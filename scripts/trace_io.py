"""LATIS single-IO search trace: run, post-process, replay, render, compare.

Subcommands
  run      one solver process (latis trace-io) on one task and one training
           pair, then post-process the recorded events and render index.html
  render   rebuild index.html from a saved trace.json only (no solver)
  compare  compare two saved traces (no solver)
  replay   independently execute saved candidate ASTs (latis trace-replay;
           executor only, never a search) and check them against the record
  oracle-replay  execute a hand-written AST; marked oracle_diagnostic_only

The solver only receives train-only files (test: []).  Nothing here feeds a
target output into a search decision; the post-hoc validation of
solve-single-pair runs after the search and is reported separately.
"""
import argparse
import gzip
import hashlib
import html
import json
import shutil
import subprocess
import sys
import time
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
SCHEMA = 'latis-trace-io/1'
DEFAULT_BINARY = ROOT / 'build' / 'latis-trace-io.exe'
LEVELS = ['summary', 'branches', 'candidates', 'full']
STAGES = [
    ('Grounding', ['Grounding'], '输入编码与对象'),
    ('Size', ['SizeRule'], '输出尺寸规则'),
    ('Alignment', ['Alignment'], '旧前端 RankAlign 对齐'),
    ('Scalar/Typed', ['TypedParameter@alignment'], 'Stage A 标量 typed hole'),
    ('Referent/VSA', ['ParameterVSA'], 'Stage B 参数 VSA / 指称'),
    ('Shape', ['ShapeDecomposition'], 'Stage C Shape 审计'),
    ('Relation', ['LegacyRelation'], 'Stage C 关系变换'),
    ('Unified/Typed', ['Composition', 'TypedParameter@unified'], 'Stage D 逆向 typed 参数计划'),
    ('Extension', ['Extension'], 'Stage D+ 3/4 槽 forward 扩展'),
    ('JointForward', ['JointForward'], 'Stage D 联合 forward 回退'),
    ('ContentFirst', ['ContentFirst'], 'Content-first OutputSpec：Input → Selection → Bounds → Dimensions → Render'),
    ('RegionSearch', ['RegionSearch'], 'Stage E2/E3：Scene 视图 → Object 诱导分区树 → Region 整体程序（广度调度 / 安全剪枝）'),
    ('Execution', ['Execution'], 'Pipeline 执行'),
    ('Render', ['Render'], '渲染与整格比对'),
    ('Verify', ['Run@terminal'], '终止与训练校验（驱动终止记录）'),
]
NOT_INSTRUMENTED = [
    {'scope': 'SizeRule', 'detail': '逐模板求值与常数赋值', 'source': 'src/Synthesis/Collection/Typed.hs:305 synthesizeTyped (via Size.hs:94 synthesizeSize)'},
    {'scope': 'Alignment', 'detail': '逐 key 合法性拒绝（只在 Graph.keyCandidates）', 'source': 'src/Synthesis/Collection/Front.hs legalKey'},
    {'scope': 'TypedParameter@alignment', 'detail': 'Stage A 标量 hole 的逐模板候选', 'source': 'src/Synthesis/Collection/Typed.hs:305 synthesizeTyped'},
    {'scope': 'ParameterVSA', 'detail': 'B 参照图节点级构建', 'source': 'src/Synthesis/Collection/Referent.hs:444 buildGraph'},
    {'scope': 'ShapeDecomposition', 'detail': 'Shape 分解内部候选', 'source': 'src/Synthesis/Collection/Shape.hs:170 decompose'},
    {'scope': 'TypedParameter@unified', 'detail': 'D 参数模板内部逐模板 fit / 类型过滤计数', 'source': 'src/Synthesis/Collection/Unified.hs goal → Typed.synthesizeTyped'},
    {'scope': 'Render', 'detail': '旧 alignment 序列体 realize 的逐 case 网格', 'source': 'src/Synthesis/Collection/Front.hs realize'},
    {'scope': 'ContentFirst', 'detail': '逐 case 的 selector 谓词求值（每个 plan 只记录 selection 结论与 bounds）', 'source': 'src/Synthesis/Collection/ContentFirst.hs selectWith / searchContentFirst'},
    {'scope': 'RegionSearch', 'detail': '惰性分区展开与 Scene 构建（只在 solver_record.region_search.run.trees 中记录结果，不逐步发事件）', 'source': 'src/Synthesis/Collection/Region/Partition.hs expandLazy / Scene.hs sceneFromView'},
]
VOLATILE = {'timestamp_monotonic_ns', 'wall_seconds', 'task_file', 'sink_seconds', 'monotonic_seconds', 'elapsed_seconds'}


def read_json(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def write_json(p, v):
    p = Path(p)
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(json.dumps(v, ensure_ascii=False, indent=1) + '\n', encoding='utf-8')


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def rel(p):
    try:
        return Path(p).resolve().relative_to(ROOT).as_posix()
    except ValueError:
        return str(p)


def guard_out(out):
    out = Path(out).resolve()
    for forbidden in ('results/stage_a', 'results/stage_b', 'results/stage_c', 'results/stage_d', 'results/stage_d_plus'):
        if out.is_relative_to((ROOT / forbidden).resolve()):
            raise SystemExit(f'refusing to write into historical batch directory {forbidden}')
    return out


# ---------------------------------------------------------------- events

def read_events(out):
    """JSON lines; a torn last line after a kill is counted, never repaired."""
    plain, packed = out / 'search_events.jsonl', out / 'search_events.jsonl.gz'
    if plain.exists():
        raw = plain.read_bytes()
    elif packed.exists():
        raw = gzip.decompress(packed.read_bytes())
    else:
        return [], {'lines': 0, 'malformed_lines': 0, 'missing_file': True}
    events, bad = [], 0
    lines = raw.split(b'\n')
    for i, line in enumerate(lines):
        if not line.strip():
            continue
        try:
            events.append(json.loads(line.decode('utf-8')))
        except (ValueError, UnicodeDecodeError):
            bad += 1
    return events, {'lines': len(events) + bad, 'malformed_lines': bad, 'missing_file': False,
                    'raw_sha256': hashlib.sha256(raw).hexdigest(), 'raw_bytes': len(raw)}


def structural_hash(events):
    canon = [json.dumps({k: v for k, v in e.items() if k not in VOLATILE}, sort_keys=True) for e in events]
    return hashlib.sha256('\n'.join(canon).encode()).hexdigest()


def compress_events(out):
    plain, packed = out / 'search_events.jsonl', out / 'search_events.jsonl.gz'
    if not plain.exists():
        return None
    data = plain.read_bytes()
    with packed.open('wb') as f, gzip.GzipFile(filename='', mode='wb', fileobj=f, compresslevel=6, mtime=0) as gz:
        gz.write(data)
    assert gzip.decompress(packed.read_bytes()) == data, 'lossless gzip check failed'
    plain.unlink()
    return {'gzip_sha256': sha(packed), 'uncompressed_sha256': hashlib.sha256(data).hexdigest(), 'uncompressed_bytes': len(data), 'gzip_bytes': packed.stat().st_size, 'lossless_verified': True}


def stage_of(e):
    scope = e.get('scope')
    if scope == 'TypedParameter':
        parent = e.get('parent_id') or e.get('parent_branch_id') or ''
        return 'TypedParameter@alignment' if parent == 'alignment' else 'TypedParameter@unified'
    if scope == 'Run':
        return 'Run@' + str(e.get('kind'))
    return scope


def blocker(e):
    if e.get('event') == 'task-terminal':
        return None
    sr = e.get('stop_reason')
    if e.get('event') == 'candidate-prefix':
        # A prefix declaration is evidence only of a cut or an empty legal prefix.
        if sr == 'BudgetCut':
            return sr
        return 'NoFitYet' if e.get('attempted') == 0 else None
    if sr in ('InvalidPrecondition', 'BudgetCut', 'NoFitYet') and e.get('event') != 'entered':
        return sr
    oc = e.get('outcome')
    if e.get('event_source') == 'trace' and e.get('kind') in ('completed', 'evaluated', 'truncated') and oc in ('invalid', 'no_fit', 'truncated'):
        return oc
    return None


def ev_ref(e):
    keys = ['sequence', 'scope', 'kind', 'event', 'stage', 'branch_id', 'parent_branch_id', 'parent_id', 'candidate_id',
            'stop_reason', 'outcome', 'reason_code', 'reason', 'case_index', 'budget', 'budgets', 'entry']
    return {k: e[k] for k in keys if k in e}


# ---------------------------------------------------------------- analysis

def build_candidates(events):
    cands = {}
    for e in events:
        cid = e.get('candidate_id')
        if not cid or e.get('event_source') != 'trace':
            continue
        c = cands.setdefault(cid, {'candidate_id': cid, 'scope': None, 'entry': None, 'parent_branch_id': None, 'ast': None,
                                   'cost': None, 'pipeline_slots': None, 'max_param_depth': None, 'enumeration_index': None,
                                   'status': 'unknown', 'reason_code': None, 'cases': [], 'sequences': [], 'duplicates': 0,
                                   'executed': False, 'rendered': False, 'truncation': None})
        c['sequences'].append(e['sequence'])
        c['scope'] = c['scope'] or ('LegacyRelation' if e['scope'] == 'LegacyRelation' else 'ContentFirst' if e['scope'] == 'ContentFirst' else 'RegionSearch' if e['scope'] == 'RegionSearch' else 'Execution')
        c['entry'] = c['entry'] or e.get('entry')
        c['parent_branch_id'] = c['parent_branch_id'] or e.get('parent_branch_id')
        if e.get('candidate_ast') and not c['ast']:
            c['ast'] = e['candidate_ast']
            c['cost'] = e['candidate_ast'].get('cost')
            c['pipeline_slots'] = e['candidate_ast'].get('pipeline_slots')
            c['max_param_depth'] = e['candidate_ast'].get('max_param_depth')
        if e.get('enumeration_index') is not None and c['enumeration_index'] is None:
            c['enumeration_index'] = e['enumeration_index']
        kind = e.get('kind')
        if kind == 'duplicate':
            c['duplicates'] += 1
        elif kind == 'truncated':
            if c['status'] == 'unknown':
                c['status'], c['reason_code'], c['truncation'] = 'truncated', e.get('reason_code'), e.get('budget')
        elif kind == 'case':
            c['cases'].append(dict(e['case'], search_sequence=e['sequence'], stage=e.get('stage'), scope=e.get('scope')))
        elif kind == 'completed':
            c['status'], c['reason_code'] = e.get('outcome'), e.get('reason_code')
        elif kind == 'evaluated':
            c['status'], c['reason_code'] = e.get('outcome'), e.get('reason_code')
            c['cases'] = [dict(x, search_sequence=e['sequence']) for x in e.get('cases', [])]
    for c in cands.values():
        c['executed'] = any(x.get('outcome') != 'truncated' for x in c['cases'])
        c['rendered'] = any(x.get('grid_hash') for x in c['cases'])
        first_fail = next((x for x in c['cases'] if x.get('outcome') not in ('exact',)), None)
        c['first_failing_case'] = first_fail['case_index'] if first_fail else None
        c['first_failure_reason'] = first_fail.get('reason') if first_fail else None
        c['text'] = (c['ast'] or {}).get('text')
    return sorted(cands.values(), key=lambda c: c['sequences'][0])


def build_param_goals(events):
    goals = []
    for e in events:
        if e.get('scope') == 'TypedParameter' and e.get('kind') == 'representatives':
            reps = e.get('representatives', [])
            classes = defaultdict(list)
            for r in reps:
                classes[r['case_relative_class']].append(r['param_id'])
            goals.append({'goal_id': e['branch_id'], 'plan_id': e.get('parent_branch_id'), 'role': e.get('goal_type'), 'refinement': e.get('refinement'),
                          'labels': e.get('labels'), 'label_source': e.get('label_source'), 'visible_leaves': e.get('visible_leaves'),
                          'representatives': reps, 'deferred': e.get('deferred', []), 'edges': e.get('edges', []), 'vsa': e.get('vsa'),
                          'templates': e.get('templates'), 'budget': e.get('budget'), 'status': e.get('status'), 'sequence': e['sequence'],
                          'case_relative_classes': [{'class': k, 'param_ids': v, 'distinct_ast_count': len(v)} for k, v in classes.items()],
                          'max_param_depth': e.get('max_param_depth')})
    return goals


def build_funnel(events, run_ok):
    out = []
    by_stage = defaultdict(list)
    for e in events:
        by_stage[stage_of(e)].append(e)
    for name, scopes, label in STAGES:
        es = [e for s in scopes for e in by_stage.get(s, [])]
        es.sort(key=lambda e: e['sequence'])
        if es:
            state = 'entered'
        elif run_ok:
            state = 'not_entered'
        else:
            state = 'unknown'
        cands = {e.get('candidate_id') for e in es if e.get('candidate_id')}
        outcomes = Counter()
        for e in es:
            if e.get('event_source') == 'trace' and e.get('candidate_id') and e.get('kind') in ('completed', 'evaluated'):
                outcomes[e.get('outcome')] += 1
        truncated = sum(1 for e in es if e.get('kind') == 'truncated')
        budget_hits = []
        for e in es:
            if e.get('hit') is True or e.get('stop_reason') == 'BudgetCut':
                budget_hits.append({'sequence': e['sequence'], 'branch_id': e.get('branch_id'), 'budget_kind': e.get('budget_kind'), 'limit': e.get('budget_limit'), 'used': e.get('budget_used'), 'budgets': e.get('budgets')})
            if e.get('kind') == 'budget':
                budget_hits.append({'sequence': e['sequence'], 'branch_id': e.get('branch_id'), 'budget': e.get('budget'), 'reason_code': e.get('reason_code')})
        first_block = next((ev_ref(e) for e in es if blocker(e)), None)
        deferred = sum(int(e.get('deferred_count') or 0) for e in es if e.get('event_source') == 'dplus')
        out.append({'stage': name, 'label': label, 'scopes': scopes, 'state': state, 'events': len(es),
                    'first_sequence': es[0]['sequence'] if es else None, 'last_sequence': es[-1]['sequence'] if es else None,
                    'counts': {'distinct_candidates': {'value': len(cands), 'unit': 'structural candidate IDs (trace level >= candidates)'},
                               'evaluated': {'value': sum(outcomes.values()), 'unit': 'candidates with a completed/evaluated record'},
                               'fit': {'value': outcomes.get('fit', 0), 'unit': 'train-exact on the search cases'},
                               'no_fit': {'value': outcomes.get('no_fit', 0), 'unit': 'executed, grid mismatch'},
                               'invalid': {'value': outcomes.get('invalid', 0), 'unit': 'execution/render rejected'},
                               'truncated': {'value': truncated + outcomes.get('truncated', 0), 'unit': 'proposed but cut by a budget'},
                               'deferred': {'value': deferred, 'unit': 'parameter representatives deferred (D+ TypedParameter)'}},
                    'budget_hits': budget_hits[:50], 'budget_hit_count': len(budget_hits), 'first_blocker': first_block})
    return out


def build_branches(events):
    nodes = {}
    for e in events:
        bid = e.get('branch_id')
        if not bid or bid == e.get('candidate_id') or (e.get('event_source') == 'dplus' and e.get('scope') in ('Execution', 'Render') and bid not in nodes and e.get('event') != 'entered'):
            continue
        n = nodes.setdefault(bid, {'branch_id': bid, 'parents': [], 'scopes': [], 'events': 0, 'first_sequence': e['sequence'], 'stop_reasons': [], 'outcomes': []})
        n['events'] += 1
        for key in ('parent_branch_id', 'parent_id'):
            p = e.get(key)
            if p and p not in n['parents']:
                n['parents'].append(p)
        if e.get('scope') not in n['scopes']:
            n['scopes'].append(e.get('scope'))
        if e.get('stop_reason') and e['stop_reason'] not in n['stop_reasons']:
            n['stop_reasons'].append(e['stop_reason'])
        if e.get('outcome') and e['outcome'] not in n['outcomes']:
            n['outcomes'].append(e['outcome'])
    return list(nodes.values())


def blockers(events, solved):
    bl = [e for e in events if blocker(e)]
    groups = {}
    for e in bl:
        key = (stage_of(e), blocker(e), e.get('reason_code') or (e.get('reason') or '')[:120])
        g = groups.setdefault(key, {'stage': key[0], 'kind': key[1], 'reason': key[2], 'count': 0, 'first_sequence': e['sequence'], 'branches': []})
        g['count'] += 1
        if len(g['branches']) < 8 and e.get('branch_id') not in g['branches']:
            g['branches'].append(e.get('branch_id'))
    return {'first_rejection': ev_ref(bl[0]) if bl else None,
            'terminal_blocker': None if solved or not bl else ev_ref(bl[-1]),
            'terminal_blocker_note': 'last evidenced blocking event before the run terminal; earlier blockers are kept in all_blockers',
            'all_blockers': sorted(groups.values(), key=lambda g: g['first_sequence'])}


# ---------------------------------------------------------------- replay

def case_dims(events, grids):
    dims = {}
    for e in events:
        if e.get('scope') == 'Grounding' and e.get('kind') == 'scene':
            dims[e['case_index']] = e['realization_dims']
    if not dims:
        for p in grids.get('pairs', []):
            if p.get('case_index') is not None and p['predicted'].get('available'):
                g = p['predicted']['grid']
                dims[p['case_index']] = [len(g[0]), len(g)]
    return dims


def replay_requests(out, record, events, candidates, grids, limit, focus):
    used = record['pairs_used_in_search']
    dims = case_dims(events, grids)
    chosen, why = [], {}
    def add(cid, reason):
        if cid not in why:
            chosen.append(cid)
            why[cid] = reason
    sel = record.get('program_transform_id')
    by_id = {c['candidate_id']: c for c in candidates}
    if sel:
        add(sel, 'selected_program')
    for f in focus or []:
        add(f, 'focus')
    for c in candidates:
        if c['status'] == 'fit':
            add(c['candidate_id'], 'train_exact_candidate')
    buckets = defaultdict(list)
    for c in candidates:
        if c['ast'] and c['executed']:
            buckets[(c['entry'], c['status'], c['reason_code'])].append(c['candidate_id'])
    per = max(1, limit // max(1, len(buckets))) if buckets else 0
    for key in sorted(buckets, key=str):
        for cid in buckets[key][:per]:
            add(cid, 'sample:' + '/'.join(str(x) for x in key))
    reqs = []
    for cid in chosen[:limit + 32]:
        ast = (by_id.get(cid) or {}).get('ast') or (record.get('program_transform_ast') if cid == sel else None)
        if not ast:
            continue
        pairs = [{'pair_index': used[i], 'case_index': i, 'output_dims': dims[i]} for i in range(len(used)) if i in dims]
        reqs.append({'request_id': cid, 'candidate_id': cid, 'reason': why[cid], 'ast': ast, 'pairs': pairs})
    return reqs


def run_replay(binary, task, config, reqs, dest):
    req_file = dest.with_suffix('.requests.json')
    write_json(req_file, {'requests': [{k: v for k, v in r.items() if k != 'reason'} for r in reqs]})
    proc = subprocess.run([str(binary), 'trace-replay', '--task', str(task), '--config', config, '--requests', str(req_file), '--out', str(dest), '+RTS', '-M2g', '-RTS'],
                          cwd=ROOT, capture_output=True, text=True, timeout=900)
    if proc.returncode != 0:
        raise RuntimeError('trace-replay failed: ' + proc.stderr[-2000:])
    return read_json(dest)


def verify_replays(replay, reqs, candidates):
    by_id = {c['candidate_id']: c for c in candidates}
    reasons = {r['request_id']: r['reason'] for r in reqs}
    results = []
    for r in replay['results']:
        cid = r.get('candidate_id')
        cand = by_id.get(cid)
        search_cases = {x['case_index']: x for x in (cand or {}).get('cases', [])}
        checks = []
        for c in r.get('cases', []):
            case_index = next((q['case_index'] for q in next(x for x in reqs if x['request_id'] == r['request_id'])['pairs'] if q['pair_index'] == c['pair_index']), None)
            s = search_cases.get(case_index)
            if not r.get('decode_ok'):
                verdict, note = 'unverifiable', r.get('decode_error')
            elif s is None or s.get('outcome') == 'truncated':
                verdict, note = 'unverifiable', 'case not executed during the search (early exit, budget or trace level); replay-only result'
            else:
                same_outcome = s['outcome'] == c['outcome'] or (s['outcome'] == 'witness_failure' and c['outcome'] == 'exact')
                same_grid = s.get('grid_hash') == c.get('grid_hash')
                verdict = 'match' if same_outcome and same_grid else 'mismatch'
                note = f"search outcome={s['outcome']} replay outcome={c['outcome']}; grid hash {'equal' if same_grid else 'differs'}"
            checks.append({'pair_index': c['pair_index'], 'case_index': case_index, 'verdict': verdict, 'note': note})
        verdicts = {x['verdict'] for x in checks}
        overall = 'mismatch' if 'mismatch' in verdicts else 'match' if verdicts == {'match'} else 'unverifiable' if not verdicts or verdicts == {'unverifiable'} else 'partial_match'
        results.append({'candidate_id': cid, 'reason': reasons.get(r['request_id']), 'decode_ok': r.get('decode_ok'), 'decoded_id_equals_candidate_id': r.get('decoded_id') == cid,
                        'verdict': overall, 'checks': checks, 'replay': r})
    return results


# ---------------------------------------------------------------- run

def run(args):
    out = guard_out(args.out)
    if (out / 'trace.json').exists() and not args.force:
        raise SystemExit(f'{out} already holds a trace; use a new --out or --force (results/trace_io only)')
    if args.force and out.exists():
        assert out.is_relative_to((ROOT / 'results' / 'trace_io').resolve()), '--force only inside results/trace_io'
        shutil.rmtree(out)
    out.mkdir(parents=True, exist_ok=True)
    task = Path(args.task).resolve()
    data = read_json(task)
    if data.get('test') != []:
        raise SystemExit('leak guard: the task file must be train-only (test: [])')
    binary = Path(args.binary).resolve()
    eventlog = out / 'search.eventlog'
    command = [str(binary), 'trace-io', '--task', str(task), '--pair-index', str(args.pair_index), '--mode', args.mode, '--config', args.config,
               '--out', str(out), '--trace-level', args.trace_level, '--timeout-ms', str(int(args.timeout * 1000)),
               '--max-events', str(args.max_events), '--max-bytes', str(args.max_bytes), '--sample-candidates', str(args.sample_candidates),
               '--posthoc', args.posthoc, '+RTS', '-M2g', '-T', '-l-au', '-ol' + str(eventlog), '-RTS']
    start = time.monotonic()
    killed = False
    with (out / 'stdout.txt').open('w', encoding='utf-8') as so, (out / 'stderr.txt').open('w', encoding='utf-8') as se:
        proc = subprocess.Popen(command, cwd=ROOT, stdout=so, stderr=se)
        limit = args.kill_after if args.kill_after is not None else args.timeout + 10
        while proc.poll() is None:
            if time.monotonic() - start > limit:
                proc.kill()
                proc.wait()
                killed = True
                break
            time.sleep(0.05)
    driver = {'command': [rel(c) if i in (0,) else c for i, c in enumerate(command)], 'exit_code': proc.returncode, 'hard_kill': killed,
              'driver_seconds': time.monotonic() - start, 'binary': rel(binary), 'binary_sha256': sha(binary), 'task_file': rel(task), 'task_sha256': sha(task)}
    write_json(out / 'driver.json', driver)
    if (out / 'trace_io_error.json').exists():
        print(json.dumps(read_json(out / 'trace_io_error.json'), ensure_ascii=False))
        raise SystemExit(proc.returncode or 2)
    trace = postprocess(out, replay_limit=args.replay_limit, focus=args.focus_candidate)
    render(out / 'trace.json', out / 'index.html', focus_candidate=(args.focus_candidate or [None])[0], focus_branch=args.focus_branch)
    s = trace['summary']
    print(f"{s['task_id']} {s['mode']} pair={s['pair_index']} status={s['status']} events={s['events_parsed']} candidates={s['candidates']} incomplete={s['trace_incomplete']} -> {rel(out / 'index.html')}")
    return trace


def postprocess(out, replay_limit=40, focus=None, binary=None):
    out = Path(out)
    driver = read_json(out / 'driver.json') if (out / 'driver.json').exists() else {}
    status_file = read_json(out / 'run_status.json') if (out / 'run_status.json').exists() else {'state': 'missing'}
    completed = status_file.get('state') == 'completed'
    record = read_json(out / 'solver_record.json') if (out / 'solver_record.json').exists() else None
    grids = read_json(out / 'grids.json') if (out / 'grids.json').exists() else {'pairs': []}
    sink = read_json(out / 'trace_sink.json') if (out / 'trace_sink.json').exists() else None
    events, parse_stats = read_events(out)
    markers = {}
    if (out / 'search.eventlog').exists():
        import run_stage_d_plus as dplus
        dplus_events, markers = dplus.parse_events(out / 'search.eventlog')
        markers['eventlog_dplus_events'] = len(dplus_events)
    meta = status_file if record is None else record
    run_ok = completed and record is not None and record.get('status') not in ('timeout', 'runtime_error')
    solved = bool(record) and record.get('status') in ('train_exact', 'pair_exact')
    candidates = build_candidates(events)
    goals = build_param_goals(events)
    funnel = build_funnel(events, run_ok)
    bl = blockers(events, solved)
    branches = build_branches(events)
    terminal = next((e for e in reversed(events) if e.get('scope') == 'Run' and e.get('kind') == 'terminal'), None)
    incomplete_reasons = []
    if not completed:
        incomplete_reasons.append('process did not complete (killed, crashed or still running); missing tail is unknown')
    if sink is None:
        incomplete_reasons.append('trace_sink.json missing: dropped/sampled counts unknown')
    elif sink.get('trace_incomplete'):
        incomplete_reasons.append(f"sink dropped={sink['events_dropped_by_cap']} sampled_out={sink['events_sampled_out']} write_errors={sink['write_errors']}")
    if parse_stats['malformed_lines']:
        incomplete_reasons.append(f"{parse_stats['malformed_lines']} torn/malformed JSONL line(s)")
    if record and record.get('status') == 'timeout':
        incomplete_reasons.append('search timeout: counters after the last checkpoint are unknown')
    # D+-compatible labels from the same events (enrich + failure_evidence).
    dplus_view = None
    if record:
        import run_stage_d_plus as dplus
        dp = [e for e in events if e.get('event_source') == 'dplus']
        rec = {'status': {'train_exact': 'train_exact', 'pair_exact': 'train_exact'}.get(record['status'], record['status']),
               'train_exact': solved, 'diagnostics': {'train_pairs': len(record['pairs_used_in_search'])}, 'counters': record.get('counters') or {},
               'search_work': record.get('search_work'), 'first_train_exact_seconds': markers.get('first_train_exact_seconds'), 'total_to_budget_seconds': markers.get('total_to_budget_seconds')}
        enriched = dplus.enrich_events(dp, {'task_id': record['task_id'], 'config': record['config']}, rec)
        fe = dplus.failure_evidence(enriched, rec)
        dplus_view = {'labels': fe['labels'], 'primary_label': fe['primary_label'], 'stage_flags': fe['stage_flags'],
                      'parameters_fit_without_solution': fe['parameters_fit_without_solution'], 'composition_executes_but_pixels_fail': fe['composition_executes_but_pixels_fail'],
                      'whole_task_exhaustiveness': fe['whole_task_exhaustiveness'], 'note': 'computed by run_stage_d_plus.failure_evidence on the D+ events of this run; pair_exact is mapped to its exact label only for this computation'}
    # Independent witness checks (same checkers as the D+ runner).
    witness_checks = []
    if record and solved and (out / 'witnesses.json').exists():
        import verify_stage_d_witness as checker
        from arc_stage_d import verify_witness as check_pixels
        w = read_json(out / 'witnesses.json')
        task = read_json(ROOT / driver['task_file']) if driver.get('task_file') else None
        for i, wit in zip(record['pairs_used_in_search'], w.get('execution_witnesses') or []):
            try:
                check_pixels(wit)
                checker.check(wit, task['train'][i]['input'])
                witness_checks.append({'pair_index': i, 'independent_checks': 'passed'})
            except AssertionError as ex:
                witness_checks.append({'pair_index': i, 'independent_checks': 'failed', 'error': str(ex)})
    # Replay: executor only, on saved ASTs.
    replays = []
    if record and driver.get('binary') and replay_limit > 0:
        reqs = replay_requests(out, record, events, candidates, grids, replay_limit, focus)
        if reqs:
            raw = run_replay(binary or (ROOT / driver['binary']), ROOT / driver['task_file'], record['config'], reqs, out / 'replays.raw.json')
            replays = verify_replays(raw, reqs, candidates)
    write_json(out / 'replays.json', {'executor': 'latis trace-replay (Relation.executePipeline/emitObjects + renderWitness; no search)', 'results': replays})
    stream = compress_events(out)
    write_json(out / 'candidates.json', {'schema': SCHEMA, 'note': 'structural candidate IDs = FNV64 of the Haskell AST show (not collision-proof); case-relative classes are training-equal value vectors, not global equivalence',
                                         'candidates': candidates, 'parameter_goals': goals})
    summary = {
        'schema': SCHEMA, 'task_id': meta.get('task_id'), 'mode': meta.get('mode'), 'pair_index': meta.get('pair_index'), 'config': meta.get('config'),
        'pairs_used_in_search': meta.get('pairs_used_in_search'), 'train_pairs_in_task': meta.get('train_pairs_in_task'),
        'status': record['status'] if record else ('killed' if driver.get('hard_kill') else 'unknown'),
        'result_scope': (record or {}).get('exact_scope'), 'detail': (record or {}).get('detail'),
        'never_call_arc_solved': True,
        'program': ((record or {}).get('program') or '')[:4000] or None, 'program_sha256': hashlib.sha256(((record or {}).get('program') or '').encode()).hexdigest() if record and record.get('program') else None, 'program_kind': (record or {}).get('program_kind'), 'program_transform_id': (record or {}).get('program_transform_id'),
        'posthoc_validation': (record or {}).get('posthoc_validation'),
        'search_work': (record or {}).get('search_work'), 'first_solution_work': ((record or {}).get('counters') or {}).get('first_solution_work') if solved else None,
        'wall_clock_seconds': (record or {}).get('wall_clock_seconds'), 'first_train_exact_seconds': markers.get('first_train_exact_seconds'),
        'total_to_budget_seconds': markers.get('total_to_budget_seconds'),
        'diagnostic_overhead': (record or {}).get('diagnostic_overhead'), 'trace_sink': sink, 'rts_max_live_bytes': (record or {}).get('rts_max_live_bytes'),
        'events_parsed': len(events), 'event_parse': parse_stats, 'candidates': len(candidates), 'parameter_goals': len(goals),
        'trace_incomplete': bool(incomplete_reasons), 'trace_incomplete_reasons': incomplete_reasons,
        'run_completed': completed, 'hard_kill': driver.get('hard_kill'), 'terminal_event': ev_ref(terminal) if terminal else None,
        'terminal_note': None if terminal else 'no terminal event recorded: final state unknown (never synthesized)',
        'whole_task_exhaustiveness': 'Unknown', 'exhaustiveness_note': 'no global finite-universe ledger; per-branch evidence never proves exhaustion',
        'structural_trace_hash': structural_hash(events), 'binary_sha256': driver.get('binary_sha256'), 'task_sha256': driver.get('task_sha256'),
        'stage_d_metrics': (record or {}).get('stage_d'), 'eventlog_markers': markers,
    }
    write_json(out / 'summary.json', summary)
    files = {}
    for name in ['solver_record.json', 'grids.json', 'witnesses.json', 'candidates.json', 'replays.json', 'summary.json', 'search_events.jsonl.gz', 'trace_sink.json', 'driver.json']:
        if (out / name).exists():
            files[name] = {'sha256': sha(out / name), 'bytes': (out / name).stat().st_size}
    trace = {'trace_schema_version': SCHEMA, 'summary': summary, 'funnel': funnel, 'blockers': bl, 'branches': branches,
             'dplus_view': dplus_view, 'witness_checks': witness_checks, 'replay_overview': [{k: r[k] for k in ('candidate_id', 'reason', 'verdict')} for r in replays],
             'not_instrumented': NOT_INSTRUMENTED, 'event_stream': stream, 'files': files}
    write_json(out / 'trace.json', trace)
    write_dot(out, trace, candidates)
    return trace


def write_dot(out, trace, candidates):
    lines = ['digraph trace {', '  rankdir=LR; node [shape=box,fontname="Helvetica"];']
    prev = None
    for f in trace['funnel']:
        color = {'entered': 'black', 'not_entered': 'gray70', 'unknown': 'orange'}[f['state']]
        lines.append(f'  "{f["stage"]}" [label="{f["stage"]}\\n{f["state"]} events={f["events"]}",color="{color}"];')
        if prev:
            lines.append(f'  "{prev}" -> "{f["stage"]}" [style=dotted];')
        prev = f['stage']
    for c in [c for c in candidates if c['status'] == 'fit'][:12]:
        lines.append(f'  "{c["candidate_id"]}" [label="{c["candidate_id"][:10]} fit",shape=ellipse];')
        lines.append(f'  "{"Execution" if c["scope"] == "Execution" else "Relation"}" -> "{c["candidate_id"]}";')
    lines.append('}')
    (out / 'trace.dot').write_text('\n'.join(lines) + '\n', encoding='utf-8')


# ---------------------------------------------------------------- render

def load_bundle(record_path):
    record_path = Path(record_path)
    base = record_path.parent
    trace = read_json(record_path)
    if trace.get('trace_schema_version') != SCHEMA:
        raise SystemExit(f'unsupported trace schema {trace.get("trace_schema_version")!r}')
    bundle = {'trace': trace}
    for key, name in [('candidates', 'candidates.json'), ('grids', 'grids.json'), ('witnesses', 'witnesses.json'), ('replays', 'replays.json'), ('record', 'solver_record.json')]:
        p = base / name
        bundle[key] = read_json(p) if p.exists() else None
    events, _ = read_events(base)
    bundle['events'] = events
    return bundle


HEAVY = ('candidate_ast', 'cases', 'case', 'representatives', 'edges', 'rows', 'plan_ids', 'deferred', 'input_objects', 'output_objects', 'labels', 'count_expressions')
CAND_COLS = ['candidate_id', 'scope', 'entry', 'parent_branch_id', 'status', 'reason_code', 'pipeline_slots', 'max_param_depth', 'cost', 'executed', 'rendered', 'text', 'first_failing_case', 'duplicates', 'first_sequence']
EVENT_COLS = ['sequence', 'event_source', 'scope', 'kind', 'stage', 'branch_id', 'parent_branch_id', 'candidate_id', 'outcome', 'reason_code', 'case_index']


def compact_event(e):
    # The page shows candidate ASTs/cases in the candidate view; events keep
    # every scalar field and mark what was moved (full JSONL stays on disk).
    out, moved = {}, []
    for k, v in e.items():
        if k in ('trace_schema_version', 'timestamp_monotonic_ns'):
            continue
        if k in HEAVY and len(json.dumps(v)) > 200:
            moved.append(k)
        else:
            out[k] = v
    if moved:
        out['_moved_fields'] = moved
    return out


def page_candidates(c, summary, replays, focus, limit):
    """Every candidate as a compact row; full records for a bounded,
    deterministic subset (selected, fits, replayed, focus, then executed in
    search order). The rest stay in candidates.json and are marked."""
    if c is None:
        return None
    cs = c['candidates']
    order = []
    seen = set()
    def take(cid):
        if cid and cid not in seen:
            seen.add(cid)
            order.append(cid)
    take(summary.get('program_transform_id'))
    for f in focus or []:
        take(f)
    for x in cs:
        if x['status'] == 'fit':
            take(x['candidate_id'])
    for r in (replays or {}).get('results', []):
        take(r['candidate_id'])
    for entry_first in (True, False):
        for x in cs:
            if x['executed'] and ((x['scope'] == 'Execution') == entry_first):
                take(x['candidate_id'])
    chosen = set(order[:limit])
    rows = [[(x['sequences'][0] if k == 'first_sequence' else (x.get(k)[:160] if k == 'text' and x.get(k) else x.get(k))) for k in CAND_COLS] for x in cs]
    details = {x['candidate_id']: x for x in cs if x['candidate_id'] in chosen}
    return {'note': c.get('note'), 'parameter_goals': c.get('parameter_goals'), 'columns': CAND_COLS, 'rows': rows, 'details': details,
            'total': len(cs), 'details_embedded': len(details), 'detail_limit': limit,
            'details_complete': len(details) == len(cs), 'details_file': 'candidates.json'}


def render(record_path, out_html, focus_candidate=None, focus_branch=None, max_embedded_events=200000, detail_limit=2500):
    b = load_bundle(record_path)
    events = b['events'][:max_embedded_events]
    objs, rows = [], []
    for e in events:
        if e.get('candidate_id') and e.get('event_source') == 'trace':
            rows.append([e.get(k) for k in EVENT_COLS])
        else:
            objs.append(compact_event(e))
    record = b['record'] or {}
    summary = b['trace']['summary']
    data = {'trace': b['trace'], 'candidates': page_candidates(b['candidates'], summary, b['replays'], [focus_candidate] if focus_candidate else None, detail_limit),
            'grids': b['grids'], 'witnesses': b['witnesses'], 'replays': b['replays'],
            'record': {k: record.get(k) for k in ('task_id', 'mode', 'pair_index', 'config', 'status', 'exact_scope', 'detail', 'program_kind', 'program_transform_ast',
                                                 'program_transform_id', 'search_work', 'posthoc_validation', 'size_rule', 'parameter_goals', 'relations', 'trace_lines',
                                                 'failure_stage', 'pairs_used_in_search', 'diagnostics_forced_on', 'trace_level', 'stage_d', 'content_first', 'content_first_plan', 'region_search')},
            'events': objs, 'event_columns': EVENT_COLS, 'event_rows': rows, 'events_total': len(b['events']), 'events_embedded': len(events),
            'focus': {'candidate': focus_candidate, 'branch': focus_branch}}
    data['record']['program'] = (record.get('program') or '')[:6000] or None
    payload = json.dumps(data, ensure_ascii=False, separators=(',', ':')).replace('</', '<\\/')
    template = (ROOT / 'scripts' / 'trace_io_viewer.html').read_text(encoding='utf-8')
    script = (ROOT / 'scripts' / 'trace_io_viewer.js').read_text(encoding='utf-8')
    title = html.escape(f"LATIS trace {data['record'].get('task_id') or ''} {data['record'].get('mode') or ''}")
    page = template.replace('__TITLE__', title).replace('__SCRIPT__', script).replace('__DATA__', payload)
    Path(out_html).write_text(page, encoding='utf-8')
    return out_html


# ---------------------------------------------------------------- replay / oracle / compare

def replay_cmd(args):
    base = Path(args.record).parent
    record = read_json(base / 'solver_record.json')
    driver = read_json(base / 'driver.json')
    cands = read_json(base / 'candidates.json')['candidates']
    events, _ = read_events(base)
    grids = read_json(base / 'grids.json')
    target = [c for c in cands if c['candidate_id'] == args.candidate]
    if not target and args.candidate != record.get('program_transform_id'):
        raise SystemExit(f'candidate {args.candidate} not in candidates.json')
    reqs = [r for r in replay_requests(base, record, events, cands, grids, 0, [args.candidate]) if r['candidate_id'] == args.candidate]
    if not reqs:
        raise SystemExit('candidate has no stored AST: unverifiable')
    dest = Path(args.out or base / f'replay-{args.candidate}.json')
    raw = run_replay(Path(args.binary or ROOT / driver['binary']), ROOT / driver['task_file'], record['config'], reqs, dest.with_suffix('.raw.json'))
    res = verify_replays(raw, reqs, cands)
    write_json(dest, {'executor': 'latis trace-replay', 'results': res})
    for r in res:
        print(r['candidate_id'], r['verdict'], [c['verdict'] for c in r['checks']])
    return res


def oracle_cmd(args):
    base = Path(args.record).parent
    record = read_json(base / 'solver_record.json')
    driver = read_json(base / 'driver.json')
    events, _ = read_events(base)
    grids = read_json(base / 'grids.json')
    dims = case_dims(events, grids)
    used = record['pairs_used_in_search']
    ast = read_json(args.ast)
    req = {'request_id': 'oracle', 'candidate_id': 'oracle', 'reason': 'oracle', 'ast': ast,
           'pairs': [{'pair_index': used[i], 'case_index': i, 'output_dims': dims[i]} for i in range(len(used)) if i in dims]}
    raw = run_replay(Path(args.binary or ROOT / driver['binary']), ROOT / driver['task_file'], record['config'], [req], Path(args.out).with_suffix('.raw.json'))
    result = {'oracle_diagnostic_only': True, 'counts_toward_blind_search': False, 'counts_toward_solve_rate': False,
              'enumerability': 'unknown', 'enumerability_note': 'no proof that the blind search grammar/budget prefix contains this AST',
              'result': raw['results'][0]}
    write_json(args.out, result)
    print(json.dumps({'cases': [(c['pair_index'], c['outcome']) for c in raw['results'][0].get('cases', [])], 'decode_ok': raw['results'][0].get('decode_ok')}))
    return result


def compare_cmd(args):
    lb, rb = load_bundle(args.left), load_bundle(args.right)
    ls, rs = lb['trace']['summary'], rb['trace']['summary']
    conds = {}
    for key in ['task_id', 'mode', 'pair_index', 'config', 'binary_sha256', 'task_sha256', 'pairs_used_in_search']:
        conds[key] = {'left': ls.get(key), 'right': rs.get(key), 'equal': ls.get(key) == rs.get(key)}
    lrec, rrec = lb['record'] or {}, rb['record'] or {}
    conds['config_text'] = {'equal': lrec.get('config_text') == rrec.get('config_text')}
    conds['trace_level'] = {'left': lrec.get('trace_level'), 'right': rrec.get('trace_level'), 'equal': lrec.get('trace_level') == rrec.get('trace_level')}
    not_identical = [k for k, v in conds.items() if not v['equal']]
    lc = {c['candidate_id']: c for c in lb['candidates']['candidates']} if lb['candidates'] else {}
    rc = {c['candidate_id']: c for c in rb['candidates']['candidates']} if rb['candidates'] else {}
    changed = [{'candidate_id': k, 'left': lc[k]['status'], 'right': rc[k]['status']} for k in sorted(set(lc) & set(rc)) if lc[k]['status'] != rc[k]['status']]
    def depth(cs, key):
        return max([c.get(key) or 0 for c in cs.values()] + [0])
    stages = []
    lf = {f['stage']: f for f in lb['trace']['funnel']}
    for f in rb['trace']['funnel']:
        l = lf.get(f['stage'], {})
        stages.append({'stage': f['stage'], 'left_state': l.get('state'), 'right_state': f['state'], 'left_events': l.get('events'), 'right_events': f['events'],
                       'left_budget_hits': l.get('budget_hit_count'), 'right_budget_hits': f['budget_hit_count'],
                       'left_first_blocker': (l.get('first_blocker') or {}).get('reason_code') or (l.get('first_blocker') or {}).get('stop_reason'),
                       'right_first_blocker': (f.get('first_blocker') or {}).get('reason_code') or (f.get('first_blocker') or {}).get('stop_reason')})
    result = {'not_identical_run_conditions': bool(not_identical), 'differing_conditions': not_identical, 'conditions': conds,
              'causal_claims': 'none: differences are descriptive; no speed-up or causal effect is inferred',
              'status': {'left': ls['status'], 'right': rs['status']},
              'structural_trace_hash_equal': ls['structural_trace_hash'] == rs['structural_trace_hash'],
              'search_work': {'left': ls.get('search_work'), 'right': rs.get('search_work')},
              'candidates': {'left': len(lc), 'right': len(rc), 'only_left': len(set(lc) - set(rc)), 'only_right': len(set(rc) - set(lc)), 'both': len(set(lc) & set(rc)),
                             'status_changed': changed[:200], 'status_changed_count': len(changed),
                             'fit_left': sorted(k for k, c in lc.items() if c['status'] == 'fit'), 'fit_right': sorted(k for k, c in rc.items() if c['status'] == 'fit'),
                             'executed_left': sum(c['executed'] for c in lc.values()), 'executed_right': sum(c['executed'] for c in rc.values()),
                             'max_pipeline_slots': {'left': depth(lc, 'pipeline_slots'), 'right': depth(rc, 'pipeline_slots')},
                             'max_param_depth': {'left': depth(lc, 'max_param_depth'), 'right': depth(rc, 'max_param_depth')}},
              'first_rejection': {'left': lb['trace']['blockers']['first_rejection'], 'right': rb['trace']['blockers']['first_rejection']},
              'terminal_blocker': {'left': lb['trace']['blockers']['terminal_blocker'], 'right': rb['trace']['blockers']['terminal_blocker']},
              'stages': stages}
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    write_json(out / 'compare.json', result)
    rows = ''.join(f"<tr><td>{html.escape(s['stage'])}</td><td>{s['left_state']}</td><td>{s['right_state']}</td><td>{s['left_events']}</td><td>{s['right_events']}</td><td>{s['left_budget_hits']}</td><td>{s['right_budget_hits']}</td><td>{html.escape(str(s['left_first_blocker']))}</td><td>{html.escape(str(s['right_first_blocker']))}</td></tr>" for s in stages)
    warn = f"<p class='warn'>not_identical_run_conditions: {', '.join(not_identical)}</p>" if not_identical else "<p>运行条件一致（binary、任务、模式、配置文本）。</p>"
    page = f"""<!doctype html><html lang="zh-CN"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Trace compare</title>
<style>body{{font:14px system-ui,sans-serif;margin:16px;background:#fff;color:#111}}table{{border-collapse:collapse}}td,th{{border:1px solid #ccc;padding:3px 6px}}.warn{{color:#a40;font-weight:bold}}pre{{white-space:pre-wrap}}</style></head>
<body><h1>两份 trace 对照</h1>{warn}<p>差异只作描述，不推断提速或因果。</p>
<p>状态：{html.escape(ls['status'])} ↔ {html.escape(rs['status'])}；search_work {ls.get('search_work')} ↔ {rs.get('search_work')}；结构 trace hash 相同：{result['structural_trace_hash_equal']}</p>
<table><tr><th>阶段</th><th>左状态</th><th>右状态</th><th>左事件</th><th>右事件</th><th>左预算命中</th><th>右预算命中</th><th>左首阻断</th><th>右首阻断</th></tr>{rows}</table>
<h2>候选</h2><pre>{html.escape(json.dumps(result['candidates'], ensure_ascii=False, indent=1)[:20000])}</pre></body></html>"""
    (out / 'compare.html').write_text(page, encoding='utf-8')
    print(json.dumps({k: result[k] for k in ('not_identical_run_conditions', 'differing_conditions', 'structural_trace_hash_equal', 'status')}, ensure_ascii=False))
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = p.add_subparsers(dest='cmd', required=True)
    r = sub.add_parser('run')
    r.add_argument('--task', required=True)
    r.add_argument('--pair-index', type=int, default=0)
    r.add_argument('--mode', choices=['inspect-pair', 'solve-single-pair'], default='inspect-pair')
    r.add_argument('--config', default='FullD')
    r.add_argument('--out', required=True)
    r.add_argument('--trace-level', choices=LEVELS, default='candidates')
    r.add_argument('--timeout', type=float, default=300.0, help='internal search timeout (s); parent watchdog adds 10 s')
    r.add_argument('--kill-after', type=float, default=None, help='hard-kill the solver after N s (fault-injection tests)')
    r.add_argument('--max-events', type=int, default=250000)
    r.add_argument('--max-bytes', type=int, default=268435456)
    r.add_argument('--sample-candidates', type=int, default=1)
    r.add_argument('--posthoc', choices=['on', 'off'], default='on')
    r.add_argument('--replay-limit', type=int, default=40)
    r.add_argument('--focus-candidate', action='append')
    r.add_argument('--focus-branch')
    r.add_argument('--binary', default=str(DEFAULT_BINARY))
    r.add_argument('--force', action='store_true')
    d = sub.add_parser('render')
    d.add_argument('--record', required=True)
    d.add_argument('--out', required=True)
    d.add_argument('--focus-candidate')
    d.add_argument('--focus-branch')
    c = sub.add_parser('compare')
    c.add_argument('--left', required=True)
    c.add_argument('--right', required=True)
    c.add_argument('--out', required=True)
    y = sub.add_parser('replay')
    y.add_argument('--record', required=True)
    y.add_argument('--candidate', required=True)
    y.add_argument('--out')
    y.add_argument('--binary')
    o = sub.add_parser('oracle-replay')
    o.add_argument('--record', required=True)
    o.add_argument('--ast', required=True)
    o.add_argument('--out', required=True)
    o.add_argument('--binary')
    args = p.parse_args()
    if args.cmd == 'run':
        run(args)
    elif args.cmd == 'render':
        render(args.record, args.out, args.focus_candidate, args.focus_branch)
        print('rendered', args.out)
    elif args.cmd == 'compare':
        compare_cmd(args)
    elif args.cmd == 'replay':
        replay_cmd(args)
    else:
        oracle_cmd(args)


if __name__ == '__main__':
    main()
