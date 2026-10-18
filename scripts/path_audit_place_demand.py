"""Path audit for round-2 results: for every run, record (a) the dependency
structure of the selected program's coordAdd base points (local = depends on a
lambda-bound variable; non-local = depends only on the scene), (b) whether a
Join built from a DEFERRED branch appears in the trace (i.e. the second pass
contributed to the DAG), and (c) which operators the selected program uses.
It never changes selection; it only reads solution.json and the trace."""
import collections, csv, json, pathlib, re, sys
ROOT = pathlib.Path(__file__).resolve().parents[1]
R2 = ROOT / 'results/place-demand-round2'

def split_args(s):
    """top-level comma split of a parenthesised argument list"""
    out, depth, cur = [], 0, ''
    for ch in s:
        if ch == '(': depth += 1
        if ch == ')': depth -= 1
        if ch == ',' and depth == 0: out.append(cur); cur = ''
        else: cur += ch
    if cur: out.append(cur)
    return out

def coordadd_bases(program):
    """first arguments of every coordAdd( ... ) occurrence"""
    bases = []
    for m in re.finditer(r'coordAdd\(', program):
        i = m.end(); depth = 1; j = i
        while j < len(program) and depth > 0:
            if program[j] == '(': depth += 1
            elif program[j] == ')': depth -= 1
            j += 1
        bases.append(split_args(program[i:j-1])[0])
    return bases

def classify(base, program):
    binders = set(re.findall(r'lambda (\w+):', program)) | set(re.findall(r'let (\w+)=', program))
    binders.discard('v0')
    uses = set(re.findall(r'\b(v\d+|__r\dbr?\d|__cse\d|__let\d|key|pair|obj)\b', base))
    return 'local' if any(b in base for b in binders) else ('non-local' if 'v0' in base else 'constant')

def main():
    rows = []
    for sol in sorted(R2.rglob('solution.json')):
        if 'extractor-diag' in str(sol): continue
        x = json.loads(sol.read_text(encoding='utf-8'))
        variant = sol.parent.name; task = sol.parent.parent.name; group = sol.parent.parent.parent.name
        program = x.get('program') or ''
        bases = coordadd_bases(program)
        kinds = [classify(b, program) for b in bases]
        trace = sol.parent / 'induced_tsl_trace.md'
        deferred_joins = 0; deferred_lines = 0
        if trace.exists():
            t = trace.read_text(encoding='utf-8', errors='replace')
            deferred_joins = len(re.findall(r'Nonempty VS_\w+ node=\d+ children=\[[^\]]*\]; deferred-nonlocal:', t))
            deferred_lines = t.count('Deferred ')
        st = x.get('statistics', {}) or {}
        rows.append(dict(group=group, task=task, variant=variant, train=x.get('train_exact'), heldout=x.get('heldout_exact'),
                         coordadd_bases=len(bases), base_kinds=';'.join(kinds), uses_nonlocal_base=any(k == 'non-local' for k in kinds),
                         uses_coordDelta='coordDelta(' in program, uses_scan='scan(' in program, uses_map='map(' in program,
                         deferred_joins_in_trace=deferred_joins, deferred_notes=deferred_lines,
                         deferred_released=st.get('deferred_released'), deferred_pass_work=st.get('deferred_pass_work'),
                         first_solution_states=st.get('first_solution_states'), program=program))
    with (R2 / 'path_audit.csv').open('w', newline='', encoding='utf-8-sig') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0])); w.writeheader(); w.writerows(rows)
    summary = collections.defaultdict(lambda: collections.Counter())
    for r in rows:
        if r['train']:
            summary[r['variant']]['train_exact'] += 1
            summary[r['variant']]['with_coordAdd'] += r['coordadd_bases'] > 0
            summary[r['variant']]['nonlocal_base'] += r['uses_nonlocal_base']
            summary[r['variant']]['deferred_join_in_trace'] += r['deferred_joins_in_trace'] > 0
            summary[r['variant']]['heldout_with_nonlocal_base'] += bool(r['uses_nonlocal_base'] and r['heldout'])
    (R2 / 'path_audit_summary.json').write_text(json.dumps({k: dict(v) for k, v in summary.items()}, indent=2) + '\n', encoding='utf-8')
    for v, c in sorted(summary.items()): print(v, dict(c))
    print('non-local-base successes:', [(r['group'], r['task'], r['variant'], r['heldout']) for r in rows if r['uses_nonlocal_base'] and r['train']][:40])
if __name__ == '__main__': main()
