"""Content-first OutputSpec: append-only train-only ARC experiment.

Subcommands
  prepare  freeze binary + source snapshot, strip the 400 official training
           tasks to train-only copies (test: []), record the data manifest
  run      one process per (task, config); FrozenD / ContentFirstOnly over the
           whole set, ContentFirstExploreAlternatives over a targeted subset;
           resumable (existing records are never overwritten)
  report   per_task.csv, metrics.csv/json, funnel.json, summary.md recomputed
           from the raw records; independent Python re-verification of every
           content-first program's crop/emit window semantics
  all      prepare + run + report

The solver receives train-only files only and refuses files with test pairs
(exit 3). Nothing here reads a training target for any search decision.
"""
import argparse
import csv
import hashlib
import json
import shutil
import statistics
import subprocess
import sys
import time
import zipfile
from collections import Counter, defaultdict
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parent))
import arc_train_only as base
from arc_stage_d import event_times

ROOT = base.ROOT
FORMAL_CONFIGS = ['FrozenD', 'ContentFirstOnly']
EXPLORE_CONFIG = 'ContentFirstExploreAlternatives'
TIMEOUT_MS = 300000
RTS = ['-M2g', '-T', '-l-au']


def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def write(p, v):
    p = Path(p)
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(json.dumps(v, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def guard_out(out):
    out = Path(out).resolve()
    assert out.is_relative_to((ROOT / 'results' / 'content_first').resolve()), 'content-first runs live under results/content_first/<run_id>'
    for forbidden in ('results/stage_a', 'results/stage_b', 'results/stage_c', 'results/stage_d', 'results/stage_d_plus', 'results/trace_io'):
        assert not out.is_relative_to((ROOT / forbidden).resolve()), 'historical batches are immutable'
    return out


# ---------------------------------------------------------------- prepare

def prepare(args):
    out = guard_out(args.out)
    if (out / 'data_manifest.json').exists():
        raise RuntimeError('existing immutable batch; use run/report or a new --out')
    settings = SimpleNamespace(out=str(out), source='data/arc1-training', binary=args.binary, limit=0, tasks='', workers=args.workers,
                               feature_timeout_ms=TIMEOUT_MS, v04_timeout_ms=60000, r2_timeout_ms=60000)
    base.cmd_prepare(settings)
    manifest = read(out / 'data_manifest.json')
    assert manifest['task_count'] == 400 and manifest['parse_ok_count'] == 400
    reference = ROOT / 'results/stage_d_plus/dplus-20261026-v2/data_manifest.json'
    if reference.exists():
        ref = read(reference)
        assert manifest['combined_sha256_of_task_hashes'] == ref['combined_sha256_of_task_hashes'], 'data differs from the Stage D+ manifest'
        manifest['same_data_as'] = 'results/stage_d_plus/dplus-20261026-v2'
        write(out / 'data_manifest.json', manifest)
    code = read(out / 'code_version.json')
    shutil.copyfile(args.binary, out / 'solver.exe')
    code.update(run_id=out.name, frozen_binary='solver.exe', binary_sha256=sha(out / 'solver.exe'),
                formal_configs=FORMAL_CONFIGS, explore_config=EXPLORE_CONFIG,
                compiler=subprocess.check_output(['E:/ghcup/ghc/9.10.3/bin/ghc.exe', '--version'], text=True).strip(),
                feature_stage='Stage D FrozenD (D0_Frozen) vs ContentFirstOnly (same A/B/C/D budgets; content-first fallback after Size-first failure) vs ContentFirstExploreAlternatives (targeted)',
                r2_stage='not executed')
    code['budgets'].update(wall_seconds=TIMEOUT_MS // 1000, rts_max_heap='2g', hard_kill_grace_s=10,
                           content_first='cfPlanBudget=400 plans, cfExecutionBudget=4000 per-case executions, cfMaxFits=16 (see config text in every record)')
    with zipfile.ZipFile(out / 'source_snapshot.zip', 'w', zipfile.ZIP_DEFLATED) as z:
        for folder in ('src', 'app', 'test', 'scripts', 'docs'):
            for path in sorted((ROOT / folder).rglob('*')):
                if path.suffix in ('.hs', '.py', '.ps1', '.md', '.js', '.html'):
                    z.write(path, path.relative_to(ROOT))
        z.write(ROOT / 'latis.cabal', 'latis.cabal')
    code['source_archive_sha256'] = sha(out / 'source_snapshot.zip')
    (out / 'git.diff').write_text(base.git('diff'), encoding='utf-8')
    write(out / 'code_version.json', code)
    print('prepared', out)


# ---------------------------------------------------------------- run

def one(out, binary, task, cfg):
    tid = task['task_id']
    dest = out / 'tasks' / tid / cfg
    result = dest / f'stage-d-{cfg}.json'
    if result.exists():
        return tid, cfg, read(result)['status'], True
    dest.mkdir(parents=True, exist_ok=True)
    eventlog = (dest / 'search.eventlog').resolve()
    cmd = [str(binary), 'arc-train-only-stage', '--stage', 'stage-d-' + cfg, '--task', str((out / task['train_only_file']).resolve()),
           '--out', str(dest.resolve()), '--timeout-ms', str(TIMEOUT_MS), '+RTS', *RTS, '-ol' + str(eventlog), '-RTS']
    started = time.monotonic()
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8', errors='replace', cwd=ROOT, timeout=TIMEOUT_MS / 1000 + 10)
        (dest / 'stderr.txt').write_text(p.stderr, encoding='utf-8')
        if p.returncode == 3:
            raise RuntimeError('leak guard refused the task file')
        if not result.exists():
            rec = {'status': 'runtime_error', 'train_exact': False, 'search_work': None, 'detail': f'exit {p.returncode}: {p.stderr[-800:]}', 'wall_clock_seconds': time.monotonic() - started}
        else:
            rec = read(result)
            rec['exit_code'] = p.returncode
    except subprocess.TimeoutExpired:
        rec = {'status': 'timeout', 'train_exact': False, 'hard_kill': True, 'search_work': None, 'detail': 'driver watchdog', 'wall_clock_seconds': time.monotonic() - started}
    rec['driver_seconds'] = time.monotonic() - started
    rec['first_train_exact_seconds'] = None
    rec['total_to_budget_seconds'] = None
    if eventlog.exists():
        try:
            rec.update(event_times(eventlog))
        except Exception as error:  # noqa: BLE001
            rec['eventlog_parse_error'] = str(error)
    if rec['status'] in ('timeout', 'runtime_error'):
        rec['search_work'] = None
        rec['counters'] = None
    write(result, rec)
    return tid, cfg, rec['status'], False


def run(args):
    out = guard_out(args.out)
    manifest = read(out / 'data_manifest.json')
    code = read(out / 'code_version.json')
    binary = (out / code['frozen_binary']).resolve()
    assert sha(binary) == code['binary_sha256'], 'frozen binary changed'
    tasks = manifest['tasks']
    if args.tasks:
        wanted = set(Path(args.tasks).read_text().split()) if Path(args.tasks).exists() else set(args.tasks.split(','))
        tasks = [t for t in tasks if t['task_id'] in wanted]
    configs = args.configs.split(',')
    for t in tasks:
        path = (out / t['train_only_file']).resolve()
        assert path.is_relative_to(out.resolve()) and read(path)['test'] == []
    meta_path = out / 'run_meta.json'
    meta = read(meta_path) if meta_path.exists() else {'phases': []}
    phase = {'phase': args.phase, 'configs': configs, 'tasks': len(tasks), 'workers': args.workers, 'timeout_ms': TIMEOUT_MS, 'rts': ' '.join(RTS),
             'started_utc': datetime.now(timezone.utc).isoformat()}
    start = time.monotonic()
    done = skipped = 0
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(one, out, binary, t, c) for t in tasks for c in configs]
        for f in as_completed(futures):
            tid, cfg, status, was_skipped = f.result()
            done += 1
            skipped += was_skipped
            if done % 25 == 0 or not was_skipped:
                print(f'[{done}/{len(futures)}] {tid} {cfg} {status} t={time.monotonic() - start:.0f}s', flush=True)
    phase.update(finished_utc=datetime.now(timezone.utc).isoformat(), wall_clock_seconds=time.monotonic() - start, resumed_skipped=skipped)
    meta['phases'].append(phase)
    write(meta_path, meta)


# ---------------------------------------------------------------- independent re-verification

def components(grid):
    """4-connected same-colour components of non-zero cells, in encoder order (min (y,x) pixel)."""
    h, w = len(grid), len(grid[0])
    seen = set()
    comps = []
    for y in range(h):
        for x in range(w):
            if grid[y][x] == 0 or (x, y) in seen:
                continue
            c = grid[y][x]
            stack, cells = [(x, y)], []
            seen.add((x, y))
            while stack:
                px, py = stack.pop()
                cells.append((px, py))
                for nx, ny in ((px + 1, py), (px - 1, py), (px, py + 1), (px, py - 1)):
                    if 0 <= nx < w and 0 <= ny < h and (nx, ny) not in seen and grid[ny][nx] == c:
                        seen.add((nx, ny))
                        stack.append((nx, ny))
            comps.append((c, cells))
    return comps


def verify_content_first(rec, train):
    """Re-derive window/dims/content semantics from the recorded plan witness and the raw input grid.

    Selector semantics are NOT re-evaluated here (shape predicates, diagonal
    view and uniqueness live in the Haskell evaluator); what is checked is the
    part a Size-first program cannot fake: dims = bounds+1, crop = raw input
    window, emit = selected pixels only, exactness against the training target.
    """
    cf = rec.get('content_first') or {}
    plan = cf.get('selected_plan')
    checks = []
    if not plan:
        return {'applicable': False, 'checks': []}
    construction = plan['construction']
    for i, (w, pair) in enumerate(zip(cf.get('witnesses') or [], train)):
        inp, target = pair['input'], pair['output']
        ok, notes = True, []
        if not w.get('derived'):
            checks.append({'pair': i, 'passed': False, 'notes': ['spec not derived: ' + str(w.get('error'))]})
            continue
        spec = w['spec']
        wit = spec['witness']
        b = wit['bounds']
        dims = wit['dims']
        if dims != [b['max_x'] - b['min_x'] + 1, b['max_y'] - b['min_y'] + 1]:
            ok = False; notes.append('dims are not bounds+1')
        grid = spec['grid']
        if [len(grid[0]), len(grid)] != dims:
            ok = False; notes.append('rendered grid dims differ from derived dims')
        window = [row[b['min_x']:b['max_x'] + 1] for row in inp[b['min_y']:b['max_y'] + 1]]
        if construction == 'CropInputWindow':
            if grid != window:
                ok = False; notes.append('crop grid is not the raw input window')
        else:
            # emit: every drawn pixel equals the input pixel at the same window position and belongs to a selected source
            for y, row in enumerate(grid):
                for x, c in enumerate(row):
                    if c != 0 and window[y][x] != c:
                        ok = False; notes.append(f'emitted pixel ({x},{y}) not in the input window'); break
            if any(not s['selected_member'] for s in wit['pixel_sources']):
                ok = False; notes.append('emit draws a non-selected source')
        if (grid == target) != bool(w.get('exact')):
            ok = False; notes.append('exact flag disagrees with the target comparison')
        if rec.get('train_exact') and grid != target:
            ok = False; notes.append('train_exact record but spec grid differs from the target')
        total = sum(s['pixels'] for s in wit['pixel_sources'])
        if total + wit['background_cells'] != dims[0] * dims[1]:
            ok = False; notes.append('pixel sources + background cells do not cover the canvas')
        checks.append({'pair': i, 'passed': ok, 'notes': notes, 'construction': construction, 'matched_ids': wit['selection']['matched_ids'], 'dims': dims})
    return {'applicable': True, 'all_passed': all(c['passed'] for c in checks) and len(checks) == len(train), 'checks': checks,
            'selector_semantics_reverified': False, 'note': 'window/dims/pixel-source semantics re-derived in Python from the raw input; selector predicates are evaluated only by the Haskell executor'}


# ---------------------------------------------------------------- report

def classify(rec, frozen):
    """Layered diagnostic label for one ContentFirstOnly record (never a proof)."""
    cf = rec.get('content_first') or {}
    if rec['status'] == 'timeout':
        return 'timeout'
    if rec.get('train_exact'):
        plan = cf.get('selected_plan')
        if plan:
            return cf.get('final_classification') or 'content_first_train_exact'
        return 'size_first_train_exact'
    return cf.get('final_classification') or 'unknown'


def report(args):
    out = guard_out(args.out)
    manifest = read(out / 'data_manifest.json')
    code = read(out / 'code_version.json')
    train = {t['task_id']: read(out / t['train_only_file'])['train'] for t in manifest['tasks']}
    records = {}
    for p in (out / 'tasks').glob('*/*/stage-d-*.json'):
        records[(p.parent.parent.name, p.parent.name)] = read(p)
    configs = sorted({c for _, c in records})
    rows = []
    verifications = {}
    for (tid, cfg), r in sorted(records.items()):
        cf = r.get('content_first') or {}
        counters = r.get('counters') or {}
        runs = cf.get('runs') or []
        solution_runs = [x for x in runs if x['role'] == 'solution']
        alt_runs = [x for x in runs if x['role'] == 'alternatives']
        metrics = cf.get('metrics') or {}
        ver = verify_content_first(r, train[tid]) if cf.get('selected_plan') else {'applicable': False}
        verifications[(tid, cfg)] = ver
        size_status = None
        if runs:
            size_status = runs[0]['size_first_status']
        elif r['status'] != 'timeout':
            size_status = 'fit' if (counters.get('size_rule_exact') or 0) > 0 or r.get('size_rule_exact') else ('no_fit_or_truncated' if r.get('failure_stage') == 'size_rule' else 'fit')
        row = {'task_id': tid, 'config': cfg, 'status': r['status'], 'train_exact': r.get('train_exact'), 'failure_stage': r.get('failure_stage'),
               'search_work': r.get('search_work'), 'first_train_exact_work': (counters.get('first_solution_work') or None) if r.get('train_exact') else None,
               'first_train_exact_seconds': r.get('first_train_exact_seconds'), 'total_to_budget_seconds': r.get('total_to_budget_seconds'),
               'wall_seconds': r.get('wall_clock_seconds'), 'rts_max_live_bytes': r.get('rts_max_live_bytes'),
               'program_kind': ('content_first_output_spec' if cf.get('selected_plan') else ('object_transform' if r.get('object_transform') and r.get('object_transform') != 'null' else ('ordered_sequence_body' if r.get('program') else None))) if r['status'] != 'timeout' else None,
               'size_first_status': size_status, 'content_first_trigger': runs[0]['trigger'] if runs else ('deferred' if int(metrics.get('cf_deferred_plans') or 0) > 0 else 'none'),
               'content_first_classification': cf.get('final_classification'), 'selected_plan': cf.get('selected_plan_text'),
               'cf_plan_universe': metrics.get('cf_plan_universe'), 'cf_plans_tried': metrics.get('cf_plans_tried'), 'cf_selection_legal_plans': metrics.get('cf_selection_legal_plans'),
               'cf_specs_derived': metrics.get('cf_specs_derived'), 'cf_rendered': metrics.get('cf_rendered'), 'cf_case_executions': metrics.get('cf_case_executions'),
               'cf_fits': metrics.get('cf_fits'), 'cf_alternative_fits': metrics.get('cf_alternative_fits'), 'cf_truncated': metrics.get('cf_truncated'),
               'cf_first_fit_executions': metrics.get('cf_first_fit_executions'), 'cf_deferred_plans': metrics.get('cf_deferred_plans'),
               'alternative_fit_plans': json.dumps([p['text'] for x in alt_runs for p in x['fit_plans']]) if alt_runs else None,
               'independent_verification': (None if not ver.get('applicable') else ('passed' if ver.get('all_passed') else 'FAILED')),
               'detail': (r.get('detail') or '')[:400]}
        rows.append(row)
    with (out / 'per_task.csv').open('w', newline='', encoding='utf-8') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0]))
        w.writeheader(); w.writerows(rows)
    write(out / 'independent_verification.json', {f'{t}/{c}': v for (t, c), v in verifications.items() if v.get('applicable')})
    frozen = {t: r for (t, c), r in records.items() if c == 'FrozenD'}
    frozen_exact = {t for t, r in frozen.items() if r.get('train_exact')}
    metrics_out = {'run': code['run_id'], 'binary_sha256': code['binary_sha256'], 'configs': {}, 'baseline_note': 'FrozenD measured in this run (not copied from history); Stage D history: 20/400'}
    for cfg in configs:
        data = {t: r for (t, c), r in records.items() if c == cfg}
        exact = {t for t, r in data.items() if r.get('train_exact')}
        completed = {t for t, r in data.items() if r['status'] not in ('timeout', 'runtime_error')}
        common = completed & {t for t, r in frozen.items() if r['status'] not in ('timeout', 'runtime_error')}
        paired = [(frozen[t]['search_work'], data[t]['search_work']) for t in sorted(common) if frozen[t].get('search_work') is not None and data[t].get('search_work') is not None]
        def dist(values):
            known = [v for v in values if v is not None]
            return {'count': len(known), 'sum': sum(known) if known else None, 'median': statistics.median(known) if known else None, 'max': max(known) if known else None}
        same_program = sum(1 for t in exact & frozen_exact if data[t].get('program') == frozen[t].get('program'))
        metrics_out['configs'][cfg] = {
            'tasks': len(data), 'train_exact': len(exact), 'coverage': '400_complete' if len(data) == 400 else f'targeted_{len(data)}',
            'statuses': dict(Counter(r['status'] for r in data.values())),
            'new_vs_FrozenD': sorted(exact - frozen_exact), 'lost_vs_FrozenD': sorted((frozen_exact & set(data)) - exact),
            'common_solved_same_program': same_program, 'common_solved': len(exact & frozen_exact),
            'common_completed_vs_FrozenD': len(common), 'paired_work_frozen': sum(a for a, _ in paired), 'paired_work_config': sum(b for _, b in paired),
            'paired_work_ratio': (sum(b for _, b in paired) / sum(a for a, _ in paired)) if paired and sum(a for a, _ in paired) else None,
            'paired_identical_work_tasks': sum(1 for a, b in paired if a == b),
            'distributions': {k: dist(row[k] for row in rows if row['config'] == cfg) for k in ['first_train_exact_work', 'search_work', 'first_train_exact_seconds', 'total_to_budget_seconds', 'wall_seconds']},
            'independent_verification': dict(Counter(row['independent_verification'] for row in rows if row['config'] == cfg and row['independent_verification'])),
            'content_first_classifications': dict(Counter(row['content_first_classification'] for row in rows if row['config'] == cfg)),
            'content_first_triggers': dict(Counter(row['content_first_trigger'] for row in rows if row['config'] == cfg)),
            'peak_live_bytes': max((r['rts_max_live_bytes'] for r in data.values() if r.get('rts_max_live_bytes') is not None), default=None)}
    # Funnel: tasks where Size-first failed (FrozenD failure_stage size_rule) and where it fit but downstream failed.
    funnel = {}
    for cfg in configs:
        if cfg == 'FrozenD':
            continue
        data = {t: r for (t, c), r in records.items() if c == cfg}
        def stage_counts(ids):
            got = [data[t] for t in ids if t in data]
            m = [((r.get('content_first') or {}).get('metrics') or {}) for r in got]
            return {'tasks': len(got), 'entered_selection': sum(1 for x in m if int(x.get('cf_triggered') or 0) > 0),
                    'legal_selection_plan': sum(1 for x in m if int(x.get('cf_selection_legal_plans') or 0) > 0),
                    'output_spec_derived': sum(1 for x in m if int(x.get('cf_specs_derived') or 0) > 0),
                    'rendered': sum(1 for x in m if int(x.get('cf_rendered') or 0) > 0),
                    'train_exact_fit': sum(1 for x in m if int(x.get('cf_fits') or 0) > 0),
                    'task_train_exact': sum(1 for r in got if r.get('train_exact')),
                    'truncated': sum(1 for x in m if int(x.get('cf_truncated') or 0) > 0),
                    'timeouts': sum(1 for r in got if r['status'] == 'timeout'),
                    'classifications': dict(Counter((r.get('content_first') or {}).get('final_classification') for r in got))}
        size_failed = sorted(t for t, r in frozen.items() if r.get('failure_stage') == 'size_rule' and r['status'] != 'timeout')
        downstream = sorted(t for t, r in frozen.items() if r['status'] not in ('timeout',) and not r.get('train_exact') and r.get('failure_stage') not in ('size_rule', 'layout_guard', 'grounding'))
        funnel[cfg] = {'size_first_failed_in_FrozenD': {'ids': size_failed, **stage_counts(size_failed)},
                       'size_first_fit_downstream_failed_in_FrozenD': {**stage_counts(downstream)},
                       'legend': 'entering the new path != deriving a spec != rendering != train-exact; counts are tasks'}
    write(out / 'metrics.json', metrics_out)
    write(out / 'funnel.json', funnel)
    with (out / 'metrics.csv').open('w', newline='', encoding='utf-8') as f:
        w = csv.writer(f)
        w.writerow(['config', 'tasks', 'train_exact', 'timeouts', 'new_vs_FrozenD', 'lost_vs_FrozenD', 'paired_work_frozen', 'paired_work_config', 'paired_work_ratio', 'first_exact_seconds_median', 'total_to_budget_seconds_sum', 'peak_live_bytes', 'verification'])
        for cfg, m in metrics_out['configs'].items():
            w.writerow([cfg, m['tasks'], m['train_exact'], m['statuses'].get('timeout', 0), len(m['new_vs_FrozenD']), len(m['lost_vs_FrozenD']), m['paired_work_frozen'], m['paired_work_config'],
                        m['paired_work_ratio'], m['distributions']['first_train_exact_seconds']['median'], m['distributions']['total_to_budget_seconds']['sum'], m['peak_live_bytes'], json.dumps(m['independent_verification'])])
    # D+ comparison of FrozenD against the recorded D0_Frozen baseline (same data manifest): status + search_work per task.
    dplus = ROOT / 'results/stage_d_plus/dplus-20261026-v2/baseline/tasks'
    comparison = {'available': dplus.exists(), 'tasks_compared': 0, 'status_equal': 0, 'work_equal': 0, 'program_equal': 0, 'differing': []}
    if dplus.exists():
        for t, r in frozen.items():
            p = dplus / t / 'D0_Frozen' / 'stage-d-D0_Frozen.json'
            if not p.exists():
                continue
            old = read(p)
            comparison['tasks_compared'] += 1
            comparison['status_equal'] += old['status'] == r['status']
            comparison['work_equal'] += old.get('search_work') == r.get('search_work')
            comparison['program_equal'] += old.get('program') == r.get('program')
            if old['status'] != r['status'] or old.get('search_work') != r.get('search_work') or old.get('program') != r.get('program'):
                comparison['differing'].append({'task': t, 'old_status': old['status'], 'new_status': r['status'], 'old_work': old.get('search_work'), 'new_work': r.get('search_work')})
    write(out / 'frozen_vs_dplus_baseline.json', comparison)
    lines = [f"# Content-first run {code['run_id']}", '', f"binary {code['binary_sha256']}", '', '| config | tasks | train-exact | timeouts | new vs FrozenD | lost | paired work ratio | verification |', '|---|---|---|---|---|---|---|---|']
    for cfg, m in metrics_out['configs'].items():
        lines.append(f"| {cfg} | {m['tasks']} | {m['train_exact']} | {m['statuses'].get('timeout', 0)} | {len(m['new_vs_FrozenD'])} {m['new_vs_FrozenD']} | {len(m['lost_vs_FrozenD'])} {m['lost_vs_FrozenD']} | {m['paired_work_ratio']} | {m['independent_verification']} |")
    lines += ['', '## Funnel (ContentFirstOnly)', '', '```', json.dumps(funnel.get('ContentFirstOnly'), indent=1, ensure_ascii=False), '```', '', '## FrozenD vs D+ D0_Frozen', '', '```', json.dumps({k: v for k, v in comparison.items() if k != 'differing'}, indent=1), '```']
    (out / 'summary.md').write_text('\n'.join(lines) + '\n', encoding='utf-8')
    print('\n'.join(lines[:12]))
    print(json.dumps({cfg: {k: m[k] for k in ('train_exact', 'new_vs_FrozenD', 'lost_vs_FrozenD', 'statuses')} for cfg, m in metrics_out['configs'].items()}, indent=1))


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument('command', choices=['prepare', 'run', 'report', 'all'])
    p.add_argument('--out', required=True)
    p.add_argument('--binary', default=str(ROOT / 'build/latis-content-first.exe'))
    p.add_argument('--workers', type=int, default=4)
    p.add_argument('--configs', default=','.join(FORMAL_CONFIGS))
    p.add_argument('--tasks', default='', help='comma list or a file of task ids (targeted phase)')
    p.add_argument('--phase', default='formal')
    args = p.parse_args()
    if args.command in ('prepare', 'all'):
        prepare(args)
    if args.command in ('run', 'all'):
        run(args)
    if args.command in ('report', 'all'):
        report(args)


if __name__ == '__main__':
    main()
