"""Stage E3.1: append-only train-only ARC experiment (prepare / run / report).

Same protocol as run_stage_e2_e3.py: one frozen solver.exe (the FINAL patched
binary, used by every configuration), 400 train-only copies (test: []), one
process per (task, config), 300 s in-process timeout + 10 s watchdog, -M2g,
eventlog with the latis-train-exact marker. Crashes are kept as
*.crashed.json; `--tasks` re-runs listed tasks; `--subdir` runs a separate
record set (e.g. tasks_w1 for the single-worker 484b58aa replay) so nothing
is overwritten. Runs live under results/stage_e31/<run_id>; the E2/E3 and
E0/E1 directories are never written.
"""
import argparse
import csv
import hashlib
import json
import os
import platform
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
import arc_train_only as base  # noqa: E402
from arc_stage_d import event_times  # noqa: E402
from run_stage_d_plus import parse_events  # noqa: E402
from run_stage_e2_e3 import verify_region_record, classify  # noqa: E402

ROOT = base.ROOT
ALL_CONFIGS = ['FrozenE01', 'E31_PatchedBaseline', 'E31_PrecheckOnly', 'E31_LazyMDLOnly', 'E31_Full', 'E31_FullNoMDL', 'E31_FullNoSafePrune', 'E31_FullSelectorPriority', 'E31_FullCostOrder']
REFERENCE = 'E31_PatchedBaseline'
E3_RUN = ROOT / 'results/stage_e2_e3/e23-20261027-main'
E3_FROZEN_SHA = '2467dd3c1556888e613acee43eccead54cba2afdabd9711b47987a3e7fa54cf6'
TIMEOUT_MS = 300000
RTS = ['-M2g', '-T', '-l-au']
PHASES = ['scene_build', 'partition_expand', 'selector_precheck', 'dependency_prune', 'candidate_execution', 'mdl_compute', 'minimal_cover']


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
    assert out.is_relative_to((ROOT / 'results' / 'stage_e31').resolve()), 'runs live under results/stage_e31/<run_id>'
    return out


def progress_line(done, total, start, note=''):
    elapsed = max(1e-6, time.monotonic() - start)
    rate = done / elapsed
    eta = (total - done) / rate if rate > 0 and done else float('nan')
    width = 30
    filled = int(width * done / total) if total else width
    return f"[{'#' * filled}{'-' * (width - filled)}] {done}/{total} {100.0 * done / max(1, total):5.1f}%  {elapsed / 60:5.1f} min elapsed  ETA {eta / 60:5.1f} min  {note}"


def source_diff_vs_e3():
    """Which .hs files differ between the E3 frozen snapshot and the sources being frozen now."""
    snap = E3_RUN / 'source_snapshot.zip'
    if not snap.exists():
        return {'available': False}
    changed, missing, added = [], [], []
    with zipfile.ZipFile(snap) as z:
        names = {n for n in z.namelist() if n.endswith('.hs')}
        for n in sorted(names):
            p = ROOT / n
            if not p.exists():
                missing.append(n)
            elif z.read(n) != p.read_bytes():
                changed.append(n)
    for folder in ('src', 'app', 'test'):
        for p in sorted((ROOT / folder).rglob('*.hs')):
            rel = p.relative_to(ROOT).as_posix()
            if rel not in names:
                added.append(rel)
    return {'available': True, 'e3_snapshot_sha256': sha(snap), 'changed_hs_files': changed, 'removed_hs_files': missing, 'added_hs_files': added}


def prepare(args):
    out = guard_out(args.out)
    if (out / 'data_manifest.json').exists():
        raise RuntimeError('existing immutable batch; use run/report or a new --out')
    settings = SimpleNamespace(out=str(out), source='data/arc1-training', binary=args.binary, limit=0, tasks='', workers=args.workers,
                               feature_timeout_ms=TIMEOUT_MS, v04_timeout_ms=60000, r2_timeout_ms=60000)
    base.cmd_prepare(settings)
    manifest = read(out / 'data_manifest.json')
    assert manifest['task_count'] == 400 and manifest['parse_ok_count'] == 400
    ref = E3_RUN / 'data_manifest.json'
    if ref.exists():
        assert manifest['combined_sha256_of_task_hashes'] == read(ref)['combined_sha256_of_task_hashes']
        manifest['same_data_as'] = 'results/stage_e2_e3/e23-20261027-main'
        write(out / 'data_manifest.json', manifest)
    code = read(out / 'code_version.json')
    shutil.copyfile(args.binary, out / 'solver.exe')
    code.update(run_id=out.name, frozen_binary='solver.exe', binary_sha256=sha(out / 'solver.exe'), all_configs=ALL_CONFIGS, reference_config=REFERENCE,
                compiler=subprocess.check_output(['E:/ghcup/ghc/9.10.3/bin/ghc.exe', '--version'], text=True).strip(),
                feature_stage='Stage E3.1: one final patched binary; FrozenE01 (negative control), E31_PatchedBaseline (= FullE3 semantics on the patched sources) and the precheck / lazy MDL / scheduling ablations (see config text per record)',
                r2_stage='not executed', os=platform.platform(), python=sys.version, cpu_count=os.cpu_count(),
                previous_frozen={'run': 'results/stage_e2_e3/e23-20261027-main', 'binary_sha256': E3_FROZEN_SHA, 'post_evaluation_patches': ['Scene.hs: c_rect via minimalCover (now attachRectCover / MDLCache)', 'Search.hs: latis-train-exact traceEvent on region fits']},
                source_diff_vs_e3_snapshot=source_diff_vs_e3())
    code['budgets'].update(wall_seconds=TIMEOUT_MS // 1000, rts_max_heap='2g', hard_kill_grace_s=10,
                           region_search='rcQuantum=6 candidates per goal per round, rcExecutionBudget=2400 program executions (each over all cases), partition budget 24 expansions / depth 3; MDLBudget 3 rects / area 64 / 200000 exprs; cover 2000 nodes / area 64')
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


def one(out, binary, task, cfg, subdir):
    tid = task['task_id']
    dest = out / subdir / tid / cfg
    result = dest / f'stage-d-{cfg}.json'
    if result.exists():
        return tid, cfg, read(result)['status'], True
    dest.mkdir(parents=True, exist_ok=True)
    eventlog = (dest / 'search.eventlog').resolve()
    cmd = [str(binary), 'arc-train-only-stage', '--stage', 'stage-d-' + cfg, '--task', str((out / task['train_only_file']).resolve()),
           '--out', str(dest.resolve()), '--timeout-ms', str(TIMEOUT_MS), '+RTS', *RTS, '-ol' + str(eventlog), '-RTS']
    started = time.monotonic()
    started_utc = datetime.now(timezone.utc).isoformat()
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
    rec['driver_started_utc'] = started_utc
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
    phase = {'phase': args.phase, 'subdir': args.subdir, 'configs': configs, 'tasks': len(tasks), 'workers': args.workers, 'cpu_count': os.cpu_count(), 'timeout_ms': TIMEOUT_MS, 'rts': ' '.join(RTS),
             'started_utc': datetime.now(timezone.utc).isoformat()}
    start = time.monotonic()
    done = skipped = 0
    exact = Counter()
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(one, out, binary, t, c, args.subdir) for t in tasks for c in configs]
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


# ---------------------------------------------------------------- report

def phase_ms(rec, name):
    pt = rec.get('phase_timings') or {}
    v = pt.get(name)
    return None if v is None else v.get('ms')


def phase_count(rec, name):
    pt = rec.get('phase_timings') or {}
    v = pt.get(name)
    return None if v is None else v.get('count')


def row_of(tid, cfg, r, train):
    counters = r.get('counters') or {}
    rs = r.get('region_search') or {}
    run_ = rs.get('run') or {}
    met = run_.get('metrics') or {}
    ver = verify_region_record(r, train) if rs.get('selected_program') else {'applicable': False}
    sp = rs.get('selected_program')
    acc = run_.get('universe_accounting') or {}
    pre = run_.get('precheck') or {}
    mdl = run_.get('mdl_cache') or {}
    row = {'task_id': tid, 'config': cfg, 'status': r['status'], 'train_exact': r.get('train_exact'), 'classification': classify(r), 'failure_stage': r.get('failure_stage'),
           'search_work': r.get('search_work'), 'first_train_exact_work': (counters.get('first_solution_work') or None) if r.get('train_exact') else None,
           'first_train_exact_seconds': r.get('first_train_exact_seconds'), 'total_to_budget_seconds': r.get('total_to_budget_seconds'), 'wall_seconds': r.get('wall_clock_seconds'), 'driver_seconds': r.get('driver_seconds'),
           'rts_max_live_bytes': r.get('rts_max_live_bytes'), 'rts_max_mem_in_use_bytes': r.get('rts_max_mem_in_use_bytes'), 'rts_allocated_bytes': r.get('rts_allocated_bytes'), 'rts_gc_cpu_ns': r.get('rts_gc_cpu_ns'), 'rts_mutator_cpu_ns': r.get('rts_mutator_cpu_ns'), 'rts_major_gcs': r.get('rts_major_gcs'),
           'program_kind': 'region' if sp else ('content_first' if (r.get('content_first') or {}).get('selected_plan') else ('legacy' if r.get('program') else None)),
           'selected_program': sp['text'] if sp else ((r.get('content_first') or {}).get('selected_plan_text')), 'program_text': r.get('program'),
           'rg_triggered': met.get('rg_triggered'), 'rg_views_legal': met.get('rg_views_legal'), 'rg_universe': met.get('rg_universe'), 'rg_candidates_considered': met.get('rg_candidates_considered'),
           'rg_executed': met.get('rg_executed'), 'rg_prechecked': met.get('rg_prechecked'), 'rg_pruned': met.get('rg_pruned'), 'rg_execution_invalid': met.get('rg_execution_invalid'), 'rg_no_fit': met.get('rg_no_fit'), 'rg_fits': met.get('rg_fits'),
           'rg_budget_cut': met.get('rg_budget_cut'), 'rg_deferred': met.get('rg_deferred'), 'rg_resumed': met.get('rg_resumed'), 'rg_first_fit_exposure': met.get('rg_first_fit_exposure'), 'rg_first_fit_candidate_index': met.get('rg_first_fit_candidate_index'),
           'rg_pruned_before_first_fit': met.get('rg_pruned_before_first_fit'), 'rg_prechecked_before_first_fit': met.get('rg_prechecked_before_first_fit'),
           'rg_precheck_entries': met.get('rg_precheck_entries'), 'rg_selector_evaluations': met.get('rg_selector_evaluations'), 'rg_k2plus_splits': met.get('rg_k2plus_splits'),
           'rg_mdl_objects': met.get('rg_mdl_objects'), 'rg_mdl_distinct_masks': met.get('rg_mdl_distinct_masks'), 'rg_mdl_cache_hits_static': met.get('rg_mdl_cache_hits_static'), 'rg_mdl_proven': met.get('rg_mdl_proven'), 'rg_mdl_bounded': met.get('rg_mdl_bounded'), 'rg_mdl_not_computed': met.get('rg_mdl_not_computed'), 'rg_crect_computed': met.get('rg_crect_computed'),
           'shape_basis': run_.get('shape_basis'), 'universe_accounting_consistent': acc.get('consistent'), 'precheck_enabled': pre.get('enabled'),
           'independent_verification': None if not ver.get('applicable') else ('passed' if ver.get('all_passed') else 'FAILED'), 'detail': (r.get('detail') or '')[:300]}
    for ph in PHASES:
        row[f'{ph}_ms'] = phase_ms(r, ph)
        row[f'{ph}_count'] = phase_count(r, ph)
    _ = mdl
    return row


def dist(values):
    known = [v for v in values if v is not None]
    return {'count': len(known), 'sum': sum(known) if known else None, 'median': statistics.median(known) if known else None, 'max': max(known) if known else None}


def paired(ref_rows, cfg_rows, keys):
    """Sums over the tasks both configurations completed (timeouts/crashes excluded from both sides)."""
    common = sorted(set(ref_rows) & set(cfg_rows))
    common = [t for t in common if ref_rows[t]['status'] not in ('timeout', 'runtime_error') and cfg_rows[t]['status'] not in ('timeout', 'runtime_error')]
    out = {'common_completed': len(common)}
    for k in keys:
        a = sum(ref_rows[t][k] or 0 for t in common)
        b = sum(cfg_rows[t][k] or 0 for t in common)
        out[k] = {'reference': a, 'config': b, 'ratio': (b / a) if a else None}
    return out


def report(args):
    out = guard_out(args.out)
    manifest = read(out / 'data_manifest.json')
    code = read(out / 'code_version.json')
    train = {t['task_id']: read(out / t['train_only_file'])['train'] for t in manifest['tasks']}
    records = {(p.parent.parent.name, p.parent.name): read(p) for p in (out / 'tasks').glob('*/*/stage-d-*.json') if '.crashed' not in p.name}
    crashed = [str(p.relative_to(out)) for p in (out / 'tasks').glob('*/*/*.crashed*.json')]
    configs = [c for c in ALL_CONFIGS if any(cc == c for _, cc in records)] + sorted({c for _, c in records} - set(ALL_CONFIGS))
    rows, verifications = [], {}
    for (tid, cfg), r in sorted(records.items()):
        row = row_of(tid, cfg, r, train[tid])
        rows.append(row)
        if row['independent_verification'] is not None:
            verifications[(tid, cfg)] = verify_region_record(r, train[tid])
    with (out / 'per_task.csv').open('w', newline='', encoding='utf-8') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0]))
        w.writeheader(); w.writerows(rows)
    write(out / 'independent_verification.json', {f'{t}/{c}': v for (t, c), v in verifications.items()})
    by_cfg = {cfg: {row['task_id']: row for row in rows if row['config'] == cfg} for cfg in configs}
    recs_by_cfg = {cfg: {t: r for (t, c), r in records.items() if c == cfg} for cfg in configs}
    frozen = by_cfg.get('FrozenE01', {})
    refr = by_cfg.get(REFERENCE, {})
    # E3 frozen FullE3 records (the previous formal result) for the retention / regression check
    e3 = {}
    if (E3_RUN / 'tasks').exists():
        for p in (E3_RUN / 'tasks').glob('*/FullE3/stage-d-FullE3.json'):
            e3[p.parent.parent.name] = read(p)
    e3_exact = {t for t, r in e3.items() if r.get('train_exact')}
    e3_frozen = {}
    for p in (E3_RUN / 'tasks').glob('*/FrozenE01/stage-d-FrozenE01.json'):
        e3_frozen[p.parent.parent.name] = read(p)
    metrics = {'run': code['run_id'], 'binary_sha256': code['binary_sha256'], 'reference_config': REFERENCE, 'configs': {}, 'crashed_records_kept': crashed,
               'e3_reference': {'run': str(E3_RUN.relative_to(ROOT)), 'binary_sha256': E3_FROZEN_SHA, 'fullE3_train_exact': sorted(e3_exact), 'available': bool(e3)},
               'workers_by_phase': [(ph['phase'], ph['workers'], ph.get('subdir', 'tasks')) for ph in (read(out / 'run_meta.json')['phases'] if (out / 'run_meta.json').exists() else [])]}
    paired_keys = ['search_work', 'total_to_budget_seconds', 'wall_seconds', 'rg_executed', 'rg_prechecked', 'rg_pruned', 'rg_candidates_considered', 'rg_execution_invalid', 'rg_no_fit', 'rg_selector_evaluations', 'rts_allocated_bytes', 'rts_gc_cpu_ns', 'rts_mutator_cpu_ns'] + [f'{ph}_ms' for ph in PHASES] + [f'{ph}_count' for ph in PHASES]
    for cfg in configs:
        data = recs_by_cfg[cfg]
        cfg_rows = by_cfg[cfg]
        exact = {t for t, r in data.items() if r.get('train_exact')}
        same_program_vs_e3 = sum(1 for t in exact & e3_exact if (data[t].get('program') or '') == (e3[t].get('program') or ''))
        region_same_vs_e3 = sum(1 for t in exact & e3_exact if ((data[t].get('region_search') or {}).get('selected_program') or {}).get('text') == ((e3[t].get('region_search') or {}).get('selected_program') or {}).get('text') and (data[t].get('region_search') or {}).get('selected_program'))
        metrics['configs'][cfg] = {
            'tasks': len(data), 'train_exact': len(exact), 'coverage': '400_complete' if len(data) == 400 else f'partial_{len(data)}_of_400',
            'solve_at_60s': sum(1 for t in exact if (data[t].get('first_train_exact_seconds') if data[t].get('first_train_exact_seconds') is not None else (data[t].get('wall_clock_seconds') or 1e9)) <= 60),
            'solve_at_60s_basis': {'eventlog_marker': sum(1 for t in exact if data[t].get('first_train_exact_seconds') is not None), 'wall_clock_upper_bound': sum(1 for t in exact if data[t].get('first_train_exact_seconds') is None),
                                   'note': 'the final binary emits latis-train-exact for region fits too; wall-clock upper bounds should be 0 here'},
            'solve_at_300s': len(exact), 'statuses': dict(Counter(r['status'] for r in data.values())),
            'new_vs_e3_fullE3': sorted(exact - e3_exact), 'lost_vs_e3_fullE3': sorted((e3_exact & set(data)) - exact), 'retained_vs_e3_fullE3': len(exact & e3_exact),
            'same_program_text_vs_e3': same_program_vs_e3, 'same_region_program_vs_e3': region_same_vs_e3,
            'new_vs_frozen_in_batch': sorted(exact - {t for t, r in frozen.items() if r['train_exact']}), 'lost_vs_frozen_in_batch': sorted({t for t, r in frozen.items() if r['train_exact']} - exact) if frozen else None,
            'same_program_vs_reference': sum(1 for t in exact if t in refr and refr[t]['train_exact'] and refr[t]['program_text'] == cfg_rows[t]['program_text']) if refr else None,
            'paired_vs_frozen': paired(frozen, cfg_rows, paired_keys) if frozen else None,
            'paired_vs_reference': paired(refr, cfg_rows, paired_keys) if refr else None,
            'distributions': {k: dist(row[k] for row in cfg_rows.values()) for k in ['first_train_exact_work', 'search_work', 'first_train_exact_seconds', 'total_to_budget_seconds', 'wall_seconds', 'rts_max_live_bytes', 'rts_allocated_bytes', 'rts_gc_cpu_ns', 'mdl_compute_ms', 'minimal_cover_ms', 'scene_build_ms', 'selector_precheck_ms', 'candidate_execution_ms']},
            'classifications': dict(Counter(row['classification'] for row in cfg_rows.values())), 'program_kinds': dict(Counter(row['program_kind'] for row in cfg_rows.values() if row['program_kind'])),
            'region_programs': sorted((row['task_id'], row['selected_program']) for row in cfg_rows.values() if row['program_kind'] == 'region'),
            'region_triggered_tasks': sum(1 for row in cfg_rows.values() if row['rg_triggered']),
            'sums': {k: sum(row[k] or 0 for row in cfg_rows.values()) for k in ['rg_universe', 'rg_candidates_considered', 'rg_executed', 'rg_prechecked', 'rg_pruned', 'rg_execution_invalid', 'rg_no_fit', 'rg_fits', 'rg_deferred', 'rg_resumed', 'rg_selector_evaluations', 'rg_precheck_entries', 'rg_mdl_objects', 'rg_mdl_distinct_masks', 'rg_mdl_cache_hits_static', 'rg_mdl_proven', 'rg_mdl_bounded', 'rg_mdl_not_computed', 'rg_crect_computed'] + [f'{ph}_ms' for ph in PHASES] + [f'{ph}_count' for ph in PHASES]},
            'region_budget_cut_tasks': sum(1 for row in cfg_rows.values() if row['rg_budget_cut']), 'region_k2plus_tasks': sum(1 for row in cfg_rows.values() if (row['rg_k2plus_splits'] or 0) > 0),
            'universe_accounting_inconsistent': [row['task_id'] for row in cfg_rows.values() if row['rg_triggered'] and row['universe_accounting_consistent'] is False],
            'independent_verification': dict(Counter(row['independent_verification'] for row in cfg_rows.values() if row['independent_verification'])),
            'peak_live_bytes': max((r['rts_max_live_bytes'] for r in data.values() if r.get('rts_max_live_bytes') is not None), default=None),
            'tasks_over_500mb_live': sorted(t for t, r in data.items() if (r.get('rts_max_live_bytes') or 0) > 500_000_000),
            'shape_basis': dict(Counter(row['shape_basis'] for row in cfg_rows.values() if row['shape_basis']))}
    # per-task regression of the patched baseline against the E3 frozen FullE3 records
    regression = {'available': bool(e3), 'compared': 0, 'status_equal': 0, 'program_equal': 0, 'executed_equal': 0, 'pruned_equal': 0, 'work_equal': 0, 'differing': []}
    if e3 and refr:
        for t, row in refr.items():
            old = e3.get(t)
            if not old:
                continue
            new = recs_by_cfg[REFERENCE][t]
            regression['compared'] += 1
            om = ((old.get('region_search') or {}).get('run') or {}).get('metrics') or {}
            nm = ((new.get('region_search') or {}).get('run') or {}).get('metrics') or {}
            se = old['status'] == new['status']; pe = (old.get('program') or '') == (new.get('program') or '')
            ee = om.get('rg_executed') == nm.get('rg_executed'); pr = om.get('rg_pruned') == nm.get('rg_pruned'); we = old.get('search_work') == new.get('search_work')
            regression['status_equal'] += se; regression['program_equal'] += pe; regression['executed_equal'] += ee; regression['pruned_equal'] += pr; regression['work_equal'] += we
            if not (se and pe and ee and pr and we):
                regression['differing'].append({'task': t, 'old_status': old['status'], 'new_status': new['status'], 'old_work': old.get('search_work'), 'new_work': new.get('search_work'),
                                                'old_executed': om.get('rg_executed'), 'new_executed': nm.get('rg_executed'), 'old_pruned': om.get('rg_pruned'), 'new_pruned': nm.get('rg_pruned'), 'program_equal': pe})
    # FrozenE01 in this batch vs E3's FrozenE01 (legacy path untouched?)
    frozen_cmp = {'available': bool(e3_frozen) and bool(frozen), 'compared': 0, 'status_equal': 0, 'work_equal': 0, 'differing': []}
    if frozen_cmp['available']:
        for t, row in frozen.items():
            old = e3_frozen.get(t)
            if not old:
                continue
            new = recs_by_cfg['FrozenE01'][t]
            frozen_cmp['compared'] += 1
            frozen_cmp['status_equal'] += old['status'] == new['status']; frozen_cmp['work_equal'] += old.get('search_work') == new.get('search_work')
            if old['status'] != new['status'] or old.get('search_work') != new.get('search_work'):
                frozen_cmp['differing'].append({'task': t, 'old_status': old['status'], 'new_status': new['status'], 'old_work': old.get('search_work'), 'new_work': new.get('search_work')})
    metrics['patched_baseline_vs_e3_fullE3'] = regression
    metrics['frozen_vs_e3_frozen'] = frozen_cmp
    # single-worker replays (tasks_w1)
    w1 = {}
    for p in (out / 'tasks_w1').glob('*/*/stage-d-*.json'):
        r = read(p)
        w1[f'{p.parent.parent.name}/{p.parent.name}'] = {'status': r['status'], 'wall_seconds': r.get('wall_clock_seconds'), 'search_work': r.get('search_work'), 'rts_max_live_bytes': r.get('rts_max_live_bytes'),
                                                          'rg_executed': (((r.get('region_search') or {}).get('run') or {}).get('metrics') or {}).get('rg_executed'), 'detail': (r.get('detail') or '')[:200],
                                                          'main_batch': {'status': records[(p.parent.parent.name, p.parent.name)]['status'], 'wall_seconds': records[(p.parent.parent.name, p.parent.name)].get('wall_clock_seconds')} if (p.parent.parent.name, p.parent.name) in records else None}
    metrics['single_worker_replays'] = w1
    write(out / 'metrics.json', metrics)
    with (out / 'metrics.csv').open('w', newline='', encoding='utf-8') as f:
        w = csv.writer(f)
        w.writerow(['config', 'coverage', 'train_exact', 'solve_at_60s', 'timeouts', 'runtime_errors', 'retained_vs_e3', 'new_vs_e3', 'lost_vs_e3', 'paired_work_ratio_vs_ref', 'paired_seconds_ref', 'paired_seconds_cfg', 'region_executed', 'region_prechecked', 'region_pruned', 'execution_invalid', 'no_fit', 'budget_cut_tasks', 'peak_live_bytes', 'mdl_compute_ms', 'minimal_cover_ms', 'verification'])
        for cfg, m in metrics['configs'].items():
            pv = m['paired_vs_reference'] or {}
            w.writerow([cfg, m['coverage'], m['train_exact'], m['solve_at_60s'], m['statuses'].get('timeout', 0), m['statuses'].get('runtime_error', 0), m['retained_vs_e3_fullE3'], len(m['new_vs_e3_fullE3']), len(m['lost_vs_e3_fullE3']),
                        (pv.get('search_work') or {}).get('ratio'), (pv.get('total_to_budget_seconds') or {}).get('reference'), (pv.get('total_to_budget_seconds') or {}).get('config'),
                        m['sums']['rg_executed'], m['sums']['rg_prechecked'], m['sums']['rg_pruned'], m['sums']['rg_execution_invalid'], m['sums']['rg_no_fit'], m['region_budget_cut_tasks'], m['peak_live_bytes'], m['sums']['mdl_compute_ms'], m['sums']['minimal_cover_ms'], json.dumps(m['independent_verification'])])
    print(json.dumps({cfg: {k: m[k] for k in ('coverage', 'train_exact', 'new_vs_e3_fullE3', 'lost_vs_e3_fullE3', 'statuses')} for cfg, m in metrics['configs'].items()}, indent=1))
    print('patched baseline vs E3 FullE3:', json.dumps({k: v for k, v in regression.items() if k != 'differing'}), 'differing:', len(regression['differing']))


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument('command', choices=['prepare', 'run', 'report'])
    p.add_argument('--out', required=True)
    p.add_argument('--binary', default=str(ROOT / 'build/latis-stage-e31.exe'))
    p.add_argument('--workers', type=int, default=4)
    p.add_argument('--configs', default=','.join(ALL_CONFIGS))
    p.add_argument('--tasks', default='')
    p.add_argument('--phase', default='formal')
    p.add_argument('--subdir', default='tasks')
    p.add_argument('--progress-every', type=int, default=10)
    args = p.parse_args()
    if args.command == 'prepare':
        prepare(args)
    elif args.command == 'run':
        run(args)
    else:
        report(args)


if __name__ == '__main__':
    main()
