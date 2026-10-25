"""Stage D fixed-budget train-only matrix, eventlog timing and independent audit."""
import argparse
import csv
import hashlib
import json
import struct
import statistics
import shutil
import subprocess
import sys
import time
import zipfile
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import arc_train_only as base
import verify_stage_d_witness as transform_checker

ROOT = base.ROOT
CONFIGS = ['BaselineA', 'BaselineB', 'BaselineC', 'TypedParamsOnly', 'ComposeOnly', 'TypedCompose', 'FullD', 'NoParamVSA']


def event_times(path):
    """Parse GHC's self-describing event headers; all integers big endian.

    Format: official GHC User Guide eventlog-formats.html and the installed
    GHC 9.10.3 EventLogFormat.h. Ignore unknown event payloads by declared size.
    """
    data = path.read_bytes()
    pos = 0

    def take(fmt):
        nonlocal pos
        size = struct.calcsize(fmt)
        value = struct.unpack_from(fmt, data, pos)
        pos += size
        return value[0] if len(value) == 1 else value

    assert take('>I') == 0x68647262
    assert take('>I') == 0x68657462
    types = {}
    while True:
        marker = take('>I')
        if marker == 0x68657465:
            break
        assert marker == 0x65746200
        tag, size = take('>H'), take('>h')
        length = take('>I')
        pos += length
        extra = take('>I')
        pos += extra
        assert take('>I') == 0x65746500
        types[tag] = size
    assert take('>I') == 0x68647265
    assert take('>I') == 0x64617462
    markers = []
    while pos + 2 <= len(data):
        tag = take('>H')
        if tag == 65535:
            break
        timestamp = take('>Q')
        size = types[tag]
        length = take('>H') if size < 0 else size
        payload = data[pos:pos + length]
        pos += length
        if tag in (19, 58):
            markers.append((timestamp / 1e9, payload.decode('utf-8', 'replace')))
    starts = [t for t, m in markers if m == 'latis-search-start']
    exact = [t for t, m in markers if m == 'latis-train-exact']
    ends = [t for t, m in markers if m == 'latis-search-end']
    start = min(starts) if starts else None
    return {'first_train_exact_seconds': min(exact)-start if exact and start is not None else None,
            'total_to_budget_seconds': max(ends)-start if ends and start is not None else None,
            'eventlog_train_exact_events': len(exact)}


def prepare(args):
    out = Path(args.out)
    if (out / 'data_manifest.json').exists():
        raise RuntimeError('Preserve existing batch; use run/report or a new --out directory')
    base.cmd_prepare(args)
    manifest = base.read_json(out / 'data_manifest.json')
    reference = base.read_json(ROOT / 'results/stage_c/arc_idle/data_manifest.json')
    reference_hashes={t['task_id']:t['sha256'] for t in reference['tasks']}
    assert all(t['sha256']==reference_hashes[t['task_id']] for t in manifest['tasks'])
    if not args.limit and not args.tasks:
        assert manifest['task_count'] == 400
        assert manifest['combined_sha256_of_task_hashes'] == reference['combined_sha256_of_task_hashes']
    code = base.read_json(out / 'code_version.json')
    code['run_id'] = 'stage-d-' + datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%SZ')
    code['configs'] = args.configs.split(',')
    shutil.copyfile(Path(args.binary), out / 'solver.exe')
    assert base.sha256_file(out / 'solver.exe') == code['binary_sha256']
    code['frozen_binary'] = 'solver.exe'
    code['compiler'] = subprocess.check_output(['E:/ghcup/ghc/9.10.3/bin/ghc.exe', '--version'], text=True).strip()
    code['feature_stage'] = 'Stage D: legacy A/B/C first, then typed parameter/composition search'
    code['r2_stage'] = 'not executed; fallback means required, not executed'
    archive = out / 'source_snapshot.zip'
    with zipfile.ZipFile(archive, 'w', zipfile.ZIP_DEFLATED) as z:
        paths = [ROOT / 'latis.cabal']
        for folder, pattern in [('src', '*.hs'), ('app', '*.hs'), ('test', '*.hs'), ('scripts', '*.py'), ('scripts', '*.ps1')]:
            paths += list((ROOT / folder).rglob(pattern))
        for p in sorted(paths):
            z.write(p, p.relative_to(ROOT))
    code['source_archive_sha256'] = base.sha256_file(archive)
    base.write_json(out / 'code_version.json', code)


def one_task(args, task):
    out = Path(args.out)
    task_dir = out / 'tasks' / task['task_id']
    task_dir.mkdir(parents=True, exist_ok=True)
    statuses = {}
    for cfg in args.configs.split(','):
        stage = 'stage-d-' + cfg
        result = task_dir / (stage + '.json')
        if result.exists():
            statuses[cfg] = base.read_json(result)['status']
            continue
        eventlog = (task_dir / (stage + '.eventlog')).resolve()
        cmd = [str(Path(args.binary).resolve()), 'arc-train-only-stage', '--stage', stage,
               '--task', str((out / task['train_only_file']).resolve()), '--out', str(task_dir.resolve()),
               '--timeout-ms', str(args.feature_timeout_ms), '+RTS', '-M4g', '-T', '-l-au', '-ol' + str(eventlog), '-RTS']
        started = time.monotonic()
        try:
            p = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8', errors='replace',
                               cwd=ROOT, timeout=args.feature_timeout_ms / 1000 + 30)
            (task_dir / (stage + '.stderr.txt')).write_text(p.stderr, encoding='utf-8')
            if not result.exists():
                raise RuntimeError(f'binary exited without result: {p.returncode}: {p.stderr[-800:]}')
            rec = base.read_json(result)
            rec['exit_code'] = p.returncode
        except subprocess.TimeoutExpired:
            rec = {'status': 'timeout', 'train_exact': False, 'hard_kill': True,
                   'search_work': None, 'wall_clock_seconds': time.monotonic()-started,
                   'detail': 'driver watchdog', 'stage_d': None}
        rec['driver_seconds'] = time.monotonic()-started
        rec['first_train_exact_seconds'] = None
        rec['total_to_budget_seconds'] = None
        if eventlog.exists():
            try:
                rec.update(event_times(eventlog))
            except (ValueError, KeyError, AssertionError, struct.error) as error:
                rec['eventlog_parse_error'] = str(error)
        # An interrupted search has no final counters. Preserve absence.
        if rec['status'] == 'timeout' or (rec['status'] == 'runtime_error' and not rec.get('counters')):
            rec['search_work'] = None
            rec['stage_d'] = None
        base.write_json(result, rec)
        statuses[cfg] = rec['status']
    return task['task_id'], statuses


def run(args):
    out = Path(args.out)
    manifest = base.read_json(out / 'data_manifest.json')
    code = base.read_json(out / 'code_version.json')
    if code.get('frozen_binary'):
        args.binary=str((out/code['frozen_binary']).resolve())
    assert base.sha256_file(Path(args.binary)) == code['binary_sha256'], 'binary changed after batch preparation'
    assert args.configs.split(',') == code['configs'], 'resume the same fixed configuration matrix'
    for task in manifest['tasks']:
        path=(out/task['train_only_file']).resolve()
        assert path.is_relative_to(out.resolve())
        assert base.sha256_file(path)==task['train_only_sha256']
        assert base.read_json(path)['test']==[]
    meta = {'run_id': code['run_id'], 'configs': args.configs.split(','), 'workers': args.workers,
            'feature_timeout_ms': args.feature_timeout_ms, 'started_utc': datetime.now(timezone.utc).isoformat(),
            'rts': '-M4g -T -l-au', 'task_count': len(manifest['tasks'])}
    base.write_json(out / 'run_meta.json', meta)
    start = time.monotonic()
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        pending = [pool.submit(one_task, args, t) for t in manifest['tasks']]
        for done, future in enumerate(as_completed(pending), 1):
            tid, statuses = future.result()
            print(f'[{done}/{len(pending)}] {tid} {statuses} t={time.monotonic()-start:.0f}s', flush=True)
    meta['wall_clock_seconds'] = time.monotonic()-start
    meta['finished_utc'] = datetime.now(timezone.utc).isoformat()
    base.write_json(out / 'run_meta.json', meta)


def verify_witness(w):
    dims = w['width'], w['height']
    grid = [[w['background']] * dims[0] for _ in range(dims[1])]
    for ordinal, emission in enumerate(w['emissions']):
        assert ordinal == emission['ordinal']
        assert emission['sources'] and set(emission['sources']) <= set(w['source_ids'])
        for x, y, color in emission['pixels']:
            assert 0 <= x < dims[0] and 0 <= y < dims[1] and 0 <= color <= 9
            grid[y][x] = color
    assert grid == w['grid']
    assert w['render_witness_valid'] and w['transform_witness_valid']


def nonidentity_steps(w):
    def signature(emissions):
        return sorted((tuple(e['sources']), tuple(sorted(tuple(p) for p in e['pixels']))) for e in emissions)
    return [s['ordinal'] for s in w.get('derivation_steps', []) if signature(s['input']) != signature(s['output'])]


def report(args):
    out = Path(args.out)
    configs = args.configs.split(',')
    record_paths={(p.parent.name,p.stem.removeprefix('stage-d-')):p for p in (out/'tasks').glob('*/stage-d-*.json')}
    records = {key:base.read_json(path) for key,path in record_paths.items()}
    original_code=base.read_json(out/'code_version.json')
    codes={cfg:original_code for cfg in configs}
    control_run=None
    if getattr(args,'control_out',None):
        control=Path(args.control_out)
        assert base.read_json(control/'data_manifest.json')['combined_sha256_of_task_hashes']==base.read_json(out/'data_manifest.json')['combined_sha256_of_task_hashes']
        control_code=base.read_json(control/'code_version.json')
        assert control_code['configs']==['ComposeOnly']
        codes['ComposeOnly']=control_code
        control_run=base.read_json(control/'run_meta.json')
        replacement=list((control/'tasks').glob('*/stage-d-ComposeOnly.json'))
        assert len(replacement)==400
        for path in replacement:
            key=(path.parent.name,'ComposeOnly')
            records[key]=base.read_json(path); record_paths[key]=path
    old = {p.parent.name: base.read_json(p) for p in (ROOT / 'results/stage_c/arc_idle/tasks').glob('*/stage-c-ObjectShapeFull.json')}
    old_exact = {tid for tid, r in old.items() if r.get('train_exact')}
    rows, witness_count, typed_step_count = [], 0, 0
    d_metric_keys=sorted({k for r in records.values() for k in (r.get('stage_d') or {})})
    for (tid, cfg), r in sorted(records.items()):
        counters, d = r.get('counters') or {}, r.get('stage_d')
        timed_out = r['status'] == 'timeout'
        train = base.read_json(out / 'train_only' / (tid + '.json'))['train']
        evidence = r.get('execution_witnesses') or []
        if r.get('train_exact'): assert len(evidence) == len(train)
        for w,pair in zip(evidence,train):
            verify_witness(w)
            typed_step_count += transform_checker.check(w,pair['input'])
            if r.get('train_exact'): assert w['grid'] == pair['output']
            witness_count += 1
        row = {'task_id': tid, 'config': cfg, 'status': r['status'], 'failure_stage': r.get('failure_stage'),
               'run_id':codes[cfg]['run_id'],'binary_sha256':codes[cfg]['binary_sha256'], 'source_record':str(record_paths[tid,cfg]),
               'train_exact': r.get('train_exact'), 'search_work': r.get('search_work'),
               'first_train_exact_work': None if timed_out else (counters.get('first_solution_work') or None),
               'first_train_exact_seconds': r.get('first_train_exact_seconds'),
               'total_to_budget_seconds': r.get('total_to_budget_seconds'), 'wall_seconds': r.get('wall_clock_seconds'),
               'rts_max_live_bytes': r.get('rts_max_live_bytes'),
               'old_c_success': tid in old_exact, 'old_c_status': old.get(tid, {}).get('status')}
        observed_steps = [len(nonidentity_steps(w)) for w in r.get('execution_witnesses') or []]
        row['selected_nonidentity_steps'] = None if timed_out else max(observed_steps, default=0)
        row['selected_composed'] = None if timed_out else any(n >= 2 for n in observed_steps)
        for flag in ['object_count_exact', 'emitted_object_exact', 'render_exact', 'transform_witness_valid', 'render_witness_valid']:
            evidence = r.get('execution_witnesses') or []
            row[flag] = all(w[flag] for w in evidence) if evidence else None
        for key in d_metric_keys:
            row[key] = None if d is None else d.get(key)
        if timed_out:
            row['failure_stage'] = 'timeout'
        elif not r.get('train_exact') and d and d.get('d_triggered'):
            row['failure_stage'] = 'budget' if any(d.get(k) for k in ['d_param_truncated','d_case_truncated','d_combination_truncated','d_skeleton_truncated']) else 'composition'
        rows.append(row)
    with (out / 'per_task.csv').open('w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0]))
        writer.writeheader(); writer.writerows(rows)
    metrics = {'run': base.read_json(out / 'run_meta.json'), 'configs': {}, 'witnesses_independently_verified': witness_count,
               'typed_transform_steps_independently_verified': typed_step_count,
               'config_run_ids':{cfg:code['run_id'] for cfg,code in codes.items()},
               'config_binary_sha256':{cfg:code['binary_sha256'] for cfg,code in codes.items()},
               'corrected_control_run':control_run}
    new_solutions = {}
    def distribution(values):
        known=[v for v in values if v is not None]
        return {'count':len(known),'sum':sum(known) if known else None,
                'median':statistics.median(known) if known else None,'max':max(known) if known else None}
    for cfg in configs:
        data = {tid: r for (tid, c), r in records.items() if c == cfg}
        exact = {tid for tid, r in data.items() if r.get('train_exact')}
        completed = {tid for tid, r in data.items() if r['status'] != 'timeout'}
        common_old = completed & {tid for tid, r in old.items() if r['status'] != 'timeout'}
        metrics['configs'][cfg] = {
            'tasks': len(data), 'train_exact': len(exact), 'fallback_required': len(data)-len(exact), 'fallback_executed': False,
            'train_exact_rate':len(exact)/len(data) if data else None,'fallback_rate':(len(data)-len(exact))/len(data) if data else None,
            'run_id':codes[cfg]['run_id'],'binary_sha256':codes[cfg]['binary_sha256'],
            'statuses': dict(Counter(r['status'] for r in data.values())), 'new_vs_C': sorted(exact-old_exact),
            'lost_old_solutions': sorted((old_exact & set(data))-exact), 'common_completed_vs_old_C': len(common_old),
            'same_work_vs_old_C': sum(data[t].get('search_work') == old[t].get('search_work') for t in common_old),
            'search_work_completed': sum(r['search_work'] for r in data.values() if r.get('search_work') is not None),
            'peak_live_bytes_completed': max((r['rts_max_live_bytes'] for r in data.values() if r.get('rts_max_live_bytes') is not None), default=None),
            'distributions': {key:distribution(row[key] for row in rows if row['config']==cfg) for key in
                              ['first_train_exact_work','search_work','first_train_exact_seconds','total_to_budget_seconds','wall_seconds']},
            'd_metric_sums_completed': {k: distribution(row[k] for row in rows if row['config']==cfg)['sum'] for k in d_metric_keys},
            'd_metric_observed_tasks': {k: distribution(row[k] for row in rows if row['config']==cfg)['count'] for k in d_metric_keys}}
        new_solutions[cfg] = [{'task_id': tid, 'program': data[tid].get('program'), 'stage_d': data[tid].get('stage_d'),
                               'source_record':str(record_paths[tid,cfg]),'run_id':codes[cfg]['run_id'],
                               'has_composition': any(len(nonidentity_steps(w)) >= 2 for w in data[tid].get('execution_witnesses') or []),
                               'ablation_statuses': {c: records.get((tid,c), {}).get('status') for c in configs}}
                              for tid in sorted(exact-old_exact)]
    # Diagnostic groups retain their original encoder/failure-stage meaning.
    diagnosis = base.read_json(ROOT / 'results/stage_c/validation/cardinality_diagnosis.json')['tasks']
    groups = {'addition_like_102': [r['task_id'] for r in diagnosis if 'addition/replication-like' in r['coarse_class']],
              'position_shape_failure_36': [tid for tid, r in old.items() if r.get('failure_stage') in ['transformation', 'grid_realization', 'grid_exact_check']]}
    transitions = {name: {cfg: [dict(task_id=tid, old=old[tid]['status'], new=records.get((tid,cfg), {}).get('status'),
                                    triggered=(records.get((tid,cfg), {}).get('stage_d') or {}).get('d_triggered')) for tid in ids]
                          for cfg in configs} for name, ids in groups.items()}
    base.write_json(out / 'diagnostic_transitions.json', transitions)
    comparisons=[]
    for tid in sorted({t for t,c in records if c=='FullD'}):
        full,flat=records.get((tid,'FullD')),records.get((tid,'NoParamVSA'))
        if not full or not flat or full['status']=='timeout' or flat['status']=='timeout': continue
        def universe(record):
            return sorted((g['role'],g['contexts'],json.dumps(g.get('expressions'),sort_keys=True)) for g in record.get('parameter_goals',[]))
        comparisons.append({'task_id':tid,'candidate_universes_equal':universe(full)==universe(flat),
                            'train_exact_equal':full.get('train_exact')==flat.get('train_exact'),
                            'full_work':full.get('search_work'),'flat_work':flat.get('search_work')})
    metrics['parameter_universe_comparison']={'common_completed':len(comparisons),
        'candidate_sets_equal':sum(c['candidate_universes_equal'] for c in comparisons),
        'train_exact_equal':sum(c['train_exact_equal'] for c in comparisons)}
    base.write_json(out / 'parameter_universe_comparison.json',comparisons)
    base.write_json(out / 'metrics.json', metrics)
    base.write_json(out / 'new_solutions.json', new_solutions)
    task_count = base.read_json(out / 'data_manifest.json')['task_count']
    base.write_json(out / 'audit.json', {'record_count': len(records), 'expected_records': len(configs)*task_count,
                                        'verified_witnesses': witness_count, 'group_sizes': {k:len(v) for k,v in groups.items()},
                                        'source_and_binary': base.read_json(out / 'code_version.json'),
                                        'configuration_versions':{cfg:{'run_id':code['run_id'],'binary_sha256':code['binary_sha256']} for cfg,code in codes.items()},
                                        'control_correction':control_run,
                                        'timeout_counters': 'missing, never zero-filled'})
    with (out / 'metrics.csv').open('w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f); writer.writerow(['config', 'train_exact', 'fallback_required', 'timeouts', 'new_vs_C', 'lost_old_solutions',
            'search_work_completed','first_exact_work_median','first_exact_seconds_median','total_to_budget_seconds_sum','peak_live_bytes',
            *d_metric_keys])
        for cfg, r in metrics['configs'].items():
            writer.writerow([cfg, r['train_exact'], r['fallback_required'], r['statuses'].get('timeout',0), len(r['new_vs_C']), len(r['lost_old_solutions']),
                r['search_work_completed'],r['distributions']['first_train_exact_work']['median'],r['distributions']['first_train_exact_seconds']['median'],
                r['distributions']['total_to_budget_seconds']['sum'],r['peak_live_bytes_completed'],*[r['d_metric_sums_completed'][k] for k in d_metric_keys]])
    print(json.dumps({cfg: {k:v for k,v in r.items() if k in ['train_exact','statuses','new_vs_C','lost_old_solutions']} for cfg,r in metrics['configs'].items()}, indent=2))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', choices=['prepare','run','report','all'])
    base.add_common(parser)
    parser.add_argument('--configs', default=','.join(CONFIGS))
    parser.add_argument('--control-out', help='explicit corrected ComposeOnly batch; raw first batch remains preserved')
    parser.set_defaults(out=str(ROOT/'results/stage_d/full_p0/arc'), binary=str(ROOT/'build/latis-stage-d-full.exe'), workers=4)
    args = parser.parse_args()
    if args.command in ['prepare','all']: prepare(args)
    if args.command in ['run','all']: run(args)
    if args.command in ['report','all']: report(args)


if __name__ == '__main__':
    main()
