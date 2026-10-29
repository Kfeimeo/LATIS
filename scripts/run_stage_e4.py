"""Stage E4: Quick40-first experiment driver (prepare / run / report).

Modes (`run --mode`):
  quick40       the frozen manifests/e4_quick40.json (40 tasks), default configs E4_Off,E4_OutputSkeletonOnly,E4_NoCrossOutput
  regression26  the 26 tasks solved by E3.1 (E31_Full rows of the frozen run), configs E4_Off,E4_OutputSkeletonOnly
  mechanism     handled by the solver binary (`output-mechanism`), see run_stage_e4.ps1 / .sh
  full400       REFUSED unless --full400 is passed explicitly (never the default)
Each mode writes its records under its own sub-directory (tasks_<mode>_<timeout>s/<task>/<config>/) so a 60 s
diagnostic run and a 300 s run are never mixed. Same protocol as run_stage_e31.py: one frozen solver.exe,
train-only task files, one process per (task, config), in-process timeout + 10 s watchdog, -M2g, eventlog.
Runs live under results/stage_e4/<run_id>; E3/E3.1 directories are never written.
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
from collections import Counter, defaultdict
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parent))
import arc_train_only as base  # noqa: E402
from arc_stage_d import event_times  # noqa: E402
from run_stage_d_plus import parse_events  # noqa: E402
from run_stage_e31 import last_checkpoint, progress_line, source_diff_vs_e3, RTS  # noqa: E402

ROOT = base.ROOT
E31_RUN = ROOT / 'results/stage_e31/e31-20261028-main'
MANIFEST = ROOT / 'manifests/e4_quick40.json'
DEFAULT_CONFIGS = {'quick40': ['E4_Off', 'E4_OutputSkeletonOnly', 'E4_NoCrossOutput'], 'regression26': ['E4_Off', 'E4_OutputSkeletonOnly'], 'full400': ['E4_Off', 'E4_OutputSkeletonOnly']}
ALL_CONFIGS = ['E4_Off', 'E4_OutputSkeletonOnly', 'E4_NoCrossOutput', 'E4_PairwiseOnly', 'E4_NoMDLScore', 'E4_SingleExplanation', 'E4_NoStructuralSharing']


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
    assert out.is_relative_to((ROOT / 'results' / 'stage_e4').resolve()), 'runs live under results/stage_e4/<run_id>'
    return out


def quick40_ids():
    m = read(MANIFEST)
    canonical = json.dumps([x['task_id'] for x in m['tasks']], separators=(',', ':'))
    assert hashlib.sha256(canonical.encode()).hexdigest() == m['task_ids_sha256'], 'Quick40 manifest hash mismatch (tampered?)'
    return [x['task_id'] for x in m['tasks']], m


def regression26_ids():
    csv.field_size_limit(10 ** 9)
    return sorted(r['task_id'] for r in csv.DictReader(open(E31_RUN / 'per_task.csv', encoding='utf-8')) if r['config'] == 'E31_Full' and r['train_exact'] == 'True')


def prepare(args):
    out = guard_out(args.out)
    if (out / 'data_manifest.json').exists():
        raise RuntimeError('existing immutable batch; use run/report or a new --out')
    ids, manifest40 = quick40_ids()
    settings = SimpleNamespace(out=str(out), source='data/arc1-training', binary=args.binary, limit=0, tasks='', workers=args.workers,
                               feature_timeout_ms=300000, v04_timeout_ms=60000, r2_timeout_ms=60000)
    base.cmd_prepare(settings)
    manifest = read(out / 'data_manifest.json')
    assert manifest['task_count'] == 400 and manifest['parse_ok_count'] == 400
    ref = E31_RUN / 'data_manifest.json'
    if ref.exists():
        assert manifest['combined_sha256_of_task_hashes'] == read(ref)['combined_sha256_of_task_hashes']
        manifest['same_data_as'] = str(E31_RUN.relative_to(ROOT))
        write(out / 'data_manifest.json', manifest)
    shutil.copyfile(MANIFEST, out / 'e4_quick40.json')
    code = read(out / 'code_version.json')
    shutil.copyfile(args.binary, out / 'solver.exe')
    (out / 'solver.exe').chmod((out / 'solver.exe').stat().st_mode | 0o111)
    code.update(run_id=out.name, frozen_binary='solver.exe', binary_sha256=sha(out / 'solver.exe'), all_configs=ALL_CONFIGS, default_configs=DEFAULT_CONFIGS,
                compiler=subprocess.check_output([args.ghc, '--version'], text=True).strip(), os=platform.platform(), python=sys.version, cpu_count=os.cpu_count(),
                feature_stage='Stage E4: output-skeleton sidecar (joint cross-output induction) on the E31_Full solver; E4_Off == E31_Full semantics',
                quick40_sha256=manifest40['task_ids_sha256'], quick40_file='e4_quick40.json', regression26=regression26_ids(),
                previous_frozen={'run': str(E31_RUN.relative_to(ROOT)), 'binary_sha256': read(E31_RUN / 'code_version.json')['binary_sha256']},
                source_diff_vs_e3_snapshot=source_diff_vs_e3())
    code['budgets'].update(rts_max_heap='2g', hard_kill_grace_s=10, e4='OutputBudget shape_alts 8 / max_objects 8 / matching 400 assignments / structures 6 / skeletons 6 / view_combos 16 / MDL 3 rects, area 64, 200000 exprs; full400 = not_run unless --full400')
    with zipfile.ZipFile(out / 'source_snapshot.zip', 'w', zipfile.ZIP_DEFLATED) as z:
        for folder in ('src', 'app', 'test', 'scripts', 'docs', 'manifests'):
            for path in sorted((ROOT / folder).rglob('*')):
                if path.suffix in ('.hs', '.py', '.ps1', '.sh', '.md', '.js', '.html', '.json') and 'results' not in path.parts:
                    z.write(path, path.relative_to(ROOT))
        z.write(ROOT / 'latis.cabal', 'latis.cabal')
    code['source_archive_sha256'] = sha(out / 'source_snapshot.zip')
    (out / 'git.diff').write_text(base.git('diff'), encoding='utf-8')
    write(out / 'code_version.json', code)
    print('prepared', out, 'quick40', manifest40['task_ids_sha256'][:16])


def one(out, binary, task, cfg, subdir, timeout_ms):
    tid = task['task_id']
    dest = out / subdir / tid / cfg
    result = dest / f'stage-d-{cfg}.json'
    if result.exists():
        return tid, cfg, read(result)['status'], True
    dest.mkdir(parents=True, exist_ok=True)
    eventlog = (dest / 'search.eventlog').resolve()
    cmd = [str(binary), 'arc-train-only-stage', '--stage', 'stage-d-' + cfg, '--task', str((out / task['train_only_file']).resolve()),
           '--out', str(dest.resolve()), '--timeout-ms', str(timeout_ms), '+RTS', *RTS, '-ol' + str(eventlog), '-RTS']
    started = time.monotonic()
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8', errors='replace', cwd=ROOT, timeout=timeout_ms / 1000 + 10)
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
    rec['timeout_ms_used'] = timeout_ms
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
    if args.mode == 'full400' and not args.full400:
        raise SystemExit('full400 is a milestone run: pass --full400 explicitly (default scripts never run 400 x configs)')
    if args.mode == 'quick40':
        ids, m40 = quick40_ids()
        assert m40['task_ids_sha256'] == code['quick40_sha256'], 'Quick40 manifest differs from the one frozen with this run'
    elif args.mode == 'regression26':
        ids = code['regression26']
    else:
        ids = [t['task_id'] for t in manifest['tasks']]
    tasks = [t for t in manifest['tasks'] if t['task_id'] in set(ids)]
    assert len(tasks) == len(ids)
    configs = args.configs.split(',') if args.configs else DEFAULT_CONFIGS[args.mode]
    subdir = f'tasks_{args.mode}_{args.timeout_ms // 1000}s'
    for t in tasks:
        path = (out / t['train_only_file']).resolve()
        assert path.is_relative_to(out.resolve()) and read(path)['test'] == []
    meta_path = out / 'run_meta.json'
    meta = read(meta_path) if meta_path.exists() else {'phases': []}
    phase = {'phase': args.mode, 'subdir': subdir, 'configs': configs, 'tasks': len(tasks), 'workers': args.workers, 'cpu_count': os.cpu_count(), 'timeout_ms': args.timeout_ms, 'rts': ' '.join(RTS),
             'started_utc': datetime.now(timezone.utc).isoformat()}
    start = time.monotonic()
    done = skipped = 0
    exact = Counter()
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(one, out, binary, t, c, subdir, args.timeout_ms) for t in tasks for c in configs]
        total = len(futures)
        print(progress_line(0, total, start, f'{len(tasks)} tasks x {len(configs)} configs, {args.workers} workers, {args.timeout_ms // 1000}s'), flush=True)
        for f in as_completed(futures):
            tid, cfg, status, was_skipped = f.result()
            done += 1
            skipped += was_skipped
            if status == 'train_exact':
                exact[cfg] += 1
            if done % 5 == 0 or done == total or (not was_skipped and status in ('train_exact', 'runtime_error', 'timeout')):
                print(progress_line(done, total, start, f'last {tid} {cfg} {status}; train-exact ' + ' '.join(f'{c}={n}' for c, n in sorted(exact.items()))), flush=True)
    phase.update(finished_utc=datetime.now(timezone.utc).isoformat(), wall_clock_seconds=time.monotonic() - start, resumed_skipped=skipped)
    meta['phases'].append(phase)
    write(meta_path, meta)


# ---------------------------------------------------------------- report

def e4_fields(rec):
    e4 = rec.get('output_skeleton')
    if not isinstance(e4, dict):
        return {'e4_status': None, 'e4_reason': None, 'e4_skeleton': None, 'e4_holes': None, 'e4_relations': None, 'e4_literals': None, 'e4_shared_cost': None, 'e4_independent_cost': None, 'e4_compression': None, 'e4_ambiguity': None, 'e4_views': None, 'e4_truncated': None, 'e4_cases': None, 'e4_structural_work': None, 'e4_prediction_ready': None}
    best = e4.get('best') or {}
    cost = best.get('cost') or {}
    return {'e4_status': e4.get('status'), 'e4_reason': (e4.get('reason') or '')[:200], 'e4_skeleton': best.get('text'), 'e4_holes': cost.get('holes'), 'e4_relations': cost.get('relations'), 'e4_literals': cost.get('literals'),
            'e4_shared_cost': cost.get('total'), 'e4_independent_cost': cost.get('independent_total') or sum(int(c['cost']) for c in e4.get('independent_costs', [])), 'e4_compression': cost.get('compression_ratio'),
            'e4_ambiguity': best.get('ambiguity'), 'e4_views': json.dumps(sorted({v['view'] for v in best.get('views', [])})) if best else None, 'e4_truncated': json.dumps(e4.get('budget_truncated')), 'e4_cases': e4.get('cases'),
            'e4_structural_work': (e4.get('counters') or {}).get('e4_structural_work'), 'e4_prediction_ready': e4.get('prediction_ready')}


def phase_ms(rec, name):
    v = (rec.get('phase_timings') or {}).get(name)
    return None if v is None else v.get('ms')


def report(args):
    out = guard_out(args.out)
    manifest = read(out / 'data_manifest.json')
    code = read(out / 'code_version.json')
    train = {t['task_id']: read(out / t['train_only_file'])['train'] for t in manifest['tasks']}
    m40 = read(out / 'e4_quick40.json')
    stratum = {x['task_id']: x['stratum'] for x in m40['tasks']}
    rows = []
    subdirs = sorted(p.name for p in out.glob('tasks_*') if p.is_dir())
    for sd in subdirs:
        for p in (out / sd).glob('*/*/stage-d-*.json'):
            if '.crashed' in p.name:
                continue
            r = read(p)
            tid, cfg = p.parent.parent.name, p.parent.name
            ws = r.get('execution_witnesses') or []
            grids = [json.loads(w['grid']) if isinstance(w.get('grid'), str) else w.get('grid') for w in ws]
            pixel_ok = (len(grids) == len(train[tid]) and all(g == pr['output'] for g, pr in zip(grids, train[tid]))) if r.get('train_exact') else None
            row = {'subdir': sd, 'mode': sd.split('_')[1], 'timeout_s': sd.rsplit('_', 1)[1], 'task_id': tid, 'config': cfg, 'stratum': stratum.get(tid), 'status': r['status'], 'train_exact': r.get('train_exact'),
                   'program_text': r.get('program'), 'search_work': r.get('search_work'), 'wall_seconds': r.get('wall_clock_seconds'), 'rts_max_live_bytes': r.get('rts_max_live_bytes'), 'rts_allocated_bytes': r.get('rts_allocated_bytes'),
                   'pixel_replay_exact': pixel_ok, 'e4_render_ms': phase_ms(r, 'e4_render'), 'e4_antiunify_ms': phase_ms(r, 'e4_antiunify'), 'e4_shape_alternatives_ms': phase_ms(r, 'e4_shape_alternatives'),
                   'detail': (r.get('detail') or '')[:200]}
            row.update(e4_fields(r))
            rows.append(row)
    rows.sort(key=lambda x: (x['subdir'], x['task_id'], x['config']))
    with (out / 'per_task.csv').open('w', newline='', encoding='utf-8') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0]))
        w.writeheader(); w.writerows(rows)
    metrics = {'run': code['run_id'], 'binary_sha256': code['binary_sha256'], 'quick40_sha256': code['quick40_sha256'], 'modes': {}, 'full400': 'not_run',
               'historical_baseline_note': 'E3.1 frozen run: 26/400 train-exact (results/stage_e31/e31-20261028-main); this stage reports Quick40 /40 and regression26 /26 only; no number here is a /400 result'}
    for sd in subdirs:
        sub = [r for r in rows if r['subdir'] == sd]
        cfgs = sorted({r['config'] for r in sub})
        by = {(r['task_id'], r['config']): r for r in sub}
        tasks = sorted({r['task_id'] for r in sub})
        off = {t: by.get((t, 'E4_Off')) for t in tasks}
        md = {'tasks': len(tasks), 'configs': cfgs, 'coverage': f'{len(tasks)}/{len(tasks)}', 'per_config': {}}
        for cfg in cfgs:
            rs = [by[(t, cfg)] for t in tasks if (t, cfg) in by]
            same_prog = sum(1 for r in rs if off.get(r['task_id']) and off[r['task_id']]['program_text'] == r['program_text'] and off[r['task_id']]['train_exact'] == r['train_exact'])
            md['per_config'][cfg] = {
                'records': len(rs), 'train_exact': sum(1 for r in rs if r['train_exact']), 'statuses': dict(Counter(r['status'] for r in rs)),
                'same_program_and_exactness_as_E4_Off': same_prog if cfg != 'E4_Off' else None, 'pixel_replay_exact': sum(1 for r in rs if r['pixel_replay_exact']),
                'e4_statuses': dict(Counter(r['e4_status'] for r in rs)), 'e4_status_by_stratum': {s: dict(Counter(r['e4_status'] for r in rs if r['stratum'] == s)) for s in sorted({r['stratum'] for r in rs if r['stratum']})},
                'e4_verified_all_tasks': sorted(r['task_id'] for r in rs if r['e4_status'] == 'StructureVerifiedAllOutputs'),
                'e4_holes_median': statistics.median([r['e4_holes'] for r in rs if r['e4_holes'] is not None]) if any(r['e4_holes'] is not None for r in rs) else None,
                'e4_compression_median': statistics.median([float(r['e4_compression']) for r in rs if r['e4_compression'] is not None]) if any(r['e4_compression'] is not None for r in rs) else None,
                'e4_truncated_tasks': sorted(r['task_id'] for r in rs if r['e4_truncated'] not in (None, '[]', 'null')),
                'wall_seconds_sum': round(sum(r['wall_seconds'] or 0 for r in rs), 1), 'wall_seconds_median': round(statistics.median([r['wall_seconds'] or 0 for r in rs]), 2) if rs else None,
                'e4_ms_sum': {k: round(sum(r[k] or 0 for r in rs), 1) for k in ('e4_render_ms', 'e4_antiunify_ms', 'e4_shape_alternatives_ms')},
                'peak_live_bytes': max((r['rts_max_live_bytes'] or 0) for r in rs) if rs else None, 'prediction_ready_true': sum(1 for r in rs if r['e4_prediction_ready'] is True)}
            if 'E4_Off' in cfgs and cfg != 'E4_Off':
                common = [t for t in tasks if (t, cfg) in by and off.get(t) and by[(t, cfg)]['status'] not in ('timeout', 'runtime_error') and off[t]['status'] not in ('timeout', 'runtime_error')]
                a = sum(off[t]['wall_seconds'] or 0 for t in common); b = sum(by[(t, cfg)]['wall_seconds'] or 0 for t in common)
                md['per_config'][cfg]['paired_wall_vs_E4_Off'] = {'common': len(common), 'off': round(a, 1), 'config': round(b, 1), 'ratio': (b / a) if a else None}
        metrics['modes'][sd] = md
        if sd.startswith('tasks_full400'):
            metrics['full400'] = sd
    write(out / 'metrics.json', metrics)
    print(json.dumps({sd: {c: {k: v[k] for k in ('records', 'train_exact', 'same_program_and_exactness_as_E4_Off', 'e4_statuses')} for c, v in md['per_config'].items()} for sd, md in metrics['modes'].items()}, indent=1))


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument('command', choices=['prepare', 'run', 'report'])
    p.add_argument('--out', required=True)
    p.add_argument('--binary', default=str(ROOT / ('build/latis-stage-e4.exe' if os.name == 'nt' else 'build/latis-stage-e4')))
    p.add_argument('--ghc', default=os.environ.get('LATIS_GHC', 'E:/ghcup/ghc/9.10.3/bin/ghc.exe' if os.name == 'nt' else 'ghc'))
    p.add_argument('--workers', type=int, default=4)
    p.add_argument('--mode', choices=['quick40', 'regression26', 'full400'], default='quick40')
    p.add_argument('--configs', default='')
    p.add_argument('--timeout-ms', type=int, default=60000)
    p.add_argument('--full400', action='store_true', help='explicit milestone switch; without it mode full400 is refused')
    args = p.parse_args()
    {'prepare': prepare, 'run': run, 'report': report}[args.command](args)


if __name__ == '__main__':
    main()
