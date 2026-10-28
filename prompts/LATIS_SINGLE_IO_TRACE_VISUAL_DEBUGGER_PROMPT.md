# LATIS：单 IO / 单任务可视化搜索诊断器（Single-IO Search Trace & Visual Debugger）实现提示词

你是 LATIS 仓库的编码模型。请在当前 Stage D+ 代码上实现**真实可运行、可重放、可审计的单个训练 IO 搜索诊断工具**，让研究人员能够回答：一个具体 ARC 案例中，输入被如何编码，哪些程序候选实际生成、求值、拒绝、延迟、接受，哪一层首次阻断了合理候选，以及输出网格为何匹配或不匹配。

本轮目标是**观测现有求解器**，不是改变其算法：不得重写 A/B/C/D 的搜索机制、DSL、prior、type rules、Alignment、Witness 或预算。必须使用真实搜索事件、真实执行与中间状态生成可视化，禁止以概念流程图冒充执行轨迹。全部文档和报告使用**简体中文**。

## 0. 开工审计：哪些能力已有、哪些缺失

先读源码以及 `docs/LATIS_STAGE_D_REPORT.md`、`docs/LATIS_STAGE_D_PLUS_REPORT.md`、`docs/LATIS_STAGE_D_PLUS_AUDIT.md`，审计并复用：

- 已有的逐任务入口（如 `stage-d-solve`、train-only runner，名称以代码为准）；
- Stage D+ 的结构化 `search_events.jsonl.gz`、`search_diagnostics.json`、`diagnostic_per_task.csv`、branch/checkpoint 事件；
- Stage C/D 的 `derivation_graph.json`、Transform Witness / Render Witness、Program AST、Candidate / VSA 与 Deferred Frontier；
- 原有的 Grid / Object encoder、4-connectivity 与可选局部 diagonal view；
- Stage D+ 已修复的 Haskell 惰性事件延迟问题：确保新增日志仍能在超时/进程失败前尽可能刷出。

**不要重复创建第二套诊断模型。** 对尚无结构化数据的旧 A/B/C 分支，采用局部增量插桩，并在覆盖矩阵里说明哪些细节尚不可观测。先提交 `docs/LATIS_SINGLE_IO_DEBUGGER_AUDIT.md`，记录源码调用点、现有数据结构、观测空缺与兼容风险。

## 1. 精确定义两种模式：避免“单 IO 成功”误报“解题成功”

必须区分：

### 模式一：`inspect-pair`（默认，推荐）

载入一个完整的 ARC training 任务（多个 train IO）；**求解约束仍使用全部训练对**，仅对指定第 `pair-index` 个 IO 展示详细网格、对象和每步执行画面。候选能否成为 train-exact，仍须重新执行并在全部训练对上逐格通过。

### 模式二：`solve-single-pair`（研究诊断模式）

只选择某一个 `train` IO 构造临时任务，使用同一真实搜索器进行单对案例合成，并输出该 IO 上的程序搜索过程。结果只能标为 `pair_exact` 或 `single_pair_fit`，绝不能称为原任务 `train_exact`，更不能称为 ARC solved。可在单独的**事后、只读验证阶段**用原任务剩余 train IO 评估泛化，必须明确这一步没有参与合成、排序、调参或候选选择。

两种模式都必须保证：

- 训练文件中只能包含官方 `train` 对，必须复用 Stage D+ 的 `test: []` / non-empty-test 拒绝守卫；不将 ARC test 输出加载到 solver 中。
- 输出训练目标只能用于既有训练匹配；**不能**将输出对象、颜色或目标尺寸偷偷作为推理时输入 Feature。
- `pair-index` 越界或输入网格非法时给出清晰错误。
- 原始任务的背景、颜色、坐标、画布尺寸与对象排序遵循当前实际代码语义。

## 2. CLI 与复现接口（示例，可按仓库约定调整）

需要提供单条命令即可完成「求解 + 记录 + 可视化」：

```powershell
./build/latis.exe trace-io --task results/stage_d_plus/train_only/<task-id>.json --pair-index 0 --mode inspect-pair --config FullD --out results/trace_io/<task-id>/inspect
./build/latis.exe trace-io --task results/stage_d_plus/train_only/<task-id>.json --pair-index 0 --mode solve-single-pair --config FullD --out results/trace_io/<task-id>/single
```

若现有 runner 由 Python 调度 Haskell 子进程，则沿用现有架构；可用 `python -I scripts/trace_io.py ...` 作为用户入口。不要为照搬命令名破坏已有 API。另提供：

```powershell
python -I scripts/trace_io.py render --record results/trace_io/<task-id>/inspect/trace.json --out results/trace_io/<task-id>/inspect/index.html
python -I scripts/trace_io.py compare --left <trace-A> --right <trace-B> --out <dir>
```

`render` 必须能**只根据保存的记录离线重建可视化**，不重新运行 solver；`compare` 用于对照两种搜索配置，同样不调用 solver。所有真实命令写入 README 并提供可复制的成功示例。

## 3. 分层真实搜索 Trace：必须覆盖完整调用链

尽量使用现有事件总线和 Branch ID，覆盖以下阶段（仅在实际触发时产生事件）：

1. **输入与 Grounding**：原始 Grid、编码后 Scene、背景、4 连通对象、颜色、bbox、Shape mask、SizeSig、集合 Cardinality、可选 diagonal view；对象源 ID 可追溯。
2. **Size Rule**：输入 Feature、目标尺寸训练约束、候选表达式、Bindings、同训练签名不同 representatives、拟合/失败、第二轮对象 Feature 是否触发；说明为何未触发。
3. **旧前端 / Alignment**：RankAlign、目标对象与输入对象候选关联、见证与排除原因；区分 cardinality 阻断、颜色不一致、Grounding/Sort 不合法。
4. **Stage A**：Typed Hole / Scalar grammar，Bool/Mod/If，模板实际展开、参数来源（Feature/constant）、类型检查、训练 fit、全局预算和 per-slot 预算、counterfactual representative 保留。
5. **Stage B**：参数/标量指称、VSA 结构共享、语义类、Confirmed/Pending/Rejected 泛化边、调度、实际执行的 DAG 求值；区分“没有建图”和“图构建后没有命中”。
6. **Stage C**：Shape 识别与分解、对象尺寸 Feature、Relation Transform 枚举、复制/合并/裁剪/重着色、为何某个谓词或对象关系非法；不要用训练目标推理时定位对象。
7. **Stage D**：Unified Pipeline skeleton、非恒等操作/操作槽数、Typed 参数逆向约束与**Joint Forward fallback 分成两个显式入口**、参数表达式深度、复制绑定时的对象作用域、组合候选、Deferred Frontier、最终 emitObjects。
8. **执行 / Render / 校验**：每一步发射对象集、重叠顺序、尺寸、越界、同色相连、Grid 重建、Grid diff、与每个训练 IO 的精确匹配结果；仅在确实执行后输出中间画面。
9. **停止状态**：首解、继续搜索、无 fit、截断、Deferred 尚未消费、超时、崩溃，保留所有 branch 终止原因；`NoFitYet` 不代表搜索穷尽。

对于某个模块的内部子项确实无法在本轮观测，允许写 `not_instrumented` + 精确源码位置；**禁止虚构 candidate、pruning reason、已尝试深度或完整搜索范围**。

## 4. 事件格式与完整性

给出向后兼容的 schema 版本 `trace_schema_version`，尽量从已有 Stage D+ 事件适配：

```json
{
  "event_id": "...",
  "sequence": 123,
  "timestamp_monotonic_ns": null,
  "stage": "typed_parameter | joint_forward | composition | render | ...",
  "kind": "entered | proposed | evaluated | fit | rejected | deferred | budget | terminal",
  "branch_id": "...",
  "parent_branch_id": null,
  "candidate_id": "...",
  "candidate_ast": null,
  "candidate_type": null,
  "scope": {"case_index": 0, "object_source_ids": [], "axis": null},
  "outcome": "fit | no_fit | invalid | truncated | unknown",
  "reason_code": "...",
  "budget": {"name": "...", "limit": null, "used": null, "unit": "..."},
  "witness_refs": [],
  "grid_snapshot_ref": null
}
```

这是目标字段示意，最终结构须与现有事件模型衔接，不必保持字面命名。具体约束：

- 事件具有稳定顺序和 branch parent 关系；候选的结构 ID 与 case-relative SemanticClass ID 分开，不将“当前训练等价”误标为全域等价。
- 事件必须能够链接 Program AST、参数 Binding、Type/Sort Witness、Relation/Render Witness、Grid Snapshot；没有证据就写 `null/unknown`。
- 至少记录 `first_rejection`、`terminal_blocker`、`all_blockers`，避免最后一个失败覆盖早期失败。
- 逐级记录 visited、considered、evaluated、fit、rejected、deferred、truncated、timeout 的口径和单位；`Exhausted` 需要可验证有限全集与 completion ledger，否则为 `Unknown`。
- 允许 `--trace-level summary|branches|candidates|full`。`full` 逐候选记录真实事件；对海量任务可设磁盘保护阈值与确定性采样，但**采样只影响记录，不得改变搜索**；每次丢弃记录必须计数并显著标记 `trace_incomplete=true`，默认不允许静默丢弃。
- 提供 `--focus-branch` 或 `--focus-candidate`：仅改变可视化筛选/可选择的日志内容，不得将目标候选插入搜索、提前提升优先级或影响成本。
- 确保超时、RTS 退出或异常时先前已完成检查点的事件能够独立解析；末尾缺失事件表示 `unknown`，不能补写假终止状态。
- 搜索性能指标与诊断 IO/序列化成本分别计量；诊断打开/关闭时，真实候选选择和旧 search_work 应尽可能逐项一致；若出现差异，必须调查。

## 5. 可视化：P0 必须交付实际可打开的离线 HTML

生成可离线打开的 `index.html`（可有相邻本地资源，但不依赖联网 CDN、运行中的服务器、远端 API 或外部数据库），至少包含：

### 5.1 Grid / Object Inspector（核心）

- `Input / Target / Predicted / Diff` 四栏网格，ARC 0–9 颜色按统一图例；最大 30×30，清晰网格线与行列坐标；可切换训练案例。
- 未找到候选或没有完成 Render 时，`Predicted` 显示 `not_available`，不能画一个看似真实的预测。
- 每个对象可高亮 bbox、source IDs、颜色、SizeSig、局部 ShapeMask、绝对坐标；显示 4 连通编码与可选对角 view 的差异。
- 点击一个**真实已执行**的候选时，按 Pipeline 步骤展示中间网格/发射对象集合（前后对照），最终网格逐像素差异数量及差异坐标；渲染前的 `EmittedObject` 与重新编码后的 `Object` 分开展示。

### 5.2 Search Pipeline Timeline / Funnel

- 将阶段 `Grounding → Size → Alignment → Scalar/Typed → Referent/VSA → Relation → Unified/Joint → Render → Verify` 按实际事件依赖呈现。分支未进入应显示 `not_entered`，而非 `failed`。
- 每阶段可展开：进入次数、候选数、实际评估数、fit、reject、deferred、budget、首个阻断原因；不同计数单位不得直接相加。
- 显示首解时间、最后检查点、超时与部分工作量下界；没有可靠时间点就不显示假时间轴。

### 5.3 Candidate Explorer

- 可按阶段、类型、模板、深度、状态、失败原因、Branch ID 过滤并搜索；选择候选显示结构化 AST、Bindings、cost、witness、每训练 IO 求值及 Grid diff。
- 能定位“一个拟合的参数为什么没有构成完整程序”、“一个程序为何被过滤/延迟”、“它有没有真正 Render”。
- 训练等价候选必须展示不同 AST 身份以及 VSA Union 关联；仅展示采样前缀时明确不完整。

### 5.4 Derivation / Witness Graph

- 以 DAG/可折叠树展示 `输入对象 → Select → Transform → EmittedObjects → RenderedPixels` 的来源；显示多个发射物体与渲染后同色连通或覆盖的关系。
- 对参数候选，展示 `Feature/Const → Typed AST → Param Fit → Pipeline`；Confirmed / Pending 用不同线型与说明，不得将 Pending 画成全域证明。
- 现有 `derivation_graph.json` / Witness 优先复用；图大时默认聚合/折叠，不要求展示数万个 DOM 节点。

可附带 `trace.dot` / `trace.svg` / Mermaid 摘要供论文与审计截图使用，但**静态 HTML 是 P0，不得只交 Mermaid 文本或一张静态流程图**。

## 6. Replay 与双配置比较

- 从保存的 AST/训练输入对指定 candidate 进行独立只读执行，并核对保存的中间 Grid/Witness；报告 `match / mismatch / unverifiable`。不重跑整个搜索来冒充 replay。
- 提供双记录比较：相同 task、pair、scope 的 `FullD` vs `Combined3_4x`、或诊断 on/off，按结构候选 ID 和阶段事件汇总显示新增访问深度、预算击中、首阻断迁移、候选 fit 与实际执行差异。
- 两份记录若来源于不同 binary、run_id、训练子集或预算，显著提示 `not_identical_run_conditions`；对比不自动声称算法加速或因果结果。
- **P1 可选**：单独的 `oracle-replay`（手写参考 AST 注入执行器）及结构候选可枚举性定向检查。必须标注 `oracle_diagnostic_only`，不能把该候选计入 blind search 或 solve rate；缺乏可枚举性证明则 `unknown`。

## 7. 正确性、回归和性能测试（强制）

1. **单 IO vs 完整任务隔离**：构造两个训练对，同一候选只匹配第一对。`solve-single-pair` 必须返回 `pair_exact`，`inspect-pair` / 全训练必须拒绝其作为 `train_exact`；事后验证不影响搜索选择。
2. **真实轨迹一致性**：选一例已解任务与一例未解任务（建议从 `5168d44c` 与 `ac0a08a4`、`ed36ccf7` 中按当前仓库状态实际确认），核对 CLI 输出、保存 AST、执行 Grid、Trace UI 的内容一致；不得硬编码任务结果。
3. **候选拒绝可追溯**：人为构造非法颜色、SizeSig 错配、非唯一 Selector、Mod 除零、越界渲染、参数 fit 但 final Grid mismatch、budget truncated、Deferred 未完成，各能在事件中找到准确 stage、branch、reason。
4. **Forward 回退可见**：至少一个实例确实进入 Joint Forward 并展示它的语法深度、16 templates / 12 count reps / 180 candidates 等上限（值从运行配置读取，不能硬编码），与 inverse Typed Goal 严格区分。
5. **UI 自动测试**：Grid 绘制与像素 diff 准确；交互过滤不改变原始记录；损坏/缺字段 JSON 给予错误或 `unknown`；HTML 无网络访问也能使用；图没有交叉引用死链。
6. **日志损失可见**：trace cap、采样、超时、强杀、IO 写入失败至少覆盖可控测试，验证不误称 exhaustive、不会静默丢失采样信息，已写 events 可解析。
7. **回归**：诊断关闭与原 Stage D+ 完全一致；诊断 on/off 对历史 20 道真实 ARC train-exact 和历史机制任务比较最终程序、全部训练预测、`search_work`，对旧失败任务进行抽样；不改变原语义或已解决集合。
8. **确定性**：同一二进制、任务、配置、pair 在不截断日志时结构事件顺序、候选 ID、Trace hash 稳定（忽略真实时间、run ID、路径、性能数据）；报告 AST 与深度由程序结构算出，不依赖描述文字。
9. **性能**：测量 normal / summary / full 的运行时间、磁盘大小、事件数及内存；设置合理安全阈值并报告真实代价，不将 trace 的字符串序列化计入旧 `search_work`。

## 8. 交付文件与验收门槛

至少交付：

```text
docs/LATIS_SINGLE_IO_DEBUGGER_AUDIT.md
docs/LATIS_SINGLE_IO_DEBUGGER.md
docs/LATIS_SINGLE_IO_DEBUGGER_REPORT.md
scripts/trace_io.py                    # 示例名；实际按仓库架构
results/trace_io/examples/<task-id>/
    index.html                        # 可离线打开并交互
    trace.json                        # 脱离求解器仍可 render
    search_events.jsonl.gz            # 真实搜索事件
    candidates.json                   # 结构 AST + provenance，允许大文件单独引用
    grids.json                        # 原始 Grid 与执行中间态，仅真实执行值
    witnesses.json                    # Transform/Render/Type/Alignment 关联记录
    summary.json                      # 原始执行状态、预算、缺失/采样统计
    trace.dot / trace.svg             # 可选辅助可视化
results/trace_io/validation/           # 回归、单 IO/全训练隔离、UI、超时/采样测试
```

`index.html` 必须给出研究人员能实际操作的一套界面，而不是占位截图。网页必须显示真实的失败分支和某一具体候选的完整可用证据；如果某些内部阶段尚未有插桩，需明确说明原因。

报告必须回答：

- 现有 D+ 具备哪些日志功能？本轮实际补充了哪些单 IO、候选及可视化能力？
- 选择哪一条**真实已执行的候选路径**，从编码到最终 Render 的每个阶段发生了什么？
- 一个真实失败任务的**首个有证据的 blocker** 是什么？未观测到的分支有哪些？是否存在 Deferred 或预算截断？
- 同一任务下 `solve-single-pair` 的 `pair_exact` 与 `inspect-pair` 的 `train_exact` 有何区别？
- Trace 是否改变了搜索行为、成本或结果？具体回归证据是什么？

### P0 / P1 优先级

**P0 必须完成：** 两种单 IO 模式、端到端真实结构化事件、稳定 branch/candidate 链接、Grid Inspector + Pipeline Timeline + Candidate Explorer 的离线 HTML、执行重放、负控制、20 题旧解回归、完整说明和至少一例已解/未解样例。

**P1 可延后：** 大规模 Witness 图的高级交互、双配置可视化比较、Oracle AST 独立注入、论文级 SVG 布局优化。但基础的 Witness/AST 数据关联必须是 P0。

### 禁止事项

- 不得为了可视化发明程序候选、伪造拒绝理由、把 `no_solution` 归因为“DSL 不可表达”。
- 不得将 ARC test 输出或 heldout 答案注入训练求解；不可将单 IO fit 冒称整题 solved。
- 不得只生成最终答案图片而没有程序搜索事件；不得用纯文字汇总代替真正交互可视化。
- 不得为采集日志改变搜索预算、候选排序、优先级或提前停止条件。
- 不得覆盖 Stage C/D/D+ 的原始实验批次。

**验收核心：** 对一条真实 ARC 失败任务，我们能否打开 `index.html`，选择一个 Branch/Candidate，看到它真实访问过哪些层、对应的类型/参数与对象几何、哪一步首次失败、哪些预算或延迟候选尚未探索，并能用原始 JSON 与程序执行独立复核？只有实现这条完整证据链，本轮才算完成。
