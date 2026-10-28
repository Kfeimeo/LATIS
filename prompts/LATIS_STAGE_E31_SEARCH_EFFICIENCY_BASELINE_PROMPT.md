# LATIS Stage E3.1：Selector 预检查、惰性 Shape MDL 与可信实验基线

> **交给编码模型执行的工程与实验任务。** 请先审计现有实现，再按本提示词完成编码、测试、复现与报告。使用**简体中文**撰写文档。不要只交设计方案或伪代码；要交可运行实现、完整原始实验数据及可独立重算的报告。遇到实际源码与报告不一致，以源码审计为准，并将差异列入报告。

## 0. 背景、问题与范围

项目为 LATIS（Haskell 符号合成 / PyTorch 神经部分）。本任务只优化 **Stage E2–E3 已实现的 Region 搜索**，暂不进入 Output-first、跨输出抽象指称、CountColor/ArgMax、通用 Region 关系或神经模型训练；不得以新增 ARC 专用规则提高解数。

依据 `docs/LATIS_STAGE_E2_E3_REPORT.md`（请先核实实际路径）及 `results/stage_e2_e3/e23-20261027-main/`：

- E2–E3 400 题 train-only：`FrozenE01=22/400`、`E2Only=26/400`、`FullE3=26/400`，4 个 Region 新解为 `1c786137`、`2dc579da`、`5582e5ca`、`d9fac9be`；旧 22 解不丢失。
- `FullE3` 的 Region 执行记录：`execution_invalid=430701`、`no_fit=11759`、`fit=4`；主要无效原因据报告为 `Unique` 选择器非唯一。这些指标首先应拆解成**选择器基数失败/其他执行错误**，不能把所有 invalid 都归因于选择器。
- 安全剪枝已存在且有 `DependencyWitness`：`FullE3` 执行 `442464`、剪枝 `98432`；关闭既有剪枝执行约 `535531`。**必须保留这套机制及跨区域数据依赖负控制。**
- Shape MDL 当前没有带来 ARC 解数或候选选择收益，却有明显开销：399 道共同完成题的配对墙钟 `FullE3≈3138s`、`FullE3_NoMDL≈2483s`，峰值 live heap 约 `1.21GB` 对 `456MB`。现有 `NoMDL` 不是“不构建 Scene”，需区分构建、Shape AST 搜索、排序及记录开销。
- **上次正式冻结二进制之后有两项未全量复验的修补**：Region 首解 `latis-train-exact` 事件缺失；`Scene.sceneFromView → bestShape` 的 `c_rect` 先前被传为 0，之后以有界 `minimalCover` 修复。旧实验的 `c_rect=0` **无效**，不能引用旧批次作为矩形覆盖成本证据；更不能预先认定修补只改变记录、不影响排序。
- 曾在 8 workers 下出现 `484b58aa` 的 watchdog 超时；单 worker 重放旧冻结二进制成功完成。计时、资源与并发要严格记录。
- 报告否定了固定的“大 Region 优先”启发式；跨 View 广度调度在部分机制任务非常有效，但不普遍最优。本阶段可尝试**候选数/选择性优先**，必须是独立可关闭的调度消融，不能悄悄改变既有候选宇宙。

**本阶段最重要的验收**：对当前有限 TSL 的所有合法候选，减少无效执行与昂贵几何成本，同时证明语义不变、预算/早停含义明确，使用修补后的单一可追溯二进制重跑正式实验。新解不是强制 KPI；正式目标是可信效率与正确性。

## 1. 实施前审计：必须交付可验证清单

先定位并列出实际函数、数据类型和调用链（不要凭报告猜名称），至少覆盖：

1. Scene View 生成与 `sceneFromView`、Shape MDL `bestShape`、`minimalCover`、其候选排序/`c_ast`/`c_rect` 消费点；区分哪个数值用于排序、报告、Witness。
2. `RegionTree` / `Partition` 生成，具体 Selector AST、`Unique`/集合选择的执行语义，`ContentFirst` / `RegionSearch` 的触发条件；`PreserveExcept`、`CropRegion`、`StampAtMarkers` 等动作是否存在条件作用域。
3. `GoalLedger`、`rcQuantum=6`、`rcExecutionBudget=2400`、Deferred/Resumed、预算计数、first-fit-stop，具体在何处消耗“执行次数”；区分**语法枚举 / Selector 求值 / 真实动作执行 / 有证据跳过**。
4. 当前安全剪枝的调用点与 `DependencyWitness`，不能让新的预检查伪装成原来的安全剪枝。
5. `latis-train-exact` 事件路径、首解时间统计、单任务 trace 和重放脚本、二进制/源码快照和 manifest 的固定方式。
6. 实际 `ShapeCost` 比较的 key（是否涉及 `c_rect`、状态 `ProvenOptimalInUniverse` / `BoundedBest`），以及 `NoMDL` 与 MDL-enabled 的程序顺序差异。

在 `docs/LATIS_STAGE_E31_AUDIT.md` 中输出：功能图、阈值与单位、未覆盖的边界情况、旧 E2/E3 正式二进制哈希、评测后修补的源码状态。**先审计再修改**。

## 2. P0-A：Selector 输入侧预检查（最大优先级）

### 2.1 语义与缓存

将“生成完整动作程序并执行全部训练案例，最后才发现 `Unique` 非唯一”的流程改成：先在输入侧评估 Selector 的静态/动态前置条件，将无效的 `(view, region-tree, selector, case-context)` 直接阻止进入需要它的动作候选。

定义概念接口（实际签名自行适配 Haskell 代码）：

```haskell
precheckSelector
  :: InputOnlyContext
  -> RegionSelector
  -> SelectorCheck

-- ValidSelected / InvalidEmpty / InvalidNonUnique / InvalidOther
-- DeferredUnknown（预检查无法证明时，保留原执行路径）
```

**语义要求**：

- `Unique` 必须恰好选中一个 Region；空集、平局、多于一个均按**当前执行器的真实语义**处理，不得擅自添加稳定排序或任意 tie-break。
- 一般 `NonEmptySet`、`Root`、集合聚合、条件分支等不一定要求唯一；不能将全局 `Unique` 预检查硬套到所有选择器。
- 若某个 Selector 只在部分 case、某个 program 分支或某个局部作用域中被求值，预检查只能覆盖该语义作用域；不能因为未执行分支上的 Selector 不合法，就拒绝整个合法程序。
- 跨多个训练 case 必须共享同一个 Selector AST，但各 case 的选择结果/基数可不同；只有在**该动作必定调用选择器的全部适用案例**中可证明失败，才能安全跳过该动作程序。
- 预检查仅使用**训练输入的 Scene/View/Region Tree**、已有的类型约束和已定义的输入侧规则；不可用目标网格、测试输出或 task ID 判断选择器有效性。后续目标约束式 `DependencyWitness` 继续独立运作，不能混淆两种证明。
- 对于非唯一、空集、错误坐标框架、执行作用域不明确等情况，分别记录结构化原因；不可判定返回 `Unknown` 并进入原执行器。对含隐式效果或重建 Region 的程序，首先做类型/作用域排除，不应误剪。
- 以精确的 AST、View 参数、Scene 假设、Region Tree/partition identity、case、环境 binding、作用域及适用语义作为缓存键；**不得仅按形状、区域面积、程序文本或训练等价签名合并不同内涵的 Referent**。缓存的内容必须携带结果与来源 Witness；受输入/环境变化时失效。
- 原本无效的程序依然属于**固定语法宇宙**；记作 `PrecheckedInvalid` / `skipped_by_selector_precheck`，不能冒充从未枚举，也不能作为 accepted candidate。

### 2.2 不改变搜索的正确性

在可完整枚举的小宇宙中设定 `firstFitStop=False`、无预算截断，逐一比较 `PrecheckOn/Off`：

\[
Accepted_{On}=Accepted_{Off},\quad
RejectedAsInvalid_{On}=RejectedAsInvalid_{Off}
\]

针对每一个相同 AST，预检查的 Invalid 结果必须与不启用预检查时执行器的 Invalid **语义等价**；`Unknown` 必须原样回退，不允许假装穷尽。

在实际有界预算下，因为提前跳过无效执行会改变可达前缀，首次 Fit 的 AST 和顺序可能不同；不要要求有预算时逐候选曝光完全一致。必须报告 `(enumerated, prechecked_invalid, dependency_pruned, executed, deferred, remaining)`，并明确工作量计数如何变化。

### 2.3 必须覆盖的测试

- 单案例唯一 / 平局 / 空集；多个案例中部分 invalid；背景视图改变唯一性；对象/Region 多层归属；带环境 binding 的同一 Selector；Root、NonEmptySet 不受误筛。
- 输入 case 具有不同的 Region 数/尺寸/背景，但共享同一 Selector AST；不同合法 View 的缓存不能串用；候选树重建后不能复用错误缓存。
- 一个条件分支中未被执行的无效 Selector；有递归分区或改变局部作用域的程序；跨 Region `StampAtMarkers` 永不因局部独立假设被误剪。
- 原有 DependencyWitness 的安全差分与所有旧 26 解回归。
- 小宇宙完整 `PruneOn/Off × PrecheckOn/Off` 四组合差分，接受程序集合一致，同时审计跳过原因和执行计数。

## 3. P0-B：Shape MDL 按需计算、精确缓存与成本修复

### 3.1 分离三类代价

必须区分：

1. **Scene / View / Region Tree 构建成本**：对输入、对象列表、余像素、分区、邻接与 Witness 的必要计算。
2. **Shape AST / 几何成本计算**：`Rect`、无交并 `⊎`、差 `\\` 等的有界 `bestShape`，可证明的 `minimalCover` / `c_rect`，证明与缓存。
3. **搜索目标函数与排序成本**：哪些优先级实际依赖 Shape MDL；纯日志与可视化不应该强制所有任务预先计算完整 MDL。

沿用已有精确 PixelSet 和坐标帧。按需计算：只有当某条搜索分支**实际要求** MDL 排序/比较，或用户打开详细审计/trace、明确请求 `c_ast/c_rect` 时才计算；其他时保留 `NotComputed`，不能填 0。

- 若 MDL 是候选排序的必要输入，则在比较前必须求值到足以保持原有排序语义；不允许以 `Unknown`、0、低成本估计偷偷改变既有排序却声称“等价优化”。若希望改成不用 MDL 的调度，需设为**显式独立配置**。
- Shape MDL 枚举有严格预算，不要在缓存命中、阶段切换或 trace 输出时被隐式重复执行。缓存至少包括精确 Shape mask/标准局部坐标、Shape DSL 版本及允许的操作集合、几何成本权重、分解预算/最优性要求、必要的坐标框架。`ProvenOptimalInUniverse` 与 `BoundedBest` 不能混用，缓存低预算 Bounded 不能作为高预算 Proven 的证明。
- 对同一形状平移后的共享，只能在成本具有平移不变性且 Witness 有合法坐标变换时启用；绝对坐标表达式成本不可默认为平移不变。
- 不可在日志中继续把 `c_rect` 记 0：未计算 = `null/NotComputed`；空 Shape 与有效 0 成本明确区分。`c_rect` 与 `c_ast` 同时保留；前者是矩形覆盖数（可重叠），后者是含无交并/差的 Shape AST 成本。不得把二者当作相同的最优性概念。
- 对已有评测后 `c_rect` 修补进行严格审计。**如果 `c_rect` 改变 `bestShape` 的排序/选择，必须将它定性为算法行为变化，并重新报告相关消融，不能声称仅修复日志。**
- 对有界小 Mask，使用独立参考算法验证成本、证明状态、并列最优候选保留；测试 Shell（两矩形之差）、十字（覆盖 2 矩形 vs 不交矩形 AST 3 块）、平移、空 Mask、预算截断、不同 mask 同 hash 的模拟碰撞、不同成本配置。

### 3.2 内存与生命周期

- 不许将全部候选 Shape AST 和 Witness 随任务结果长期持有，特别要检查 Haskell 惰性 thunk、大型日志闭包、hash-cons DAG 生命周期以及分区树父节点引用。
- 以每题/每 View 有界缓存为主，按需物化和可控驱逐；不可用无限全局缓存伪装本阶段内存改善。
- 对最耗时/内存的 `a64e4611`、`50846271`、`3631a71a`、`780d0b14` 做内存/GC/缓存命中率追踪。
- 输出分项计数：`scene_build_ms`、`mdl_compute_ms`、`minimal_cover_ms`、`mdl_cache_hits/misses`、`mdl_proven/bounded/not_computed`、`peak_live_bytes`、`allocated_bytes`（仅在工具可测时填写，不能虚构）。旧 `search_work` 与新增几何计算成本要并列报告。

## 4. P0-C：排序策略及公平调度，只做可控试验

保留 Stage E3 的跨 View 分层公平调度、`GoalLedger`、Deferred/Resumed 与已验证安全剪枝；**不要把“大 Region 优先”继续作为不可关闭的默认规则**。此前它在 `1c786137` 等题上使首次解更晚。

- 新增一种可关闭的低成本策略，例如：先做输入侧预检查，再按照每个 Goal 有效 Selector 数量 / 有效候选数由少到多排序；相同成本时采用稳定 tie-break，跨 View 保留公平曝光。输入侧有效数是候选搜索负担估计，**不是输出正确性概率**。
- 可以把 `execution_invalid` 的在线比例作为软排序反馈，但不得当作“证明该 Goal 不可能有正确程序”而彻底删掉；有界调度保证未被证明无效的 Goal 有恢复机会。
- 先实现并保留原顺序对照，使用机制和 ARC 数据评价再选择默认；不要为了让个别 ARC 新解曝光提前而按 task ID 调 Prior。
- 如果此项显著增加工程范围，优先完成 P0-A/B 和正式回归；排序属于独立实验开关，不得阻塞核心交付。

## 5. P0-D：首解标记、冻结版本和实验回归

### 5.1 版本冻结

- 将 Stage E2–E3 冻结二进制及其 source snapshot 与**当前修补后的源码**区别记录。先证明 patched baseline 能执行原有 26 道解；新正式矩阵使用**同一份最终冻结 `solver.exe`**（每配置同一二进制及 manifest），记录 SHA256、git diff/status、GHC/RTS、OS、workers、任务超时与内存限制。
- 补齐 Region 分支首个 train-exact 的 `latis-train-exact` 事件；记录准确 first-fit `SearchWork`、时间、Program AST 和来源分支。旧版缺事件只能采用**上界**，不能回填假装有精确事件。
- 在正式实验之前，运行已有 Stage A/B/C/D/D+/ContentFirst/Geometry/Region 等回归；其中 Stage B 长套件若未运行，明确解释和标记 `not_run`，不能默认为通过。
- `484b58aa` 单独以 `Workers=1` 或低并发复查，保存 watchdog、RTS 状态。正式批次避免 8 workers 资源争用导致错误归因；可用 4 workers 并报告系统负载与每题墙钟。针对 timeout/crash 保留 partial counters 和末次事件，最终 work 未知为 `null`。

### 5.2 完整对照矩阵（400 个官方 ARC training 任务）

使用相同**最终修复版**二进制、manifest、原有语法/参数预算、Time & RTS 限额跑至少：

| 配置 | Precheck | Shape MDL | 调度 | 作用 |
|---|---|---|---|---|
| `E31_PatchedBaseline` | Off | 现有 eager/原排序 | E3 旧顺序 | 验证最终修补是否改变旧结果 |
| `E31_PrecheckOnly` | On | 同基线 | 同基线 | 单独测输入侧无效选择器过滤 |
| `E31_LazyMDLOnly` | Off | On-demand/cache | 同基线且保留比较语义 | 单独测 MDL 按需/缓存 |
| `E31_Full` | On | On-demand/cache | 可配置的公平调度（默认需提前冻结） | 正式优化版 |
| `E31_FullNoMDL` | On | 不用于排序；可按需 trace | 同 Full | 分离 MDL 的实际搜索收益与成本 |
| `E31_FullNoSafePrune`（建议） | On | 同 Full | 同 Full | 既有安全剪枝的独立消融 |

如新增 `SelectorCountPriority`，必须另有**仅调度变化**的同 binary 消融；不能把调度收益混入预检查与 MDL 的收益。若算力有限，至少完整跑前五配置，第六可只完成机制与分层 pilot，但**严格标记**覆盖范围。不得将 pilot 子集写成 `/400`。

- 使用 Stage E2–E3 相同的 400 题 training manifest；只有 `train` 对进入合成器，`test=[]` 仍须有守卫。heldout 机制测试仅评分，不能传入合成或调参。
- 首解原有 26 道（尤其新增 4 道）应全部保留；如果修补后任何解丢失，必须定位并说明原因，**不允许修改 prior/规则或借额外预算掩盖回归**。首解 Program 文本不一定与旧版完全相同（排序修补会影响先后），需要报告所选程序差异并逐格独立验证。
- 正式报告每配置 `train_exact`、旧解留存、新解 ID、超时/崩溃、`Solve@60s/300s`、首次 Fit 耗时/Work、完成任务总 Work、配对实际 wall time、RSS/RTS live heap、GC、候选曝光、预检查失效、现有依赖剪枝、执行、NoFit、Invalid、Deferred/Resumed、各阶段预算截断及几何成本。
- 按**共同完成任务**做 SearchWork/时间比较；超时未完成不能当 0。区分 `selector_precheck_invalid`、`execution_invalid_remaining`、`dependency_pruned`，不要将所有少执行的候选说成某个单独优化的贡献。
- 统计「执行减少」时使用固定候选宇宙：完整（或有证据覆盖的）候选总数 = 已执行 + 被输入侧预检查跳过 + 已有证明剪枝 + 其他可审计终止；若去重影响数量，提供 AST identity 映射表而不是把差异隐去。

## 6. 必需机制测试与定向实验

至少在现有 E2–E3 机制 10 族 × 3 seeds 基础上复跑，并增加：

1. **SelectorUniqueTie / Empty / CaseDependent**：证明预检查使用每个 case 的输入侧结果与精确作用域，不误删。
2. **BackgroundViewSelectorDivergence**：同一 Selector 在不同背景视图和 Region 树下合法性不同，缓存不得污染。
3. **NestedRegionOwnership**：子 Region 所属对象、坐标帧和父/子层级不同，预检查结果不串用。
4. **CrossRegionCopyCounterexample**：跨区域读写不误剪，现有 `DependencyWitness` 不回归。
5. **MDLShell / Cross / Boundaries**：`RectOuter \\ RectInner`、重叠最少矩形覆盖 vs 无交并 AST 成本、Proven/Bounded/NotComputed、不同预算与缓存键。
6. **PriorityVsBreadth**：固定宇宙下比较旧尺寸优先、广度调度、有效 Selector 数量优先，报告 first-fit 曝光与公平恢复，允许负结果。
7. **OneCaseVsAllCases**：单训练对偶合候选不能被误认为 400 题 train-exact 或跨所有 train cases 有效。

对于完整小宇宙，独立枚举器/参考实现验证 PrecheckOn/Off、CacheOn/Off、SafePruneOn/Off 的**接受集合**完全一致，并做故意构造的缓存键碰撞/环境变化反例。旧 26 道 ARC 全部使用最终预测网格的独立像素重放核验。

## 7. 输出工件（必须真的生成）

至少交付：

- `docs/LATIS_STAGE_E31_AUDIT.md`：实施前实际调用链、修补影响、MDL 排序语义、预算及潜在不等价点。
- `docs/LATIS_STAGE_E31.md`：新预检查/缓存/调度设计、数学与类型语义、缓存生命周期、为何安全。
- `docs/LATIS_STAGE_E31_REPORT.md`：机制与 400 题完整对照、版本与复现、结果及负结果、明确的下一阶段建议。
- `scripts/run_stage_e31.ps1` 和报告/审计 Python 脚本；禁止覆盖旧 `results/stage_e2_e3` / `results/stage_e01` 目录。
- `results/stage_e31/<run_id>/`：`code_version.json`、冻结二进制与源码快照、manifest/hash、按配置逐任务 JSON、`per_task.csv`、`metrics.json`、机制记录、差分证明、首解 AST 与 Witness、异常事件、内存与耗时采样、可独立重算 digest。
- 单案例 trace viewer 增加 Selector 预检查结果（何处判无效、哪个 case/view、选中数）、MDL 缓存/证明状态、Goal 恢复进度，不得制造无实际执行的 trace。不存在的数据写 `null/not_run`。

## 8. 最终验收标准与失败处理

**必须满足**：

1. 不修改现有 Region / Shape / Scene / OutputSpec 的数学语义；不新增 ARC 专用规则、增加原语或在训练阶段使用 test 标签。保留 `Scene` 单色余像素语义、Object 诱导的 Region 严格不重叠完整分区、Shape 的 `Rect/⊎/差` 与可证明 Witness。
2. `Selector` 预检查的跳过具有可独立重放的输入侧基数/作用域证据；完整固定宇宙差分的接受集合**必须完全相同**。`Unknown` 永远回退原执行。
3. Shape MDL 的延迟计算不能改变 MDL-enabled 模式的候选成本或语义；`c_rect` 未计算写 `null`，有值必须来自有界覆盖算法并记录证明状态。准确区分真实全局最优、`ProvenOptimalInUniverse` 和 `BoundedBest`。
4. 正式二进制包含评测后修补；新正式报告只能归因于该二进制。旧 26 道解应保留；如不能，给出精确第一分歧点，**不可伪称验收通过**。
5. 400 题 train-only、同 binary 多配置消融、各类计数/耗时/内存有原始记录及独立重算；并发导致的超时单列，不把“未观察到新解”说成 DSL 不可表达。
6. 对 E3.1 的排序策略如未见收益，应明确保留负结果，不按个别任务临时调阈值。**不要因为更好看的 SearchWork 指标而隐瞒 MDL 的真实 CPU/heap 成本。**

**实施顺序**：Audit → 修补后冻结基线/机制回归 → Precheck + 差分 → Lazy MDL + 缓存与成本修复 → 可选选择性调度 → 机制矩阵 → 正式 400 题消融 → 全量逐题审计及报告。若实验很耗时，不允许只提交未经执行的预期结果；如部分配置未完成，明确 `not_run` 与仍可成立的有限结论。

**本轮之后才考虑 E4**：跨所有训练输出的结构指称和 Output-first；E3.1 不应提前实现这些功能。
