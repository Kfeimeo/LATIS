"""Independent (Python) verification of a Stage E3.1 run directory (read-only).

1. Selector precheck replay: every recorded SelectorCheck witness (view, selector, per-case
   kind + matched region ids) is recomputed from the recorded INPUT trees (depth-1 content
   nodes: area, object count, colour list) with a separate implementation of the selector
   semantics, and the tree hash of the witness must be the tree hash of the recorded tree.
2. Universe accounting: considered = executed + prechecked_invalid + dependency_pruned,
   universe = considered + remaining, for every record that entered the region search.
3. Cross-configuration equivalences on the same task and binary:
     LazyMDLOnly vs PatchedBaseline  identical exposures (program, outcome), fits, counts, scene costs
     PrecheckOnly vs PatchedBaseline when neither is budget-cut: identical fits and first-fit
                                     candidate index; executed+pruned (base) = executed+prechecked+pruned (precheck)
     Full vs FullNoMDL etc.          reported, not asserted
4. Pixel replay of every train-exact record: the recorded per-case predicted grid equals the
   training target pixel for pixel; region programs CropRegion / PreserveExcept(ClearRegion)@Root
   are additionally re-executed in Python from the recorded region bounds / scene background.
Writes <out>/verification_e31.json and prints a summary. Never modifies a record.
"""
import argparse
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


SELECTOR_NAMES = {'Root': ('Root', None), 'UniqueLargestContent': ('Largest', None), 'UniqueSmallestContent': ('Smallest', None),
                  'UniqueContentWithObjects': ('WithObjects', None), 'UniqueContentWithoutObjects': ('WithoutObjects', None)}


def parse_selector(text):
    if text in SELECTOR_NAMES:
        return SELECTOR_NAMES[text]
    if text.startswith('UniqueContentWithColor('):
        return ('WithColor', int(text[len('UniqueContentWithColor('):-1]))
    if text.startswith('UniqueContentWithObjectCount('):
        return ('WithObjectCount', int(text[len('UniqueContentWithObjectCount('):-1]))
    raise ValueError(text)


def node_colours(n):
    c = n.get('colours')
    if isinstance(c, list):
        return c
    return json.loads(str(c))


def resolve(selector_text, tree):
    """Independent re-implementation of Program.resolveSelector on a recorded tree -> (kind, matched ids)."""
    kind, arg = parse_selector(selector_text)
    nodes = sorted(tree['nodes'], key=lambda n: n['region_id'])
    if kind == 'Root':
        return ('ValidSelected', [0]) if any(n['region_id'] == 0 for n in nodes) else ('InvalidOther', [])
    cs = [n for n in nodes if n['role'] == 'RoleContent' and n['depth'] == 1]
    if not cs:
        return ('InvalidRootUnsplit', [])
    objs = lambda n: n['objects'] if isinstance(n['objects'], list) else json.loads(str(n['objects']))  # noqa: E731

    def unique(matches):
        if len(matches) == 1:
            return ('ValidSelected', [matches[0]['region_id']])
        if not matches:
            return ('InvalidEmpty', [])
        return ('InvalidNonUnique', [m['region_id'] for m in matches])

    def extremum(key):
        ordered = sorted(cs, key=key)  # stable: ties keep ascending region_id order, as Haskell sortOn over M.elems
        if len(ordered) >= 2 and key(ordered[0]) == key(ordered[1]):
            return ('InvalidNonUnique', [ordered[0]['region_id'], ordered[1]['region_id']])
        return ('ValidSelected', [ordered[0]['region_id']])
    if kind == 'Largest':
        return extremum(lambda n: -n['area'])
    if kind == 'Smallest':
        return extremum(lambda n: n['area'])
    if kind == 'WithObjects':
        return unique([n for n in cs if objs(n)])
    if kind == 'WithoutObjects':
        return unique([n for n in cs if not objs(n)])
    if kind == 'WithColor':
        return unique([n for n in cs if arg in node_colours(n)])
    if kind == 'WithObjectCount':
        return unique([n for n in cs if len(objs(n)) == arg])
    raise ValueError(kind)


def replay_precheck(rec):
    run = (rec.get('region_search') or {}).get('run') or {}
    pre = run.get('precheck') or {}
    out = {'witnesses': 0, 'cases_checked': 0, 'mismatches': [], 'tree_hash_mismatches': 0, 'skipped_consistent': None}
    if not pre.get('enabled'):
        return None
    trees = {(t['case_index'], t['view']): t for t in run.get('trees', [])}
    for w in pre.get('witnesses', []):
        out['witnesses'] += 1
        for c in w['cases']:
            t = trees.get((c['case_index'], w['view']))
            if t is None:
                out['mismatches'].append({'view': w['view'], 'selector': w['selector'], 'case': c['case_index'], 'why': 'tree missing'})
                continue
            if t.get('tree_hash') != c.get('tree_hash'):
                out['tree_hash_mismatches'] += 1
            kind, ids = resolve(w['selector'], t['tree'])
            rec_ids = c['matched_ids'] if isinstance(c['matched_ids'], list) else json.loads(str(c['matched_ids']))
            out['cases_checked'] += 1
            if kind != c['kind'] or ids != rec_ids:
                out['mismatches'].append({'view': w['view'], 'selector': w['selector'], 'case': c['case_index'], 'recorded': (c['kind'], rec_ids), 'replayed': (kind, ids)})
    # every skipped candidate must be explained by a witness case that is not ValidSelected (or SameRegion)
    wit = {(w['view'], w['selector']): w for w in pre.get('witnesses', [])}
    bad = 0
    for s in pre.get('skipped_candidates', []):
        if s['kind'] == 'InvalidSameRegion':
            continue
        w = wit.get((s.get('view') or s['program'].split(' @ ')[-1], s.get('selector')))
        if w is None or not any(c['case_index'] == s.get('case_index') and c['kind'] == s['kind'] for c in w['cases']):
            bad += 1
    out['skipped_consistent'] = bad == 0
    out['skipped_unexplained'] = bad
    return out


def accounting(rec):
    run = (rec.get('region_search') or {}).get('run') or {}
    acc = run.get('universe_accounting')
    if not acc:
        return None
    ints = {k: int(acc[k]) for k in ('universe', 'considered', 'executed', 'prechecked_invalid', 'dependency_pruned', 'remaining_not_reached')}
    ok = ints['considered'] == ints['executed'] + ints['prechecked_invalid'] + ints['dependency_pruned'] and ints['universe'] == ints['considered'] + ints['remaining_not_reached'] and ints['remaining_not_reached'] >= 0
    return {'ok': ok, **ints}


def pixel_replay(rec, train):
    if not rec.get('train_exact'):
        return None
    out = {'witness_grids_exact': None, 'python_replay': None}
    ws = rec.get('execution_witnesses') or []
    grids = []
    for w in ws:
        g = w.get('grid')
        grids.append(json.loads(g) if isinstance(g, str) else g)
    out['witness_grids_exact'] = len(grids) == len(train) and all(g == pair['output'] for g, pair in zip(grids, train))
    rs = rec.get('region_search') or {}
    sp = rs.get('selected_program')
    if sp:
        run = rs.get('run') or {}
        results = []
        for ex in rs.get('executions', []):
            i = ex['pair_index']
            inp, tgt = train[i]['input'], train[i]['output']
            e = ex.get('exec') or {}
            if sp['action'] == 'CropRegion' and e.get('region_bounds'):
                b = e['region_bounds']
                pred = [row[b['x_min']:b['x_max'] + 1] for row in inp[b['y_min']:b['y_max'] + 1]]
                results.append(('crop_window', pred == tgt))
            elif sp['action'] == 'PreserveExcept(ClearRegion)' and sp['selector'] == 'Root':
                tree = next((t for t in run.get('trees', []) if t['case_index'] == i and t['view'] == sp['view']['view']), None)
                bg = (((tree or {}).get('tree') or {}).get('scene') or {}).get('background') or {}
                if bg.get('kind') == 'UniformResidual':
                    pred = [[bg['colour']] * len(inp[0]) for _ in inp]
                    results.append(('fill_background', pred == tgt))
                else:
                    results.append(('fill_background', None))
            else:
                results.append(('not_replayed_in_python', None))
        out['python_replay'] = {'action': sp['action'], 'selector': sp['selector'], 'cases': results, 'all_passed': all(r[1] for r in results) if results and all(r[1] is not None for r in results) else None}
    return out


def exposures_of(rec):
    run = (rec.get('region_search') or {}).get('run') or {}
    return [(e['program'], e['outcome']) for e in run.get('exposures', [])], run


def main():
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:  # noqa: BLE001
        pass
    p = argparse.ArgumentParser()
    p.add_argument('--out', required=True)
    p.add_argument('--subdir', default='tasks')
    a = p.parse_args()
    out = Path(a.out)
    manifest = read(out / 'data_manifest.json')
    train = {t['task_id']: read(out / t['train_only_file'])['train'] for t in manifest['tasks']}
    records = defaultdict(dict)
    for rp in (out / a.subdir).glob('*/*/stage-d-*.json'):
        if '.crashed' in rp.name:
            continue
        records[rp.parent.name][rp.parent.parent.name] = read(rp)
    result = {'configs': {}, 'equivalences': {}}
    for cfg, recs in sorted(records.items()):
        pre_total = Counter(); acc_bad = []; px_fail = []; px_ok = 0; py_ok = 0; py_fail = []; py_na = 0; pre_mismatch = []; hash_mm = 0; skipped_bad = []
        for tid, rec in sorted(recs.items()):
            r = replay_precheck(rec)
            if r is not None:
                pre_total['records'] += 1; pre_total['witnesses'] += r['witnesses']; pre_total['cases_checked'] += r['cases_checked']
                hash_mm += r['tree_hash_mismatches']
                if r['mismatches']:
                    pre_mismatch.append({'task': tid, 'mismatches': r['mismatches'][:5]})
                if not r['skipped_consistent']:
                    skipped_bad.append((tid, r['skipped_unexplained']))
            acc = accounting(rec)
            if acc is not None and not acc['ok']:
                acc_bad.append({'task': tid, **acc})
            px = pixel_replay(rec, train[tid])
            if px is not None:
                if px['witness_grids_exact']:
                    px_ok += 1
                else:
                    px_fail.append(tid)
                py = px['python_replay']
                if py is not None:
                    if py['all_passed'] is True:
                        py_ok += 1
                    elif py['all_passed'] is False:
                        py_fail.append((tid, py))
                    else:
                        py_na += 1
        result['configs'][cfg] = {'records': len(recs), 'precheck_replay': dict(pre_total), 'precheck_mismatches': pre_mismatch, 'precheck_tree_hash_mismatches': hash_mm, 'skipped_without_witness': skipped_bad,
                                  'accounting_inconsistent': acc_bad, 'train_exact_witness_grids_exact': px_ok, 'train_exact_witness_grid_failures': px_fail,
                                  'region_python_replay_passed': py_ok, 'region_python_replay_failed': py_fail, 'region_python_replay_not_applicable': py_na}
    # cross-configuration equivalences
    base = records.get('E31_PatchedBaseline', {})

    def compare(cfg_a, cfg_b, strict):
        ra, rb = records.get(cfg_a, {}), records.get(cfg_b, {})
        res = {'compared': 0, 'both_completed': 0, 'fits_equal': 0, 'exposures_equal': 0, 'counts_identity': 0, 'first_fit_candidate_equal': 0, 'scene_costs_equal': 0, 'neither_budget_cut': 0, 'differing': []}
        for tid in sorted(set(ra) & set(rb)):
            res['compared'] += 1
            A, B = ra[tid], rb[tid]
            if A['status'] in ('timeout', 'runtime_error') or B['status'] in ('timeout', 'runtime_error'):
                continue
            res['both_completed'] += 1
            ea, runA = exposures_of(A); eb, runB = exposures_of(B)
            if not runA and not runB:
                res['fits_equal'] += 1; res['exposures_equal'] += 1; res['counts_identity'] += 1; res['first_fit_candidate_equal'] += 1; res['scene_costs_equal'] += 1; res['neither_budget_cut'] += 1
                continue
            fa = sorted(f['text'] for f in runA.get('fits', [])); fb = sorted(f['text'] for f in runB.get('fits', []))
            ma, mb = runA.get('metrics', {}), runB.get('metrics', {})
            cut = bool(runA.get('budget_cut')) or bool(runB.get('budget_cut'))
            if not cut:
                res['neither_budget_cut'] += 1
            fe = fa == fb
            xe = ea == eb
            idn = int(ma.get('rg_executed', 0)) + int(ma.get('rg_pruned', 0)) + int(ma.get('rg_prechecked', 0)) == int(mb.get('rg_executed', 0)) + int(mb.get('rg_pruned', 0)) + int(mb.get('rg_prechecked', 0))
            ffe = ma.get('rg_first_fit_candidate_index') == mb.get('rg_first_fit_candidate_index')
            sce = [v.get('scene_cost') for v in runA.get('views', [])] == [v.get('scene_cost') for v in runB.get('views', [])]
            res['fits_equal'] += fe; res['exposures_equal'] += xe; res['counts_identity'] += idn; res['first_fit_candidate_equal'] += ffe; res['scene_costs_equal'] += sce
            expect = (fe and xe and idn and ffe and sce) if strict == 'lazy' else ((fe and idn and ffe) or cut)
            if not expect:
                res['differing'].append({'task': tid, 'fits_a': fa, 'fits_b': fb, 'exposures_equal': xe, 'counts_identity': idn, 'first_fit_equal': ffe, 'budget_cut': cut,
                                         'a': {k: ma.get(k) for k in ('rg_executed', 'rg_pruned', 'rg_prechecked', 'rg_first_fit_candidate_index')}, 'b': {k: mb.get(k) for k in ('rg_executed', 'rg_pruned', 'rg_prechecked', 'rg_first_fit_candidate_index')}})
        return res
    if base:
        if 'E31_LazyMDLOnly' in records:
            result['equivalences']['LazyMDLOnly_vs_PatchedBaseline'] = compare('E31_PatchedBaseline', 'E31_LazyMDLOnly', 'lazy')
        if 'E31_PrecheckOnly' in records:
            result['equivalences']['PrecheckOnly_vs_PatchedBaseline'] = compare('E31_PatchedBaseline', 'E31_PrecheckOnly', 'precheck')
        if 'E31_Full' in records and 'E31_PrecheckOnly' in records:
            result['equivalences']['Full_vs_PrecheckOnly(lazy MDL added)'] = compare('E31_PrecheckOnly', 'E31_Full', 'lazy')
        for other in ('E31_FullNoMDL', 'E31_FullNoSafePrune', 'E31_FullSelectorPriority', 'E31_FullCostOrder'):
            if other in records and 'E31_Full' in records:
                result['equivalences'][f'{other}_vs_Full(reported_only)'] = compare('E31_Full', other, 'report')
    (out / 'verification_e31.json').write_text(json.dumps(result, ensure_ascii=False, indent=1, default=str) + '\n', encoding='utf-8')
    for cfg, v in result['configs'].items():
        print(cfg, json.dumps({k: (v[k] if not isinstance(v[k], list) else len(v[k])) for k in v}, default=str))
    for k, v in result['equivalences'].items():
        print(k, json.dumps({kk: vv for kk, vv in v.items() if kk != 'differing'}), 'differing:', len(v['differing']))


if __name__ == '__main__':
    main()
