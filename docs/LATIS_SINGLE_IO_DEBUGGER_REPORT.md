# LATIS 单 IO 搜索诊断器：实现与验收报告

所有数字来自 `results/trace_io/validation/*.json` 与 `results/trace_io/examples/*`，由 `python -I test/TraceIOValidation.py` 重新生成（9 项全部通过，`validation_summary.json`）。最终 binary `build/latis-trace-io.exe` SHA256 `298c23fa97c82a06e5f5015cb3c0e0a3ccaeb75e257e58ac0a89f112f9ff0aa4`；对照基线是 `results/stage_d_plus/dplus-20261026-v2`（binary `da1f18a7…`），该批次没有被写入。

## 1. D+ 已有能力与本轮补充

**D+ 已有**：checkpoint 级结构化事件（scope/branch/parent/stop_reason/budgets/exhaustiveness），经 GHC eventlog 传给父进程；`failure_evidence` 的 first_rejection/最终阻塞/多标签；选中程序的 Transform/Render witness；GoalAudit；诊断开关不改变搜索的回归。缺口（见审计）：未拟合候选没有 AST，逐 case 事件没有编号也没有网格，Joint Forward 没有独立事件，extension 与 inverse 共用父节点，逆向标签只存在于 trace 字符串，旧 C 只有汇总，程序只有 Haskell `show`，无法独立重放。

**本轮补充**：
- `Diagnostics.traceAt/traceCand`：受 trace level 控制的事件（全局 IORef，默认 0 时不构造字段），另加带 sequence 的 JSONL 文件 sink（行缓冲，带 cap、确定性采样、丢弃计数）；D+ 原事件照旧走 eventlog，同时复制进 sink。
- 插桩位置：Grounding、SizeRule 代表（含对象叶子第二轮是否触发）、旧 C grammar 与逐候选结果、D 计划/逆向标签行/提案、TypedGoal 代表（AST、binding、case 值、case-relative 类、VSA root、Confirmed/Pending 边、deferred）、Extension 与 JointForward 两个独立入口、`tryProgram` 逐候选逐 case（入口、父计划、结构 AST、失败阶段与原因、grid hash、diff；full 级附网格），以及截断和重复提案。
- `ARC.TraceIO`：`trace-io` 实现两种模式与事后只读验证，`trace-replay` 解码结构 AST、经 `checkedParam`、用真实 executor 执行。
- `scripts/trace_io.py`：run/render/compare/replay/oracle-replay；复用 D+ 的 `parse_events`、`enrich_events`、`failure_evidence` 与两个独立 witness 检查器。
- 离线页面 `index.html`，七个视图。

搜索语义没有改：只给 `tryProgram`/`goal`/`construct` 加了诊断标签参数，给 `runCases` 加了惰性的逐 case 记录，给 `SizeStats` 加了 `ssObjectRound`。它们都不进入任何搜索决策（回归见 §5）。

## 2. 真实已执行的候选路径：5168d44c（inspect-pair，train_exact）

页面：`results/trace_io/examples/5168d44c/inspect/index.html`。

1. **Grounding**：搜索实际使用的 4 连通编码，背景 0。case 0 有 7 个输入对象：一个 3×3 空心框和 6 个 1×1 点。对角视图已启用，接受链 0、拒绝 0。
2. **Size**：宽、高各有代表，选中的是 `GridWidth(Input)`/`GridHeight(Input)`。对象叶子第二轮未触发，原因记为"base grid leaves already fit"。
3. **Alignment**：seed/synthesized 两个 prefix，没有产生可实现的对齐，因此进入旧 C。
4. **旧 C relation**：7740 个结构候选全部执行。0 个 fit：4903 个执行或渲染拒绝，2837 个像素不符（例如 `412e86ac…` 在 case 0 上 16 格不同）。
5. **Stage D 逆向计划** `87f0c0bb…` = `(FilterBy IsMaxArea, KeepOthers, MoveOnly)`。逆向标签行：case0 源对象 0 → (x=2, y=2)，case1 对象 2 → (3, 5)，case2 对象 1 → (1, 3)。
6. **TypedGoal**：x 保留 32 个代表、deferred 544；y 保留 27 个代表、8 条 Pending 边。训练等价但 AST 不同的组同时显示，例如 `CurrentY` 与 `Mod(CurrentY, InputWidth)` 在三个 case 上的值相同。页面把这类组标为 case-relative，不当作全域等价。
7. **Execution/Render**：选中程序 `f7de6c42bf9d5166` = `Select(Area == unique max); keep others; MapPosition(CurrentY, Add(CurrentX, WholeColors))`。三个 case 都 `exact`（case0 发射 7 个对象，diff 0）。之后 16 个 fit 达到 `sdMaxFits` 上限，13616 个后续提案被记录为 `truncated: train_exact_fit_cap`。
8. **Verify**：`search_work=250766`，与 D+ 相同；`first_solution_work=135562`。三个训练对的 Transform/Render witness 有效，D+ 的两个 Python 独立检查器都通过。选中 AST 的独立 replay：`match`，解码 ID 等于候选 ID，三个 replay 网格等于 D+ 记录的 witness 网格，也等于训练目标。

## 3. 真实失败任务的首个有证据 blocker

**ac0a08a4**（`inspect/index.html`）：
- **first_rejection**：事件 #13，`TypedParameter@alignment`，slot `shared-AX` 的 Stage A typed hole，row/probe 用了 60002 次（上限 60000），BudgetCut。这与 D+ 失败文本中的 "typed hole search skipped: global typed budget exhausted" 一致。
- **Alignment**：synthesized prefix 访问 391 对，84 对未访问（BudgetCut）。
- **旧 C**：11505 个候选全部执行，0 fit，没有被截断。
- **Stage D**：171 个计划中只访问前 96 个（`sdSkeletonBudget`），所以 75 个计划没有被访问。已访问的计划全部 InvalidPrecondition，主要原因是 "inverse requires a unique selected source"（42 次）、selector 最大/最小面积不唯一、shape correspondence absent。
- **Joint Forward**：执行 150 个程序，0 个 fit。
- **terminal_blocker**：Composition completed，BudgetCut（skeletons 96/96）。

**ed36ccf7**：已访问的 96 个逆向计划全部不适用，3 个计划未被访问。Joint Forward 执行 150 个程序：120 个执行或渲染拒绝，30 个像素不符。

**未观测的分支**（见 §7）：Stage A/D 模板内部、Alignment 逐 key、B 图节点。两个任务的全任务穷尽性都是 `Unknown`。

**Deferred 与预算截断**：两题都有 D+ TypedParameter 的 BudgetCut。5168d44c 有 deferred 代表未被消费（x 目标 544 个）。

**补充发现**：在 `Combined3_4x` 下运行 ac0a08a4，3/4 槽 extension 执行了 8000 个程序，用尽共享的 `sdCombinationBudget`（2000×4）。随后 Joint Forward 虽然进入，720 个提案却全部被记为 `truncated: parameter_combination_budget`，一个也没执行（`validation/joint_forward.json`）。D+ 报告只记录了 "联合 forward 回退题数"（是否进入），看不出这一入口在 Combined 配置下可能执行数为 0。这里只描述这一题的现象，不作因果推广。

## 4. pair_exact 与 train_exact

同一任务 5168d44c：
- **solve-single-pair（pair 0）**：只用一对训练，旧 alignment 序列体程序（`ordered_sequence_body`，13 个事件）给出 `pair_exact`。事后只读验证：其余 2 对训练中 0 对匹配。
- **inspect-pair**：用全部 3 对训练，得到的是另一个程序（Stage D Pipeline），`train_exact`。

合成负控制 `iso_contradict`：两对训练输入相同、输出颜色不同。单对模式给出 `pair_exact`，事后在 pair 1 上 `mismatch`；完整任务为 `no_solution`。`--posthoc on/off` 两次运行的结构 trace hash、程序与 `search_work` 完全相同（`validation/isolation.json`）。页面与记录从不把 pair_exact 称为 train_exact 或 ARC solved。

## 5. Trace 是否改变了搜索：回归证据

`validation/regression.json`，76 次 D+ 路径运行全部一致：
- **D+ 路径**：新 binary 分别运行 `D0_Off`（诊断关）与 `D0_Frozen`（D+ 事件开），覆盖历史 20 道 train-exact 与 18 个机制任务。与 dplus-v2 记录逐项比较 `program`、全部训练预测网格、`search_work`、`status`、`stage_d` 计数，全部相同。38 次 D0_Frozen 运行的 eventlog D+ 事件逐字段相同（只排除时间字段）。
- **trace-io 全插桩**（FullD + candidates 级）：20 道旧解全部 train_exact，程序、预测与 `search_work` 等于 D+ 记录。按事先固定规则抽取的 12 道旧失败题（按 ID 排序、D+ 墙钟 < 8 s 的前 12 道），`search_work` 与状态也全部相同。
- **改变 trace 设置**（`performance.json`、`log_loss.json`）：cap 到 500 个事件、采样 1/7、summary/branches/candidates/full 四个级别，`search_work` 都不变。diagnostic 与 sink 成本单列，不计入 `search_work`。

## 6. 其余验收项

| 项 | 结果（文件） |
|---|---|
| 真实轨迹一致性 | 5168d44c、ed36ccf7：stdout 行、记录、D+ 程序与 work、replay、页面内嵌数据（trace hash、候选数、程序 ID）一致；失败题 Predicted 为 not_available（`consistency.json`） |
| 拒绝可追溯（搜索时） | selector 不唯一、渲染越界、shape/SizeSig 对应缺失、count refinement 失败、候选被预算截断、deferred 未消费、alignment 路径"参数 fit 但整格不符"，各有 task/sequence/scope/branch/reason（`rejections.json`）。说明：已追踪的 35 题中，逆向计划候选在执行时要么整格精确，要么计划没有提出任何程序，因此这一条路径没有"参数 fit 但网格不符"的样例 |
| 拒绝可追溯（executor 级，构造 AST，`oracle_diagnostic_only`） | 非法颜色（ArcColor refinement）、`Mod(…,0)`、越界、selector 不唯一、非法画布 SizeSig（31×3）、类型错误解码。这些候选搜索语法本身不会提出 |
| Forward 回退可见 | ed36ccf7/FullD：上限 16/12/5/180 由 multiplier=1 算出，执行 150 个；ac0a08a4/Combined3_4x：64/48/5/720（multiplier=4），见 §3。联合入口参数深度为 1，与逆向 TypedGoal（深度 2/3）分开 |
| UI | Node 单元测试 8 项；无网络的 headless Chrome 在 8 个页面上自测各 12–20 个视图（视图数随页面是否有候选、replay 而不同）：无 JS 错误、无死链、内嵌记录未被修改、网格格数与 diff 标记等于纯函数结果。缺字段页面显示错误或 unknown；不支持的 schema 被拒绝（`ui.json`） |
| 日志损失可见 | cap、采样、1 s 超时、2 s 强杀、sink 无法打开（exit 4，不运行搜索）、含 test 对（exit 3）、pair 越界、31 格网格。强杀后：已写事件可解析，不补写终止事件，各阶段状态为 unknown（`log_loss.json`） |
| 确定性 | 同 binary、同任务连跑两次：5168d44c（full，21698 事件）与 ac0a08a4（candidates）的结构 trace hash 及候选 ID 序列相同（`determinism.json`） |

**性能**（单次运行，共享工作站，`performance.json`）：

| 任务 | 模式 | 墙钟 s | 事件 | sink 字节 | gzip 字节 | sink s |
|---|---|---|---|---|---|---|
| 5168d44c | D0_Off / D0_Frozen | 1.25 / 1.25 | 0 / 207 | — | — | — |
| 5168d44c | summary / branches / candidates / full | 1.29 / 1.44 / 3.12 / 5.95 | 209 / 262 / 21698 / 21698 | 0.09 / 0.85 / 15.4 / 35.1 MB | 9 KB / 97 KB / 0.75 MB / 1.1 MB | 0.02 / 0.16 / 1.84 / 4.61 |
| ac0a08a4 | D0_Off / candidates / full | 2.30 / 3.63 / 3.96 | 0 / 12554 / 12554 | — / 13.1 / 13.8 MB | — / 0.49 / 0.50 MB | — / 1.28 / 1.46 |
| ed36ccf7 | D0_Off / candidates / full | 9.09 / 11.0 / 10.6 | 0 / 9579 / 9579 | — / 11.1 / 11.4 MB | — / 0.39 / 0.39 MB | — / 1.91 / 1.43 |

RTS 峰值 live heap 在各模式之间最多相差 1.3 倍（ac0a08a4 为 53–68 MB，ed36ccf7 为 263–313 MB）。页面 1.3–11.2 MB。成本主要来自行缓冲写盘（`sink_seconds`）。默认 cap（25 万事件 / 256 MiB）远高于这三题的用量。

## 7. 限制与未完成

- **未插桩**：`Typed.synthesizeTyped` 内部（Size、Stage A 标量 hole、D goal 模板逐个 fit 与类型过滤）、`Front.legalKey`、`Referent.buildGraph` 节点、`Shape.decompose` 内部、旧 alignment `realize` 的逐 case 网格。这些层只有汇总事件，页面列出了源码位置。
- **Replay 范围**：旧 alignment 序列体程序没有结构 AST，独立 replay 只能是 `unverifiable`；其预测来自同进程 `runProgramEvidence`，并经 D+ witness 检查器复核。早停的失败候选，后续 case 只能 replay-only（`partial_match`）。
- **页面大小**：页面只内嵌前 2500 个候选的完整记录（确定性优先级），其余候选只有摘要行，页面顶部有明确提示，完整记录在 `candidates.json`。
- **P1 进度**：`compare` 输出 JSON 与简易 HTML（`validation/compare_ac0a08a4`，并标出 `not_identical_run_conditions`）；oracle-replay 可用，可枚举性一律记为 unknown。`trace.dot` 已生成，SVG 与高级 Witness 图交互未做。
- **哈希与时间**：候选 ID 是 FNV64，不是无碰撞证明。事件顺序是实际求值顺序；诊断区间时间受惰性求值影响，是上界。
