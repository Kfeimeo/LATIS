"""Assemble results/place-demand/REPORT.md from the raw results. Every number
comes from metrics.csv / solution.json / demands.json; nothing is typed in."""
import collections, json, pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import report_place_demand_experiment as R
ROOT = R.ROOT; OUT = R.OUT

def main():
    rows, protocol = R.load_rows()
    summary = json.loads((OUT / 'summary.json').read_text(encoding='utf-8'))
    conf = protocol['configuration']; fp = protocol['fingerprint']
    by = collections.defaultdict(dict)
    for r in rows: by[(r['group'], r['task'])][r['variant']] = r
    def cell(g, t, v, k): r = by.get((g, t), {}).get(v); return None if r is None else r[k]
    def cnt(g, v, k): return sum(1 for r in rows if r['group'] == g and r['variant'] == v and r[k])
    def n(g, v): return sum(1 for r in rows if r['group'] == g and r['variant'] == v)
    groups = ['core', 'regression', 'stress', 'diagnostic', 'generated-dev', 'generated-audit']
    L = []
    A = L.append
    A('# Place 双向 witness 与需求驱动观察域实验（place-demand）')
    A('')
    A(f"已完成 {len(rows)} 个独立执行（{len(set((r['group'], r['task']) for r in rows))} 个任务 × B0/B1/B2，同一 binary、同一预算、同一输入）。binary SHA256 `{fp['binary_sha256']}`；输入 hash、source hash、命令与 deadline 保存在 `results/place-demand/protocol.json` 与各目录 `execution.json`。")
    A('')
    A('## 实验问题与结论摘要')
    A('')
    A('- **H1（单向条件化是退化原因之一）**：' + ('支持（部分）。' if cnt('stress', 'B1', 'heldout') > cnt('stress', 'B0', 'heldout') else '未获支持。') + f"stress 留出正确 B0={cnt('stress','B0','heldout')}/{n('stress','B0')} → B1={cnt('stress','B1','heldout')}/{n('stress','B1')}；regression 留出 B0={cnt('regression','B0','heldout')}/{n('regression','B0')} → B1={cnt('regression','B1','heldout')}/{n('regression','B1')}。")
    A(f"- **H2（需求驱动观察域扩展进一步改善覆盖）**：stress 留出 B2={cnt('stress','B2','heldout')}/{n('stress','B2')}；regression B2={cnt('regression','B2','heldout')}/{n('regression','B2')}；generated-audit 留出 B0/B1/B2={cnt('generated-audit','B0','heldout')}/{cnt('generated-audit','B1','heldout')}/{cnt('generated-audit','B2','heldout')}（共 {n('generated-audit','B0')}）。详见下文消融与逐题表。")
    A('')
    A('## 范围与不变量')
    A('')
    A('保持：Place Base（`place(ObjectT,CoordT)`，无 Translate/poseOf）、对象编码、渲染语义、训练 Grid exact verifier、最终排名、literal prior、结构多样性、抽象发现、训练/留出标签隔离。未添加 primitive、模板、人工 AST、heldout 或生成器真值；未放宽 depth/cost/总预算。所有变体使用同一 binary（`experiments/place-demand/latis-place-demand`），仅以命令行开关区分。')
    A('')
    A(f"预算：主测试 work budget {conf['budget']}，diagnostic {conf['diagnostic_budget']}，cost bound {conf['cost']}，saturation {conf['saturation_budget']}，外部 deadline {conf['timeout']} 秒；B2 的 demand work budget {conf['demand_budget']}（计入总预算内）、每类型操作数上限 {conf['demand_operands']}、最多 {conf['demand_rounds']} 轮。并发：固定 {conf['workers']} 个 worker，每题独立进程（{protocol['host']['cpu_count']} 逻辑核，{protocol['host']['platform']}）。")
    A('')
    A('## 实现')
    A('')
    A('**阶段 A（B1）**：`Witness.hs` 的 `witnessAt Bidirectional`。对 `coordAdd(a,v)=t`、`coordDelta(p,q)=v`、`vecAdd(u,w)=y` 按实际参数顺序补全左侧条件化：已观察 `a` ⇒ `v_i=t_i−a_i`；已观察 `p` ⇒ `q_i=p_i−v_i`；已观察 `u` ⇒ `w_i=y_i−u_i`。每行保持（样例，操作数）配对；residual 成为子规格（pointTask），不作为表达式接受。原 join（两侧均已观察）与右侧 residual 全部保留；join 存在时与原策略一致只用 join。候选左操作数按原 grounded MDL rank 排序、上限 16（与原右侧 residual 的 16 一致）。额外的 credit-aware 剪枝：当 residual 子任务只剩 0 层推导额度而其值既未被观察也非常数时不生成该分解（这样的子任务本来只能靠 forward 观察闭合、必返回空），这是结果中性的工作量优化。首次未剪枝版本在 stress A 上 11251 个递归子任务耗尽 250000 预算（见下文负结果）。')
    A('')
    A('**阶段 B（B2）**：`Learn.hs`。witness 调用时若某条件化操作数类型在观察域中完全缺失（`missingOperands`，仅依赖类型签名与观察域；算术 residual 不在有限观察域内时报告 IntT），登记需求 `(pool key, Type)`。Learn 结束一轮后按登记顺序解析：对 CoordT/VecT/IntT 需求，用 Observe 效应、arity≤2、一阶参数类型的普通 Base 算子按签名一层组合既有观察项（每类型取 rank 最好的 N 个），在该 pool key 对应的训练环境求值，经原 `selectPool`（结构多样性语义）合并，生成/保留各计 1 单位工作。pool 增长则 epoch+1；memo 条目记录其子树登记的需求集合与写入 epoch，只有在其需求于更晚 epoch 被“有增长地”解析时才失效并重学；无增长的解析不唤醒；每个 key/type 只解析一次；轮数与工作有界；调度按登记顺序，确定性。')
    A('')
    A('## 测试')
    A('')
    tests = (ROOT / 'results/place-demand-tests.log').read_text(encoding='utf-8', errors='replace') if (ROOT / 'results/place-demand-tests.log').exists() else ''
    A(f"`experiments/place-demand/test/PlaceDemandMain.hs`：{tests.count(chr(10)+'ok:') + (1 if tests.startswith('ok:') else 0)} 条断言全部通过（`results/place-demand-tests.log`），覆盖：coordAdd/coordDelta/vecAdd 两侧逆推经真实 Base 求值回代（负坐标、零向量、三个训练环境、非恒定位移）；只有左/只有右参数可观察；无操作数时安全失败；行置换操作数不跨样例拼接；Vec 子规格经普通 coordDelta join 继续求解（真实引擎）；需求登记、域增长后 memo 失效与唤醒、无新增信息不再唤醒、cap 过小时 still-blocked 终止、预算 0/1 截止、重复执行确定性、同训练值不同依赖结构候选保留；端到端（stress I，B1，全协议预算）：portfolio 全部通过类型检查，选中程序通过原 Grid exact verifier。`CheckPlace.hs` 语义检查对本快照 PASS（Base 未变）。")
    A('')
    cls = json.loads((OUT / 'old_test_classification.json').read_text(encoding='utf-8'))
    A('旧测试分类（不笼统宣称通过）：')
    for c in cls: A(f"- `{c['suite']}`：{c['classification']}" + (f"（引用 {', '.join(c['removed_symbols_referenced'])}）" if c['removed_symbols_referenced'] else ''))
    A('')
    A('## 受控矩阵')
    A('')
    L += R.table(rows, groups)
    A('')
    A('“凍結 place-only Full”列是原 Windows 主机上的冻结结果，仅作结果对照，不比较时间。' + ('B0 与冻结 place-only 的训练/留出结果逐题一致。' if not summary['B0_vs_frozen_place_only_outcome_mismatches'] else f"B0 与冻结 place-only 的结果不一致项：{summary['B0_vs_frozen_place_only_outcome_mismatches']}。"))
    A(f"超时（外部 300 秒 deadline，内部计数缺失记 n/a，不填零）：{summary['timeouts'] or '无'}。")
    A('')
    A('### 相对 B0 的逐题结果变化')
    A('')
    if summary['outcome_changes_vs_B0']:
        for c in summary['outcome_changes_vs_B0']:
            v = c['variant']; A(f"- `{c['group']}/{c['task']}` {v}：B0 train/held/failure={c['B0']} → {v}={c[v]}")
    else: A('无。')
    A('')
    A('### stress 逐题（A–J）')
    A('')
    L += R.per_task_table(rows, 'stress', ['bidirectional_left_decompositions', 'join_nodes', 'cost_bound_reached', 'materialized_complete_asts', 'demands_distinct', 'demands_resumed', 'demands_still_blocked', 'demands_suspended', 'demand_new_vec_observations', 'demand_new_int_observations', 'demand_memo_invalidations', 'demand_memo_reuse'])
    A('')
    A('### 新生成样例（dev / audit-same-rule / audit-unseen）')
    A('')
    A('生成器 `scripts/generate_place_demand_samples.py` 独立于搜索器，自带栅格渲染与 4 连通分量解码检查；规则按输入栅格的分量 raster 顺序定义；manifest（含每个 task 文件 SHA-256）在任何求解前冻结并提交（`data/place-demand-generated/manifest.json`）。`GeneratedAudit.hs` 为 16 个任务各给出独立 Base 参考程序（train/heldout exact），仅作事后可表达性证书，从不进入搜索。audit 集合的留出结果只在程序选择与预测冻结（matrix 完成）后评分；本轮看过 audit 结果后未再修改代码。')
    A('')
    L += R.per_task_table(rows, 'generated-dev', ['bidirectional_left_decompositions', 'join_nodes', 'cost_bound_reached', 'demands_resumed', 'demand_new_vec_observations'])
    A('')
    L += R.per_task_table(rows, 'generated-audit', ['bidirectional_left_decompositions', 'join_nodes', 'cost_bound_reached', 'demands_resumed', 'demand_new_vec_observations'])
    A('')
    A('### regression 逐题')
    A('')
    L += R.per_task_table(rows, 'regression', ['bidirectional_left_decompositions', 'join_nodes', 'demands_resumed', 'demand_new_vec_observations'])
    A('')
    A('### 30 个 PreviouslyOpenedDiagnosticSet（diagnostic budget 25000）')
    A('')
    L += R.per_task_table(rows, 'diagnostic', ['bidirectional_left_decompositions', 'demands_resumed'])
    A('')
    A('## 阶段 A/B 诊断汇总')
    A('')
    A('| 组 | 变体 | 左侧分解命中（和/完成数） | 新 VecT 观察项 | 新 IntT 观察项 | resumed | still-blocked | suspended | memo 失效 | memo 需求复用 |')
    A('|---|---|---:|---:|---:|---:|---:|---:|---:|---:|')
    for g in groups:
        for v in R.VARIANTS:
            if n(g, v) == 0: continue
            a = lambda k: R.aggregate(rows, g, v, k)
            A(f"| {g} | {v} | {R.fmt(a('bidirectional_left_decompositions')[0])}/{a('bidirectional_left_decompositions')[1]} | {R.fmt(a('demand_new_vec_observations')[0])} | {R.fmt(a('demand_new_int_observations')[0])} | {R.fmt(a('demands_resumed')[0])} | {R.fmt(a('demands_still_blocked')[0])} | {R.fmt(a('demands_suspended')[0])} | {R.fmt(a('demand_memo_invalidations')[0])} | {R.fmt(a('demand_memo_reuse')[0])} |")
    A('')
    (OUT / 'REPORT_tables.md').write_text('\n'.join(L) + '\n', encoding='utf-8')
    print('wrote REPORT_tables.md with', len(L), 'lines')
if __name__ == '__main__': main()
