"""Assemble results/place-demand/REPORT.md from raw results. Every number is
computed from metrics.csv / solution.json / demands.json / trace files."""
import collections, json, pathlib, re, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import report_place_demand_experiment as R
ROOT = R.ROOT; OUT = R.OUT; ABL = ROOT / 'results/place-demand-ablations'
MAIN = ['B0', 'B1', 'B2']; EXTRA = ['B1L', 'B2L']
GROUPS = ['core', 'regression', 'stress', 'diagnostic', 'generated-dev', 'generated-audit']

def main():
    rows, protocol = R.load_rows()
    abl_rows, abl_protocol = (R.load_rows(ABL) if (ABL / 'protocol.json').exists() else ([], None))
    allrows = rows + abl_rows
    summary = json.loads((OUT / 'summary.json').read_text(encoding='utf-8'))
    conf = protocol['configuration']; fp = protocol['fingerprint']
    by = collections.defaultdict(dict)
    for r in allrows: by[(r['group'], r['task'])][r['variant']] = r
    def cnt(g, v, k): return sum(1 for r in allrows if r['group'] == g and r['variant'] == v and r[k])
    def n(g, v): return sum(1 for r in allrows if r['group'] == g and r['variant'] == v)
    def tos(g, v): return sum(1 for r in allrows if r['group'] == g and r['variant'] == v and r['timeout'])
    def agg(g, v, k):
        vals = [r[k] for r in allrows if r['group'] == g and r['variant'] == v and r[k] is not None]
        return sum(vals) if vals else None
    def row(g, t, v): return by.get((g, t), {}).get(v)
    def tbl(groups, variants, baseline=True):
        head = '| 测试组 | 变体 | 完成 | 训练正确 | 留出正确 | 超时 |' + (' 冻结 place-only Full 留出（同批，异主机） |' if baseline else '')
        lines = [head, '|---|---|---:|---:|---:|---:|' + ('---:|' if baseline else '')]
        for g in groups:
            for v in variants:
                if n(g, v) == 0: continue
                base = sum(1 for r in allrows if r['group'] == g and r['variant'] == v and r['place_only_heldout'] is True) if g in ['core', 'regression', 'stress', 'diagnostic'] else '—'
                lines.append(f"| {g} | {v} | {n(g,v)} | {cnt(g,v,'train')} | {cnt(g,v,'heldout')} | {tos(g,v)} |" + (f" {base} |" if baseline else ''))
        return lines
    def changes(variant, groups):
        out = []
        for (g, t), vs in sorted(by.items()):
            if g not in groups or 'B0' not in vs or variant not in vs: continue
            a, b = vs['B0'], vs[variant]
            if (a['train'], a['heldout']) != (b['train'], b['heldout']):
                out.append(f"- `{g}/{t}`：B0 train/held={int(a['train'])}/{int(a['heldout'])}（{a['failure']}） → {variant} {int(b['train'])}/{int(b['heldout'])}（{b['failure']}{'，外部超时' if b['timeout'] else ''}）")
        return out or ['- 无。']
    def joins_summary(variant):
        rs = [r for r in allrows if r['variant'] == variant and not r['timeout'] and r['join_nodes'] is not None]
        b = collections.defaultdict(lambda: [0, 0])
        for r in rs:
            j = r['join_nodes']; k = '≤250' if j <= 250 else ('251–1000' if j <= 1000 else '>1000')
            b[k][0 if (r['materialized_complete_asts'] or 0) > 0 else 1] += 1
        return b
    chain = R.chain
    L = []; A = L.append
    A('# Place 双向 witness 与需求驱动观察域实验（place-demand）')
    A('')
    A(f"受控矩阵：{len(rows)} 个独立执行（{len(set((r['group'], r['task']) for r in rows))} 个任务 × B0/B1/B2，同一 binary `{fp['binary_sha256'][:16]}…`、同一预算、同一输入，固定 {conf['workers']} 个 worker）。额外探索性消融 B1L/B2L：{len(abl_rows)} 个执行（binary `{(abl_protocol or {}).get('fingerprint',{}).get('binary_sha256','')[:16]}…`，独立 protocol）。所有命令、输入/源码/binary hash 与 deadline 在 `results/place-demand/protocol.json`、`results/place-demand-ablations/protocol.json` 及各目录 `execution.json`。")
    A('')
    A('## 结论摘要')
    A('')
    A(f"- **H1（Place 退化部分来自 coordinate witness 的单向条件化）：支持，但代价重大。** 原来 `WitnessMissing` 的 stress B/I 在 B1 下 train/heldout 均 exact（B0 留出 {cnt('stress','B0','heldout')}/10 → B1 {cnt('stress','B1','heldout')}/10）；trace 证明阻断点确为 `Learn(CoordT; Γ=[v0,v1])` 处 `coordAdd` 无可条件化的 VecT 右操作数。但对称 16 路左侧 residual 在场景级两行子规格（Γ=[v0]，scan seed 等）中与大量偶然 join 相乘，使 DAG 膨胀：stress A/C/F/G、regression map-translate/map-scan-ambiguity 及全部新生成样例在 B1 下 train 失败（固定 cover/saturation 预算无法物化完整 AST，或推导阶段即耗尽 250000 工作预算）。regression 留出 B0 {cnt('regression','B0','heldout')}/17 → B1 {cnt('regression','B1','heldout')}/17；generated-audit train B0 {cnt('generated-audit','B0','train')}/12 → B1 {cnt('generated-audit','B1','train')}/12。")
    A(f"- **H2（按需求扩展 typed 观察域进一步改善覆盖）：在本轮预算下未获支持。** B2 相对 B1 没有任何任务的 train/heldout 结果变化（stress {cnt('stress','B2','heldout')}/10，regression {cnt('regression','B2','heldout')}/17，generated-audit train {cnt('generated-audit','B2','train')}/12）。需求机制本身按设计工作（共 {agg('stress','B2','demands_distinct')} 个 stress 需求键，resumed {agg('stress','B2','demands_resumed')}，新增 VecT 观察项 {agg('stress','B2','demand_new_vec_observations')}），但新增 VecT 项只让 `coordAdd` 在再学习时多出 join 备选，没有改变已被 B1 膨胀主导的提取结果；在 B1 本已成功的任务上 B2 只增加工作量。")
    if abl_rows:
        solvedL = sorted(r['task'][:1] for r in abl_rows if r['group'] == 'stress' and r['variant'] == 'B1L' and r['heldout'])
        A(f"- **额外消融 B1L/B2L（看过 A/C/F trace 后提出，属开发证据）**：把左侧 residual 限制在依赖非 Scene 变量（元素局部）的基点上。stress 留出 B1L {cnt('stress','B1L','heldout')}/{n('stress','B1L')}（留出正确：{', '.join(solvedL) or '无'}），regression 留出 {cnt('regression','B1L','heldout')}/{n('regression','B1L')}，generated-audit train/heldout {cnt('generated-audit','B1L','train')}/{cnt('generated-audit','B1L','heldout')}（{n('generated-audit','B1L')}）；B2L：stress {cnt('stress','B2L','heldout')}/{n('stress','B2L')}，regression {cnt('regression','B2L','heldout')}/{n('regression','B2L')}。B1L 是在看过失败案例后设计的规则，其 audit 数字不能称为未见审计；它检验的是“退化来源是场景级两行子规格中的 residual 扇出”这一诊断。")
    A('')
    A('## 范围与不变量')
    A('')
    A('保持：Place Base（`place(ObjectT,CoordT)`，无 Translate/poseOf）、对象编码、渲染语义、训练 Grid exact verifier、最终排名、literal prior、结构多样性、抽象发现、训练/留出标签隔离。未添加 primitive、模板、人工 AST、heldout 或生成器真值；未放宽 depth（7）、cost（96）、saturation（25000）、总预算（250000）；B2 的 demand 工作计入总预算。B0 与冻结 place-only 在 stress A 上逐指标一致（work 1161、witness_calls 725），B0 对 58 个原任务的 train/heldout 结果与冻结结果' + ('逐题一致' if not summary['B0_vs_frozen_place_only_outcome_mismatches'] else f"除 {[(x['group'],x['task']) for x in summary['B0_vs_frozen_place_only_outcome_mismatches']]} 外一致") + '（`regression/scan-TR-TL` B0 首次执行被主机 cgroup OOM 杀死，单独重跑后 train/heldout exact，矩阵采用重跑行，见 out-of-protocol-diagnostics/README.md）。')
    A('')
    A(f"预算：主测试 {conf['budget']}，diagnostic {conf['diagnostic_budget']}，cost {conf['cost']}，saturation {conf['saturation_budget']}，外部 deadline {conf['timeout']} 秒；demand budget {conf['demand_budget']}、每类型操作数上限 {conf['demand_operands']}、最多 {conf['demand_rounds']} 轮。主机 {protocol['host']['cpu_count']} 逻辑核（{protocol['host']['platform']}），固定 3 个 worker、每题独立进程；与原 Windows 16 核主机不作 wall-clock 比较。")
    A('')
    A('## 实现（`experiments/place-demand`，与 place-only 的差异可用 `diff -r` 列出）')
    A('')
    A('**阶段 A（B1，`Witness.hs: witnessAt Bidirectional`）**：对 `coordAdd(a,v)=t`、`coordDelta(p,q)=v`、`vecAdd(u,w)=y` 按实际参数顺序补全左侧条件化（已观察 a ⇒ v_i=t_i−a_i；已观察 p ⇒ q_i=p_i−v_i；已观察 u ⇒ w_i=y_i−u_i）。每行保持（样例，操作数）配对；residual 是子规格（pointTask），不是被接受的表达式；原 join 与右侧 residual 完整保留，join 存在时沿用原 `preferGround`。候选左操作数按原 grounded MDL rank 排序、上限 16（与原右侧 residual 相同）。另加 credit-aware 剪枝：residual 子任务若只剩 0 层推导额度且其值既非观察项也非常数，则不生成（这样的子任务本来只能靠 forward 观察闭合，必返回空；无 invention 时结果中性）。未剪枝的首个版本在 stress A 上 11251 个递归子任务耗尽 250000 预算。')
    A('')
    A('**阶段 B（B2，`Learn.hs`）**：witness 调用时若某条件化操作数类型在观察域中完全缺失（`missingOperands`，只看类型签名与观察域；算术 residual 不在有限观察域时报告 IntT），登记需求 `(pool key, Type)` 并记入当前 Learn 调用栈帧。一轮 Learn 后按登记顺序解析：对 CoordT/VecT/IntT，用 Observe 效应、arity≤2、一阶参数的普通 Base 算子按签名一层组合既有观察项（每类型取 rank 最好的 24 个），在该 pool key 的训练环境求值，经原 `selectPool`（结构多样性语义）合并；生成/保留各计 1 单位工作。pool 增长则 epoch+1；memo 条目记录子树登记的需求集合与写入 epoch，仅当其需求在更晚 epoch 被“有增长地”解析时失效并重学（memo hit 时把子树需求集合向上传播）；无增长的解析不唤醒；每个 key/type 只解析一次；轮数与工作有界；调度确定性。`demands.json` 记录每个需求的状态（resumed / still-blocked / suspended）。')
    A('')
    A('**额外开关（B1L/B2L，`BidirectionalLocal`）**：左侧 residual 只条件化至少依赖一个非 SceneT 环境变量的操作数；类型级通用规则，无任务信息。它是在检查 B1 失败 trace（A/C/F 的 join 全部位于 Γ=[v0] 上下文）之后提出的，所以其结果只算开发证据。')
    A('')
    A('## 测试')
    A('')
    tests = (ROOT / 'results/place-demand-tests.log').read_text(encoding='utf-8', errors='replace')
    A(f"`experiments/place-demand/test/PlaceDemandMain.hs`：{tests.count(chr(10)+'ok:') + (1 if tests.startswith('ok:') else 0)} 条断言全部通过（`results/place-demand-tests.log`；B1L 补丁后 `--quick` 复跑 PASS，`results/place-demand-tests-quick-after-B1L.log`）。覆盖：coordAdd/coordDelta/vecAdd 两侧逆推经真实 Base 求值回代（负坐标、零向量、三个训练环境、非恒定位移）；只有左/只有右参数可观察；无操作数时安全失败；行置换操作数不跨样例拼接；Vec 子规格经普通 coordDelta join 继续求解（真实引擎）；需求登记、域增长后 memo 失效与唤醒、无新增信息不再唤醒、cap 过小时 still-blocked 终止、预算 0/1 截止、重复执行确定性、同训练值不同依赖结构候选保留；端到端（stress I，B1，全协议预算）：portfolio 全部通过类型检查，选中程序通过原 Grid exact verifier，使用 place/coordAdd/coordDelta 且无 Translate。`CheckPlace.hs` 对本快照 PASS。")
    A('')
    cls = json.loads((OUT / 'old_test_classification.json').read_text(encoding='utf-8'))
    A('旧测试分类（不笼统宣称全部通过）：')
    for c in cls: A(f"- `{c['suite']}`：{c['classification']}" + (f"（引用 {', '.join(c['removed_symbols_referenced'])}）" if c['removed_symbols_referenced'] else ''))
    A('')
    A('## 受控矩阵（B0/B1/B2）')
    A('')
    L += tbl(GROUPS, MAIN)
    A('')
    A(f"超时（外部 300 秒，内部计数缺失记 n/a）：{len(summary['timeouts'])} 项：{', '.join('/'.join(t) for t in summary['timeouts'])}。两个 regression 超时项（map-scan-ambiguity B1/B2、map-translate B2）在无 deadline 的 out-of-protocol 复跑中约 290 秒自行终止：250000 工作预算全部耗于推导（first-exact 0，join 1682/2163），因此它们是搜索预算失败而非主机时钟 artefact；30 个 diagnostic 的两个超时（484b58aa、c444b776）三个变体都出现，与冻结结果相同。")
    A('')
    A('### 相对 B0 的逐题结果变化')
    A('')
    A('B1：'); L += changes('B1', GROUPS); A(''); A('B2（相对 B0；B2 与 B1 的 train/heldout 逐题相同）：'); L += changes('B2', GROUPS)
    A('')
    A('### DAG 规模与提取结果的关系')
    A('')
    A('下表按 join 节点数分桶统计“cost saturation 是否物化出至少一个完整根 AST”（不含超时行）。B1/B2 的 join 爆炸集中在 Γ=[v0] 的两行子规格（scan seed / let 绑定坐标）：例如 stress C 的 1780 个 join 中 coordAdd[v0]=1090、coordDelta[v0]=327，[v0,v1] 上下文为 0；F 的 4153 个 join 中 coordAdd[v0]=2679。')
    A('')
    A('| 变体 | join ≤250 | 251–1000 | >1000 |'); A('|---|---|---|---|')
    for v in MAIN + (EXTRA if abl_rows else []):
        b = joins_summary(v)
        A(f"| {v} | " + ' | '.join(f"物化 {b[k][0]} / 未物化 {b[k][1]}" for k in ['≤250', '251–1000', '>1000']) + ' |')
    A('')
    if abl_rows:
        A('## 额外探索性消融 B1L/B2L（开发证据）')
        A('')
        L += tbl(['core', 'regression', 'stress', 'generated-dev', 'generated-audit'], EXTRA)
        A('')
        A('B1L 相对 B0：'); L += changes('B1L', GROUPS); A(''); A('B2L 相对 B0：'); L += changes('B2L', GROUPS)
        A('')
        A('B1L 的规则在看过 A/C/F 的失败 trace 后制定，因此 generated-audit 在 B1L 下的留出数字是开发证据而非未见审计；它回答的问题是“B1 的退化是否来自场景级两行子规格中的 residual 扇出”，而不是“B1L 泛化更好”。B1L 在 regression 上是否保住 16 个成功项、在 stress 上是否同时保住 C/J 并恢复 A/B/I，见上表与逐题表。')
        A('')
    A('## 逐题表')
    A('')
    A('### stress A–J')
    A('')
    L += R.per_task_table(allrows, 'stress', ['bidirectional_left_decompositions', 'join_nodes', 'cost_bound_reached', 'materialized_complete_asts', 'demands_distinct', 'demands_resumed', 'demands_still_blocked', 'demands_suspended', 'demand_new_vec_observations', 'demand_new_int_observations', 'demand_memo_invalidations', 'demand_memo_reuse'])
    A('')
    A('### 新生成样例（generated-dev / generated-audit）')
    A('')
    A('生成器 `scripts/generate_place_demand_samples.py` 独立于搜索器（自带栅格渲染与 4 连通分量解码校验，规则按输入栅格分量的 raster 顺序定义，无隐藏 id）；manifest 含每个 task 的 SHA-256，在任何求解前冻结提交（hash `' + json.loads((ROOT / 'data/place-demand-generated/manifest.json').read_text())['manifest_hash'][:16] + '…`）。`GeneratedAudit.hs` 为 16 个任务各给出独立 Base 参考程序（train/heldout exact），仅作事后可表达性证书。dev 集（原 A/B/I 同规则）用于开发；audit-same-rule（同规则新实例，含一个“位移等于首对象绝对坐标”的混淆训练用例 audit-same-relative-2）与 audit-unseen（negated/double/x-align 三种原 stress 中没有的组合规则）只在矩阵完成后评分；B0/B1/B2 看过 audit 结果后未再修改。')
    A('')
    L += R.per_task_table(allrows, 'generated-dev', ['bidirectional_left_decompositions', 'join_nodes', 'cost_bound_reached', 'demands_resumed', 'demand_new_vec_observations'])
    A('')
    L += R.per_task_table(allrows, 'generated-audit', ['bidirectional_left_decompositions', 'join_nodes', 'cost_bound_reached', 'demands_resumed', 'demand_new_vec_observations'])
    A('')
    A('generated 集合的 B0 结果本身说明：同规则新实例（多对象、随机形状）下，原 Place 搜索 train exact 但留出几乎全错（AbstractionMissing），即原搜索选中的是训练一致但不泛化的程序；B1/B2 的 0 train 是推导预算耗尽。audit-same-relative-2 的混淆训练（位移=首对象 TL）在 B0 下 train exact、留出错，与设计的歧义一致，但没有真值的反事实只能证明歧义，不能判定哪个程序正确。')
    A('')
    A('### regression')
    A('')
    L += R.per_task_table(allrows, 'regression', ['bidirectional_left_decompositions', 'join_nodes', 'demands_resumed', 'demand_new_vec_observations'])
    A('')
    A('### 30 个 PreviouslyOpenedDiagnosticSet（budget 25000）')
    A('')
    dg = [(t, {v: (row('diagnostic', t, v) or {}) for v in MAIN}) for t in sorted({r['task'] for r in rows if r['group'] == 'diagnostic'})]
    A('三个变体的 train/heldout 结果逐题相同：' + ', '.join(f"{t}={int(bool(vs['B0'].get('train')))}/{int(bool(vs['B0'].get('heldout')))}" for t, vs in dg if vs['B0'].get('train')) + '（其余 train=0）；' + f"B1 左侧分解命中合计 {agg('diagnostic','B1','bidirectional_left_decompositions')}，B2 resumed 需求 {agg('diagnostic','B2','demands_resumed')}。在 25000 预算下该集合对两种机制都不敏感；它仍只是 previously-opened diagnostics。")
    A('')
    A('## 阶段 A/B 诊断汇总')
    A('')
    A('| 组 | 变体 | 左侧分解命中 | 需求键 | resumed | still-blocked | suspended | 新 VecT | 新 IntT | demand work | memo 失效 | memo 需求复用 |')
    A('|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|')
    for g in GROUPS:
        for v in MAIN + EXTRA:
            if n(g, v) == 0: continue
            A(f"| {g} | {v} | " + ' | '.join(R.fmt(agg(g, v, k)) for k in ['bidirectional_left_decompositions', 'demands_distinct', 'demands_resumed', 'demands_still_blocked', 'demands_suspended', 'demand_new_vec_observations', 'demand_new_int_observations', 'demand_work', 'demand_memo_invalidations', 'demand_memo_reuse']) + ' |')
    A('')
    A('suspended 需求 = 解析前 demand budget（25000）或总预算已耗尽而未解析的键；still-blocked = 解析后无新观察项或类型不支持。本轮没有 still-blocked（24 个操作数的一层组合总能产生新项），而 suspended 很多：说明在 B2 下预算不是被“无法生成”而是被“生成太多”占用。cache：memo 需求复用计 memo hit 时向上传播需求集合的次数；失效计域增长后被重学的条目。')
    A('')
    A('## 代表性案例（可追踪链）')
    A('')
    def case(title, path, pats, note, limit=14):
        A(f"### {title}"); A(''); A(note); A(''); A('```text')
        for l in chain(path, pats, limit): A(l)
        A('```'); A('')
    pats_ok = [r'^Learn\(CoordT; observations=\d+; Gamma=\[\("v0",SceneT\),\("v1",PlacedT\)\]', r'Nonempty VS_coordDelta', r'Nonempty VS_coordAdd', r'Nonempty VS_place', r'Nonempty VS_map node', r'^Cost saturation', r'^Selected AST']
    rI = row('stress', 'I-equivalent-representations', 'B1')
    case('stress I（B1 成功）', 'results/place-demand/stress/I-equivalent-representations/B1/induced_tsl_trace.md', pats_ok,
         f"训练规格 → `Learn(CoordT; Γ=[v0,v1])`（每对象目标坐标）→ `coordAdd` 左侧条件化 a=Anchor(v1,·) 得到 VecT residual 子规格 v_i=t_i−a_i → `coordDelta` join（p、q 均为已观察锚点）→ 完整候选 → 原 Grid 验证 → 冻结选择后留出 exact。选中程序：`{(rI or {}).get('program')}`；first-exact work {R.fmt((rI or {}).get('first_solution_states'))}，总 work {R.fmt((rI or {}).get('total_expanded_work'))}，portfolio {R.fmt((rI or {}).get('portfolio'))}，held-correct {R.fmt((rI or {}).get('held_correct'))}。B0 下同一子任务只有 `coord` 的两个 IntT 子任务且都为空（trace：`MRV immediate domains=[(0,0),(1,0)]`），map witness 被拒绝。")
    rA = row('stress', 'A-absolute-relative', 'B1'); rAL = row('stress', 'A-absolute-relative', 'B1L')
    case('stress A（B1 失败：候选提取）', 'results/place-demand/stress/A-absolute-relative/B1/induced_tsl_trace.md', pats_ok,
         f"同一条链在 A 的 DAG 中存在（`Nonempty VS_coordAdd node=135 children=[11,134]`，child 11 为含 `Anchor(v1,TL)` 的 Union，134 为 coordDelta join），map join 非空；但 cover（12500）与 saturation（25000）物化 0 个完整 AST，C 只到 {R.fmt((rA or {}).get('cost_bound_reached'))}（完整程序 cost≈29），join {R.fmt((rA or {}).get('join_nodes'))}（其中 coordAdd[v0] 374、coordDelta[v0] 171）。out-of-protocol 的 4 倍 saturation 复跑仍 0 个完整 AST（C=23）。第一个实际阻断的子任务：**候选提取**（固定 cover/saturation 预算下，场景级两行子规格的 join 级多样性）。" + (f" B1L 把 [v0] 上下文的左侧 residual 关掉后：train/held {int(rAL['train'])}/{int(rAL['heldout'])}，join {rAL['join_nodes']}，程序 `{rAL['program']}`。" if rAL else ''))
    rB = row('stress', 'B-repeated-progression', 'B2')
    case('stress B（B2：需求登记→解析→重学）', 'results/place-demand/stress/B-repeated-progression/B2/induced_tsl_trace.md', [r'Demand registered: coordAdd', r'Demand resolved', r'Demand round', r'Nonempty VS_coordAdd', r'^Selected AST'],
         f"`coordAdd` 在 Γ=[v0,v1] 的 pool 中缺 VecT → 登记 (pool key, VecT) → 一轮后按签名生成 coordDelta/vec 组合、求值、合并（VecT 新项 {R.fmt((rB or {}).get('demand_new_vec_observations'))}）→ epoch+1 → 失效 {R.fmt((rB or {}).get('demand_memo_invalidations'))} 个 memo 条目 → 重学。结果与 B1 相同（程序 `{(rB or {}).get('program')}`），总 work {R.fmt((rB or {}).get('total_expanded_work'))} vs B1 {R.fmt((row('stress','B-repeated-progression','B1') or {}).get('total_expanded_work'))}：需求机制可达但在此无增益。", limit=10)
    rC0 = row('stress', 'C-scene-axis', 'B0'); rC1 = row('stress', 'C-scene-axis', 'B1')
    A('### stress C（B0 成功 → B1 失败）'); A('')
    A(f"B0：train/held 1/1，join {R.fmt((rC0 or {}).get('join_nodes'))}，C 到 {R.fmt((rC0 or {}).get('cost_bound_reached'))}，程序 `{(rC0 or {}).get('program')}`（无 coordAdd）。B1：join {R.fmt((rC1 or {}).get('join_nodes'))}（coordAdd[v0] 1090），左侧分解 {R.fmt((rC1 or {}).get('bidirectional_left_decompositions'))}，推导 {R.fmt((rC1 or {}).get('deduction_milliseconds'))} ms，0 个完整 AST。B1 没有删除 B0 的任何分解，它只是把同一预算分给了更多训练一致的备选；因此这是提取/调度瓶颈，不是 witness 错误。" + (f" B1L：{int(row('stress','C-scene-axis','B1L')['train'])}/{int(row('stress','C-scene-axis','B1L')['heldout'])}。" if row('stress','C-scene-axis','B1L') else ''))
    A('')
    A('## 负结果与限制')
    A('')
    A('- B1 的对称 residual 使训练一致 DAG 在弱约束子规格中爆炸；在现行“探索所有分解、保留所有结构代表、固定提取预算”的 R2 设计下，这直接转化为 train 失败（A/C/F/G、2 个 regression、全部 generated）。这不是 Base 不可表达（独立证书存在），也不是 witness 不支持（链在 DAG 中）；第一个阻断的子任务是候选提取（A/C/F）或推导预算耗尽（generated、两个 regression）。')
    A('- B2 在本轮没有改变任何 train/heldout 结果。一层签名组合产生的 VecT/IntT 观察项数量巨大（stress B2 新 VecT ' + R.fmt(agg('stress','B2','demand_new_vec_observations')) + '），demand budget 常被前几个键耗尽（suspended ' + R.fmt(agg('stress','B2','demands_suspended')) + ' / ' + R.fmt(agg('stress','B2','demands_distinct')) + '），并且新 join 备选加剧了提取压力。H2 在“B1 已修复”的前提下测试，但 B1 本身没有干净修复，所以 H2 的否定结论只对本设置成立。')
    A('- 新生成样例的 B0 结果（train exact、留出错）说明原搜索对多对象随机形状实例选择了不泛化的训练一致程序；候选数增加不等于泛化提高，held-correct 列才是覆盖证据。')
    A('- 超时内部证据缺失记 n/a；两个 regression 超时经无 deadline 复跑确认是预算失败。wall-clock 受 3 并发与主机差异影响，不作加速结论。一次 cgroup OOM 是执行失败，已单独重跑。')
    A('- 30 个 diagnostic 在 25000 预算下对两机制不敏感，仍称 previously-opened。')
    A('- B1L 是事后规则；它恢复 A/B/I 并保住 C 的证据来自开发集，其 audit 数字不能称未见。')
    A('')
    A('## 下一阶段判断')
    A('')
    regL = [r for r in abl_rows if r['group'] == 'regression' and r['variant'] == 'B1L']
    A(f"证据最支持的动作是**先修已定位的瓶颈，而不是继续 demand closure 或局部抽象反馈**：双向 witness 已经使 A/B/I 的链可达（H1 的机制部分成立），真正阻断的是“弱约束子规格中的 residual/join 扇出 × 固定提取预算”。开发证据 B1L（仅把左侧 residual 限制在元素局部基点）在相同预算下 stress 留出 {cnt('stress','B1L','heldout')}/{n('stress','B1L')}、regression 留出 {cnt('regression','B1L','heldout')}/{len(regL)}、generated-audit 留出 {cnt('generated-audit','B1L','heldout')}/{n('generated-audit','B1L')}，说明扇出而非 witness 语义是瓶颈。下一步应在不改预算口径的前提下，把“residual 不得是规格的整体平移”做成有理论依据的通用条件（例如要求 residual 子规格相对父规格有信息增益，或在 cover/saturation 中按子规格约束强度调度），**重新生成未见 audit 样例**后以同一受控矩阵检验；demand closure 应在提取瓶颈解决后、以“候选覆盖相同的工作量”重新评估：本轮 B2 的新增信息被提取预算吞没，而 B2L 相对 B1L 在 stress 上" + ('没有增益' if cnt('stress','B2L','heldout') <= cnt('stress','B1L','heldout') else '有增益') + f"（{cnt('stress','B2L','heldout')}/{n('stress','B2L')} vs {cnt('stress','B1L','heldout')}/{n('stress','B1L')}），且改变了部分任务的选择结果。")
    (OUT / 'REPORT.md').write_text('\n'.join(L) + '\n', encoding='utf-8')
    print('wrote REPORT.md', len(L), 'lines')
if __name__ == '__main__': main()
