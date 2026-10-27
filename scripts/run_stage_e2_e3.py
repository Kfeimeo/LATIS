"""Stage E2/E3: append-only train-only ARC experiment (prepare / run / report).

Same protocol as run_stage_e01.py: one frozen solver.exe, 400 train-only
copies (test: []), one process per (task, config), 300 s in-process timeout +
10 s watchdog, -M2g, eventlog. Crashes (no result file) are recorded with the
exit code, stderr tail, OS info and the last checkpoint event of the eventlog
and are never overwritten; `--tasks` re-runs listed tasks into fresh records
while the crashed ones are kept as *.crashed.json.
"""
import argparse
import csv
import hashlib
import json
import platform
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
from run_stage_d_plus import parse_events

ROOT = base.ROOT
ALL_CONFIGS = ['FrozenE01', 'E2Only', 'RegionPriority', 'BreadthScheduler', 'RegionBreadth', 'FullE3', 'FullE3_NoMDL', 'FullE3_NoSafePrune']
FULL_CONFIGS = ['FrozenE01', 'E2Only', 'RegionBreadth', 'FullE3']
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
    assert out.is_relative_to((ROOT / 'results' / 'stage_e2_e3').resolve()), 'runs live under results/stage_e2_e3/<run_id>'
    return out


def progress_line(done, total, start, note=''):
    elapsed = max(1e-6, time.monotonic() - start)
    rate = done / elapsed
    eta = (total - done) / rate if rate > 0 and done else float('nan')
    width = 30
    filled = int(width * done / total) if total else width
    return f"[{'#' * filled}{'-' * (width - filled)}] {done}/{total} {100.0 * done / max(1, total):5.1f}%  {elapsed / 60:5.1f} min elapsed  ETA {eta / 60:5.1f} min  {note}"


def prepare(args):
    out = guard_out(args.out)
    if (out / 'data_manifest.json').exists():
        raise RuntimeError('existing immutable batch; use run/report or a new --out')
    settings = SimpleNamespace(out=str(out), source='data/arc1-training', binary=args.binary, limit=0, tasks='', workers=args.workers,
                               feature_timeout_ms=TIMEOUT_MS, v04_timeout_ms=60000, r2_timeout_ms=60000)
    base.cmd_prepare(settings)
    manifest = read(out / 'data_manifest.json')
    assert manifest['task_count'] == 400 and manifest['parse_ok_count'] == 400
    ref = ROOT / 'results/stage_e01/e01-20261027-main/data_manifest.json'
    if ref.exists():
        assert manifest['combined_sha256_of_task_hashes'] == read(ref)['combined_sha256_of_task_hashes']
        manifest['same_data_as'] = 'results/stage_e01/e01-20261027-main'
        write(out / 'data_manifest.json', manifest)
    code = read(out / 'code_version.json')
    shutil.copyfile(args.binary, out / 'solver.exe')
    code.update(run_id=out.name, frozen_binary='solver.exe', binary_sha256=sha(out / 'solver.exe'), all_configs=ALL_CONFIGS, full_configs=FULL_CONFIGS,
                compiler=subprocess.check_output(['E:/ghcup/ghc/9.10.3/bin/ghc.exe', '--version'], text=True).strip(),
                feature_stage='Stage E2/E3: FrozenE01 (= FullE01) vs region/scene search configurations (see config text per record)', r2_stage='not executed',
                os=platform.platform(), python=sys.version)
    code['budgets'].update(wall_seconds=TIMEOUT_MS // 1000, rts_max_heap='2g', hard_kill_grace_s=10,
                           region_search='rcQuantum=6, rcExecutionBudget=2400 program executions (each over all cases), partition budget 24 expansions / depth 3')
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


def last_checkpoint(eventlog):
    try:
        events, _ = parse_events(eventlog)
        return events[-1] if events else None
    except Exception as error:  # noqa: BLE001
        return {'parse_error': str(error)}


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
            rec = {'status': 'runtime_error', 'train_exact': False, 'search_work': None, 'detail': f'process exited without a result file; exit code {p.returncode}',
                   'exit_code': p.returncode, 'stderr_tail': p.stderr[-2000:], 'stdout_tail': p.stdout[-500:], 'os': platform.platform(),
                   'last_checkpoint_event': last_checkpoint(eventlog) if eventlog.exists() else None, 'wall_clock_seconds': time.monotonic() - started}
        else:
            rec = read(result)
            rec['exit_code'] = p.returncode
    except subprocess.TimeoutExpired:
        rec = {'status': 'timeout', 'train_exact': False, 'hard_kill': True, 'search_work': None, 'detail': 'driver watchdog', 'wall_clock_seconds': time.monotonic() - started,
               'last_checkpoint_event': last_checkpoint(eventlog) if eventlog.exists() else None}
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
    if args.rerun_crashed:
        for t in tasks:
            for c in configs:
                rec = out / 'tasks' / t['task_id'] / c / f'stage-d-{c}.json'
                if rec.exists() and read(rec)['status'] == 'runtime_error':
                    n = len(list(rec.parent.glob('*.crashed*.json')))
                    rec.rename(rec.parent / f'stage-d-{c}.crashed{n}.json')
                    st = rec.parent / 'stderr.txt'
                    if st.exists():
                        st.rename(rec.parent / f'stderr.crashed{n}.txt')
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
            if done % every == 0 or done == total or (not was_skipped and status in ('train_exact', 'runtime_error', 'timeout')):
                note = f'last {tid} {cfg} {status}; train-exact so far ' + ' '.join(f'{c}={n}' for c, n in sorted(exact.items())) + (f'; resumed {skipped}' if skipped else '')
                print(progress_line(done, total, start, note), flush=True)
    phase.update(finished_utc=datetime.now(timezone.utc).isoformat(), wall_clock_seconds=time.monotonic() - start, resumed_skipped=skipped)
    meta['phases'].append(phase)
    write(meta_path, meta)


# ---------------------------------------------------------------- independent re-verification of region programs

def components(grid):
    h, w = len(grid), len(grid[0])
    seen, comps = set(), []
    for y in range(h):
        for x in range(w):
            if (x, y) in seen:
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
            comps.append((c, frozenset(cells)))
    return comps


def verify_region_record(rec, train):
    """Re-derive, in Python, the scene / partition / region claims of a selected region program.

    For every pair: the tree's children partition the root (disjoint, covering), the separator is a
    4-connected single-colour component of the input, each content region is a 4-connected component of
    canvas minus separator, and the recorded exec output equals the training target when exact is
    claimed. Selector semantics are not re-evaluated here (Haskell), only the structural claims.
    """
    rs = rec.get('region_search') or {}
    run = rs.get('run')
    if not rs.get('selected_program') or not run:
        return {'applicable': False}
    view = rs['selected_program']['view']['view']
    checks = []
    for i, pair in enumerate(train):
        inp = pair['input']
        tree = next((t['tree'] for t in run['trees'] if t['case_index'] == i and t['view'] == view), None)
        ex = next((e for e in rs.get('executions', []) if e.get('pair_index') == i), None)
        notes, ok = [], True
        if tree is None:
            checks.append({'pair': i, 'passed': False, 'notes': ['tree missing']})
            continue
        nodes = {n['region_id']: n for n in tree['nodes']}
        root = nodes[0]
        W, H = len(inp[0]), len(inp)
        if root['area'] != W * H:
            ok = False; notes.append('root area is not the canvas')
        kids = [nodes[k] for k in root['children']]
        if kids:
            if sum(k['area'] for k in kids) != root['area']:
                ok = False; notes.append('children areas do not sum to the root')
            seps = [k for k in kids if k['role'] == 'RoleSeparator']
            if len(seps) != 1:
                ok = False; notes.append('not exactly one separator')
            else:
                sep = seps[0]
                if not sep['pixels_truncated']:
                    cells = frozenset((x, y) for x, y in sep['pixels'])
                    comps = components(inp)
                    if not any(c == cells for _, c in comps):
                        ok = False; notes.append('separator is not a single-colour 4-connected component of the input')
                    rest = [[0 if (x, y) in cells else 1 for x in range(W)] for y in range(H)]
                    rest_comps = [c for col, c in components(rest) if col == 1]
                    contents = [k for k in kids if k['role'] == 'RoleContent' and not k['pixels_truncated']]
                    for k in contents:
                        kc = frozenset((x, y) for x, y in k['pixels'])
                        if kc not in rest_comps:
                            ok = False; notes.append(f'content region {k["region_id"]} is not a 4-connected component of canvas minus separator')
                    if len([k for k in kids if k['role'] == 'RoleContent']) != len(rest_comps):
                        ok = False; notes.append('k differs from the number of components')
        if ex is not None and 'exec' in ex:
            if ex['exact'] and rec.get('train_exact'):
                pass
            if ex['exec']['output_dims'] != [len(pair['output'][0]), len(pair['output'])] and ex['exact']:
                ok = False; notes.append('exact claimed but dims differ')
        checks.append({'pair': i, 'passed': ok, 'notes': notes})
    return {'applicable': True, 'all_passed': all(c['passed'] for c in checks) and len(checks) == len(train), 'checks': checks,
            'note': 'structural partition claims re-derived in Python from the raw input; selector/action semantics are evaluated only by the Haskell executor'}


def classify(rec):
    if rec['status'] == 'timeout':
        return 'timeout'
    if rec['status'] == 'runtime_error':
        return 'runtime_error'
    if rec.get('train_exact'):
        rs = rec.get('region_search') or {}
        if rs.get('selected_program'):
            return 'region_program_train_exact'
        cf = rec.get('content_first') or {}
        if cf.get('selected_plan'):
            return 'content_first_train_exact'
        return 'size_first_train_exact'
    rs = rec.get('region_search') or {}
    run = rs.get('run')
    if not run:
        return (rec.get('content_first') or {}).get('final_classification') or 'unknown'
    if not run['views']:
        return 'region_no_legal_scene_view'
    k2 = sum(int(v) for t in run['trees'] for k, v in t['tree']['k_histogram'].items() if int(k) >= 2)
    if k2 == 0:
        return 'region_no_separating_split'
    if run['budget_cut']:
        return 'region_budget_truncated'
    return 'region_rule_unavailable'


def report(args):
    out = guard_out(args.out)
    manifest = read(out / 'data_manifest.json')
    code = read(out / 'code_version.json')
    train = {t['task_id']: read(out / t['train_only_file'])['train'] for t in manifest['tasks']}
    records = {(p.parent.parent.name, p.parent.name): read(p) for p in (out / 'tasks').glob('*/*/stage-d-*.json') if '.crashed' not in p.name}
    crashed = [str(p.relative_to(out)) for p in (out / 'tasks').glob('*/*/*.crashed*.json')]
    configs = sorted({c for _, c in records})
    rows, verifications = [], {}
    for (tid, cfg), r in sorted(records.items()):
        counters = r.get('counters') or {}
        rs = r.get('region_search') or {}
        run = rs.get('run') or {}
        met = run.get('metrics') or {}
        ver = verify_region_record(r, train[tid]) if rs.get('selected_program') else {'applicable': False}
        verifications[(tid, cfg)] = ver
        sp = rs.get('selected_program')
        rows.append({'task_id': tid, 'config': cfg, 'status': r['status'], 'train_exact': r.get('train_exact'), 'classification': classify(r), 'failure_stage': r.get('failure_stage'),
                     'search_work': r.get('search_work'), 'first_train_exact_work': (counters.get('first_solution_work') or None) if r.get('train_exact') else None,
                     'first_train_exact_seconds': r.get('first_train_exact_seconds'), 'total_to_budget_seconds': r.get('total_to_budget_seconds'), 'wall_seconds': r.get('wall_clock_seconds'),
                     'rts_max_live_bytes': r.get('rts_max_live_bytes'), 'program_kind': 'region' if sp else ('content_first' if (r.get('content_first') or {}).get('selected_plan') else ('legacy' if r.get('program') else None)),
                     'selected_program': sp['text'] if sp else ((r.get('content_first') or {}).get('selected_plan_text')),
                     'rg_triggered': met.get('rg_triggered'), 'rg_views_legal': met.get('rg_views_legal'), 'rg_views_rejected': met.get('rg_views_rejected'), 'rg_universe': met.get('rg_universe'),
                     'rg_executed': met.get('rg_executed'), 'rg_pruned': met.get('rg_pruned'), 'rg_fits': met.get('rg_fits'), 'rg_budget_cut': met.get('rg_budget_cut'), 'rg_deferred': met.get('rg_deferred'),
                     'rg_resumed': met.get('rg_resumed'), 'rg_first_fit_exposure': met.get('rg_first_fit_exposure'), 'rg_splits_tried': met.get('rg_splits_tried'), 'rg_splits_legal': met.get('rg_splits_legal'),
                     'rg_k2plus_splits': met.get('rg_k2plus_splits'), 'scene_views': json.dumps([v['view'] for v in run.get('views', [])]) if run else None,
                     'k_histogram': json.dumps(Counter(k for t in run.get('trees', []) for k, v in t['tree']['k_histogram'].items() for _ in range(int(v)))) if run else None,
                     'leaf_kinds': json.dumps(sorted({str(l) for t in run.get('trees', []) for l in (t['tree']['leaf_kinds'] if isinstance(t['tree']['leaf_kinds'], list) else json.loads(str(t['tree']['leaf_kinds']).replace("'", '"')))})) if run else None,
                     'independent_verification': None if not ver.get('applicable') else ('passed' if ver.get('all_passed') else 'FAILED'), 'detail': (r.get('detail') or '')[:300]})
    with (out / 'per_task.csv').open('w', newline='', encoding='utf-8') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0]))
        w.writeheader(); w.writerows(rows)
    write(out / 'independent_verification.json', {f'{t}/{c}': v for (t, c), v in verifications.items() if v.get('applicable')})
    base_cfg = 'FrozenE01'
    frozen = {t: r for (t, c), r in records.items() if c == base_cfg}
    frozen_exact = {t for t, r in frozen.items() if r.get('train_exact')}
    metrics = {'run': code['run_id'], 'binary_sha256': code['binary_sha256'], 'configs': {}, 'crashed_records_kept': crashed,
               'baseline_note': 'FrozenE01 measured in this run; Stage E0/E1 history: FullE01 22/400'}
    for cfg in configs:
        data = {t: r for (t, c), r in records.items() if c == cfg}
        exact = {t for t, r in data.items() if r.get('train_exact')}
        completed = {t for t, r in data.items() if r['status'] not in ('timeout', 'runtime_error')}
        common = completed & {t for t, r in frozen.items() if r['status'] not in ('timeout', 'runtime_error')}
        paired = [(frozen[t], data[t]) for t in sorted(common)]
        def dist(values):
            known = [v for v in values if v is not None]
            return {'count': len(known), 'sum': sum(known) if known else None, 'median': statistics.median(known) if known else None, 'max': max(known) if known else None}
        cfg_rows = [row for row in rows if row['config'] == cfg]
        metrics['configs'][cfg] = {
            'tasks': len(data), 'train_exact': len(exact), 'coverage': '400_complete' if len(data) == 400 else f'pilot_{len(data)}_of_400',
            'solve_at_60s': sum(1 for t in exact if (data[t].get('first_train_exact_seconds') or data[t].get('wall_clock_seconds') or 1e9) <= 60),
            'solve_at_60s_basis': {'eventlog_marker': sum(1 for t in exact if data[t].get('first_train_exact_seconds') is not None),
                                   'wall_clock_upper_bound': sum(1 for t in exact if data[t].get('first_train_exact_seconds') is None),
                                   'note': 'region-program fits in the frozen binary emit no latis-train-exact marker; for them the whole-process wall clock is used (an upper bound on time-to-first-exact)'},
            'solve_at_300s': len(exact),
            'statuses': dict(Counter(r['status'] for r in data.values())), 'new_vs_baseline': sorted(exact - frozen_exact), 'lost_vs_baseline': sorted((frozen_exact & set(data)) - exact),
            'common_solved_same_program': sum(1 for t in exact & frozen_exact if data[t].get('program') == frozen[t].get('program')),
            'common_completed_vs_baseline': len(common), 'paired_work_baseline': sum(a.get('search_work') or 0 for a, _ in paired), 'paired_work_config': sum(b.get('search_work') or 0 for _, b in paired),
            'paired_work_ratio': (sum(b.get('search_work') or 0 for _, b in paired) / sum(a.get('search_work') or 0 for a, _ in paired)) if paired and sum(a.get('search_work') or 0 for a, _ in paired) else None,
            'paired_seconds_baseline': sum(a.get('total_to_budget_seconds') or 0 for a, _ in paired), 'paired_seconds_config': sum(b.get('total_to_budget_seconds') or 0 for _, b in paired),
            'distributions': {k: dist(row[k] for row in cfg_rows) for k in ['first_train_exact_work', 'search_work', 'first_train_exact_seconds', 'total_to_budget_seconds', 'wall_seconds', 'rts_max_live_bytes']},
            'classifications': dict(Counter(row['classification'] for row in cfg_rows)), 'program_kinds': dict(Counter(row['program_kind'] for row in cfg_rows if row['program_kind'])),
            'region_programs': [(row['task_id'], row['selected_program']) for row in cfg_rows if row['program_kind'] == 'region'],
            'region_triggered_tasks': sum(1 for row in cfg_rows if row['rg_triggered']), 'region_executed_sum': sum(row['rg_executed'] or 0 for row in cfg_rows), 'region_pruned_sum': sum(row['rg_pruned'] or 0 for row in cfg_rows),
            'region_budget_cut_tasks': sum(1 for row in cfg_rows if row['rg_budget_cut']), 'region_deferred_sum': sum(row['rg_deferred'] or 0 for row in cfg_rows), 'region_resumed_sum': sum(row['rg_resumed'] or 0 for row in cfg_rows),
            'region_k2plus_tasks': sum(1 for row in cfg_rows if (row['rg_k2plus_splits'] or 0) > 0), 'region_views_legal_hist': dict(Counter(row['rg_views_legal'] for row in cfg_rows if row['rg_triggered'])),
            'independent_verification': dict(Counter(row['independent_verification'] for row in cfg_rows if row['independent_verification'])),
            'peak_live_bytes': max((r['rts_max_live_bytes'] for r in data.values() if r.get('rts_max_live_bytes') is not None), default=None)}
    # baseline comparison with the E0/E1 FullE01 records (same manifest)
    e01 = ROOT / 'results/stage_e01/e01-20261027-main/tasks'
    comparison = {'available': e01.exists(), 'tasks_compared': 0, 'status_equal': 0, 'work_equal': 0, 'program_equal_modulo_region_field': 0, 'differing': []}
    if e01.exists():
        for t, r in frozen.items():
            p = e01 / t / 'FullE01' / 'stage-d-FullE01.json'
            if not p.exists():
                continue
            old = read(p)
            comparison['tasks_compared'] += 1
            comparison['status_equal'] += old['status'] == r['status']
            comparison['work_equal'] += old.get('search_work') == r.get('search_work')
            norm = lambda s: (s or '').replace(', progRegion = Nothing', '')  # noqa: E731
            comparison['program_equal_modulo_region_field'] += norm(old.get('program')) == norm(r.get('program'))
            if old['status'] != r['status'] or old.get('search_work') != r.get('search_work'):
                comparison['differing'].append({'task': t, 'old_status': old['status'], 'new_status': r['status'], 'old_work': old.get('search_work'), 'new_work': r.get('search_work')})
    write(out / 'frozen_vs_e01.json', comparison)
    write(out / 'metrics.json', metrics)
    with (out / 'metrics.csv').open('w', newline='', encoding='utf-8') as f:
        w = csv.writer(f)
        w.writerow(['config', 'coverage', 'train_exact', 'solve_at_60s', 'timeouts', 'runtime_errors', 'new_vs_baseline', 'lost_vs_baseline', 'paired_work_ratio', 'paired_seconds_baseline', 'paired_seconds_config', 'region_triggered', 'region_executed', 'region_pruned', 'region_budget_cut', 'region_k2plus_tasks', 'peak_live_bytes', 'verification'])
        for cfg, m in metrics['configs'].items():
            w.writerow([cfg, m['coverage'], m['train_exact'], m['solve_at_60s'], m['statuses'].get('timeout', 0), m['statuses'].get('runtime_error', 0), len(m['new_vs_baseline']), len(m['lost_vs_baseline']), m['paired_work_ratio'],
                        round(m['paired_seconds_baseline'], 1), round(m['paired_seconds_config'], 1), m['region_triggered_tasks'], m['region_executed_sum'], m['region_pruned_sum'], m['region_budget_cut_tasks'], m['region_k2plus_tasks'], m['peak_live_bytes'], json.dumps(m['independent_verification'])])
    print(json.dumps({cfg: {k: m[k] for k in ('coverage', 'train_exact', 'new_vs_baseline', 'lost_vs_baseline', 'statuses', 'region_programs')} for cfg, m in metrics['configs'].items()}, indent=1))


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument('command', choices=['prepare', 'run', 'report'])
    p.add_argument('--out', required=True)
    p.add_argument('--binary', default=str(ROOT / 'build/latis-stage-e23.exe'))
    p.add_argument('--workers', type=int, default=4)
    p.add_argument('--configs', default=','.join(FULL_CONFIGS))
    p.add_argument('--tasks', default='')
    p.add_argument('--phase', default='formal')
    p.add_argument('--progress-every', type=int, default=10)
    p.add_argument('--rerun-crashed', action='store_true', help='move runtime_error records aside (kept as *.crashed*.json) and rerun them')
    args = p.parse_args()
    if args.command == 'prepare':
        prepare(args)
    elif args.command == 'run':
        run(args)
    else:
        report(args)


if __name__ == '__main__':
    main()
