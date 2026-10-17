"""Round-2 report: pruning-neutrality correction, assemblability diagnostic,
B1U pruning ablation, and the B0/B1/B1L/B1Q/B1X/B1QX matrix (core, regression,
stress, generated round-1 sets, frozen round-2 audit)."""
import collections, json, pathlib, re, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import report_place_demand_experiment as R
ROOT = R.ROOT
R2 = ROOT / 'results/place-demand-round2'; UNP = ROOT / 'results/place-demand-ablations-unpruned'
VARS = ['B0', 'B1', 'B1L', 'B1Q', 'B1X', 'B1QX']
GROUPS = ['core', 'regression', 'stress', 'generated-dev', 'generated-audit', 'generated-round2']

def main():
    R.VARIANTS = VARS + ['B1U']
    rows, proto = R.load_rows(R2) if (R2 / 'protocol.json').exists() else ([], None)
    unp, _ = R.load_rows(UNP) if (UNP / 'protocol.json').exists() else ([], None)
    main_rows, _ = R.load_rows(ROOT / 'results/place-demand')
    for r in rows:
        if r['group'] == 'generated-audit' and r['task'].startswith('audit2-'): r['group'] = 'generated-round2'
    by = collections.defaultdict(dict)
    for r in rows: by[(r['group'], r['task'])][r['variant']] = r
    def n(g, v): return sum(1 for r in rows if r['group'] == g and r['variant'] == v)
    def cnt(g, v, k): return sum(1 for r in rows if r['group'] == g and r['variant'] == v and r[k])
    def tos(g, v): return sum(1 for r in rows if r['group'] == g and r['variant'] == v and r['timeout'])
    def subset(g, v, pred, k): return sum(1 for r in rows if r['group'] == g and r['variant'] == v and pred(r['task']) and r[k])
    L = []; A = L.append
    A('# place-demand 第二轮：公平调度与惰性提取能否在保留双向 witness 分解的前提下获得局部限制的效率？')
    A('')
    A('## 对第一轮报告的更正')
    A('')
    A('1. **credit-aware 剪枝的“结果中性”说法过强。** 能论证的只有无预算截断下的 DAG 等价：被剪的 residual 子任务 credit=0，`learnBase` 在 remaining==0 时不调用 witness、无 invention、pool key 与父任务相同，只能由 forward 观察或 shared 常数闭合，而这正是剪枝条件。但在有限总预算下剪枝改变了 MRV lookahead 的域计数（兄弟子任务求解顺序）和工作消耗序列，截断点随之变化，不能推出结果不变。本轮用开关 `bidirectional-unpruned`（B1U）在协议预算下实测（下表），原报告中“结果中性”改为“无界等价有论证，有界中性未证明，实测见 B1U”。')
    A('2. **“整体平移 residual”不能硬排除。** t_i − a_i = c 是合法的常数位移规则，典型情形是 scan seed（Γ=[v0]）里“首对象平移 c”；B1L 的硬限制删除了这条路径。B1L 只作为扇出诊断的参考，不再作为改进候选；本轮改为可恢复的延后调度（B1Q），并冻结了必须使用非局部基点的 audit 规则（seedshift_x/y）来测量局部偏好的代价。')
    A('')
    A('## A 的失败层级（事后诊断，不注入求解）')
    A('')
    diag = (ROOT / 'results/place-demand/out-of-protocol-diagnostics/assemblability/A-B1.log').read_text(encoding='utf-8', errors='replace') if (ROOT / 'results/place-demand/out-of-protocol-diagnostics/assemblability/A-B1.log').exists() else ''
    A('`AssembleDiag.hs`：对 stress A 用 B1 推导得到同一 DAG（2902 节点、670 join），然后以 10^8 次尝试上限运行**原 cover 算法**（同一 Join assemble 函数、同一分解内关联约束、同一原 Grid verifier）。结果：')
    A('')
    A('```text'); L += [l for l in diag.splitlines() if l.strip()][:12]; A('```')
    A('')
    A('无预算 cover 组装出 7024 个训练 exact 程序（最低 cost 29，事后留出 exact），需要 149768 次 assemble 尝试；协议的 12500 次得到 0 个。因此 A 在 B1 下的第一个阻断层是**候选提取**（固定 cover 预算 × join 级多样性），不是关联约束、binder/env 或 DAG 构造问题。')
    A('')
    if unp:
        A('## B1U：取消 credit-aware 剪枝（协议预算）')
        A('')
        A('| 组 | B1（第一轮） | B1U | 结果不同的任务 |'); A('|---|---|---|---|')
        for g in ['stress', 'regression']:
            b1 = {r['task']: r for r in main_rows if r['group'] == g and r['variant'] == 'B1'}
            bu = {r['task']: r for r in unp if r['group'] == g}
            diff = [t for t in sorted(bu) if t in b1 and (b1[t]['train'], b1[t]['heldout']) != (bu[t]['train'], bu[t]['heldout'])]
            A(f"| {g} | train {sum(r['train'] for r in b1.values())}/{len(b1)}，留出 {sum(r['heldout'] for r in b1.values())}/{len(b1)} | train {sum(r['train'] for r in bu.values())}/{len(bu)}，留出 {sum(r['heldout'] for r in bu.values())}/{len(bu)}，超时 {sum(r['timeout'] for r in bu.values())} | {', '.join(f'{t}: B1 {int(b1[t][chr(116)+chr(114)+chr(97)+chr(105)+chr(110)])}/{int(b1[t][chr(104)+chr(101)+chr(108)+chr(100)+chr(111)+chr(117)+chr(116)])} → B1U {int(bu[t][chr(116)+chr(114)+chr(97)+chr(105)+chr(110)])}/{int(bu[t][chr(104)+chr(101)+chr(108)+chr(100)+chr(111)+chr(117)+chr(116)])}' for t in diff) or '无'} |")
        A('')
        A('B1U 与 B1 使用同一分解集合（剪枝只去掉 credit=0 且既非观察项也非常数的 residual 子任务），差异完全来自有限预算下的工作消耗与调度顺序。')
        A('')
    if rows:
        A('## 第二轮矩阵')
        A('')
        A(f"binary `{proto['fingerprint']['binary_sha256'][:16]}…`，预算与第一轮相同（250000 / cost 96 / saturation 25000 / 300 s），B1Q/B1QX 的延后份额 62500（含在总预算内），固定 3 worker。generated-round2 是冻结于任何第二轮求解之前的新 audit（manifest hash `{json.loads((ROOT/'data/place-demand-generated-round2/manifest.json').read_text())['manifest_hash'][:16]}…`）：audit2-same（同规则新实例）、audit2-nonlocal（seedshift_x/y，seed 需要非局部基点+常数位移）、audit2-newstruct（mirror_relative）。")
        A('')
        oom = [r for r in rows if r['failure'] == 'ImplementationBug']
        solo = [r for r in rows if r.get('note')]
        A(f"执行失败：矩阵中被主机 cgroup OOM 杀死的行（3 并发时单个 scan-* 任务 RSS 约 5.8 GB）已用 `--workers 1` 单独重跑并替换（重跑 protocol 另存为 `protocol-rerun-*.json`）；当前仍标 ImplementationBug 的行：{[(r['group'], r['task'], r['variant']) for r in oom] or '无'}。")
        A('')
        A('| 组 | 变体 | 完成 | 训练正确 | 留出正确 | 超时 |'); A('|---|---|---:|---:|---:|---:|')
        for g in GROUPS:
            for v in VARS:
                if n(g, v): A(f"| {g} | {v} | {n(g,v)} | {cnt(g,v,'train')} | {cnt(g,v,'heldout')} | {tos(g,v)} |")
        A('')
        A('### generated-round2 按家族')
        A('')
        A('| 家族 | 变体 | 训练正确 | 留出正确 |'); A('|---|---|---:|---:|')
        for fam, pred in [('audit2-same', lambda t: t.startswith('audit2-same')), ('audit2-nonlocal', lambda t: 'nonlocal' in t), ('audit2-newstruct', lambda t: 'newstruct' in t)]:
            tot = sum(1 for r in rows if r['group'] == 'generated-round2' and r['variant'] == 'B1' and pred(r['task']))
            for v in VARS:
                if n('generated-round2', v): A(f"| {fam} | {v} | {subset('generated-round2', v, pred, 'train')}/{tot} | {subset('generated-round2', v, pred, 'heldout')}/{tot} |")
        A('')
        A('### 逐题')
        A('')
        for g in GROUPS:
            if not any(r['group'] == g for r in rows): continue
            A(f"#### {g}"); A('')
            L += R.per_task_table(rows, g, ['join_nodes', 'cost_bound_reached', 'materialized_complete_asts', 'deferred_branches', 'deferred_released', 'deferred_pass_work', 'cover_lazy_candidates'])
            A('')
        A('### 验收重点')
        A('')
        def heldset(g, v): return {r['task'] for r in rows if r['group'] == g and r['variant'] == v and r['heldout']}
        reg = {v: heldset('regression', v) for v in VARS}
        A(f"- 恢复已有 regression：B0 留出 {len(reg['B0'])}/17；B1 {len(reg['B1'])}；B1L {len(reg['B1L'])}；B1Q {len(reg['B1Q'])}；B1X {len(reg['B1X'])}；B1QX {len(reg['B1QX'])}。相对 B0 丢失：" + '; '.join(f"{v}: {sorted(reg['B0']-reg[v]) or '无'}" for v in VARS[1:]) + '。')
        rA = {v: by.get(('stress', 'A-absolute-relative'), {}).get(v) for v in VARS}
        A('- A 产生可验证完整候选：' + '; '.join(f"{v}: train {int(bool(rA[v] and rA[v]['train']))} / held {int(bool(rA[v] and rA[v]['heldout']))}, portfolio {R.fmt(rA[v]['portfolio']) if rA[v] else 'n/a'}" for v in VARS) + '。')
        st = {v: heldset('stress', v) for v in VARS}
        A('- 保留 B/I 收益：' + '; '.join(f"{v}: {sorted(x[:1] for x in st[v])}" for v in VARS) + '。')
        nl = {v: {r['task'] for r in rows if r['group'] == 'generated-round2' and 'nonlocal' in r['task'] and r['variant'] == v and r['train']} for v in VARS}
        nlh = {v: {r['task'] for r in rows if r['group'] == 'generated-round2' and 'nonlocal' in r['task'] and r['variant'] == v and r['heldout']} for v in VARS}
        A('- 必须使用非局部基点的任务（audit2-nonlocal，3 题）：' + '; '.join(f"{v}: train {len(nl[v])} / held {len(nlh[v])}" for v in VARS) + '。局部硬限制 B1L 若在此为 0 而 B1Q/B1QX 不为 0，说明延后而非删除保住了非局部规则的求解能力；若所有变体都为 0，则该能力在协议预算内对任何变体都未达成，不能据此偏好任一方案。')
        A('')
    if rows:
        A('## 研究问题的回答')
        A('')
        def held(g, v): return {r['task'] for r in rows if r['group'] == g and r['variant'] == v and r['heldout']}
        def train(g, v): return {r['task'] for r in rows if r['group'] == g and r['variant'] == v and r['train']}
        gs = ['regression', 'stress', 'generated-dev', 'generated-audit', 'generated-round2']
        def tot(v, f): return sum(len(f(g, v)) for g in gs)
        ntot = sum(n(g, 'B1') for g in gs)
        A('问题：在保留双向 witness 分解的条件下，能否通过公平调度（Q）与惰性提取（X）获得局部限制（B1L）的效率，同时保留非局部规则的求解能力？')
        A('')
        A('| 变体 | 五组合计 train | 五组合计 heldout | 相对 B1L 留出差集（B1L 有而它没有） | 它有而 B1L 没有 |'); A('|---|---:|---:|---|---|')
        HL = {g: held(g, 'B1L') for g in gs}
        for v in VARS:
            lost = [f"{g}/{t}" for g in gs for t in sorted(HL[g] - held(g, v))]
            gained = [f"{g}/{t}" for g in gs for t in sorted(held(g, v) - HL[g])]
            A(f"| {v} | {tot(v, train)}/{ntot} | {tot(v, held)}/{ntot} | {', '.join(lost) or '无'} | {', '.join(gained) or '无'} |")
        A('')
        qx = tot('B1QX', held); q = tot('B1Q', held); x = tot('B1X', held); l = tot('B1L', held); b1 = tot('B1', held); b0 = tot('B0', held)
        A(f"- **Q（延后调度）**：五组合计留出 {q}（B1 {b1}，B1L {l}，B0 {b0}）。延后而非删除非局部 residual，在 regression 上" + ('保住了 B0 的全部 16 项' if held('regression', 'B1Q') >= held('regression', 'B0') else f"丢失 {sorted(held('regression','B0')-held('regression','B1Q'))}") + f"，在 stress 上得到 {sorted(t[:1] for t in held('stress','B1Q'))}。与 B1L 的差集见表：差异来自延后份额（62500）本身的工作消耗与它加入 DAG 的非局部备选对提取/选择的影响。")
        A(f"- **X（惰性提取）单独**：合计留出 {x}。它修复的是提取层（A/C/G 等“DAG 中有可组装正确程序但 cover 预算不足”的情形），但不减少推导工作，所以在推导阶段就耗尽预算的任务（regression map-translate/map-scan-ambiguity、多数 generated）上仍失败。")
        A(f"- **Q+X**：合计留出 {qx}。" + ('两者互补（优于各自单独）。' if qx > max(q, x) else ('不优于单独的 Q：惰性 cover 的候选集与 refine cover 不同，改变了部分任务的 portfolio 与选择（见逐题表中 B1Q 对 B1QX 的差异），说明两个机制在本预算下不是简单叠加。' if qx <= q else '与单独 X 相当。')))
        nlb = {v: (len(train('generated-round2', v) & {t for t in train('generated-round2','B0') if 'nonlocal' in t} if False else {t for t in train('generated-round2', v) if 'nonlocal' in t}), {t for t in held('generated-round2', v) if 'nonlocal' in t}) for v in VARS}
        A('- **非局部基点代价（audit2-nonlocal，3 题）**：' + '; '.join(f"{v} train {len(nlb[v][0])}/3, held {len(nlb[v][1])}/3" for v in VARS) + '。该家族没有按设计区分局部硬限制与延后调度：连 B0 也能在训练上求解其中的 seed（经 `coord`/算术分量路径而非 coordAdd），所以它测到的不是“非局部 residual 的必要性”，而是另一条已有路径；要测量局部偏好的真实代价，需要构造 `coord`/算术路径也不可达的非局部规则。这是本轮 audit 设计的一个失误，如实记录。')
        A('- **B1L 仍是有用的参考而非方案**：它在 audit2-same-negated-0 等任务上优于 B1Q（延后份额的成本），但它删除了合法规则；Q 用可恢复的方式得到接近的覆盖。')
        A('')
        A('## 下一步')
        A('')
        A('1. 非局部代价的 audit 需要重做：规则必须使 `coord(add(x,·),add(y,·))` 等分量路径不可用（例如位移随场景变化、且不等于任何可观察标量之差），再冻结后评估 B1L/B1Q/B1QX。')
        A('2. Q 的份额与 X 的候选集相互作用（B1QX 在若干任务上不如 B1Q）需要单独消融：固定 Q，比较 refine/lazy cover 的 portfolio 与选择差异，并把 lazy cover 的 phase-2 扩展与 saturation 的分工写清楚。')
        A('3. 推导预算耗尽（而非提取）仍是 generated 集上的主要失败：延后份额之外，第一遍局部队列本身在多对象实例上也很重，需要按子规格约束强度（行数/依赖）对分支排序的下一版调度。')
    (ROOT / 'results/place-demand-round2/REPORT_ROUND2.md' if rows else ROOT / 'results/place-demand/REPORT_ROUND2_draft.md').write_text('\n'.join(L) + '\n', encoding='utf-8')
    print('wrote round-2 report with', len(L), 'lines')
if __name__ == '__main__': main()
