"""Stage E0/E1: append-only train-only ARC ablation (FrozenCF, BackgroundViewsOnly, GeometryFeaturesOnly, FullE01).

Subcommands
  prepare  freeze binary + source snapshot, train-only copies (test: []), manifest
  run      one process per (task, config); resumable, never overwrites
  report   per_task.csv, metrics.csv/json, funnel.json, summary.md recomputed from
           the raw records; independent Python re-verification of content-first
           programs (window/dims/pixel sources) and of geometry witnesses
           (every rectangle inside the pixel set, union == pixel set, bounds)
  all      prepare + run + report

The solver receives train-only files only (exit 3 on a file with test pairs).
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
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parent))
import arc_train_only as base
from arc_stage_d import event_times
from run_content_first import verify_content_first, components  # noqa: F401

ROOT = base.ROOT
CONFIGS = ['FrozenCF', 'BackgroundViewsOnly', 'GeometryFeaturesOnly', 'FullE01']
BASELINE = 'FrozenCF'
PREVIOUS = ROOT / 'results/content_first/cf-20261026-main'
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
    assert out.is_relative_to((ROOT / 'results' / 'stage_e01').resolve()), 'Stage E0/E1 runs live under results/stage_e01/<run_id>'
    return out


def prepare(args):
    out = guard_out(args.out)
    if (out / 'data_manifest.json').exists():
        raise RuntimeError('existing immutable batch; use run/report or a new --out')
    settings = SimpleNamespace(out=str(out), source='data/arc1-training', binary=args.binary, limit=0, tasks='', workers=args.workers,
                               feature_timeout_ms=TIMEOUT_MS, v04_timeout_ms=60000, r2_timeout_ms=60000)
    base.cmd_prepare(settings)
    manifest = read(out / 'data_manifest.json')
    assert manifest['task_count'] == 400 and manifest['parse_ok_count'] == 400
    ref = read(PREVIOUS / 'data_manifest.json')
    assert manifest['combined_sha256_of_task_hashes'] == ref['combined_sha256_of_task_hashes'], 'data differs from the content-first manifest'
    manifest['same_data_as'] = str(PREVIOUS.relative_to(ROOT))
    write(out / 'data_manifest.json', manifest)
    code = read(out / 'code_version.json')
    shutil.copyfile(args.binary, out / 'solver.exe')
    code.update(run_id=out.name, frozen_binary='solver.exe', binary_sha256=sha(out / 'solver.exe'), configs=CONFIGS, baseline=BASELINE,
                compiler=subprocess.check_output(['E:/ghcup/ghc/9.10.3/bin/ghc.exe', '--version'], text=True).strip(),
                feature_stage='Stage E0/E1 over Content-first: FrozenCF (= ContentFirstOnly budgets) vs explicit background views vs geometry predicates/witnesses vs both',
                r2_stage='not executed')
    code['budgets'].update(wall_seconds=TIMEOUT_MS // 1000, rts_max_heap='2g', hard_kill_grace_s=10,
                           content_first='FrozenCF 400 plans/4000 executions; BackgroundViewsOnly 1600/12000; GeometryFeaturesOnly 600/6000; FullE01 2400/16000 (see config text per record)',
                           cover='predicate budget 4000 nodes / 400 area; witness budget 20000 nodes / 900 area / 8 alternatives')
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


def progress_line(done, total, start, note=''):
    """One-line progress bar with rate and ETA (printed as a new line so logs and tee keep it)."""
    elapsed = max(1e-6, time.monotonic() - start)
    rate = done / elapsed
    eta = (total - done) / rate if rate > 0 and done else float('nan')
    width = 30
    filled = int(width * done / total) if total else width
    bar = '#' * filled + '-' * (width - filled)
    return f'[{bar}] {done}/{total} {100.0 * done / max(1, total):5.1f}%  {elapsed / 60:5.1f} min elapsed  ETA {eta / 60:5.1f} min  {note}'


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
    phase = {'phase': args.phase, 'configs': configs, 'tasks': len(tasks), 'workers': args.workers, 'timeout_ms': TIMEOUT_MS, 'rts': ' '.join(RTS), 'started_utc': datetime.now(timezone.utc).isoformat()}
    start = time.monotonic()
    done = skipped = 0
    exact = Counter()
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(one, out, binary, t, c) for t in tasks for c in configs]
        total = len(futures)
        print(progress_line(0, total, start, f'{len(tasks)} tasks x {len(configs)} configs, {args.workers} workers'), flush=True)
        for f in as_completed(futures):
            tid, cfg, status, was_skipped = f.result()
            done += 1
            skipped += was_skipped
            if status == 'train_exact':
                exact[cfg] += 1
            every = 1 if total <= 200 else args.progress_every
            if done % every == 0 or done == total or (not was_skipped and status == 'train_exact'):
                note = f'last {tid} {cfg} {status}; train-exact so far ' + ' '.join(f'{c}={n}' for c, n in sorted(exact.items())) + (f'; resumed {skipped}' if skipped else '')
                print(progress_line(done, total, start, note), flush=True)
    phase.update(finished_utc=datetime.now(timezone.utc).isoformat(), wall_clock_seconds=time.monotonic() - start, resumed_skipped=skipped)
    meta['phases'].append(phase)
    write(meta_path, meta)


# ---------------------------------------------------------------- independent geometry re-verification

def verify_geometry(rec):
    """Every geometry witness of the selected program: rectangles inside the pixel set, union == pixel set, bounds, width/height, status consistency."""
    cf = rec.get('content_first') or {}
    results = []
    for w in cf.get('witnesses') or []:
        if not w.get('derived'):
            continue
        spec = w['spec']
        wit = spec['witness']
        geos = wit.get('geometry')
        if not geos:
            continue
        # pixel set of each selected member from the emitted provenance (selected members only)
        selected = {e['sources'][0]: {(p[0], p[1]) for p in e['pixels']} for e in spec['emitted'] if len(e['sources']) == 1}
        bx, by = wit['bounds']['min_x'], wit['bounds']['min_y']
        for g in geos:
            notes = []
            rects = [(r['x_min'], r['y_min'], r['x_max'], r['y_max']) for r in g['rectangles']]
            union = {(x, y) for (x0, y0, x1, y1) in rects for x in range(x0, x1 + 1) for y in range(y0, y1 + 1)}
            if g['status'] != 'empty' and len(union) != g['pixel_count']:
                notes.append('union size differs from the recorded pixel count')
            if any(x1 < x0 or y1 < y0 for (x0, y0, x1, y1) in rects):
                notes.append('inverted rectangle')
            b = g.get('bounds')
            if isinstance(b, dict) and union:
                if (min(x for x, _ in union), min(y for _, y in union), max(x for x, _ in union), max(y for _, y in union)) != (b['x_min'], b['y_min'], b['x_max'], b['y_max']):
                    notes.append('bounds differ from the union of rectangles')
            if g['status'] == 'proven_minimal' and g['lower_bound'] != g['upper_bound'] != len(rects):
                notes.append('proven witness with inconsistent bounds')
            if g['status'] == 'bounded' and not (g['lower_bound'] <= len(rects) == g['upper_bound']):
                notes.append('bounded witness bounds inconsistent')
            if g.get('independent_replay') != 'passed':
                notes.append('Haskell replay reported: ' + str(g.get('independent_replay')))
            results.append({'pair': w['pair_index'], 'status': g['status'], 'rectangles': len(rects), 'passed': not notes, 'notes': notes})
    return results


def classification_of(rec):
    cf = rec.get('content_first') or {}
    if rec['status'] == 'timeout':
        return 'timeout'
    return cf.get('final_classification') or ('size_first_train_exact' if rec.get('train_exact') else 'unknown')


def report(args):
    out = guard_out(args.out)
    manifest = read(out / 'data_manifest.json')
    code = read(out / 'code_version.json')
    train = {t['task_id']: read(out / t['train_only_file'])['train'] for t in manifest['tasks']}
    records = {(p.parent.parent.name, p.parent.name): read(p) for p in (out / 'tasks').glob('*/*/stage-d-*.json')}
    configs = [c for c in CONFIGS if any(cfg == c for _, cfg in records)]
    rows = []
    verifications = {}
    for (tid, cfg), r in sorted(records.items()):
        cf = r.get('content_first') or {}
        counters = r.get('counters') or {}
        metrics = cf.get('metrics') or {}
        runs = cf.get('runs') or []
        ver = verify_content_first(r, train[tid]) if cf.get('selected_plan') else {'applicable': False}
        geo = verify_geometry(r) if cf.get('selected_plan') else []
        verifications[(tid, cfg)] = {'content_first': ver, 'geometry': geo}
        plan = cf.get('selected_plan') or {}
        rows.append({'task_id': tid, 'config': cfg, 'status': r['status'], 'train_exact': r.get('train_exact'), 'failure_stage': r.get('failure_stage'),
                     'search_work': r.get('search_work'), 'first_train_exact_work': (counters.get('first_solution_work') or None) if r.get('train_exact') else None,
                     'first_train_exact_seconds': r.get('first_train_exact_seconds'), 'total_to_budget_seconds': r.get('total_to_budget_seconds'), 'wall_seconds': r.get('wall_clock_seconds'),
                     'rts_max_live_bytes': r.get('rts_max_live_bytes'),
                     'program_kind': ('content_first_output_spec' if plan else ('object_transform' if r.get('object_transform') and r.get('object_transform') != 'null' else ('ordered_sequence_body' if r.get('program') else None))) if r['status'] != 'timeout' else None,
                     'selected_plan': cf.get('selected_plan_text'), 'selected_view': ((plan.get('view') or {}).get('view')) if plan else None,
                     'size_first_status': runs[0]['size_first_status'] if runs else None, 'content_first_trigger': runs[0]['trigger'] if runs else ('deferred' if int(metrics.get('cf_deferred_plans') or 0) > 0 else 'none'),
                     'classification': classification_of(r),
                     'cf_plan_universe': metrics.get('cf_plan_universe'), 'cf_plans_tried': metrics.get('cf_plans_tried'), 'cf_selection_legal_plans': metrics.get('cf_selection_legal_plans'),
                     'cf_specs_derived': metrics.get('cf_specs_derived'), 'cf_case_executions': metrics.get('cf_case_executions'), 'cf_fits': metrics.get('cf_fits'), 'cf_truncated': metrics.get('cf_truncated'),
                     'geo_views_created': metrics.get('geo_views_created'), 'geo_views_not_applicable': metrics.get('geo_views_not_applicable'), 'geo_feature_evaluations': metrics.get('geo_feature_evaluations'),
                     'geo_cover_proven': metrics.get('geo_cover_proven'), 'geo_cover_bounded': metrics.get('geo_cover_bounded'), 'geo_selected_rect_count': metrics.get('geo_selected_rect_count'),
                     'content_first_verification': None if not ver.get('applicable') else ('passed' if ver.get('all_passed') else 'FAILED'),
                     'geometry_verification': None if not geo else ('passed' if all(g['passed'] for g in geo) else 'FAILED'),
                     'detail': (r.get('detail') or '')[:400]})
    with (out / 'per_task.csv').open('w', newline='', encoding='utf-8') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0]))
        w.writeheader(); w.writerows(rows)
    write(out / 'independent_verification.json', {f'{t}/{c}': v for (t, c), v in verifications.items() if v['content_first'].get('applicable') or v['geometry']})
    baseline = {t: r for (t, c), r in records.items() if c == BASELINE}
    base_exact = {t for t, r in baseline.items() if r.get('train_exact')}
    metrics_out = {'run': code['run_id'], 'binary_sha256': code['binary_sha256'], 'baseline': BASELINE, 'configs': {}}
    for cfg in configs:
        data = {t: r for (t, c), r in records.items() if c == cfg}
        exact = {t for t, r in data.items() if r.get('train_exact')}
        completed = {t for t, r in data.items() if r['status'] not in ('timeout', 'runtime_error')}
        common = completed & {t for t, r in baseline.items() if r['status'] not in ('timeout', 'runtime_error')}
        paired = [(baseline[t]['search_work'], data[t]['search_work']) for t in sorted(common) if baseline[t].get('search_work') is not None and data[t].get('search_work') is not None]
        secs = [(baseline[t].get('total_to_budget_seconds'), data[t].get('total_to_budget_seconds')) for t in sorted(common)]
        secs = [(a, b) for a, b in secs if a is not None and b is not None]
        def dist(values):
            known = [v for v in values if v is not None]
            return {'count': len(known), 'sum': sum(known) if known else None, 'median': statistics.median(known) if known else None, 'max': max(known) if known else None}
        metrics_out['configs'][cfg] = {
            'tasks': len(data), 'coverage': '400_complete' if len(data) == 400 else f'subset_{len(data)}', 'train_exact': len(exact),
            'statuses': dict(Counter(r['status'] for r in data.values())),
            'new_vs_baseline': sorted(exact - base_exact), 'lost_vs_baseline': sorted((base_exact & set(data)) - exact),
            'common_solved_same_program': sum(1 for t in exact & base_exact if data[t].get('program') == baseline[t].get('program')),
            'common_completed': len(common), 'paired_work_baseline': sum(a for a, _ in paired), 'paired_work_config': sum(b for _, b in paired),
            'paired_work_ratio': (sum(b for _, b in paired) / sum(a for a, _ in paired)) if paired and sum(a for a, _ in paired) else None,
            'paired_seconds_baseline': sum(a for a, _ in secs), 'paired_seconds_config': sum(b for _, b in secs),
            'views_created_tasks': sum(1 for row in rows if row['config'] == cfg and int(row['geo_views_created'] or 0) > 0),
            'views_created_sum': sum(int(row['geo_views_created'] or 0) for row in rows if row['config'] == cfg),
            'views_not_applicable_sum': sum(int(row['geo_views_not_applicable'] or 0) for row in rows if row['config'] == cfg),
            'geometry_feature_evaluations_sum': sum(int(row['geo_feature_evaluations'] or 0) for row in rows if row['config'] == cfg),
            'selected_views': dict(Counter(row['selected_view'] for row in rows if row['config'] == cfg and row['selected_view'])),
            'classifications': dict(Counter(row['classification'] for row in rows if row['config'] == cfg)),
            'content_first_verification': dict(Counter(row['content_first_verification'] for row in rows if row['config'] == cfg and row['content_first_verification'])),
            'geometry_verification': dict(Counter(row['geometry_verification'] for row in rows if row['config'] == cfg and row['geometry_verification'])),
            'cover_status_selected': {'proven': sum(int(row['geo_cover_proven'] or 0) for row in rows if row['config'] == cfg), 'bounded': sum(int(row['geo_cover_bounded'] or 0) for row in rows if row['config'] == cfg)},
            'distributions': {k: dist(row[k] for row in rows if row['config'] == cfg) for k in ['first_train_exact_work', 'search_work', 'first_train_exact_seconds', 'total_to_budget_seconds', 'wall_seconds']},
            'peak_live_bytes': max((r['rts_max_live_bytes'] for r in data.values() if r.get('rts_max_live_bytes') is not None), default=None)}
    # FrozenCF against the recorded ContentFirstOnly run (same manifest): status, work, program (modulo the new plan field).
    comparison = {'available': (PREVIOUS / 'tasks').exists(), 'tasks_compared': 0, 'status_equal': 0, 'work_equal': 0, 'program_equal_modulo_view_field': 0, 'differing': []}
    if comparison['available']:
        for t, r in baseline.items():
            p = PREVIOUS / 'tasks' / t / 'ContentFirstOnly' / 'stage-d-ContentFirstOnly.json'
            if not p.exists():
                continue
            old = read(p)
            comparison['tasks_compared'] += 1
            comparison['status_equal'] += old['status'] == r['status']
            comparison['work_equal'] += old.get('search_work') == r.get('search_work')
            newp = (r.get('program') or '').replace(', cfpView = LegacyView', '')
            comparison['program_equal_modulo_view_field'] += newp == (old.get('program') or '')
            if old['status'] != r['status'] or old.get('search_work') != r.get('search_work') or newp != (old.get('program') or ''):
                comparison['differing'].append({'task': t, 'old_status': old['status'], 'new_status': r['status'], 'old_work': old.get('search_work'), 'new_work': r.get('search_work')})
    write(out / 'frozen_vs_content_first_run.json', comparison)
    write(out / 'metrics.json', metrics_out)
    with (out / 'metrics.csv').open('w', newline='', encoding='utf-8') as f:
        w = csv.writer(f)
        w.writerow(['config', 'tasks', 'train_exact', 'timeouts', 'new_vs_baseline', 'lost_vs_baseline', 'paired_work_ratio', 'paired_seconds_baseline', 'paired_seconds_config', 'views_created_tasks', 'geometry_feature_evaluations', 'peak_live_bytes', 'cf_verification', 'geo_verification'])
        for cfg, m in metrics_out['configs'].items():
            w.writerow([cfg, m['tasks'], m['train_exact'], m['statuses'].get('timeout', 0), len(m['new_vs_baseline']), len(m['lost_vs_baseline']), m['paired_work_ratio'], m['paired_seconds_baseline'], m['paired_seconds_config'], m['views_created_tasks'], m['geometry_feature_evaluations_sum'], m['peak_live_bytes'], json.dumps(m['content_first_verification']), json.dumps(m['geometry_verification'])])
    lines = [f"# Stage E0/E1 run {code['run_id']}", '', f"binary {code['binary_sha256']}", '', '| config | tasks | train-exact | timeouts | new vs FrozenCF | lost | paired work ratio | views created (tasks) | geometry evaluations |', '|---|---|---|---|---|---|---|---|---|']
    for cfg, m in metrics_out['configs'].items():
        lines.append(f"| {cfg} | {m['tasks']} | {m['train_exact']} | {m['statuses'].get('timeout', 0)} | {len(m['new_vs_baseline'])} {m['new_vs_baseline']} | {len(m['lost_vs_baseline'])} {m['lost_vs_baseline']} | {m['paired_work_ratio']} | {m['views_created_tasks']} | {m['geometry_feature_evaluations_sum']} |")
    lines += ['', '## FrozenCF vs recorded ContentFirstOnly run', '', '```', json.dumps({k: v for k, v in comparison.items() if k != 'differing'}, indent=1), '```']
    (out / 'summary.md').write_text('\n'.join(lines) + '\n', encoding='utf-8')
    print('\n'.join(lines[:10]))
    print(json.dumps({cfg: {k: m[k] for k in ('train_exact', 'new_vs_baseline', 'lost_vs_baseline', 'statuses', 'classifications', 'selected_views')} for cfg, m in metrics_out['configs'].items()}, indent=1))


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument('command', choices=['prepare', 'run', 'report', 'all'])
    p.add_argument('--out', required=True)
    p.add_argument('--binary', default=str(ROOT / 'build/latis-stage-e01.exe'))
    p.add_argument('--workers', type=int, default=4)
    p.add_argument('--configs', default=','.join(CONFIGS))
    p.add_argument('--tasks', default='')
    p.add_argument('--phase', default='formal')
    p.add_argument('--progress-every', type=int, default=10, help='print a progress line every N completed (task, config) runs (always on train-exact and at the end)')
    args = p.parse_args()
    if args.command in ('prepare', 'all'):
        prepare(args)
    if args.command in ('run', 'all'):
        run(args)
    if args.command in ('report', 'all'):
        report(args)


if __name__ == '__main__':
    main()
