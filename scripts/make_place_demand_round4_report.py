"""Round-4 report: B1Q (working baseline) vs B1QS (single soft branch-order
strategy). Independent gain only; no X combination. Numbers from result files."""
import collections, json, pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import report_place_demand_experiment as R
ROOT = R.ROOT; R4 = ROOT / 'results/place-demand-round4'
VARS = ['B1Q', 'B1QS']
def main():
    R.VARIANTS = VARS
    rows, proto = R.load_rows(R4)
    for r in rows:
        if r['group'] == 'generated-audit' and r['task'].startswith('audit2-'): r['group'] = 'generated-round2'
        if r['group'] == 'generated-audit' and r['task'].startswith('audit3-'): r['group'] = 'generated-round3'
    groups = ['core', 'regression', 'stress', 'generated-dev', 'generated-audit', 'generated-round2', 'generated-round3']
    by = collections.defaultdict(dict)
    for r in rows: by[(r['group'], r['task'])][r['variant']] = r
    def n(g, v): return sum(1 for r in rows if r['group'] == g and r['variant'] == v)
    def cnt(g, v, k): return sum(1 for r in rows if r['group'] == g and r['variant'] == v and r[k])
    L = []; A = L.append
    A('# place-demand 第四轮：在 Q 上增加单一可解释的分支排序策略（B1QS）')
    A('')
    A(f"binary `{proto['fingerprint']['binary_sha256'][:16]}…`；预算与前几轮相同；固定 3 worker。策略 S：在一次 Learn 调用内，对分解按（无 forward 观察且未在 memo 中解决的子任务数 升序，已在 memo 中解决的子任务数 降序，原成本估计 升序，原索引）排序；只用已缓存的廉价信号，每个被评分的分支计 1 单位工作（`branch_order_scored`）；不删除任何分支；队列比例、评分公式之外的部分与 B1Q 完全相同；未与 X 组合。")
    A('')
    A('| 组 | 变体 | 完成 | 训练正确 | 留出正确 | 超时 |'); A('|---|---|---:|---:|---:|---:|')
    for g in groups:
        for v in VARS:
            if n(g, v): A(f"| {g} | {v} | {n(g,v)} | {cnt(g,v,'train')} | {cnt(g,v,'heldout')} | {sum(1 for r in rows if r['group']==g and r['variant']==v and r['timeout'])} |")
    A('')
    A('## 结果不同的任务（分层）')
    A('')
    diffs = [(g, t, vs['B1Q'], vs['B1QS']) for (g, t), vs in sorted(by.items()) if 'B1Q' in vs and 'B1QS' in vs and (vs['B1Q']['train'], vs['B1Q']['heldout']) != (vs['B1QS']['train'], vs['B1QS']['heldout'])]
    if not diffs: A('无。')
    else:
        A('| 任务 | B1Q train/held (timeout) | B1QS train/held (timeout) | join Q/QS | work Q/QS | first-exact Q/QS | held-correct 候选 Q/QS | 判断 |'); A('|---|---|---|---|---|---|---|---|')
        for g, t, q, s in diffs:
            judge = '超时（内部证据缺失）' if q['timeout'] or s['timeout'] else ('推导层：train 结果不同' if q['train'] != s['train'] else ('覆盖层：held-correct 候选数不同' if (q['held_correct'] or 0) != (s['held_correct'] or 0) else '选择层：候选相同但选中不同'))
            A(f"| {g}/{t} | {int(q['train'])}/{int(q['heldout'])} ({int(q['timeout'])}) | {int(s['train'])}/{int(s['heldout'])} ({int(s['timeout'])}) | {q['join_nodes']}/{s['join_nodes']} | {q['total_expanded_work']}/{s['total_expanded_work']} | {R.fmt(q['first_solution_states'])}/{R.fmt(s['first_solution_states'])} | {R.fmt(q['held_correct'])}/{R.fmt(s['held_correct'])} | {judge} |")
    A('')
    A('## 工作量与首个 exact 的变化（结果相同的任务）')
    A('')
    same = [(g, t, vs['B1Q'], vs['B1QS']) for (g, t), vs in sorted(by.items()) if 'B1Q' in vs and 'B1QS' in vs and (vs['B1Q']['train'], vs['B1Q']['heldout']) == (vs['B1QS']['train'], vs['B1QS']['heldout']) and vs['B1Q']['train'] and not vs['B1Q']['timeout'] and not vs['B1QS']['timeout']]
    faster = sum(1 for _, _, q, s in same if (s['first_solution_states'] or 0) < (q['first_solution_states'] or 0)); slower = sum(1 for _, _, q, s in same if (s['first_solution_states'] or 0) > (q['first_solution_states'] or 0))
    A(f"在 {len(same)} 个两者都训练 exact 的任务上，B1QS 的 first-exact work 比 B1Q 小的有 {faster} 个，大的有 {slower} 个（评分本身的计费已含在 work 内）。work 是离散计数，不作 wall-clock 结论。")
    A('')
    tq = sum(cnt(g, 'B1Q', 'heldout') for g in groups); ts = sum(cnt(g, 'B1QS', 'heldout') for g in groups)
    trq = sum(cnt(g, 'B1Q', 'train') for g in groups); trs = sum(cnt(g, 'B1QS', 'train') for g in groups)
    A('## 判断')
    A('')
    A(f"合计 train B1Q {trq} / B1QS {trs}，heldout B1Q {tq} / B1QS {ts}。" + ('S 没有独立收益，不进入与 X 的组合。' if ts <= tq and trs <= trq else ('S 有独立收益；下一步才测与 X 的组合。' if ts > tq else '结果混合：train 与 heldout 方向不一致，需要先看分层表再决定。')))
    (R4 / 'REPORT_ROUND4.md').write_text('\n'.join(L) + '\n', encoding='utf-8')
    print('wrote round-4 report', len(L), 'lines')
if __name__ == '__main__': main()
