"""Single-IO trace validation (section 7 of the debugger prompt).

Every test writes its evidence to results/trace_io/validation/<test>.json and
raises AssertionError on failure. Expected values come from the saved Stage D+
records or from the run itself, never from hard-coded task outcomes.

  python -I test/TraceIOValidation.py [test ...]
"""
import argparse
import gzip
import json
import re
import shutil
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
import trace_io as T  # noqa: E402
import run_stage_d_plus as DP  # noqa: E402

VAL = ROOT / 'results' / 'trace_io' / 'validation'
EX = ROOT / 'results' / 'trace_io' / 'examples'
BIN = ROOT / 'build' / 'latis-trace-io.exe'
DPLUS = ROOT / 'results' / 'stage_d_plus' / 'dplus-20261026-v2'
TRAIN = DPLUS / 'train_only'
CHROME = Path('C:/Program Files/Google/Chrome/Application/chrome.exe')


def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def save(name, value):
    T.write_json(VAL / f'{name}.json', value)
    return value


def trace(task, out, mode='inspect-pair', pair=0, config='FullD', level='candidates', timeout=300, kill_after=None,
          max_events=250000, sample=1, posthoc='on', replay_limit=40):
    ns = argparse.Namespace(task=str(task), pair_index=pair, mode=mode, config=config, out=str(out), trace_level=level, timeout=timeout,
                            kill_after=kill_after, max_events=max_events, max_bytes=268435456, sample_candidates=sample, posthoc=posthoc,
                            replay_limit=replay_limit, focus_candidate=None, focus_branch=None, binary=str(BIN), force=True)
    T.run(ns)
    return load(out)


def load(out):
    out = Path(out)
    return {'summary': read(out / 'summary.json'), 'trace': read(out / 'trace.json'), 'record': read(out / 'solver_record.json') if (out / 'solver_record.json').exists() else None,
            'grids': read(out / 'grids.json') if (out / 'grids.json').exists() else None, 'dir': out}


def dplus_record(tid, cfg='D0_Frozen', phase='baseline'):
    return read(DPLUS / phase / 'tasks' / tid / cfg / f'stage-d-{cfg}.json')


def events_of(out):
    return T.read_events(Path(out))[0]


def embedded(html_path):
    text = Path(html_path).read_text(encoding='utf-8')
    m = re.search(r'<script id="trace-data" type="application/json">(.*?)</script>', text, re.S)
    return json.loads(m.group(1).replace('<\\/', '</'))


def selftest(html_path, attempts=2):
    import tempfile
    url = 'file:///' + Path(html_path).resolve().as_posix() + '#selftest'
    for attempt in range(attempts):
        # A fresh profile per run: a lingering headless instance holding a shared
        # profile makes a second launch return without rendering.
        profile = tempfile.mkdtemp(prefix='chrome-', dir=ROOT / 'build' / 'trace-io-tmp')
        proc = subprocess.run([str(CHROME), '--headless=new', '--disable-gpu', '--no-first-run', f'--user-data-dir={profile}',
                               '--host-resolver-rules=MAP * ~NOTFOUND', '--virtual-time-budget=60000', '--dump-dom', url],
                              capture_output=True, text=True, encoding='utf-8', timeout=240)
        shutil.rmtree(profile, ignore_errors=True)
        m = re.search(r'<pre id="selftest-result">(.*?)</pre>', proc.stdout, re.S)
        if m:
            break
    assert m, f'viewer self-test produced no report for {html_path} (JavaScript failed?)'
    import html
    return json.loads(html.unescape(m.group(1)))


def train_only_task(name, train):
    p = VAL / 'tasks' / f'{name}.json'
    T.write_json(p, {'train': train, 'test': []})
    return p


# ---------------------------------------------------------------- 1

def test_isolation():
    """A candidate exact on pair 0 only: pair_exact in solve-single-pair, never train_exact."""
    g_in = [[0, 0, 0, 0, 0], [0, 1, 1, 0, 0], [0, 1, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
    out2 = [[2 if c else 0 for c in r] for r in g_in]
    out3 = [[3 if c else 0 for c in r] for r in g_in]
    task = train_only_task('iso_contradict', [{'input': g_in, 'output': out2}, {'input': g_in, 'output': out3}])
    base = VAL / 'isolation'
    single = trace(task, base / 'single_posthoc_on', mode='solve-single-pair', pair=0)
    single_off = trace(task, base / 'single_posthoc_off', mode='solve-single-pair', pair=0, posthoc='off')
    inspect = trace(task, base / 'inspect', mode='inspect-pair', pair=0)
    s, so, si = single['summary'], single_off['summary'], inspect['summary']
    assert s['status'] == 'pair_exact', s['status']
    assert 'train_exact' not in s['status'] and s['result_scope'].startswith('pair_exact')
    ph = s['posthoc_validation']
    assert ph['performed'] and ph['used_in_search'] is False and ph['matching_other_pairs'] == 0 and ph['pairs'][0]['outcome'] == 'mismatch'
    assert so['posthoc_validation'] is None
    assert s['structural_trace_hash'] == so['structural_trace_hash'], 'post-hoc validation changed the recorded search'
    assert single['record']['program'] == single_off['record']['program'] and s['search_work'] == so['search_work']
    assert si['status'] != 'train_exact', 'contradictory pairs cannot be train_exact'
    # Real task: the pair-0 program fails the other pairs; the full task needs another program.
    real_single, real_inspect = load(EX / '5168d44c' / 'single'), load(EX / '5168d44c' / 'inspect')
    rs, ri = real_single['summary'], real_inspect['summary']
    assert rs['status'] == 'pair_exact' and ri['status'] == 'train_exact'
    assert rs['posthoc_validation']['all_other_pairs_match'] is False
    assert real_single['record']['program'] != real_inspect['record']['program']
    return save('isolation', {'passed': True, 'synthetic': {'single': s['status'], 'posthoc': ph, 'single_hash_with_posthoc': s['structural_trace_hash'], 'single_hash_without_posthoc': so['structural_trace_hash'],
        'inspect': si['status'], 'inspect_detail': si['detail']},
        'real_5168d44c': {'single_pair0': rs['status'], 'single_program_kind': rs['program_kind'], 'posthoc_matching_other_pairs': rs['posthoc_validation']['matching_other_pairs'],
                          'inspect': ri['status'], 'inspect_program_kind': ri['program_kind']}})


# ---------------------------------------------------------------- 2

def test_consistency():
    """CLI line, saved AST, executed grids and the page data agree; D+ record agrees."""
    out = {}
    for tid in ['5168d44c', 'ed36ccf7']:
        d = VAL / 'consistency' / tid
        r = trace(TRAIN / f'{tid}.json', d)
        s, rec = r['summary'], r['record']
        hist = dplus_record(tid)
        stdout = (d / 'stdout.txt').read_text(encoding='utf-8').strip()
        assert f' {rec["status"]} work={rec["search_work"]} ' in stdout + ' ', stdout
        assert rec['search_work'] == hist['search_work'], (rec['search_work'], hist['search_work'])
        assert (rec['status'] == 'train_exact') == hist['train_exact']
        assert rec['program'] == hist['program'], 'program differs from the D+ D0_Frozen record'
        page = embedded(d / 'index.html')
        assert page['trace']['summary']['structural_trace_hash'] == s['structural_trace_hash']
        assert page['candidates']['total'] == len(read(d / 'candidates.json')['candidates'])
        assert page['record']['program_transform_id'] == rec['program_transform_id']
        info = {'status': rec['status'], 'dplus_status': hist['status'], 'search_work': rec['search_work'], 'dplus_search_work': hist['search_work'], 'stdout': stdout}
        if hist['train_exact']:
            wit = [w['grid'] for w in hist['execution_witnesses']]
            pred = [p['predicted']['grid'] for p in r['grids']['pairs']]
            task = read(TRAIN / f'{tid}.json')
            assert pred == wit == [p['output'] for p in task['train']]
            rep = [x for x in read(d / 'replays.json')['results'] if x['candidate_id'] == rec['program_transform_id']][0]
            assert rep['decoded_id_equals_candidate_id'] and rep['verdict'] == 'match'
            assert [c['grid'] for c in rep['replay']['cases']] == pred
            assert all(w['independent_checks'] == 'passed' for w in r['trace']['witness_checks'])
            info.update(selected_ast_replay=rep['verdict'], predicted_equals_dplus_witness=True)
        else:
            assert not any(p['predicted']['available'] for p in r['grids']['pairs'])
            st = selftest(d / 'index.html')
            assert st['predicted_panels_na'] > 0 and not st['errors']
            info.update(predicted='not_available', page_na_panels=st['predicted_panels_na'])
        out[tid] = info
    return save('consistency', {'passed': True, 'tasks': out})


# ---------------------------------------------------------------- 3

def find(events, pred):
    for e in events:
        if pred(e):
            return {k: e.get(k) for k in ('sequence', 'scope', 'stage', 'kind', 'event', 'branch_id', 'parent_branch_id', 'parent_id', 'candidate_id', 'stop_reason', 'outcome', 'reason_code', 'reason', 'deferred_count', 'budget', 'budgets')} | (
                {'case': {k: e['case'].get(k) for k in ('case_index', 'outcome', 'reason')}} if 'case' in e else {})
    return None


def case_reason(e, outcome, text):
    cs = [e['case']] if 'case' in e else e.get('cases', []) if e.get('kind') == 'evaluated' else []
    return any(c['outcome'] == outcome and text in c['reason'] for c in cs)


def test_rejections():
    """Each rejection kind is located with stage, branch and reason."""
    dirs = [EX / t / 'inspect' for t in ['5168d44c', 'ac0a08a4', 'ed36ccf7']] + sorted((VAL / 'regression' / 'trace_unsolved').glob('*')) + sorted((VAL / 'regression' / 'trace_solved').glob('*'))
    pools = [(d.parent.name if d.parent.parent.name != 'regression' else d.name, events_of(d), d) for d in dirs if (d / 'trace.json').exists()]
    search = {}
    def first(name, pred, extra=None):
        for tid, ev, d in pools:
            hit = find(ev, pred)
            if hit and (extra is None or extra(tid, ev, d, hit)):
                search[name] = {'task': tid, 'event': hit}
                return
        search[name] = None
    first('non_unique_selector', lambda e: case_reason(e, 'execution_invalid', 'not unique') or (e.get('scope') == 'Composition' and 'not unique' in (e.get('reason') or '')))
    first('out_of_canvas_render', lambda e: case_reason(e, 'render_invalid', 'outside canvas'))
    first('shape_sizesig_correspondence_absent', lambda e: e.get('scope') == 'Composition' and e.get('stop_reason') == 'InvalidPrecondition' and 'shape correspondence absent' in (e.get('reason') or ''))
    first('illegal_count_refinement', lambda e: case_reason(e, 'execution_invalid', 'parameter refinement failed'))
    first('budget_truncated_candidate', lambda e: e.get('kind') == 'truncated' and e.get('budget') is not None)
    first('deferred_unconsumed', lambda e: e.get('event_source') == 'dplus' and e.get('scope') == 'TypedParameter' and (e.get('deferred_count') or 0) > 0 and e.get('stop_reason') == 'BudgetCut')
    def param_fit_mismatch(tid, ev, d, hit):
        goals = read(d / 'candidates.json')['parameter_goals']
        return any(g['plan_id'] == hit['parent_branch_id'] and any(r['matches_all_labels'] for r in g['representatives']) for g in goals)
    first('param_fit_but_final_grid_mismatch_inverse_plan', lambda e: e.get('kind') == 'case' and e.get('entry') == 'inverse_typed' and e.get('outcome') == 'render_mismatch', param_fit_mismatch)
    # Alignment path: the scalar slot bodies were fitted on the training rows,
    # the realized grids then mismatched (D+ Render checkpoint).
    first('param_fit_but_final_grid_mismatch_alignment', lambda e: e.get('event_source') == 'dplus' and e.get('scope') == 'Render' and e.get('parent_id') == 'alignment' and (e.get('render_mismatches') or 0) > 0)
    inverse_note = None
    if search['param_fit_but_final_grid_mismatch_inverse_plan'] is None:
        inverse_note = 'in the %d traced tasks no inverse-plan candidate rendered a mismatching grid: every executed inverse_typed case was exact or the plan proposed nothing' % len(pools)
        del search['param_fit_but_final_grid_mismatch_inverse_plan']
    missing = [k for k, v in search.items() if v is None]
    assert not missing, f'no search-time evidence for {missing}'
    # Executor-level controls (constructed ASTs; the search grammar cannot propose them).
    base = EX / 'ac0a08a4' / 'inspect'
    rec, driver = read(base / 'solver_record.json'), read(base / 'driver.json')
    dims = T.case_dims(events_of(base), read(base / 'grids.json'))
    def p(ref, expr):
        return {'refinement': ref, 'expr': expr}
    def ast(steps, sel=None):
        return {'selector': sel or {'kind': 'AllObjects'}, 'others': 'DropOthers', 'body': {'kind': 'Pipeline', 'steps': steps}}
    cx, cy = {'leaf': 'CurrentX'}, {'leaf': 'CurrentY'}
    controls = {
        'illegal_colour': (ast([{'op': 'MapColor', 'params': [p('ArcColor', {'const': 12})]}]), dims[0], 'parameter refinement failed: ArcColor'),
        'mod_division_by_zero': (ast([{'op': 'MapPosition', 'params': [p('IntegerParam', {'op': 'Mod', 'args': [cx, {'const': 0}]}), p('IntegerParam', cy)]}]), dims[0], 'mod: division by zero'),
        'out_of_canvas': (ast([{'op': 'MapPosition', 'params': [p('IntegerParam', {'const': 40}), p('IntegerParam', cy)]}]), dims[0], 'outside canvas'),
        'non_unique_selector': (ast([{'op': 'MapColor', 'params': [p('ArcColor', {'const': 1})]}], {'kind': 'FilterBy', 'pred': {'kind': 'IsMinArea'}}), dims[0], 'not unique'),
        'invalid_canvas_sizesig': (ast([{'op': 'MapColor', 'params': [p('ArcColor', {'const': 1})]}]), [31, 3], 'invalid ARC SizeSig/canvas'),
        'type_error_decode': (ast([{'op': 'MapColor', 'params': [p('ArcColor', {'op': 'IsOdd', 'args': [cx]})]}]), dims[0], 'checkedParam rejected'),
    }
    reqs = [{'request_id': k, 'candidate_id': 'oracle:' + k, 'reason': 'oracle_diagnostic_only', 'ast': a, 'pairs': [{'pair_index': rec['pairs_used_in_search'][0], 'case_index': 0, 'output_dims': dd}]} for k, (a, dd, _) in controls.items()]
    raw = T.run_replay(BIN, ROOT / driver['task_file'], rec['config'], reqs, VAL / 'rejections.replay.json')
    executor = {}
    for r in raw['results']:
        rid = r['request_id']
        text = controls[rid][2]
        if r['decode_ok']:
            c = r['cases'][0]
            stage, reason = c['outcome'], c['reason']
        else:
            stage, reason = 'decode', r['decode_error']
        assert text in reason, (rid, stage, reason)
        executor[rid] = {'stage': stage, 'reason': reason, 'oracle_diagnostic_only': True}
    return save('rejections', {'passed': True, 'search_time_evidence': search, 'executor_controls': executor, 'inverse_plan_mismatch_note': inverse_note, 'traced_tasks_scanned': len(pools),
        'note': 'illegal colour, Mod(…,0), invalid canvas and ill-typed parameters cannot be proposed by the search grammar (ArcColor/closed domains, labels from 0..9); they are executor-level controls with constructed ASTs and never count as search candidates'})


# ---------------------------------------------------------------- 4

def multiplier(rec):
    return int(re.search(r'sdBudgetMultiplier = (\d+)', rec['config_text']).group(1))


def test_joint_forward():
    out = {}
    for tid, cfg in [('ed36ccf7', 'FullD'), ('ac0a08a4', 'Combined3_4x')]:
        d = VAL / 'joint_forward' / f'{tid}-{cfg}'
        r = trace(TRAIN / f'{tid}.json', d, config=cfg)
        ev = events_of(d)
        m = multiplier(r['record'])
        jf = [e for e in ev if e.get('scope') == 'JointForward' and e.get('kind') == 'entered']
        assert len(jf) == 1, 'JointForward entry not recorded'
        lim = jf[0]['limits']
        assert (lim['templates']['limit'], lim['count_representatives']['limit'], lim['candidates']['limit']) == (16 * m, 12 * m, 180 * m)
        assert jf[0]['grammar']['param_ast_depth_limit'] == 1 and jf[0]['typed_goal'].startswith('none')
        joint = [e for e in ev if e.get('entry') == 'joint_forward' and e.get('kind') == 'completed']
        starved = [e for e in ev if e.get('entry') == 'joint_forward' and e.get('kind') == 'truncated']
        inverse_goals = [e for e in ev if e.get('scope') == 'TypedParameter' and e.get('event_source') == 'dplus' and e.get('parent_id') == 'unified']
        # Entered with either executed candidates, or every proposal cut by a recorded budget.
        assert joint or (starved and all(e.get('budget') for e in starved)), 'joint forward entered without executions or recorded truncation'
        assert all(e.get('parent_branch_id') == 'unified.joint' for e in joint + starved)
        ext = [e for e in ev if e.get('scope') == 'Extension']
        sd = re.search(r'sdComposeDepth = (\d+), sdParamDepth = (\d+)', r['record']['config_text'])
        if int(sd.group(1)) > 2:
            assert ext and ext[0]['compose_depth_limit'] == int(sd.group(1))
        out[f'{tid}-{cfg}'] = {'multiplier_from_config': m, 'limits': lim, 'grammar': jf[0]['grammar'], 'joint_candidates_executed': len(joint),
                               'joint_candidates_truncated': len(starved), 'truncation_reasons': sorted({e.get('reason_code') for e in starved}),
                               'extension_programs_executed': sum(1 for e in ev if e.get('entry') == 'extension_forward' and e.get('kind') == 'completed'),
                               'inverse_typed_goal_events': len(inverse_goals), 'compose_depth': int(sd.group(1)), 'param_depth_inverse_goal': int(sd.group(2)),
                               'extension_entered': bool(ext), 'search_work': r['summary']['search_work'], 'status': r['summary']['status']}
    assert any(v['joint_candidates_executed'] > 0 for v in out.values()), 'no run executed a joint forward candidate'
    return save('joint_forward', {'passed': True, 'runs': out, 'note': 'limits computed from the configuration text of each run; the joint forward depth (1) is separate from the inverse TypedGoal param_depth'})


# ---------------------------------------------------------------- 5

def test_ui():
    node = subprocess.run(['node', str(ROOT / 'test' / 'trace_io_viewer_test.js')], capture_output=True, text=True)
    assert node.returncode == 0, node.stdout + node.stderr
    pages = sorted(EX.glob('*/*/index.html')) + sorted((VAL / 'consistency').glob('*/index.html'))
    reports = {}
    for page in pages:
        text = page.read_text(encoding='utf-8')
        external = re.findall(r'(?:src|href)\s*=\s*["\'](?:https?:)?//', text)
        assert not external, f'{page}: external resource reference'
        assert 'fetch(' not in text and 'XMLHttpRequest' not in text
        st = selftest(page)
        assert not st['errors'] and not st['dead_links'] and st['embedded_unchanged'] and not st['validation']['errors'], (page, st['errors'], st['dead_links'])
        for g in st['grid_checks']:
            assert g['input_cells_drawn'] == g['input_cells_expected'] and g['predicted_cells_drawn'] == g['predicted_cells_expected'] and g['diff_marked'] == g['diff_expected'], g
        reports[T.rel(page)] = {'views': len(st['tabs']), 'grid_checks': st['grid_checks'], 'warnings': st['validation']['warnings']}
    # Corrupt / partial bundles must be visible as errors or unknown.
    src = EX / 'ac0a08a4' / 'inspect'
    corrupt = VAL / 'ui_corrupt'
    if corrupt.exists():
        shutil.rmtree(corrupt)
    shutil.copytree(src, corrupt)
    tr = read(corrupt / 'trace.json')
    del tr['funnel']
    T.write_json(corrupt / 'trace.json', tr)
    T.render(corrupt / 'trace.json', corrupt / 'missing_funnel.html')
    st1 = selftest(corrupt / 'missing_funnel.html')
    assert 'trace.funnel' in ' '.join(st1['validation']['errors'])
    tr['funnel'] = read(src / 'trace.json')['funnel']
    T.write_json(corrupt / 'trace.json', tr)
    (corrupt / 'candidates.json').unlink()
    (corrupt / 'grids.json').unlink()
    T.render(corrupt / 'trace.json', corrupt / 'missing_files.html')
    st2 = selftest(corrupt / 'missing_files.html')
    assert any('candidates.json' in w for w in st2['validation']['warnings']) and any('grids.json' in w for w in st2['validation']['warnings']) and not st2['errors']
    bad = corrupt / 'bad_schema.json'
    T.write_json(bad, dict(tr, trace_schema_version='other/0'))
    try:
        T.render(bad, corrupt / 'bad.html')
        raise AssertionError('unsupported schema rendered')
    except SystemExit as e:
        schema_error = str(e)
    return save('ui', {'passed': True, 'node_unit_tests': node.stdout.strip().splitlines()[-1], 'pages': reports,
                       'corrupt': {'missing_funnel_errors': st1['validation']['errors'], 'missing_files_warnings': st2['validation']['warnings'], 'bad_schema': schema_error},
                       'offline': 'headless Chrome with all host resolution disabled; no src/href to remote URLs; no fetch/XMLHttpRequest'})


# ---------------------------------------------------------------- 6

def test_log_loss():
    task = TRAIN / 'ac0a08a4.json'
    base = VAL / 'log_loss'
    full = load(EX / 'ac0a08a4' / 'inspect')
    res = {}
    cap = trace(task, base / 'cap', max_events=500)
    sc = cap['summary']
    assert sc['trace_incomplete'] and sc['trace_sink']['events_dropped_by_cap'] > 0 and sc['trace_sink']['dropped_by_scope']
    assert sc['search_work'] == full['summary']['search_work'] and sc['status'] == full['summary']['status'], 'event cap changed the search'
    res['cap'] = {'written': sc['trace_sink']['events_written'], 'dropped': sc['trace_sink']['events_dropped_by_cap'], 'dropped_by_scope': sc['trace_sink']['dropped_by_scope'], 'search_work_equal': True}
    smp = trace(task, base / 'sample7', sample=7)
    ss = smp['summary']
    assert ss['trace_incomplete'] and ss['trace_sink']['events_sampled_out'] > 0 and ss['search_work'] == full['summary']['search_work']
    res['sampling'] = {'sampled_out': ss['trace_sink']['events_sampled_out'], 'by_scope': ss['trace_sink']['sampled_out_by_scope'], 'search_work_equal': True}
    to = trace(TRAIN / 'ed36ccf7.json', base / 'timeout', timeout=1.0)
    st = to['summary']
    assert st['status'] == 'timeout' and st['search_work'] is None and st['trace_incomplete'] and to['record']['counters'] is None
    assert st['event_parse']['malformed_lines'] == 0
    res['timeout'] = {'status': st['status'], 'events_before_timeout': st['events_parsed'], 'terminal': st['terminal_event'], 'reasons': st['trace_incomplete_reasons']}
    kill = trace(TRAIN / 'ed36ccf7.json', base / 'hard_kill', kill_after=2.0)
    sk = kill['summary']
    assert sk['status'] == 'killed' and sk['hard_kill'] and sk['trace_incomplete'] and sk['terminal_event'] is None and sk['terminal_note']
    assert kill['record'] is None, 'a killed process must not leave a fabricated record'
    ev, stats = T.read_events(base / 'hard_kill')
    assert ev and all('sequence' in e for e in ev) and [e['sequence'] for e in ev] == sorted(e['sequence'] for e in ev)
    res['hard_kill'] = {'events_parsed': len(ev), 'malformed_tail_lines': stats['malformed_lines'], 'terminal_event': None, 'note': sk['terminal_note'], 'funnel_states': {f['stage']: f['state'] for f in kill['trace']['funnel']}}
    assert 'unknown' in res['hard_kill']['funnel_states'].values()
    # Sink cannot be opened: the run is refused before any search.
    bad = base / 'sink_open_failure'
    if bad.exists():
        shutil.rmtree(bad)
    (bad / 'search_events.jsonl').mkdir(parents=True)
    proc = subprocess.run([str(BIN), 'trace-io', '--task', str(task), '--out', str(bad), '--mode', 'inspect-pair'], capture_output=True, text=True)
    assert proc.returncode == 4 and 'trace sink cannot be opened' in read(bad / 'trace_io_error.json')['error']
    assert not (bad / 'solver_record.json').exists()
    res['sink_open_failure'] = {'exit_code': proc.returncode, 'error': read(bad / 'trace_io_error.json')['error'][:200]}
    # Guards: test pairs and pair index.
    leak = train_only_task('leak', [{'input': [[1]], 'output': [[1]]}])
    T.write_json(leak, {'train': [{'input': [[1]], 'output': [[1]]}], 'test': [{'input': [[1]], 'output': [[1]]}]})
    p3 = subprocess.run([str(BIN), 'trace-io', '--task', str(leak), '--out', str(base / 'leak')], capture_output=True, text=True)
    p2 = subprocess.run([str(BIN), 'trace-io', '--task', str(task), '--pair-index', '9', '--out', str(base / 'pair_range')], capture_output=True, text=True)
    big = train_only_task('too_big', [{'input': [[0] * 31], 'output': [[0] * 31]}])
    p4 = subprocess.run([str(BIN), 'trace-io', '--task', str(big), '--out', str(base / 'too_big')], capture_output=True, text=True)
    assert p3.returncode == 3 and p2.returncode == 2 and 'out of range' in p2.stderr and p4.returncode == 2 and '1..30' in p4.stderr
    res['guards'] = {'test_pairs_exit': p3.returncode, 'pair_index_error': p2.stderr.strip(), 'grid_size_error': p4.stderr.strip()}
    return save('log_loss', {'passed': True, **res})


# ---------------------------------------------------------------- 7

def stage_run(tid, cfg, task_file, dest, eventlog):
    dest.mkdir(parents=True, exist_ok=True)
    cmd = [str(BIN), 'arc-train-only-stage', '--stage', 'stage-d-' + cfg, '--task', str(task_file), '--out', str(dest), '--timeout-ms', '300000', '+RTS', '-M2g', '-T']
    if eventlog:
        cmd += ['-l-au', '-ol' + str(dest / 'search.eventlog')]
    cmd += ['-RTS']
    subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True, timeout=400)
    return read(dest / f'stage-d-{cfg}.json')


def raw_dplus_events(path):
    ev, _ = DP.parse_events(path)
    return [{k: v for k, v in e.items() if k not in ('monotonic_seconds', 'elapsed_seconds')} for e in ev]


def compare_stage(tid, cfg, new, old):
    same = {'program': new['program'] == old['program'], 'search_work': new['search_work'] == old['search_work'], 'status': new['status'] == old['status'],
            'predictions': [w.get('grid') for w in new.get('execution_witnesses') or []] == [w.get('grid') for w in old.get('execution_witnesses') or []],
            'stage_d': new.get('stage_d') == old.get('stage_d')}
    return same


def test_regression():
    sel = read(DPLUS / 'selection.json')
    solved = sel['positive_controls']
    jobs = []
    for tid in solved:
        jobs.append((tid, 'D0_Off', TRAIN / f'{tid}.json', 'regression', False))
        jobs.append((tid, 'D0_Frozen', TRAIN / f'{tid}.json', 'baseline', True))
    for p in sorted((DPLUS / 'mechanism_train').glob('*.json')):
        for cfg in ['D0_Frozen', 'D0_Off']:
            jobs.append((p.stem, cfg, p, 'mechanism', cfg == 'D0_Frozen'))
    rows = []
    def one(job):
        tid, cfg, task_file, phase, ev = job
        dest = VAL / 'regression' / 'dplus_path' / tid / cfg
        new = stage_run(tid, cfg, task_file, dest, ev)
        old = read(DPLUS / phase / 'tasks' / tid / cfg / f'stage-d-{cfg}.json')
        row = {'task': tid, 'config': cfg, 'phase': phase, **compare_stage(tid, cfg, new, old)}
        if ev:
            a, b = raw_dplus_events(dest / 'search.eventlog'), raw_dplus_events(DPLUS / phase / 'tasks' / tid / cfg / 'search.eventlog')
            row['dplus_events_identical'] = a == b
            row['dplus_events'] = len(a)
        return row
    with ThreadPoolExecutor(max_workers=4) as pool:
        rows = list(pool.map(one, jobs))
    bad = [r for r in rows if not all(v for k, v in r.items() if k in ('program', 'search_work', 'status', 'predictions', 'stage_d', 'dplus_events_identical'))]
    # trace-io (all instrumentation on) against the D+ D0_Frozen records.
    def traced(tid, group):
        d = VAL / 'regression' / group / tid
        ns = argparse.Namespace(task=str(TRAIN / f'{tid}.json'), pair_index=0, mode='inspect-pair', config='FullD', out=str(d), trace_level='candidates', timeout=300,
                                kill_after=None, max_events=250000, max_bytes=268435456, sample_candidates=1, posthoc='on', replay_limit=8, focus_candidate=None,
                                focus_branch=None, binary=str(BIN), force=True)
        subprocess.run([sys.executable, '-I', str(ROOT / 'scripts' / 'trace_io.py'), 'run'] + sum([[f'--{k}', str(v)] for k, v in
                       [('task', ns.task), ('pair-index', 0), ('mode', 'inspect-pair'), ('config', 'FullD'), ('out', ns.out), ('trace-level', 'candidates'), ('replay-limit', 8)]], []) + ['--force'],
                       cwd=ROOT, capture_output=True, text=True, timeout=900)
        rec = read(d / 'solver_record.json')
        old = dplus_record(tid)
        preds = [p['predicted'].get('grid') for p in read(d / 'grids.json')['pairs']]
        return {'task': tid, 'program': rec['program'] == old['program'], 'search_work': rec['search_work'] == old['search_work'], 'status': (rec['status'] == 'train_exact') == old['train_exact'],
                'predictions': (preds == [w['grid'] for w in old['execution_witnesses']]) if old['train_exact'] else not any(preds), 'trace_work': rec['search_work'], 'dplus_work': old['search_work']}
    unsolved = []
    for p in sorted((DPLUS / 'baseline' / 'tasks').glob('*/D0_Frozen/stage-d-D0_Frozen.json')):
        r = read(p)
        if not r['train_exact'] and r['wall_clock_seconds'] is not None and r['wall_clock_seconds'] < 8 and len(unsolved) < 12:
            unsolved.append(r['task_id'])
    with ThreadPoolExecutor(max_workers=4) as pool:
        trace_solved = list(pool.map(lambda t: traced(t, 'trace_solved'), solved))
        trace_unsolved = list(pool.map(lambda t: traced(t, 'trace_unsolved'), unsolved))
    bad_trace = [r for r in trace_solved + trace_unsolved if not (r['program'] and r['search_work'] and r['status'] and r['predictions'])]
    result = save('regression', {'passed': not bad and not bad_trace, 'dplus_path_runs': len(rows), 'dplus_path_failures': bad, 'dplus_path': rows,
        'trace_io_solved': trace_solved, 'trace_io_unsolved_sample': trace_unsolved, 'trace_io_failures': bad_trace,
        'unsolved_sample_rule': 'first 12 D0_Frozen non-exact tasks by task id with D+ wall < 8 s (no outcome of this round consulted)',
        'solved_count': sum(1 for r in trace_solved if r['status']), 'note': 'D0_Off = diagnostics off; D0_Frozen = D+ events on (eventlog payloads compared field by field, timing excluded); trace-io = FullD with forced D+ diagnostics and the candidates trace level'})
    assert result['passed'], (bad[:3], bad_trace[:3])
    return result


# ---------------------------------------------------------------- 8

def test_determinism():
    out = {}
    for tid, level in [('5168d44c', 'full'), ('ac0a08a4', 'candidates')]:
        a = trace(TRAIN / f'{tid}.json', VAL / 'determinism' / f'{tid}-a', level=level, replay_limit=0)
        b = trace(TRAIN / f'{tid}.json', VAL / 'determinism' / f'{tid}-b', level=level, replay_limit=0)
        ca = [c['candidate_id'] for c in read(a['dir'] / 'candidates.json')['candidates']]
        cb = [c['candidate_id'] for c in read(b['dir'] / 'candidates.json')['candidates']]
        assert a['summary']['structural_trace_hash'] == b['summary']['structural_trace_hash'] and ca == cb
        out[tid] = {'level': level, 'structural_trace_hash': a['summary']['structural_trace_hash'], 'events': a['summary']['events_parsed'], 'candidate_ids_equal': True,
                    'ignored_fields': sorted(T.VOLATILE)}
    return save('determinism', {'passed': True, 'runs': out})


# ---------------------------------------------------------------- 9

def test_performance():
    rows = []
    for tid in ['5168d44c', 'ac0a08a4', 'ed36ccf7']:
        for cfg, ev in [('D0_Off', False), ('D0_Frozen', True)]:
            dest = VAL / 'performance' / tid / cfg
            r = stage_run(tid, cfg, TRAIN / f'{tid}.json', dest, ev)
            rows.append({'task': tid, 'mode': cfg + (' (D+ events -> eventlog)' if ev else ' (no diagnostics)'), 'wall_seconds': r['wall_clock_seconds'], 'search_work': r['search_work'],
                         'events': (r.get('diagnostic_overhead') or {}).get('events'), 'disk_bytes': (dest / 'search.eventlog').stat().st_size if ev else 0,
                         'rts_max_live_bytes': r.get('rts_max_live_bytes'), 'diagnostic_seconds': (r.get('diagnostic_overhead') or {}).get('serialization_and_emit_seconds')})
        for level in T.LEVELS:
            t = trace(TRAIN / f'{tid}.json', VAL / 'performance' / tid / f'trace-{level}', level=level, replay_limit=0)
            s = t['summary']
            rows.append({'task': tid, 'mode': 'trace-io ' + level, 'wall_seconds': s['wall_clock_seconds'], 'search_work': s['search_work'], 'events': s['events_parsed'],
                         'disk_bytes': (s.get('trace_sink') or {}).get('bytes_written'), 'gzip_bytes': (read(t['dir'] / 'trace.json').get('event_stream') or {}).get('gzip_bytes'),
                         'rts_max_live_bytes': s['rts_max_live_bytes'], 'diagnostic_seconds': (s.get('diagnostic_overhead') or {}).get('serialization_and_emit_seconds'),
                         'sink_seconds': (s.get('trace_sink') or {}).get('sink_seconds')})
    for tid in {r['task'] for r in rows}:
        assert len({r['search_work'] for r in rows if r['task'] == tid}) == 1, f'search_work differs across trace levels for {tid}'
    return save('performance', {'passed': True, 'rows': rows, 'note': 'single run per cell on a shared workstation; wall seconds include diagnostics; search_work never includes trace serialization'})


TESTS = {'isolation': test_isolation, 'consistency': test_consistency, 'joint_forward': test_joint_forward, 'log_loss': test_log_loss,
         'regression': test_regression, 'rejections': test_rejections, 'determinism': test_determinism, 'performance': test_performance, 'ui': test_ui}

if __name__ == '__main__':
    names = sys.argv[1:] or list(TESTS)
    summary = {}
    for name in names:
        start = time.monotonic()
        try:
            TESTS[name]()
            summary[name] = {'passed': True, 'seconds': round(time.monotonic() - start, 1)}
        except AssertionError as e:
            summary[name] = {'passed': False, 'error': str(e)[:2000], 'seconds': round(time.monotonic() - start, 1)}
        print(name, summary[name], flush=True)
    prev = read(VAL / 'validation_summary.json') if (VAL / 'validation_summary.json').exists() else {}
    prev.update(summary)
    save('validation_summary', prev)
    sys.exit(0 if all(v['passed'] for v in summary.values()) else 1)
