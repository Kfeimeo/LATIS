# 单 IO 搜索诊断器：开工审计

审计对象：2026-10-26 工作区（HEAD `c9632ab7` + 未提交 Stage D+ 修改），`../reports/stage_d/LATIS_STAGE_D_REPORT.md`、`../reports/stage_d_plus/LATIS_STAGE_D_PLUS_REPORT.md`、`docs/LATIS_STAGE_D_PLUS_AUDIT.md`，以及 `results/stage_d_plus/dplus-20261026-v2` 的原始记录。本文件只记录"已有什么、缺什么、在哪里插桩、风险是什么"，实现说明见 `LATIS_SINGLE_IO_DEBUGGER.md`。

## 1. 现有逐任务入口

| 入口 | 位置 | 能力 | 对本轮的意义 |
|---|---|---|---|
| `latis arc-train-only-stage --stage stage-d-<Cfg>` | `app/Main.hs:229`，`src/ARC/ArcTrainOnly.hs:228` (`runStage`) | 单进程单任务；`test` 非空拒绝（exit 3）；整格 train-exact 复核；写 `stage-d-<Cfg>.json`（程序 `show`、counters、`stage_d`、`parameter_goals`、`execution_witnesses`） | trace-io 复用同一 `frontSearch`、同一 timeout/异常处理语义、同一 leak guard 与 `SD.witnessesJSON` |
| `stage-a/b/c-solve` | `app/Main.hs:186-227` | 写 `solution.json`/`derivation_graph.json`/`trace.txt` | 只覆盖 A/B/C 配置，无 D+ 事件；不复用 |
| `scripts/run_stage_d_plus.py run_one` | 同名文件 | Python 父进程调度 Haskell 子进程、eventlog 解析（`parse_events`，容忍尾部截断）、`enrich_events`、`failure_evidence`（first_rejection / last_blocking_branch / alternative_blocking_branches） | trace_io.py 直接 import 这些函数，生成与 D+ 同口径的 `diagnostic` 段，避免第二套标签逻辑 |
| `scripts/visualize_latis.py` / `docs/latis-explorer.html` | 旧 v0.3 R2 Base 程序浏览器 | 面向 `solution.json` 的 R2 Base AST | 程序语言不同（不是 Stage D ObjectTransform/Pipeline），不可直接复用；仅沿用 ARC 0–9 调色板惯例 |

## 2. 现有结构化数据

| 数据 | 产生位置 | 内容 | 缺口 |
|---|---|---|---|
| D+ 事件（`latis-diag:` JSON user event） | `Diagnostics.hs:46` `diagnostic`；`Front.hs:396-405,456,473,620,646,783,982` `emit`；`Unified.hs:123,180,188,254,259,277-287,304,320,329` `diagD` | scope / branch_id / parent_id / stop_reason / budgets / exhaustiveness，按 checkpoint | ①Execution 事件只有 `program_hash`，**未拟合候选没有 AST**；②逐 case 事件**没有 case_index**；③Render 不匹配时没有预测网格或 diff；④Joint Forward 没有独立事件，只有 `d_joint_fallback` 计数；⑤extension(3/4 槽) 与 inverse 计划共用 `parent_id="unified"`，不可区分入口；⑥逆向约束标签（count/dx/dy/x/y/color）只在 `drTrace` 字符串里；⑦旧 C `searchTransforms` 只有汇总事件，没有逐候选事件 |
| eventlog 传输 | `traceEventIO`；Python `parse_events` | 自描述 GHC eventlog；`latis-search-start/end`、`latis-train-exact` 标记 | 变长 user event 长度字段为 16 bit，**单事件不能超过 64 KiB**，不适合承载网格行；需要旁路文件 sink |
| `stage-d-*.json` 记录 | `ArcTrainOnly.hs:runConfigured` | 程序 `show`、`size_rule`、`hole_bindings`、`stage_b` 摘要、`relations`、`shapes`、`parameter_goals`（GoalAudit：kept/deferred/bindings/edges/status）、`execution_witnesses` | 程序只有 Haskell `show` 文本，**没有可解析的结构化 AST**，无法独立重放 |
| Witness | `StageDEvaluate.hs:135` `witnessesJSON`；`Relation.hs:314` `executePipeline`、`:426` `renderWitness`、`:431` `verifyRenderWitness` | 每训练对 derivation_steps（输入/输出 EmittedObject、bindings）、emissions、像素贡献、grid | 只对**最终选中程序**；候选级没有 |
| `derivation_graph.json` | `stage-*-solve` 的 `V6.graphJSON` | Front Graph 全量 | D 路径未写；本轮从 solver_record 的 `relations`/`parameter_goals` 与事件重建 |
| Grounding | `Latent/Encode.hs:15` `encode`；`Shape.hs:249` `applyDiagonalView`；`Front.hs:338-344`（`viewed`/`scenes`） | 4 连通对象、背景、ID；可选对角视图 | 搜索内部没有任何 Grounding 事件 |

## 3. 各层观测空缺与本轮处理

| 层 | 现状 | 本轮处理 | 仍不可观测（`not_instrumented`） |
|---|---|---|---|
| Grounding | 无事件 | `Front.hs main` 在 `branches` 级输出每 case 的对象摘要（来自搜索实际使用的 `scenes`，含 permutation/diagonal view）；trace-io 另用同一 encoder 配置导出完整 mask，Python 交叉核对对象 ID | — |
| Size Rule | 每轴汇总事件 | 记录中已有 `size_rule` 代表；补 `branches` 级 SizeRule 代表事件 | `Size.hs:94 synthesizeSize` 内部逐模板求值 |
| Alignment | prefix 与逐 key-pair 拒绝 | 原样复用 | `legalKey` 逐 key 拒绝只在 Graph `keyCandidates`（记录里未导出）|
| Stage A scalar holes | 每 slot 汇总 | 原样复用 | `Typed.hs:305 synthesizeTyped` 逐模板、逐常数赋值 |
| Stage B referent / VSA | 计数在 `stage_b`/`d_vsa_*` | ParameterVSA 事件 + GoalAudit 边（Confirmed/Pending）进入 Witness 图 | `Referent.hs:444 buildGraph` 节点级 |
| Stage C relation | 汇总事件 | `candidates` 级逐候选事件（AST、每 case 结果、失败原因）于 `Relation.hs:495 searchTransforms`；`branches` 级 grammar 摘要 | `Shape.hs:170 decompose` 内部 |
| Stage D inverse typed | goal 汇总 | `branches` 级逆向标签行、goal 代表 AST + binding；`parent_branch_id` 指向计划 | 模板内部首 fit 时刻 |
| Stage D extension / joint forward | 无独立事件 | 新增 `JointForward`、`Extension` 入口事件（限额由运行配置计算）；每个候选标 `entry` | — |
| Execution / Render | 每 case 无编号事件 | `candidates` 级逐 case 结果（case_index、失败阶段与原因、渲染网格 hash、diff 数）；`full` 级附预测网格 | 旧 alignment 路径 `realize` 的逐 case 网格 |
| 停止状态 | D+ `task-terminal` 由父进程补 | trace-io 写入 `run_terminal`；进程被杀时不补写，Python 标 `unknown` | — |

## 4. 插桩设计约束

1. **不新增搜索语义**：新事件只通过 `Diagnostics.traceAt level fields x`（`unsafePerformIO`，返回 `x`）发出；trace level 为进程全局 IORef，默认 0。level 0 时所有新调用点在执行前读取 IORef 后直接返回，不构造字段。
2. **D+ 默认行为不变**：`diagnostic` 在没有文件 sink 时与原实现逐语句相同；有 sink 时额外写一行 JSONL，事件内容不变。`Config`/`StageD` 记录不加字段，避免改变 `config` 文本与 `effective_config_scalars`。
3. **只给新增参数**：`tryProgram`、`goal`、`construct` 增加诊断用 `entry`/`parent` 字符串参数，只进入 trace 字段；`searchTransforms` 的 `runCases` 多返回一个惰性失败原因字符串，只在 trace 时被强制。
4. **惰性求值风险**（沿用 D+ 审计结论）：trace 字段可能提前强制本就会计算的纯值（例如 `show t`、渲染结果），不改变结果，但会把求值时间移入诊断区间；性能报告把诊断成本单列，不并入 `search_work`。事件顺序是实际强制顺序；DM/Search monad 已改为 `case` 绑定，与逻辑顺序一致。
5. **磁盘保护**：文件 sink 有 `--max-events`/`--max-bytes`，超过后丢弃并按 scope 计数；候选级可用 `--sample-candidates K` 确定性采样（按候选在本 scope 的序号）。只影响写出，不影响搜索；任何丢弃都令 `trace_incomplete=true`。
6. **崩溃可解析**：sink 使用行缓冲，每行是独立 JSON；尾部残缺行由 Python 丢弃并计数；被杀进程不补写终止事件。

## 5. 兼容风险

| 风险 | 缓解 |
|---|---|
| 修改 `Unified.hs`/`Relation.hs` 后 D0 结果漂移 | 回归：同一新 binary 上诊断 on/off、trace-io full，与 `dplus-20261026-v2` 历史 20 解 + 机制任务比较程序、全部训练预测、`search_work`；抽样旧失败题比较 `search_work` |
| eventlog 64 KiB 单事件上限 | 新 trace 事件只走文件 sink；D+ 原事件仍走 eventlog |
| 结构化 AST 解码与 `checkedParam` | replay 解码后每个参数重新经过 `checkedParam`；解码失败报告 `unverifiable` 而非猜测 |
| 旧 alignment（序列体）程序不能结构化编码 | 选中程序若无 `progTransform`，replay 只能在同进程运行 `runProgram`（trace-io 内），独立 replay 标 `unverifiable` 并给出原因 |
| `solve-single-pair` 误报 | 结果字段只用 `pair_exact`/`single_pair_fit`；事后验证在搜索完成后执行、单独字段 `posthoc_validation`，并有"开/关事后验证搜索事件 hash 相同"测试 |
| 覆盖 D+ 原始批次 | 所有输出写 `results/trace_io/`；`run` 拒绝覆盖已有 `trace.json`（`--force` 才允许，且只限 `results/trace_io` 下） |
