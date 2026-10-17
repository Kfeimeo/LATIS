"""Summarize the place-demand matrix without treating missing/timeout runs as
zeros. Writes metrics.csv, summary.json and the tables used by REPORT.md.
Heldout-correct candidate counts are post-selection audits only."""
import collections, csv, hashlib, json, pathlib, re, sys
ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / 'results/place-demand'
VARIANTS = ['B0', 'B1', 'B2']
STAT_KEYS = ['total_expanded_work', 'first_solution_states', 'witness_calls', 'bidirectional_left_decompositions', 'recursive_learning_tasks',
             'version_space_nodes', 'join_nodes', 'structural_representatives', 'max_representatives_per_class', 'cost_bound_reached',
             'materialized_complete_asts', 'exact_verifier_calls', 'portfolio_cover_work', 'extraction_work', 'deduction_milliseconds', 'extraction_milliseconds',
             'demands_registered', 'demands_distinct', 'demands_resumed', 'demands_still_blocked', 'demands_suspended', 'demand_rounds', 'demand_generated_terms',
             'demand_new_observations', 'demand_new_vec_observations', 'demand_new_coord_observations', 'demand_new_int_observations', 'demand_work',
             'demand_memo_invalidations', 'demand_memo_reuse', 'memo_hits', 'invented_abstractions', 'observer_terms', 'wall_clock_seconds']

def digest(p): return hashlib.sha256(p.read_bytes()).hexdigest()

def load_rows():
    rows = []
    protocol = json.loads((OUT / 'protocol.json').read_text(encoding='utf-8'))
    binary_hash = protocol['fingerprint']['binary_sha256']
    for p in sorted(OUT.rglob('execution.json')):
        result = p.parent / 'solution.json'
        if not result.exists(): continue
        execution = json.loads(p.read_text(encoding='utf-8')); x = json.loads(result.read_text(encoding='utf-8'))
        variant = p.parent.name; task = p.parent.parent.name; group = p.parent.parent.parent.name
        proto = execution['protocol']
        assert proto['fingerprint']['binary_sha256'] == binary_hash, p
        assert proto['variant'] == variant
        program = x.get('program') or ''
        assert 'Translate(' not in program and 'poseOf(' not in program, p
        timeout = bool(x.get('external_timeout', False))
        stats = x.get('statistics', {}) or {}
        held_correct = None
        pd = p.parent / 'portfolio_diagnostics.json'
        if pd.exists():
            try:
                cands = json.loads(pd.read_text(encoding='utf-8'))['candidates']
                held_correct = sum(1 for c in cands if c.get('heldout_exact') is True)
            except Exception: held_correct = None
        baseline = None
        if group in ['core', 'regression', 'stress', 'diagnostic']:
            b = ROOT / 'results/place-only' / group / task / 'Full' / 'solution.json'
            if b.exists():
                old = json.loads(b.read_text(encoding='utf-8')); baseline = (old.get('train_exact'), old.get('heldout_exact'), old.get('failure'))
        row = dict(group=group, task=task, variant=variant, train=bool(x.get('train_exact')), heldout=bool(x.get('heldout_exact')), failure=x.get('failure'),
                   timeout=timeout, elapsed_seconds=round(execution['elapsed_seconds'], 2), portfolio=x.get('portfolio_count'), held_correct=held_correct,
                   place_only_train=None if baseline is None else baseline[0], place_only_heldout=None if baseline is None else baseline[1], place_only_failure=None if baseline is None else baseline[2],
                   program=program, path=str(result.relative_to(ROOT)), input_sha256=proto['input_sha256'])
        for k in STAT_KEYS: row[k] = None if timeout else stats.get(k)
        rows.append(row)
    return rows, protocol

def table(rows, groups):
    lines = ['| 测试组 | 变体 | 完成 | 训练正确 | 留出正确 | 超时 | 凍結 place-only Full 留出正确（同批，异主机） |', '|---|---|---:|---:|---:|---:|---:|']
    for g in groups:
        for v in VARIANTS:
            rs = [r for r in rows if r['group'] == g and r['variant'] == v]
            if not rs: continue
            base = sum(1 for r in rs if r['place_only_heldout'] is True) if g in ['core', 'regression', 'stress', 'diagnostic'] else '—'
            lines.append(f"| {g} | {v} | {len(rs)} | {sum(r['train'] for r in rs)} | {sum(r['heldout'] for r in rs)} | {sum(r['timeout'] for r in rs)} | {base} |")
    return lines

def main():
    rows, protocol = load_rows()
    OUT.mkdir(parents=True, exist_ok=True)
    with (OUT / 'metrics.csv').open('w', newline='', encoding='utf-8-sig') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0])); w.writeheader(); w.writerows(rows)
    (OUT / 'comparison_all.json').write_text(json.dumps(rows, indent=1, ensure_ascii=False) + '\n', encoding='utf-8')
    groups = ['core', 'regression', 'stress', 'diagnostic', 'generated-dev', 'generated-audit']
    summary = {'completed': len(rows), 'per_group': {}}
    for g in groups:
        for v in VARIANTS:
            rs = [r for r in rows if r['group'] == g and r['variant'] == v]
            if rs: summary['per_group'][f'{g}/{v}'] = {'n': len(rs), 'train': sum(r['train'] for r in rs), 'heldout': sum(r['heldout'] for r in rs), 'timeouts': sum(r['timeout'] for r in rs)}
    by = collections.defaultdict(dict)
    for r in rows: by[(r['group'], r['task'])][r['variant']] = r
    changes = []
    for (g, t), vs in sorted(by.items()):
        if 'B0' in vs:
            for v in ['B1', 'B2']:
                if v in vs and (vs[v]['train'], vs[v]['heldout']) != (vs['B0']['train'], vs['B0']['heldout']):
                    changes.append({'group': g, 'task': t, 'variant': v, 'B0': [vs['B0']['train'], vs['B0']['heldout'], vs['B0']['failure']], v: [vs[v]['train'], vs[v]['heldout'], vs[v]['failure']]})
    summary['outcome_changes_vs_B0'] = changes
    b0_vs_frozen = [{'group': r['group'], 'task': r['task'], 'B0': [r['train'], r['heldout'], r['failure']], 'place_only': [r['place_only_train'], r['place_only_heldout'], r['place_only_failure']]}
                    for r in rows if r['variant'] == 'B0' and r['place_only_train'] is not None and (r['train'], r['heldout']) != (r['place_only_train'], r['place_only_heldout'])]
    summary['B0_vs_frozen_place_only_outcome_mismatches'] = b0_vs_frozen
    summary['timeouts'] = [(r['group'], r['task'], r['variant']) for r in rows if r['timeout']]
    (OUT / 'summary.json').write_text(json.dumps(summary, indent=2, ensure_ascii=False) + '\n', encoding='utf-8')
    (OUT / 'summary_tables.md').write_text('\n'.join(table(rows, groups)) + '\n', encoding='utf-8')
    print(json.dumps(summary['per_group'], indent=1)); print('changes vs B0:', len(changes)); print('B0 vs frozen mismatches:', b0_vs_frozen); print('timeouts:', summary['timeouts'])
if __name__ == '__main__': main()

# ---------------------------------------------------------------------------
# Per-task tables and traceable chains (appended; invoked by make_place_demand_report)
def fmt(v):
    if v is None: return 'n/a'
    if isinstance(v, bool): return '1' if v else '0'
    if isinstance(v, float): return f'{v:.1f}'
    return str(v)

def per_task_table(rows, group, keys):
    by = collections.defaultdict(dict)
    for r in rows:
        if r['group'] == group: by[r['task']][r['variant']] = r
    head = '| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | ' + ' | '.join(keys) + ' |'
    lines = [head, '|' + '---|' * (10 + len(keys))]
    for task in sorted(by):
        for v in VARIANTS:
            r = by[task].get(v)
            if r is None: continue
            lines.append(f"| {task} | {v} | {fmt(r['train'])} | {fmt(r['heldout'])} | {r['failure']}{' (timeout)' if r['timeout'] else ''} | {fmt(r['portfolio'])} | {fmt(r['held_correct'])} | {fmt(r['first_solution_states'])} | {fmt(r['total_expanded_work'])} | {fmt(r['wall_clock_seconds'])} | " + ' | '.join(fmt(r[k]) for k in keys) + ' |')
    return lines

def chain(path, patterns, limit=40):
    """Extract trace lines matching any pattern, in order, truncated to a width."""
    p = ROOT / path
    if not p.exists(): return ['(trace missing)']
    out = []
    for line in p.read_text(encoding='utf-8', errors='replace').splitlines():
        if any(re.search(pt, line) for pt in patterns):
            out.append(line[:260])
            if len(out) >= limit: break
    return out

def aggregate(rows, group, variant, key):
    vals = [r[key] for r in rows if r['group'] == group and r['variant'] == variant and r[key] is not None]
    return (sum(vals), len(vals)) if vals else (None, 0)
