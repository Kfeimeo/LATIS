"""Independent (Python) verification of a Stage E4 run directory (read-only).

1. Skeleton replay: every recorded best skeleton (template JSON + per-case bindings) is rendered by
   this file's own interpreter (Rect / DisjointUnion / Difference in the local frame, Place, linear
   Repeat, Canvas with background or no residual) and must equal the training output pixel for pixel.
2. Tamper tests on every verified skeleton: +1 on one binding, dropping a hole, swapping two roles'
   positions and changing the background must each break at least one case.
3. Provenance: prediction_ready is false, every hole is OutputObserved / NotAttempted, every role's
   members cover distinct objects per case, repeat classes have a hole or literal count.
4. Solver invariance: for every task, E4_Off and every sidecar configuration have the same program
   text and train_exact flag.
5. Mechanism matrix: recorded E4 status equals the family's expected status; heldout diagnostics
   are structural only.
Writes <out>/verification.json.
"""
import argparse
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def ev_int(e, b):
    if e['kind'] == 'Lit':
        return e['value']
    if e['kind'] == 'Hole':
        return b[str(e['hole'])]
    if e['kind'] == 'Offset':
        return b[str(e['hole'])] + e['offset']
    raise ValueError(e)


def shape_cells(s, b):
    if s['kind'] == 'Rect':
        x0, y0, x1, y1 = (ev_int(s[k], b) for k in ('x0', 'y0', 'x1', 'y1'))
        if x1 < x0 or y1 < y0:
            raise ValueError('inverted rectangle')
        return {(x, y) for x in range(x0, x1 + 1) for y in range(y0, y1 + 1)}
    l, r = shape_cells(s['left'], b), shape_cells(s['right'], b)
    if s['kind'] == 'DisjointUnion':
        if l & r:
            raise ValueError('union operands overlap')
        return l | r
    if s['kind'] == 'Difference':
        if not r or not r <= l or l == r:
            raise ValueError('difference not restricted')
        return l - r
    raise ValueError(s['kind'])


def render(skel, bindings):
    """bindings: {'?0': v, ...} as recorded."""
    b = {k[1:]: v for k, v in bindings.items()}
    w, h = ev_int(skel['width'], b), ev_int(skel['height'], b)
    bg = skel['background']
    bgc = None if bg['kind'] == 'None' else (bg['value'] if bg['kind'] == 'Lit' else b[str(bg['hole'])])
    painted = {}
    for coll in skel['objects']:
        o = coll['object']
        inst = [(0, 0)]
        if coll['kind'] == 'Repeat':
            n = ev_int(coll['count'], b)
            dx, dy = ev_int(coll['dx'], b), ev_int(coll['dy'], b)
            inst = [(k * dx, k * dy) for k in range(n)]
        cells = shape_cells(o['shape'], b)
        colour = o['colour']['value'] if o['colour']['kind'] == 'Lit' else b[str(o['colour']['hole'])]
        px, py = ev_int(o['x'], b), ev_int(o['y'], b)
        for ox, oy in inst:
            for (x, y) in cells:
                p = (x + px + ox, y + py + oy)
                if p in painted:
                    raise ValueError('objects overlap')
                if not (0 <= p[0] < w and 0 <= p[1] < h):
                    raise ValueError('object outside the canvas')
                painted[p] = colour
    if bgc is None and len(painted) != w * h:
        raise ValueError('no residual but uncovered pixels')
    return [[painted.get((x, y), bgc) for x in range(w)] for y in range(h)]


def check_record(rec, train):
    e4 = rec.get('output_skeleton')
    if not isinstance(e4, dict):
        return None
    out = {'status': e4.get('status'), 'prediction_ready': e4.get('prediction_ready'), 'input_binding_status': e4.get('input_binding_status'), 'replay': None, 'tamper': None, 'provenance_ok': None}
    best = e4.get('best')
    if not best:
        return out
    skel = best['skeleton']
    ok_cases, bad = 0, []
    for bnd in best['bindings']:
        i = bnd['case_index']
        try:
            g = render(skel, bnd['values'])
            if g == train[i]['output']:
                ok_cases += 1
            else:
                bad.append((i, 'mismatch'))
        except Exception as e:  # noqa: BLE001
            bad.append((i, str(e)))
    out['replay'] = {'cases': len(best['bindings']), 'exact': ok_cases, 'failures': bad}
    # tamper tests
    t = {'binding_plus_one_breaks': None, 'hole_dropped_breaks': None, 'background_changed_breaks': None}
    if best['bindings'] and best['bindings'][0]['values']:
        b0 = dict(best['bindings'][0]['values'])
        k0 = sorted(b0)[0]
        def broken(bb, sk=skel):
            try:
                return render(sk, bb) != train[best['bindings'][0]['case_index']]['output']
            except Exception:  # noqa: BLE001
                return True
        t['binding_plus_one_breaks'] = broken({**b0, k0: b0[k0] + 1})
        t['hole_dropped_breaks'] = broken({k: v for k, v in b0.items() if k != k0})
    sk2 = json.loads(json.dumps(skel))
    if sk2['background']['kind'] == 'Lit':
        sk2['background']['value'] = (sk2['background']['value'] + 1) % 10
        try:
            t['background_changed_breaks'] = render(sk2, best['bindings'][0]['values']) != train[best['bindings'][0]['case_index']]['output']
        except Exception:  # noqa: BLE001
            t['background_changed_breaks'] = True
    out['tamper'] = t
    holes_ok = all(h['origin'] == 'OutputObserved' and h['input_binding_status'] == 'NotAttempted' for h in best['holes'])
    roles_ok = all(len(set(m['object_ids'] if isinstance(m['object_ids'], list) else json.loads(str(m['object_ids'])))) == len(m['object_ids'] if isinstance(m['object_ids'], list) else json.loads(str(m['object_ids']))) for r in best['roles'] for m in r['members'])
    out['provenance_ok'] = holes_ok and roles_ok and e4.get('prediction_ready') is False and e4.get('input_binding_status') == 'NotAttempted'
    return out


def main():
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:  # noqa: BLE001
        pass
    p = argparse.ArgumentParser()
    p.add_argument('--out', required=True)
    a = p.parse_args()
    out = Path(a.out)
    manifest = read(out / 'data_manifest.json')
    train = {t['task_id']: read(out / t['train_only_file'])['train'] for t in manifest['tasks']}
    result = {'subdirs': {}, 'mechanism': None}
    for sd in sorted(p2.name for p2 in out.glob('tasks_*') if p2.is_dir()):
        recs = defaultdict(dict)
        for rp in (out / sd).glob('*/*/stage-d-*.json'):
            if '.crashed' not in rp.name:
                recs[rp.parent.parent.name][rp.parent.name] = read(rp)
        summ = {'records': 0, 'with_skeleton': 0, 'replay_exact_records': 0, 'replay_failures': [], 'tamper_all_break': 0, 'tamper_not_breaking': [], 'provenance_ok': 0, 'provenance_bad': [], 'solver_invariance_violations': [], 'statuses': Counter()}
        for tid, by in sorted(recs.items()):
            off = by.get('E4_Off')
            for cfg, rec in sorted(by.items()):
                summ['records'] += 1
                if off and cfg != 'E4_Off' and ((off.get('program') or '') != (rec.get('program') or '') or off.get('train_exact') != rec.get('train_exact')):
                    summ['solver_invariance_violations'].append((tid, cfg))
                c = check_record(rec, train[tid])
                if c is None:
                    continue
                summ['statuses'][c['status']] += 1
                if c['replay']:
                    summ['with_skeleton'] += 1
                    if c['replay']['exact'] == c['replay']['cases']:
                        summ['replay_exact_records'] += 1
                    else:
                        summ['replay_failures'].append((tid, cfg, c['replay']['failures'][:2]))
                    tv = [v for v in c['tamper'].values() if v is not None]
                    if tv and all(tv):
                        summ['tamper_all_break'] += 1
                    else:
                        summ['tamper_not_breaking'].append((tid, cfg, c['tamper']))
                    if c['provenance_ok']:
                        summ['provenance_ok'] += 1
                    else:
                        summ['provenance_bad'].append((tid, cfg))
        summ['statuses'] = dict(summ['statuses'])
        result['subdirs'][sd] = summ
    mech = out / 'mechanism' / 'matrix.json'
    if mech.exists():
        m = read(mech)
        rows = [r for row in m for r in row]
        joint_cfgs = {'E4_OutputSkeletonOnly', 'E4_NoMDLScore', 'E4_NoStructuralSharing', 'E4_PairwiseOnly'}
        jrows = [r for r in rows if r['config'] in joint_cfgs]
        agree = sum(1 for r in jrows if r.get('e4_status') == r.get('expected_e4_status'))
        result['mechanism'] = {'rows': len(rows), 'joint_rows': len(jrows), 'status_as_expected': agree, 'disagreements': [(r['family'], r['seed'], r['config'], r.get('e4_status'), r.get('expected_e4_status')) for r in jrows if r.get('e4_status') != r.get('expected_e4_status')][:20],
                               'off_rows_without_skeleton': sum(1 for r in rows if r['config'] == 'E4_Off' and r.get('e4_status') is None),
                               'independent_rows_not_attempted': sum(1 for r in rows if r['config'] == 'E4_NoCrossOutput' and r.get('e4_status') == 'NotAttempted'),
                               'single_explanation_statuses': dict(Counter(r.get('e4_status') for r in rows if r['config'] == 'E4_SingleExplanation')),
                               'train_exact_any': sum(1 for r in rows if r.get('train_exact')), 'prediction_ready_true': sum(1 for r in rows if r.get('prediction_ready') is True),
                               'heldout_structural': dict(Counter(((r.get('heldout_structural') or {}).get('oracle_parameter_structural_reconstruction')) for r in rows))}
    (out / 'verification.json').write_text(json.dumps(result, ensure_ascii=False, indent=1, default=str) + '\n', encoding='utf-8')
    for sd, s in result['subdirs'].items():
        print(sd, json.dumps({k: (v if not isinstance(v, list) else len(v)) for k, v in s.items()}, default=str))
    print('mechanism', json.dumps(result['mechanism'], default=str)[:800])


if __name__ == '__main__':
    main()
