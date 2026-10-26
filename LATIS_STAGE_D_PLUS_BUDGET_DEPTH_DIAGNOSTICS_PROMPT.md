# LATIS Stage D+：逐层失败诊断 + 搜索预算／深度 Scaling 实验

你是 LATIS 仓库的编码与实验执行模型。请在当前 Stage D **已验收的有界统一 TSL** 基础上进行一次可复现的诊断与消融实验：先使搜索的停止原因与覆盖范围可审计，再分别扩大预算、对象操作组合深度、Typed 参数表达式深度，判断未解 ARC 任务中的搜索瓶颈究竟在哪里。

**必须实际修改代码、运行必要测试、执行实验并交付报告和机器可读明细；不能只提交设计文档。** 全程用简体中文写文档和报告。不要假定失败任务的真实 ARC 规则，不用任何 ARC test 输出调参，不承诺 heldout 泛化。

## 0. 既有事实与边界

请先阅读并定位：`LATIS_STAGE_D_REPORT.md`、Stage D 实现和运行脚本、Stage C 审计报告、`results/stage_d/full_p0/` 的 raw per-task JSON、诊断与验证文件。若路径或字段不符，以实际仓库为准，在报告列明差异。

- Stage D 当前 FullD = **20/400 train-exact**；阶段 C = 17/400；新增任务 `5168d44c`、`a79310a0`、`aabf363d`，旧 17 个解均保留。
- D 已有 Typed 参数、两步组合、参数级 Int/Bool VSA、双层 Transform/Render Witness、deferred frontier、`exact / no-fit / not-applicable / truncated / timeout` 区分，以及 first-solution 和 total-search work/time 指标。本轮**复用已有日志与枚举机制，不重复造诊断系统**。
- 当前组合深度约束为 ≤2；参数深度、各层候选预算以源码配置为准，禁止把建议值当成已确认的实现值。
- 严格 ComposeOnly 在旧实验中来自单独二进制；评测完成后又修复过 `MigratedBody` 的旧合法重叠发射大于 900 的兼容问题。**本轮统一冻结最终源码快照／单一二进制，并重新跑基线**，不可沿用不同 binary 的数字作为严格消融。
- 目标是有界搜索的因果诊断，**禁止**借机新增 Shape/Object 原语、修改 TSL 基础语义、训练泄漏、引入神经网络、改变 canonicalization/prior、接入 R2，或进行无界深度搜索。

## 1. D0：先审计现有诊断与限制配置

逐一找到 `frontSearch → relationPath → unifiedPath → searchUnified → param synthesis / fitPool → Pipeline → render` 中：

1. 每层语法枚举、深度定义及实际终止条件（包括旧 C、Size Rule、alignment、A typed holes、B param VSA、D parameters、D composition、deferred recovery）；
2. 参数模板 budget、单目标/全局 budget、代表数上限、组合数/执行数上限、发射对象数安全上限、画布/像素合法性边界、内存和墙钟限制；区分**性能预算**与**语义安全限制**，后者不随倍数放大；
3. 各子搜索能否真正枚举完整有限集合，哪些存在 lazy frontier、early-stop、cost/order 截断或仅报告 `NoFit`；
4. 当前 JSON 已有哪些信息、缺少哪些、首次失败是否会被最后一个分支覆盖、超时是否导致整块指标缺失。

写出 `docs/LATIS_STAGE_D_PLUS_AUDIT.md`：字段／源码位置／单位／默认值／是否可调／是否会改变候选集合／是否支持穷尽证明。**先完成此审计，再决定真正的调参入口**；不要仅把常量写大就声称深度扩展成功。

## 2. D0 实装：逐层搜索证据与停止状态

新增一个**结构化、可机器复核**的逐任务、逐搜索层记录，不改变候选枚举次序、程序选择、prior、求值及 Stage D 工作量语义。兼容现有 JSON；诊断开关默认关闭，打开时只产生额外的诊断计数和 trace，诊断本身的耗时/内存单独记账。

建议的概念结构（允许映射至现有类型，字段名可调整但语义不可缺）：

```text
SearchScope = SizeRule | Alignment | LegacyRelation | TypedParameter
            | ParameterVSA | Composition | Execution | Render
StopReason  = FoundFit | ExhaustedFinite | BudgetCut(kind, limit, used)
            | Timeout | InvalidPrecondition(reason) | Deferred
            | NoFitYet | NotEntered(reason) | InternalError
Exhaustiveness = ProvenExhausted | ProvenNotExhausted | Unknown
```

每个搜索事件至少记录：

- `task_id, case_count, config, run_id, binary_sha256, scope, goal_type, trigger, branch_id/parent_id`；可稳定复现的候选／程序结构哈希与作用域信息；
- `grammar_version`、当前有效的组合深度上限／参数表达式深度上限、**实际访问的最大深度**、各深度候选生成数／求值数／接受的 fit 数；
- `attempted, evaluated, rejected_type, invalid_domain, param_fit_count, composed_candidates_evaluated, render_attempts, render_mismatches, train_exact_candidates`；准确区分“模板数”“参数实例数”“训练案例求值数”“网格完整验证数”；
- `budget_kind, budget_limit, budget_used, hit`, `remaining_frontier_count`（若无法廉价精确获取，设 `null`，但保存 `frontier_nonempty` 和原因），`deferred_count`、`representatives_dropped_or_deferred`；
- `stop_reason`、`exhaustiveness`、`exhaustiveness_evidence`、`first_fit_work/time`、`first_full_solution_work/time`、`total_work/time`；没有首解须为 `null`，超时缺失指标不能填 0；
- 汇总时**保留每个分支的终止原因**，不以最后一条错误覆盖其他分支；报告“首个拒绝点”和“最终仍阻塞的点”两个不同维度。

`ProvenExhausted` **仅**在已界定版本／类型／深度／叶子／常数域的有限搜索空间中，证明所有合法候选（含 deferred frontier、代表上限后被延迟的候选）已访问、且无预算截断或超时，才可以成立。`NoFit`、没有记录截断、或仅将前缀全部枚举都**不**足以证明穷尽。若逻辑无法证明，必须给 `Unknown` 或 `ProvenNotExhausted`；不可把“当前 DSL 不可表达”当成无条件结论。

为每道任务提供一个 `FailureEvidence`：

- `size/alignment/param/compose/render` 各阶段的 reached / blocked / exhausted / truncated / timeout；
- 是否存在“某些参数有 fit 但无法组成完整程序”“组合能执行但最终像素失败”；
- 运行停止时的最直接阻塞原因、可替代的阻塞分支、可用于后续预算实验的明确证据。

建议输出 `tasks/<id>/search_diagnostics.json` 或在现有结果中扩展 `diagnostics`，并汇总为 `diagnostic_per_task.csv` 与 `search_events.jsonl`。单个任务日志可按上限截断，但必须记录 `trace_truncated`；**不允许静默丢弃失败分支**。

## 3. D0 测试与基线回归——未通过不做 scaling

补齐至少以下可运行测试，并把日志留档：

1. **穷尽正例**：一个小型有限语法全部候选访问完毕、无 fit → `ProvenExhausted`，并给出候选数量一致性证据。
2. **截断反例**：只差最后一个候选就能 fit，但预算在它之前耗尽 → `BudgetCut` 且不得是 `ProvenExhausted`；提升预算后应能找到。
3. **深度反例**：唯一可用的构造位于深度 3，深度 2 不可达，且完整深度 2 枚举不会错误宣称无限 TSL 不可表达。
4. **分支反例**：某分支参数无 fit，另一分支可 fit 但 render mismatch；两个证据须同时保留。
5. **deferred / representative**：延迟候选未恢复时不得声称 exhaustive；恢复后可完成穷尽；代表数截断单独计数。
6. **超时 / crash**：保留已经完成的事件、停止原因和 partial work；不存在的数据为 `null`，而非 0。
7. **语义无回归**：同一个冻结二进制下诊断开关 on/off 对旧 17、D 的新增 3 道及历史机制任务的程序／逐格预测一致；对于同样完成的任务，原 `search_work` 计数一致，诊断 overhead 单列。回归至少复现 FullD **20/400** 的既有 train-exact 集合（若偏离必须逐题说明，不能直接调参掩盖）。

## 4. D+：可配置预算与深度 Scaling（分离变量）

先确定 `compose_depth` 指的是**实际非恒等操作步骤数**还是内部 AST 节点深度；`param_depth` 指 Typed AST 结构深度还是模板 spine 深度。文档给出精确定义、示例和递归合法性规则。确保深度 3/4 真正生成了**深度 2 不存在的、类型正确、可执行的候选**；不能改配置字符串却仍只执行两步 pipeline。固定语法和无截断条件下应验证较深宇宙包含较浅宇宙（规范化后对照），但不能因更深搜索的不同预算前缀和优先级变化就强制旧 first-solution 不变。

建议实验矩阵如下；确切数值以审计后的现有默认值为 1×，可保留并记录更安全的上限：

| 配置 | Compose 深度 | Typed 参数深度 | 工作预算（相对默认） | 目的 |
|---|---:|---:|---:|---|
| `D0_Frozen` | 2 | 2 | 1× | 最终源码的诊断化基线 |
| `Budget4x` | 2 | 2 | 4× | 固定语言，只验证搜索预算 |
| `Compose3` | 3 | 2 | 1× | 只开放更长对象操作组合 |
| `Param3` | 2 | 3 | 1× | 只开放更深参数表达式 |
| `Combined3_4x` | 3 | 3 | 4× | 检查深度 × 预算的交互 |
| `Extended4_8x` | 4 | 3 | 8× | **只对预选诊断任务**运行的上限实验 |

若审计发现现有默认参数深度并非 2，或组合深度 3 在现有语法下并不能安全工作，要保留原数值并在报告明确实际配置；不得隐瞒偏离。工作预算倍率只作用于**搜索截断阈值**，需逐项列明：参数模板／实例、fit representatives、组合枚举、case evaluations、B 的参数图／VSA 容量、任务级预算等。若需要保持某个预算固定以完成因果隔离，加入单独消融并解释；不能无差别扩大 SizeSig、画布边界、递归栈／发射对象合法性上限或内存安全约束。

时间窗口分别记录 `Solve@60s` 与 `Solve@300s`。推荐用每任务 300 s 上限的实验保留精确首解事件的 `t<=60s` 标志，并对小样本进行独立 60 s 运行验证；**不要**把不同 CPU 负载和不同运行批次的时间混为严格提速证明。若某配置在 300 s 内找到解，须保留程序 AST、深度、首解时间和独立 train-exact 复核。

## 5. 实验执行策略与资源安全

为避免盲目跑 `400 × 6 × 300 秒`：

**先做 pilot**：用确定性、预先公布的筛选规则，从原阶段 D 的 380 道未解任务中选择约 30–60 道，兼顾参数截断、组合截断、deferred 非空、渲染失败、旧 C exhausted、D 未触发、对象/画布变化等诊断类型；另含 20 道已解正控制。不按 pilot 的 ARC train-exact 成败重新挑选任务或动态调 prior。对这些任务运行全部 E0–E4 配置，并有界运行 E5；为每道任务输出完整诊断迁移。

**再做正式 ARC 400 train-only**：固定 pilot 后的代码、配置和所有上限，在同一最终二进制上至少执行 `D0_Frozen`、`Budget4x` 与从 pilot 预先确定的最有解释力的深度配置；如果资源允许补齐 `Compose3/Param3/Combined3_4x` 的 400 题矩阵。E5 维持针对性实验，不用它的定向解数冒充 400 题统一 solve rate。任何未完成配置需如实标记为 `not_run`，不能推测其结果。

全程：

- 只用官方 ARC-AGI-1 training 的**训练输入/输出对**进行合成与 train-exact 校验；solver 接收 `test: []`，拒绝非空 test；机制 heldout 只在训练之外评分，不输入 solver。
- 相同数据 manifest 和 hash、相同冻结二进制（ComposeOnly 旧的跨版本问题不能重现）、相同 CPU 并行度、独立 run_id、完整 Config JSON、git status/diff 快照及 binary SHA256。
- 结果目录 append-only，**不覆盖** `results/stage_d/full_p0`、Stage C 原始结果及任何历史运行。支持中断恢复；硬超时也应由父进程写入 partial status。
- 设置总资源保护：每任务 RAM、候选上限、日志体积、墙钟和整体 pilot 规模；即使 `Extended4_8x` 仍须有硬上限，不能 OOM 后静默丢任务。
- 不将「更多搜索预算」与「更多搜索时间」混为一个变量。记录每个候选因预算、语义安全限制、超时而停止的确切原因。

## 6. 必须给出的分析，而不仅是 solve rate

1. 全部配置的 `train_exact / 400`（仅对完整 400 评估）、`Solve@60/300s`、新增／丢失任务 ID、首次解深度、first-solution work/time、total work/time、实际超时与预算截断、峰值内存；共同完成题进行配对成本对比。
2. 固定深度 2 时 `Budget4x` 新增的任务：指出原来**命中哪一个预算上限**，新增解的 AST 是否原本就在语法宇宙内，是否可以在低预算前缀之外复现。
3. `Compose3` 新增的任务：列选中程序的**实际非恒等步骤数**、运行顺序与 Witness，并验证该构造没有在旧深度 2 宇宙中出现。
4. `Param3` 新增的任务：列参数 AST、真实结构深度和 Typed bindings，并验证旧参数深度 2 不可枚举该表达式。
5. `Combined3_4x` 独有新增：区分深度与预算的交互，不能仅凭归属一组就断言因果；必要时定向重放同一程序在其它预算/深度配置的可达性。
6. 每个未解任务的诊断分类必须有证据：`proven_finite_exhausted`、`budget_truncated`、`timeout`、`blocked_before_unified_search`、`param_no_fit`、`composition_no_fit`、`render_mismatch`、`unknown`。**分类允许多标签**，在报告中另给可复算的主标签优先级规则；不将仅有部分分支穷尽误称整体穷尽。
7. 由有界语法已穷尽而失败的任务，可以称“**当前有限配置内没有 train-exact 程序**”，不能据此称“ARC 真规则不在 TSL 中”或“存在数学意义上的不可表达性证明”。新增 train-exact 也不等于 test 泛化。
8. B 参数 VSA：在同候选集、同预算／深度且无截断的对照中观察实际求值节约，区分本地 DAG 重用与端到端 `search_work` 的差异；本次不以提高 Confirmed 边数量为成功要求。

## 7. 交付物与验收

交付如下文件（如路径需调整，请在索引中明确）：

- `docs/LATIS_STAGE_D_PLUS_AUDIT.md`：当前限额/深度/日志的源码审计与诊断定义；
- `docs/LATIS_STAGE_D_PLUS.md`：配置开关、语义不变量、实验矩阵、复现命令；
- `docs/LATIS_STAGE_D_PLUS_REPORT.md`：结果、置信边界、预算 vs 深度 vs 表示瓶颈的逐题证据；
- `results/stage_d_plus/{run_id}/`：manifest、源码/binary hash、config、机制测试、ARC 原始任务 JSON、`search_events.jsonl`、`diagnostic_per_task.csv`、`metrics.csv`、`per_task.csv`、`new_solutions.json`、`failure_transitions.csv`；
- `scripts/run_stage_d_plus.*` 与 `scripts/report_stage_d_plus.py`：可复现、可断点继续、不会覆盖原始数据的执行与汇总；
- 新增自动化测试，尤其覆盖 D0 七类场景、深度真实扩张、fit/deferred 保留、Wall-time/预算差异、独立 train-exact re-execution。

### 验收标准

- 诊断开关关闭时，Stage A/B/C/D 旧测试仍通过；开启时旧解／预测不变，**同完成任务的原 `search_work` 不变**。
- 每条 `ExhaustedFinite` 都可提供范围明确、数量自洽、无遗漏 deferred 的穷尽证据；未知一律不冒充证明。
- 深度 3 至少能在人工构造的**负控制机制任务**上生成深度 2 不存在的新候选；扩大预算能找回先前故意截断的候选。无这些测试，不准声称 scaling 已实现。
- 主要消融保持单一最终 binary、相同语义、明确预算／墙钟配置，所有统计可由原始逐题记录独立复算。
- 如在真实 ARC 中新增 0 道，也要完整报告各层的 `reached/exhausted/truncated` 与搜索成本；**诊断的可证伪性是首要目标，不得为了追求新增解修改任务语义或扩大测试信息。**

**实施顺序：先审计 → D0 诊断和回归 → 配置化深度/预算与机制负控制 → pilot → 冻结配置 → 400 train-only → 独立复算 → 提交报告。** 不要求再次询问用户已明确的实验目标；若硬资源限制阻止完整矩阵，完成可运行的子集并准确列出缺失部分，不能编造数字。
