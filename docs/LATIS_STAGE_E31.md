# LATIS Stage E3.1：Selector 输入侧预检查、精确 Shape MDL 缓存与可信效率基线

本轮对应 `../prompts/LATIS_STAGE_E31_SEARCH_EFFICIENCY_BASELINE_PROMPT.md`。实施前审计见 [LATIS_STAGE_E31_AUDIT.md](LATIS_STAGE_E31_AUDIT.md)，实测见 [LATIS_STAGE_E31_REPORT.md](LATIS_STAGE_E31_REPORT.md)。本阶段**只**优化 Stage E2–E3 已有的 Region 搜索：不改 Scene / Partition / Shape / Program 的数学语义，不新增 ARC 专用规则、原语或 Selector，不读测试标签；所有新行为都是 `RegionConfig` 上独立可关闭的开关，全部关闭时与 E3 的 `FullE3` 逐候选一致（这正是 `E31_PatchedBaseline` 配置，并用 400 题对照 E3 冻结记录验证）。

## 1. 开关与配置

`Synthesis.Collection.Region.Search.RegionConfig` 新增四个字段：

| 字段 | 含义 | 默认（`regionConfigOn`） |
|---|---|---|
| `rcPrecheck` | 输入侧 Selector 预检查（§2） | False |
| `rcLazyMDL` | 对象 Shape 来自每题精确 MDL 缓存（§3） | False |
| `rcMDLRecord` | 即使 `rcMDL=False` 也计算并记录每个对象的 Shape（trace/审计用） | True（`FullE3_NoMDL`、`E31_FullNoMDL` 显式设 False） |
| `rcSelectorPriority` | 仅调度：按预检查有效候选数排 goal、goal 内有效候选优先（§4） | False |

`ARC.StageDEvaluate.namedConfigsD` 新增（`ARC.ContentFirstEvaluate.namedConfigsE31` 汇总为同一二进制的矩阵）：

| 配置 | Precheck | Shape MDL | 排序 / 调度 | 安全剪枝 |
|---|---|---|---|---|
| `E31_PatchedBaseline` | Off | eager，参与视图排序 | E3（广度 + 尺寸类） | On |
| `E31_PrecheckOnly` | On | 同基线 | 同基线 | On |
| `E31_LazyMDLOnly` | Off | 缓存，参与视图排序 | 同基线 | On |
| `E31_Full` | On | 缓存 | 同基线 | On |
| `E31_FullNoMDL` | On | 不计算（NotComputed），不参与排序 | 同基线 | On |
| `E31_FullNoSafePrune` | On | 缓存 | 同基线 | **Off** |
| `E31_FullSelectorPriority` | On | 缓存 | 有效候选数优先（仅调度变化） | On |
| `E31_FullCostOrder` | On | 缓存 | 成本序（不用尺寸类） | On |

`FrozenE01` 作为未进入 Region 路径的负对照保留。E3 的 8 个旧配置名继续存在且行为不变（`FullE3_NoMDL` 显式 `rcMDLRecord=False`，与 E3 记录中 `shape: null` 一致）。

## 2. P0-A：Selector 输入侧预检查

### 2.1 语义

E2 的 Selector 只有 7 种形态（`Root`、`UniqueLargest/SmallestContent`、`UniqueContentWith/WithoutObjects`、`UniqueContentWithColor c`、`UniqueContentWithObjectCount n`），程序没有条件分支、环境 binding 或局部作用域：一个程序对每个训练 case 恰好求值其目标 Selector 一次，`StampAtMarkers src` 再求值源 Selector 一次（`Program.programSelectors`）。因此"作用域"就是 (程序, case)，预检查对程序引用的每个 Selector 在每个 case 的**输入树**上求值即覆盖了全部语义作用域。

`Program.resolveSelector :: RegionSelector -> RegionTree -> SelectorOutcome` 是唯一的结构化判定：

```
SelOK node | SelRootUnsplit sel | SelEmpty what n | SelNonUnique what ids | SelTie what a b | SelNoRoot
```

执行器 `selectRegion s t = outcomeText (resolveSelector s t)`，`outcomeText` 逐字复现 E2 的 reason 字符串。预检查与执行器调用同一个函数，所以"预检查判无效 ⇔ 执行器在该 case 以同一原因 `Left`"是**构造上**成立的，不是经验等价。`Unique` 的语义不变：空集、并列、多于一个都失败，没有新增任何 tie-break。

判定规则 `Search.decideFromChecks`（独立于缓存，可用合成结果测试）：

- 程序引用的某个 Selector 在某个 case 不是 `SelOK` → `PrecheckInvalid {role, selector, case, kind, evidence}`，取 (role, case) 顺序的第一个失败；kind ∈ `InvalidRootUnsplit | InvalidEmpty | InvalidNonUnique | InvalidOther`（`SelTie` 归入 NonUnique，证据里给两个 id）。
- 全部 OK 且动作是 `StampAtMarkers`，若某 case 源与目标选中同一区域 → `PrecheckInvalid … InvalidSameRegion`（执行器在该 case 必 `Left "source and target are the same region"`）。
- 任一 case 的结果缺失（`Nothing`）→ `PrecheckUnknown`，候选照常执行。当前 Selector 语言下不会产生 Unknown；该路径由单元测试用合成输入覆盖。
- 否则 `PrecheckValid`。

动作级的输入侧前置条件（`ClearRegion`/`Translate` 需要余像素背景色、`Translate` 出界或压到对象、`Stamp` 出区域等）**不**在本阶段预检查范围内，仍由执行器判定并计入 `execution_invalid_remaining`（报告单列）。

### 2.2 缓存键与证据

`checks :: Map (ViewId, RegionSelector) SelectorCheck`，惰性 `Data.Map`，值 = `SelectorCheck {view, selector, cases :: [(case, SelectorOutcome)], treeHashes :: [(case, hash)]}`。键是精确的 Selector AST 和视图；树本身在一次 `searchRegions` 内对每个 (case, 视图) 固定且只建一次，`treeHashOf`（节点 id/parent/role/depth/像素集/对象集的 `stableHash`）随证据一起记录，供独立重放核对"这个判定属于哪棵树"。不按面积、形状、程序文本或训练等价签名合并；不同视图的同一 Selector 是不同条目（机制家族 `BackgroundViewSelectorDivergence` 证明两个条目可以给出相反判定）。缓存生命周期 = 一次任务的 `searchRegions` 局部值。每个条目第一次被需要时求值一次（`timedForce "selector_precheck"` 计一次），之后命中。

### 2.3 在调度中的位置与计数

`Search.step`（保持 E3 顺序）：预算检查 → **预检查**（`rcPrecheck`）→ 依赖剪枝 `prunable` → `sharedRuleOK` → 执行。被预检查跳过的候选：

- 记为 `PrecheckedCandidate {program, candidateIndex, verdict}`，进入 `rsPrechecked`，JSON `precheck.skipped_candidates`；
- **占用** goal 的 quantum 名额（与被剪枝候选相同口径，所以无预算截断时 `PrecheckOn/Off` 的执行候选顺序完全一致，首个 fit 的候选位置相同），**不**消耗 `rcExecutionBudget`；
- 计入 `search_work` 1 单位（`Front.regionPath`：`work = executed*ncases + pruned + prechecked`；预检查关闭时公式退化为 E3 的公式，基线数值不变）；
- 仍是固定宇宙的成员：`universe_accounting = {universe, considered, executed, prechecked_invalid, dependency_pruned, remaining_not_reached, consistent}` 随记录输出，`considered = executed + prechecked_invalid + dependency_pruned`。

新增曝光字段 `candidate_index`（含被跳过候选的固定宇宙位置）和 `first_fit_candidate_index`，与 `first_fit_exposure`（已执行候选中的序号）并列，便于跨配置比较"到达第一个解之前考虑了多少候选"。GoalLedger 新增 `prechecked`、`pruned`、`valid_candidates`，并修正了 E3 广度模式下 `used`/`fits` 被层账本覆盖为 0 的记录缺陷（审计 §1.4 的发现；搜索行为不受影响）。

### 2.4 正确性论证

设 U 为固定宇宙，`firstFitStop=False`、预算不截断。对任一候选 p：

- 若预检查判 p 无效，则 ∃case k 使 p 的某个 Selector 在 k 的输入树上不是 `SelOK`（或 Stamp 源目标同区域）；执行器在 case k 的第一步 `selectRegion`（或 Stamp 的同区域检查）必返回 `Left`，故 `execute p` 的裁决是 `execution_invalid`。因此 `Accepted_On ⊆ Accepted_Off` 且 `RejectedAsInvalid_On ⊇ RejectedAsInvalid_Off ∩ Prechecked`。
- 若预检查判 p 有效，p 走与 Off 完全相同的路径（剪枝 → 执行）。
- 结合"被跳过候选占 quantum 不占预算"，Off 与 On 考虑的候选序列相同，故 `Accepted_On = Accepted_Off`，`Invalid_On = Invalid_Off`（On 侧 = 执行无效 ∪ 预检查跳过）。

在有限预算下，On 比 Off 少消耗执行预算，可达前缀变大，首个 fit 的 AST 可能不同；报告以 `(enumerated, prechecked_invalid, dependency_pruned, executed, deferred, remaining)` 六元组说明工作量变化，不要求逐候选曝光一致。

### 2.5 与 DependencyWitness 的关系

依赖剪枝读训练**目标**（拟合期证明），预检查只读训练**输入**；两者在记录中分列（`precheck` 与 `dependency_witnesses`）。预检查放在剪枝之前，使以前"所有 case 的 Selector 都失败却因此没被剪枝、执行后 invalid"的 `PreserveExcept` 候选改为输入侧跳过，也使"部分 case 失败、部分 case diff 越界"的候选先被预检查接住——因此 `dependency_pruned` 计数下降是预期现象，不是剪枝失效（审计 §1.5）。跨区域 `StampAtMarkers` 仍从不被剪枝；预检查只会因其 Selector 在输入上不唯一/为空或源目标同区域而跳过它。

## 3. P0-B：Shape MDL 按需、精确缓存与成本

### 3.1 三类成本分离与观测计时器

`Synthesis.Collection.Diagnostics.timedForce label force x`：用单调时钟计一次 `force x` 的求值时间并累加到 `label`（`unsafePerformIO` + `NOINLINE`，与既有 `diagnostic` 同一机制）。因为被包裹的是共享 thunk，一个缓存条目至多计一次（= 一次 miss）。任何求解决策都不读这些计数。记录字段 `phase_timings`：

| label | 计什么 | count 的含义 |
|---|---|---|
| `scene_build` | `viewRegions` + `sceneFromRegions` 到合法性判定（不含 Shape） | (case, 视图) 数 |
| `partition_expand` | 根节点一次 `expandLazy`（分隔物枚举、分量、straddle） | 树数 |
| `selector_precheck` | 一个 (视图, Selector) 条目在全部 case 上的判定 | 条目数 |
| `dependency_prune` | 一个候选的 `prunable` 判定 | 候选数 |
| `candidate_execution` | 一个候选在全部 case 的执行与裁决 | 执行数 |
| `mdl_compute` | 一个归一化 mask 的 `bestShape` | 缓存条目数（= distinct masks） |
| `minimal_cover` | 一个归一化 mask 的 `minimalCover`（`c_rect`） | 同上 |

RTS 侧新增 `rts_allocated_bytes`、`rts_gcs`、`rts_major_gcs`、`rts_gc_cpu_ns`、`rts_mutator_cpu_ns`、`rts_cpu_ns`、`rts_gc_elapsed_ns`（`GHC.Stats`，进程级，需 `+RTS -T`），与原 `rts_max_live_bytes` 并列。

### 3.2 按需计算与 NotComputed

`Scene.ShapeSource = NoShapes | EagerShapes MDLBudget CoverBudget | CachedShapes MDLCache`；`sceneFromRegions src v g vr` 用 `shapeLookup src` 填 `poShape`。`NoShapes` 时 `poShape = Nothing`（**不是**惰性 thunk：审计 §2.3 指出 `runConfigured` 的 `show f` 会强制一切，所以只有 `Nothing` 才真正不算），JSON 为 `"shape": null, "shape_status": "NotComputed"`，`sceneCost` 用 `5*|support|` 代理并在 `cost.shape_basis` 标明 `pixel_proxy`（E3 的 NoMDL 记录里这个代理值没有标注，审计 §2.2）。`rsShapeBasis ∈ {not_computed, mdl_eager, mdl_cached}` 进入记录与 trace。单 IO trace 在 `--trace-level full` 下对关闭 MDL 的配置强制 `rcMDLRecord=True`（record-only，`run_status.json.mdl_record_forced_on`），即"可按需 trace"。

### 3.3 `c_rect` 的类型化修复

`MDLResult.mrRectCost :: Int` 改为 `mrRectCover :: Maybe CoverResult`：`Nothing` = NotComputed → JSON `"c_rect": null, "c_rect_status": "NotComputed"`；`Just cover` 带自己的证明状态（`proven_minimal` / `bounded: …` / `empty`）。`bestShape :: MDLBudget -> PixelSet -> Either String MDLResult` 不再接收覆盖数参数；`attachRectCover` 单独附加。排序 key 仍是 `(shapeCost, shapeText)`，`c_rect` 不参与任何比较；E3 评测后修补"把 0 改成 minimalCover"因此**不改变 `bestShape` 的排序/选择**（源码层面：`mrRectCost` 的唯一消费者是 `mdlJSON`），但增加 CPU（每个对象一次 2000 节点的分支定界）——这部分在 E3 从未测量，E3.1 用 `minimal_cover_ms` 单独计时并在缓存中按 distinct mask 只算一次。`c_ast`（含 ⊎/\\ 的表达式成本）与 `c_rect`（可重叠矩形覆盖数）并列输出，测试用十字（`c_ast=17`，`c_rect=2`）和 Shell（12 对 4）固定两者不是同一概念。

### 3.4 精确缓存 `Synthesis.Collection.Region.MDLCache`

键 `MDLKey = (归一化 mask 的有序坐标表, (smMaxRects, smMaxArea, smMaxExprs), mdlDSLVersion, (cbMaxNodes, cbMaxArea, cbMaxAlternatives))`。

- 不以尺寸、bbox、hash、程序文本或训练签名为键（测试：面积与 bbox 相同的两个不同 mask 得到不同条目；`meMaskHash` 只是证据）。
- 不同预算是不同条目：低预算的 `BoundedBest` 永远不会被当成高预算的 `ProvenOptimalInUniverse`（测试覆盖）。
- 平移共享合法：`shapeCost` 没有坐标项，`bestShape` 始终在 `pixelSetNormalize` 后的局部帧上求值，回到画布的坐标变换就是对象自身的 bounds；绝对坐标不进入键也不进入成本。
- 条目惰性：`buildMDLCache` 先按任务内所有合法视图、所有 case 的对象支持集去重建键，值为 thunk；哪个消费者（视图排序、记录）先需要就先算且只算一次。`cacheStats` 给 `mdl_distinct_masks`、`mdl_object_references`、`mdl_cache_hits_static = references − distinct`；`phase_timings.mdl_compute.count` 是实际算过的条目数。
- 生命周期：`MDLCache` 是 `searchRegions` 的局部值，随该任务的 `RegionSearch` 一起释放，没有全局无限缓存。

### 3.5 枚举流式化（内存）

`ShapeMDL.level` 由"`take limit` 后同时被 `length` 与过滤共享的列表"改为单遍严格 fold：逐表达式计数、只保留命中的表达式、`limit` 处若还有剩余则 `cut`。结果（命中集合及顺序、`cut` 判定、`exprsTried`）与 E2 列表版逐项相同（测试：Shell/十字/L/大 mask 的成本与状态、`bruteForceBestCost` 独立枚举一致、预算截断仍 `BoundedBest`）。它消除了审计 §2.4 指出的最多 20 万个 `ShapeExpr` 同时驻留的峰值。

## 4. P0-C：仅调度的选择性优先（可关闭）

`rcSelectorPriority=True` 时（`E31_FullSelectorPriority`）：

- goal 内排序 key 为 `(layer, 预检查无效?1:0, programCost, show p)`：有效候选先、无效候选后，不用尺寸类；
- 同一层内 goal 的服务顺序按 `valid_candidates`（预检查有效候选数）升序、原视图顺序为稳定 tie-break；
- 宇宙、quantum、执行预算、跨视图公平曝光（deficit round-robin）、Deferred/Resumed 均不变；`goal_order` 写入记录。

"有效候选数"是输入侧搜索负担估计，不是输出正确性概率；`execution_invalid` 的在线比例未被用作删除 goal 的依据（任何未被证明无效的 goal 都保留在轮转中）。E3 的尺寸类排序（`rcRegionFirst`）保留为对照，`E31_FullCostOrder` 为成本序对照；三者在机制矩阵（`PriorityVsBreadth`：首个 fit 的曝光序号与候选位置）和 400 题上比较，结果允许为负。

## 5. P0-D：首解标记、冻结与回归

- Region 首解 `traceEvent "latis-train-exact"`（E3 评测后修补）包含在本阶段二进制内；`scripts/arc_stage_d.event_times` 由此得到 `first_train_exact_seconds`；报告的 `solve_at_60s_basis` 分别统计事件来源与上界来源。
- `scripts/run_stage_e31.py prepare` 冻结 `solver.exe`（sha256）、`source_snapshot.zip`、`git.diff`/status/head、GHC/OS/Python/CPU 数，并记录 `previous_frozen`（E3 二进制 sha）与 `source_diff_vs_e3_snapshot`（相对 E3 快照改动/新增的 `.hs` 文件列表）。`run` 执行前断言 sha 不变；每题记录含 `config` 原文、`driver_started_utc`、workers（`run_meta.json` 按阶段记录 workers 与 `cpu_count`）。
- 正式批次 4 workers；`484b58aa` 另以 `--workers 1 --subdir tasks_w1` 复查（记录 RTS 状态与墙钟），不与主批次记录混放。
- 回归：`E31_PatchedBaseline` 逐题对照 E3 `FullE3` 记录（status / program / rg_executed / rg_pruned / search_work），`FrozenE01` 对照 E3 `FrozenE01`；旧 26 解的留存、程序文本差异、逐格独立重放（`scripts/verify_stage_e31.py`）。
- 回归套件：Region（含 E3.1 测试）、Geometry、ContentFirst、StageD、StageDFull、StageDControl、StageDPlus、StageC、StageA；Stage B 长套件默认 `not_run`（`-RunStageB` 可开启），在 `validation/tests_passed.json` 中显式标注。

## 6. 机制家族（新增 5 个，加上 E3 的 10 个）

| 家族 | 证明的性质 |
|---|---|
| `SelectorCardinalityCaseDependent` | 同一 Selector AST 在 case 0–2 唯一、case 3 两个匹配：预检查给出带 case 3 基数证据的跳过，解仍被找到；`Crop[UniqueContentWithObjects]` 不在接受集合 |
| `SelectorEmptyInOneCase` | `UniqueContentWithColor(5)` 在 case 3 为空（`InvalidEmpty`）、`…(8)` 在 case 0–2 为空；按对象的 Selector 解 |
| `BackgroundViewSelectorDivergence` | 同一 Selector 在 LegacyView 全 case 非唯一、在 UniqueMostFrequentColor 视图全 case 有效：按视图分键，不串用 |
| `NestedRegionOwnership` | 环内的点在深度 1 的搜索树中归属象限（计 2 个对象）；在更深的 eager 树中归属深度 ≥2 节点，树 hash 不同 |
| `OneCaseCoincidence` | `Crop[UniqueSmallestContent]` 只拟合 case 0：全 case 搜索判 `no_fit`，单 case 搜索会接受——单训练对的拟合不是 train-exact；接受的是 `Crop[UniqueContentWithObjects]`（或等价的 `UniqueContentWithColor(7)`） |

全部家族在单元测试里做四组合差分（`SafePrune × Precheck`，`firstFitStop=False`，预算 100000）：四个组合的接受集合完全相同；剪枝关闭时，无效集合（执行无效 ∪ 预检查跳过）与 no_fit 集合在预检查开/关下相同；剪枝开启时，`invalid ∪ pruned` 与 no_fit 集合在预检查开/关下相同（Selector 无效的 `PreserveExcept` 候选以前被依赖剪枝接住、现在被预检查接住，所以单看 `pruned` 会下降，这正是审计 §1.5 预告的现象）；`executed + prechecked + pruned = universe`；每个被预检查跳过的程序在关闭预检查时都是 `execution_invalid`；`invalid ∪ no_fit ∪ pruned`（剪枝开）= `invalid ∪ no_fit`（剪枝关）。`LazyMDLOnly` 与 `PatchedBaseline` 在全部实例上 scene cost、goal 顺序、曝光序列、每个对象的 shape/c_ast/status/c_rect 逐项相同。

## 7. 输出工件

`scripts/run_stage_e31.ps1`（build → 9 套件 → prepare → `region-mechanism-e31` → 400 × 9 配置 → 单 worker 复查 → report → verify → traces → viewer 自检）、`scripts/run_stage_e31.py`、`scripts/report_stage_e31.py`、`scripts/verify_stage_e31.py`、`scripts/stage_e31_trace_selftests.py`；结果目录 `results/stage_e31/<run_id>/`（`code_version.json`、`solver.exe`、`source_snapshot.zip`、`data_manifest.json`、`tasks/<id>/<cfg>/stage-d-<cfg>.json` + eventlog、`tasks_w1/`、`per_task.csv`、`metrics.json`、`metrics.csv`、`mechanism/`、`verification_e31.json`、`independent_verification.json`、`traces/`、`validation/`、`report_digest.json`）。单 IO trace 查看器的 Scene/Region 页新增"Selector 预检查"（逐 (视图, Selector, case) 判定与匹配 id、被跳过候选）、"Shape MDL：缓存与证明状态"、"Goal 恢复进度"卡片，曝光表增加候选位置列；自检统计渲染出的行数而不是匹配字符串。
