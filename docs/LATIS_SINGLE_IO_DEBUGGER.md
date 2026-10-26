# LATIS 单 IO 搜索诊断器：使用说明与语义

本工具观测现有求解器，不改变它：A/B/C/D 的搜索机制、DSL、prior、类型规则、Alignment、Witness 与预算都没有改动。所有可视化内容来自真实搜索事件、真实执行和真实中间状态。开工审计见 [LATIS_SINGLE_IO_DEBUGGER_AUDIT.md](LATIS_SINGLE_IO_DEBUGGER_AUDIT.md)，实测结果见 [LATIS_SINGLE_IO_DEBUGGER_REPORT.md](LATIS_SINGLE_IO_DEBUGGER_REPORT.md)。

## 1. 命令

先构建（与 D+ 相同的编译选项，单独的 outputdir）：

```powershell
./scripts/run_trace_io.ps1 -BuildOnly
```

一次完成"求解 + 记录 + 可视化"：

```powershell
python -I scripts/trace_io.py run --task results/stage_d_plus/dplus-20261026-v2/train_only/5168d44c.json --pair-index 0 --mode inspect-pair --config FullD --out results/trace_io/examples/5168d44c/inspect
python -I scripts/trace_io.py run --task results/stage_d_plus/dplus-20261026-v2/train_only/5168d44c.json --pair-index 0 --mode solve-single-pair --config FullD --out results/trace_io/examples/5168d44c/single
```

只根据保存记录离线重建页面、对照两份记录、独立重放候选（都不调用搜索）：

```powershell
python -I scripts/trace_io.py render --record results/trace_io/examples/5168d44c/inspect/trace.json --out results/trace_io/examples/5168d44c/inspect/index.html
python -I scripts/trace_io.py compare --left results/trace_io/examples/ac0a08a4/inspect/trace.json --right results/trace_io/validation/joint_forward/ac0a08a4-Combined3_4x/trace.json --out results/trace_io/validation/compare_ac0a08a4
python -I scripts/trace_io.py replay --record results/trace_io/examples/5168d44c/inspect/trace.json --candidate f7de6c42bf9d5166
python -I scripts/trace_io.py oracle-replay --record results/trace_io/examples/ac0a08a4/inspect/trace.json --ast my_ast.json --out results/trace_io/validation/oracle.json
```

底层 Haskell 子命令可以直接调用：`latis trace-io …` 写事件与记录，`latis trace-replay --task T --config C --requests R.json --out O.json` 只执行保存的 AST。`run` 的常用选项：

| 选项 | 默认 | 含义 |
|---|---|---|
| `--trace-level` | `candidates` | `summary`：只有 D+ 原事件与驱动记录；`branches`：加 Grounding、SizeRule 代表、逆向标签行、参数目标代表、Extension/JointForward 入口；`candidates`：加逐候选与逐 case 记录；`full`：再加每个已渲染 case 的预测网格、被截断提案的 AST |
| `--timeout` | 300 | 进程内搜索超时（秒）；父进程在其后 10 秒强杀 |
| `--max-events` / `--max-bytes` | 250000 / 256 MiB | 磁盘保护。超过后丢弃并按 scope 计数（驱动记录除外），`trace_incomplete=true` |
| `--sample-candidates K` | 1 | 候选级事件按候选 ID 的 FNV 哈希取模 K 保留；只影响记录 |
| `--posthoc on/off` | on | `solve-single-pair` 结束后是否在其余训练对上做只读验证 |
| `--focus-candidate` / `--focus-branch` | — | 只改变页面初始视图与 replay 选取，不进入搜索 |
| `--replay-limit` | 40 | 自动独立 replay 的候选数上限（确定性选择：选中程序、全部 fit、焦点、再按 入口/状态/原因 分桶取前缀） |
| `--kill-after` | — | 故障注入：N 秒后强杀子进程 |

输出目录只能在 `results/trace_io/` 一类新位置；`results/stage_a..stage_d_plus` 被拒绝写入，已有 `trace.json` 时需 `--force`（只限 `results/trace_io`）。

## 2. 两种模式

**inspect-pair（默认）**：载入完整 training 任务，所有训练对都参与求解约束；`--pair-index` 只决定页面默认展开哪一对。成功标签是 `train_exact`，由 trace-io 在全部训练对上重新执行程序逐格核对。

**solve-single-pair**：只把第 k 个训练对交给同一个搜索器。成功标签只能是 `pair_exact`（页面同时显示"不是 train_exact，更不是 ARC solved"）。搜索返回之后，程序才在其余训练对上运行，结果写在独立字段 `posthoc_validation`（`used_in_search=false`，`used_for_ranking_or_selection=false`）。`--posthoc off` 与 on 的结构 trace hash 相同，这是"事后验证不影响搜索"的测试依据。

两种模式都只接受 `test: []` 的 train-only 文件（Python 与 Haskell 各检查一次，后者 exit 3）；`--pair-index` 越界、网格超出 1..30 会给出明确错误（exit 2）。输出对象只出现在训练匹配与逆向 witness 中，事件里标注 "training target; never a program input"。背景、颜色、坐标、画布和对象顺序使用求解器实际的 encoder、diagonal view 与 enumeration permutation（`ARC.TraceIO.sceneOf` 复刻 `Front.frontSearch` 的同一组函数调用）。

`--config` 取 `ARC.StageDEvaluate.namedConfigsD` 中的名称。若该配置 `sdDiagnostics=False`（如 `FullD`），trace-io 将其置为 True 并在记录中写 `diagnostics_forced_on=true`；D+ 已验证诊断开关不改变程序、预测与 `search_work`，本轮回归再次核对。

## 3. 事件模型

事件复用 D+ 事件总线：原 D+ 事件（`event_source=dplus`）仍写 GHC eventlog，同时被复制到 JSONL 文件 sink；本轮新增事件（`event_source=trace`）与驱动记录（`event_source=driver`）只写 JSONL（eventlog 单个用户事件上限 64 KiB，放不下网格）。每行独立可解析，行缓冲，进程被杀时已写行保留，残缺尾行计为 `malformed_lines`，不修补。

公共字段：`sequence`（全局写出序号，即实际求值顺序）、`trace_schema_version=latis-trace-io/1`、`event_source`、`timestamp_monotonic_ns`，其余字段沿用 D+ 命名：`scope`、`kind`/`event`、`stage`、`branch_id`、`parent_branch_id`（D+ 事件为 `parent_id`）、`candidate_id`、`outcome`、`reason_code`、`reason`、`budget{name,limit,used,unit}`、`case_index`。

| 新事件 | level | 位置 | 内容 |
|---|---|---|---|
| Grounding/scene | branches | `Front.groundingTrace` | 每 case 搜索实际使用的输入/输出对象（ID、颜色、bbox、SizeSig、像素数、mask hash）、实现画布尺寸及来源、对角链接受/拒绝 |
| SizeRule/representatives | branches | `Front.sizeStep` | 每轴代表 AST、binding、denotation、case-relative 类；对象叶子第二轮是否触发及原因 |
| LegacyRelation/grammar、evaluated、budget | branches/candidates | `Front.relationPath`、`Relation.searchTransforms` | 旧 C 语法参数；每个候选的结构 AST 与逐 case 结果；预算截断时未访问的已枚举候选数 |
| Composition/plans、inverse_rows、proposals | branches | `Unified.searchUnified` | 计划列表、每计划的逆向标签行（源对象、count/dx/dy/x/y/color）、提案数与截断 |
| TypedParameter/representatives、cache_hit | branches | `Unified.goal` | 代表的 Typed AST、binding、各 case 值、是否匹配全部标签、case-relative 类、VSA root/union、Confirmed/Pending 边、deferred |
| Extension/entered、JointForward/entered、completed | branches | `Unified.searchUnified` | 两个独立入口；上限由当次运行的 `sdBudgetMultiplier` 计算（16m 模板、12m count 代表、180m 程序；extension 为 `sdCombinationBudget+1`） |
| Execution/proposed、case、completed、truncated、duplicate | candidates | `Unified.tryProgram` | `entry ∈ {inverse_typed, extension_forward, joint_forward}`、父计划、结构 AST、逐 case 结果（执行/渲染拒绝原因、grid hash、diff 数；full 级附预测网格）、截断时的预算 |
| Run/entered、terminal | 总是 | `ARC.TraceIO` | 运行元数据；终止状态（被杀进程没有终止记录，页面显示 unknown） |

**ID**：候选结构 ID = Haskell `show` AST 的 FNV64（与 D+ `program_hash` 相同；不是无碰撞证明）。参数代表另有 `param_id`。`case_relative_class` = 训练 case 上值向量的哈希，只表示"当前训练等价"，页面明确不当作全域等价。分支 ID：`task`、`size.*`、`grounding.caseK`、`legacy`、`legacy.search`、`unified`、计划哈希、目标哈希、`unified.extension`、`unified.joint`。

**阻断**：`first_rejection` 是首个有证据的阻断事件；`terminal_blocker` 是终止前最后一个阻断事件；`all_blockers` 按 (阶段, 类别, 原因) 分组并保留首个序号，不会被后续失败覆盖。Alignment 的 `candidate-prefix` 只在 BudgetCut 或空合法前缀时算阻断。另外用 `run_stage_d_plus.failure_evidence` 在同一批 D+ 事件上计算 D+ 兼容标签。

**计数口径**：漏斗中的每个计数都带单位（结构候选、带完成记录的候选、执行后像素不符、执行/渲染拒绝、被预算截断的提案、D+ 报告的 deferred 参数代表），不同单位不相加。`not_entered` = 运行正常结束且该阶段没有任何检查点；进程未正常结束时为 `unknown`。全任务穷尽性恒为 `Unknown`，因为没有全局有限 ledger。

## 4. 产物

| 文件 | 内容 |
|---|---|
| `search_events.jsonl.gz` | 全部真实事件（无损 gzip，校验后删除明文） |
| `solver_record.json` | 状态、程序 `show`、选中程序的结构 AST、`search_work`、counters、size rule、relations、参数目标、trace 行、事后验证、诊断与 sink 成本 |
| `grids.json` | 每个训练对的原始网格、4 连通编码、搜索实际对象、对角链、目标编码；Predicted 只在选中程序真实执行时给出（含 EmittedObject、重新编码对象、diff 坐标） |
| `witnesses.json` | `StageDEvaluate.witnessesJSON` 的 Transform/Render witness，及 relations、parameter goals |
| `candidates.json` | 全部结构候选（AST、入口、父分支、逐 case 结果）与参数目标 |
| `replays.json` | 独立 replay 结果与核对结论（`match`/`partial_match`/`mismatch`/`unverifiable`） |
| `summary.json`、`trace.json` | 运行摘要、漏斗、阻断、分支、D+ 兼容标签、独立 witness 检查、未插桩清单、文件哈希 |
| `index.html` | 离线页面（数据与脚本内嵌，无 CDN/服务器/远程 API） |
| `trace.dot` | 阶段与 fit 候选的 Graphviz 摘要 |

## 5. 页面

七个视图：概览（结果标签、记录完整性、阻断证据、事后验证、D+ 标签、replay 与 witness 复核、未插桩清单）；网格/对象（Input/Target/Predicted/Diff，ARC 0–9 调色，行列坐标，对象 bbox 高亮，4 连通与搜索视图切换，EmittedObject 与重新编码对象分栏；Predicted 来源可切换为选中程序、当前候选的搜索时网格或独立 replay，缺失时显示 not_available）；搜索流程（按事件序号排布的阶段条带与可展开计数、预算、首阻断）；候选浏览（按层/入口/状态/原因/槽数/参数深度/ID/文本过滤、分页，详情含结构 AST、逐 case 结果、同计划参数目标、逐步 replay 前后对象集与最终 diff）；参数目标（Feature/Const → Typed AST → Param Fit，训练等价不同 AST 组，Confirmed 实线/Pending 虚线）；推导/Witness（输入对象 → Select → 步骤 → EmittedObjects → 像素，覆盖与同色相连提示）；原始事件。

页面只读：过滤生成新数组，不修改内嵌记录（浏览器自测核对内嵌文本长度不变）。为控制文件大小，所有候选与事件都以摘要行内嵌；完整详细记录只内嵌确定性优先的前 2500 个候选（选中程序、fit、replay、焦点、再按搜索顺序的已执行候选），其余在页面顶部明确标出并指向 `candidates.json`。地址栏 `#tab=grid&candidate=<id>&source=replay` 可直达视图，`#selftest` 运行浏览器自测并把 JSON 报告写入 DOM。

## 6. Replay 与 oracle

`trace-replay` 解码结构 AST：每个参数重新通过 `checkedParam`，未知构造或类型错误直接报 `unverifiable`/decode error。执行用 `Relation.executePipeline`（Pipeline/MigratedBody）或 `emitObjects`（旧 C），渲染用 `renderWitness`，输入场景用与搜索相同的 encoder/view/permutation，输出画布取搜索记录的实现尺寸（Grounding 事件），不读目标尺寸。核对规则：搜索中执行过的 case 比较 outcome 与 grid hash（`match`/`mismatch`）；搜索中因早停或预算没有执行的 case 只能是 `unverifiable`（replay-only），所以早停的失败候选通常是 `partial_match`。选中程序若是旧 alignment 序列体（无结构 AST），独立 replay 为 `unverifiable`，其预测来自 trace-io 进程内的 `runProgramEvidence`，并另有 D+ 同款 Python witness 检查。

`oracle-replay` 执行手写 AST，结果固定标注 `oracle_diagnostic_only`、`counts_toward_blind_search=false`、`enumerability=unknown`。

## 7. 未插桩（not_instrumented）

`Typed.synthesizeTyped` 逐模板与常数赋值（Size、Stage A 标量 hole、D 参数 goal 内部）；`Front.legalKey` 逐 key 拒绝；`Referent.buildGraph` 节点级；`Shape.decompose` 内部；旧 alignment `realize` 的逐 case 网格。页面概览列出源码位置。这些层只有 D+ 汇总事件，不能据此推断内部尝试了哪些候选。
