# LATIS Stage E3.1 实施前审计

审计对象：git `858dadb2`（提交 "E2-E3"，工作树干净）的源码，即 Stage E2–E3 正式批次之后、含两处评测后修补的状态。所有符号名、行号均来自当前源码，不是报告转述。先审计、后修改：本文件描述的是 **修改前** 的实际行为；E3.1 的改动见 `LATIS_STAGE_E31.md`，实测见 `../reports/stage_e31/LATIS_STAGE_E31_REPORT.md`。

## 0. 版本事实

| 项 | 值 |
|---|---|
| E2–E3 正式冻结二进制 | `results/stage_e2_e3/e23-20261027-main/solver.exe`，sha256 `2467dd3c1556888e613acee43eccead54cba2afdabd9711b47987a3e7fa54cf6`，GHC 9.10.3 `-O2 -fno-omit-yields -rtsopts -eventlog` |
| 冻结源码快照 | `source_snapshot.zip`（sha256 `4c6d2f00…31d4`），对应 git head `c760d901` + 当时未提交的 E2/E3 文件 |
| 快照 vs 当前源码 | 147 个 `.hs` 文件中只有 2 个不同：`src/Synthesis/Collection/Region/Scene.hs`、`src/Synthesis/Collection/Region/Search.hs`（用 Python 逐字节对比得到） |
| 差异 1（Scene.hs:62-65） | 冻结版 `bestShape mdl 0 (normalize px)`；当前版 `bestShape mdl (rectCoverCount (normalize px)) (normalize px)`，`rectCoverCount = length (coverRectangles (minimalCover defaultCoverBudget{cbMaxNodes=2000,cbMaxArea=64} px))` |
| 差异 2（Search.hs:146） | 当前版在 outcome 为 `fit` 时 `traceEvent "latis-train-exact"`（冻结版没有，Region 首解缺事件） |
| 两处修补是否重跑过 400 题 | **否**。只跑过 Region 单元套件（399 PASS）和 2dc579da 单题冒烟 |
| 当前批次结果目录 | `results/stage_e2_e3/e23-20261027-main/`（8 配置 × 400，8 workers），`e23-20261027-rerun484b58aa/`（1 worker） |

## 1. 功能图与调用链（实际符号）

### 1.1 入口与门控

`Synthesis.Collection.Front.main`（Front.hs:430-458）：`sizeStep` → `sizeFirstPaths` → `contentFirstGate` → `regionGate`。`regionGate`（Front.hs:464-468）只在 content-first 也失败（`Left err`）且 `rcEnabled` 时进入 `regionPath`；`cfExploreAlternatives` 下在已有解之后只记录不替换。`regionPath`（Front.hs:470-496）：

1. `res = searchRegions rg examples`（纯函数，Search.hs:72）；
2. `work = rsExecuted res * length examples + rsPruned res` 计入 `operator_applications`（即 `search_work`，Front.hs:345）；
3. `first_solution_work = startWork + (rsFirstFitExposure+1) * ncases`；
4. 选中 `rsFits` 的第一个程序，构造 `Program{progRegion=Just rp}`，用 `runProgram`（Front.hs:215 → `runRegionProgram defaultPartitionBudget`）重新执行全部 case 核对。

**执行次数在何处消耗**：只有 `Search.step` 中的 `execute p`（Search.hs:124-131）消耗 `ex`（对 `rcExecutionBudget` 计数，一次 = 该程序在全部训练 case 上执行）。语法枚举（`universe`）、Selector 求值（在 `execute` 内部，每 case 一次）、剪枝（`prunable`/`sharedRuleOK`）都不消耗 `ex`。

### 1.2 Scene / View / Tree 构建

`searchRegions`（Search.hs:72-80）：

- `scenes = [(v,[sceneFromView defaultMDLBudget (rcMDL cfg) v x | (x,_)<-pairs]) | v<-LegacyView:allBackgroundViews]`，4 个视图 × 全部 case。`legal` = 每个 case 都 `Right` 的视图；`sequence` 在第一个 `Left` 处短路，后续 case 的 Scene thunk 不会被求值。
- `trees = [(k,v,fst (expandLazy (rcPartition cfg) (rootNode s)))]`：每个 (case, 合法视图) **只展开一次根节点**。`expandLazy` 展开一个 deferred 节点（根），产生 separator + k 个 content 子节点；子节点进入 `rtDeferred` 但搜索**从不**继续展开。`treeFor`（Program.hs:92，`runProgram` 核对时用）同样只展开一次。因此：
  - 搜索中的 Region Tree 深度恒为 1；`pbMaxExpansions=24`、`pbMaxDepth=3` 在搜索里从不被触及（只在 `eagerClosure` 单元测试中消耗）。
  - 所有 Selector 都定义在深度 1 的 content 节点上（`depth1Content`），"多层归属" 只体现在 `rnObjects`（`objectsInside`：wholly inside 的所有对象，包括嵌套对象）。
- `sceneFromView`（Scene.hs:57-80）：`viewRegions v g` → 每个 Region 成为 `PlacedObject`；检查支持集两两不交、余像素单色（`UniformResidual c | NoResidual`）、`verifyScene` 逐像素重建。`poShape` 字段为 **惰性** thunk（见 §2）。
- `legalSeparators`（Partition.hs:98）对区域内每个对象调用 `splitRegion`（4 连通分量、straddle 检查）；`expandLazy` 选第一个 k≥2 的分隔物，没有则标 `NonSeparatingOnly`/`UnsplitLeaf`。

### 1.3 Selector / Action 语义

`Program.hs`：

- `RegionSelector` = `SelRoot | SelLargestContent | SelSmallestContent | SelContentWithObjects | SelContentWithoutObjects | SelContentWithColor c | SelContentWithObjectCount n`；`enumerateSelectors colours` = 5 个固定 + 每个颜色一个 + n∈{1,2,3}。**颜色常量来自训练输入和训练目标的全部颜色**（Search.hs:79，Stage C 约定），因此 Selector 宇宙的大小受目标颜色集影响（但不读目标网格内容）。
- `selectRegion`（Program.hs:106-129）只读树：`SelRoot` 永远 `Right root`；其余先要求 `depth1Content` 非空（否则 `Left "...: the root was not split"`），然后 `unique`（恰好 1 个匹配，空集 / 多于 1 个都 `Left`，错误串含基数与 id 列表）或 `extremum`（面积极值，前两名并列即 `Left tie`）。没有任何隐式 tie-break。
- `runRegionProgramOn`（Program.hs:136-183）：先 `selectRegion (rpSelector p) t`（失败 → 整个 case `Left`），再执行动作；`StampAtMarkers src` 还要 `selectRegion src t` 且 `rnId src /= rnId n`。动作级输入侧前置条件：`ClearRegion`/`TranslateRegion` 需要 `UniformResidual` 背景色；`TranslateRegion` 需要区域有对象、不出画布、不压到区域外对象；`StampAtMarkers` 需要源有对象、目标有 1 像素 marker、印章不出区域。这些都只读输入，但本阶段预检查**只覆盖 Selector 基数**，动作级条件保留为 `execution_invalid_remaining` 并单独计数。
- `programEffect`：`CropRegion→EffectSelection`，`PreserveExcept→EffectLocal`，`TranslateRegion→EffectLocal`，`StampAtMarkers→EffectCrossRegion`。无条件分支、无递归分区、无环境 binding：一个 Selector 在一个程序里恰好被求值一次（Stamp 为两个不同 Selector 各一次），且在每个训练 case 上都必定被求值（没有"未执行分支"）。因此"作用域"= (程序, case)，预检查只需对程序引用的 Selector 在每个 case 上求值。

`execute p`（Search.hs:124-131）的裁决：按 case 序取第一个 `Left` → `("execution_invalid","case k: <err>")`；否则第一个输出 ≠ 目标的 case → `no_fit`；否则 `fit`。**注意**：若 case 0 的动作失败、case 1 的 Selector 失败，报告的是 case 0 的动作错误——两者同属 `execution_invalid`；等价性比较必须按 outcome 类别和 AST 集合做，不能按 reason 字符串。

### 1.4 调度（GoalLedger / quantum / Deferred）

Search.hs:150-190：

- `goals0`：每个 (视图, 层) 一个 goal，视图顺序 = `viewOrder`，层 ∈ {0,1,2}（`layerOf`：Stamp=2；Crop/Clear 在 Root/Largest 等大区域 Selector 上=0；其余=1）。
- `candsOf v l = sortOn orderKey`；`orderKey` 在 `rcRegionFirst` 时为 `(layer, sizeClass sel, programCost, show p)`，否则 `(layer, 0, programCost, show p)`。`sizeClass`: Root=0, Largest=1, 其它=2, Smallest=3（E3 报告已给出"尺寸类优先"为否定结果）。
- 广度调度 `layerRun`：逐层；一轮内按 `goalsL` 顺序给每个 goal `chunk = take quantum (drop cursor cands)`——**quantum 以候选个数计，被剪枝（不执行）的候选同样占用名额**；执行预算 `ex` 只在真正 `execute` 时增加。goal 剩余候选且未解 → `glDeferred+1`，下轮从 cursor 恢复（`glResumed+1`）。
- `solved` = 预算截断或（`rcFirstFitStop` 且已有 fit）。`rcFirstFitStop=False` 时收集全部 fit（差分测试用）。
- 非广度 `runSequential`：按 `(show view, layer)` 排序逐 goal 穷尽。
- `rsFirstFitExposure` 是**已执行曝光**序列中的序号（被剪枝候选不计入曝光）。
- **记录缺陷**：`layerRun` 结束时用层账本（`ledgerF`，由 `goalsL` 的初始账本经 `M.adjust` 更新 cursor/allocated/deferred/resumed/status）**整体替换**状态中的 goal 记录，而 `glUsed`/`glFits` 只在 `step` 的状态副本里累加——因此 E3 批次所有广度模式记录的 `goals[*].used` 与 `fits` 恒为 0（已在 `results/stage_e2_e3/e23-20261027-main` 的 2dc579da/e50d258f 记录中核实）。搜索行为不受影响；E3 报告中"只用了 3 次执行"等陈述来自曝光序列而非 `used`。E3.1 合并两份记录。

### 1.5 安全剪枝与 DependencyWitness

`prunable p`（Search.hs:103-113）：仅 `PreserveExcept` 且 `rcSafePrune`。读训练目标（拟合期）：`dwDimsPreserved` 为假 → 剪；否则对每个 **Selector 求值成功** 的 case，若 `diffPixels k ⊄ 选中区域` → 剪。Selector 失败的 case 被 `Right sel<-[...]` 静默跳过：一个 Selector 在所有 case 都失败的 `PreserveExcept` 程序**不会被剪枝**，而是执行后得到 `execution_invalid`。`sharedRuleOK`（Root + RecolorObjects）为每区域拟合色的交集。被剪候选记入 `PrunedCandidate` 并在 `deps'` 中挂到对应视图的 `DependencyWitness`（`dwPruned`、`dwKept`）。

含义：E3.1 预检查放在 `prunable` 之前时，会把"所有 case 都 Selector 失败"的 `PreserveExcept` 候选从"执行→invalid"转为"预检查跳过"；而"部分 case 失败、部分 case diff 超出区域"的候选以前由依赖剪枝接住，现在会被预检查先接住——`dependency_pruned` 计数**必然下降**，不能把这部分下降算成剪枝失效。

### 1.6 事件、首解时间、trace

- `traceCand levelCandidates`（Search.hs:146）为每个**执行**的候选发 `kind=evaluated` 事件（含 `exposure_index`、`outcome`、`reason_code`）；被剪枝候选不发候选事件，只在 JSON 的 DependencyWitness 中。
- `traceEvent "latis-train-exact"` 在 fit 时发（修补后）；`scripts/arc_stage_d.event_times` 解析 eventlog 的 `latis-search-start / latis-train-exact / latis-search-end` 得到 `first_train_exact_seconds`。冻结版无该标记，E3 报告的 4 个 Region 解的 Solve@60s 用整进程墙钟上界。
- `Front.regionPath` 发 D+ 诊断事件 `RegionSearch entered/completed`（attempted/evaluated/exhaustiveness）。
- 单 IO trace（`ARC.TraceIO`，`scripts/trace_io.py`，`trace_io_viewer.js` 的 `viewRegion`）读取 `solver_record.region_search.run` 展示 Scene/Tree/Goal 账本/曝光/DependencyWitness；没有预检查、MDL 缓存状态的展示（尚不存在）。

### 1.7 记录与冻结方式

`scripts/run_stage_e2_e3.py prepare`：复制二进制为 `solver.exe` 记 sha256、`git_head`、`git_status_porcelain`、`git.diff`、`source_snapshot.zip`（src/app/test/scripts/docs）、GHC 版本、OS、Python；`run` 执行前断言二进制 sha 未变；每题每配置一个进程，`arc-train-only-stage --stage stage-d-<Config>`，`--timeout-ms 300000 +RTS -M2g -T -l-au -ol<eventlog>`，驾驭 watchdog +10 s。记录字段含 `config`（`show Config` 原文）、`counters`、`region_search`、`rts_max_live_bytes`、`rts_max_mem_in_use_bytes`；**没有** GC/分配字节/mutator 时间，也没有搜索内部的分阶段耗时。`ARC.ArcTrainOnly.runConfigured`（ArcTrainOnly.hs:147-160）用 `evaluate (length (show f))` 强制整个结果——包括 `regionRun` 内每个 `PlacedObject.poShape`（见 §2.3）。

## 2. Shape MDL：数值的消费点

### 2.1 三类数值

| 数值 | 产生 | 消费 |
|---|---|---|
| `mrCost`（`c_ast`） | `bestShape`（ShapeMDL.hs:107-137），`minimumBy (comparing (shapeCost, shapeText))` | `sceneCost`（Scene.hs:44-51）→ `scShapeMDL`/`scTotal`；`mdlJSON`；测试 |
| `mrRectCost`（`c_rect`） | `bestShape` 的参数 `crect`，原样存入 | **只有** `mdlJSON`（ShapeMDL.hs:191）和 `test/RegionMain.hs`。`grep -rn mrRectCost src` 无其它消费者 |
| `mrStatus` | `proven = not cut && (found/=Nothing || smMaxRects b>=3)` | `mdlJSON`；测试 |

因此 `c_rect` 修补**不改变** `bestShape` 的排序或选择（排序 key 不含 `crect`），也不改变 `sceneCost` 与 `viewOrder`——这是源码层面的证明；E3.1 还将用 400 题的 `E31_PatchedBaseline` 对照 E3 `FullE3` 的程序、执行数、剪枝数做实测复核。**但它不是"只改记录"的零成本修补**：`minimalCover`（2000 节点 / 面积 ≤64）会在记录被强制时对每个 (case, 合法视图, 对象) 各算一次，而 `runConfigured` 的 `show f` 总会强制它——这部分 CPU 从未在 400 题上测过。

### 2.2 MDL 在搜索中的唯一作用：视图顺序

Search.hs:81：`viewOrder = if rcMDL cfg then sortOn (Σ_cases scTotal, show v) legal else map fst legal`。`goals0` 按 `viewOrder` 排视图，广度调度一轮内按 `goalsL` 顺序分配 quantum，所以 MDL 只影响**同一层内视图被轮到的先后**；候选宇宙、每个 goal 内的顺序、剪枝都与 MDL 无关。E3 400 题实测：FullE3 与 FullE3_NoMDL 的程序全部相同，但执行总数 442464 对 442474、剪枝 98432 对 98434——视图顺序确实在少数题上改变了可达前缀（差 10 次执行）。`runSequential` 用 `(show view, layer)` 排序，MDL 对非广度模式完全无影响。

`rcMDL=False` 时 `poShape=Nothing`，`sceneCost` 用 `5*|support|` 作为形状成本代理（Scene.hs:46），`rsSceneCost`/JSON 的 `scene_cost` 仍有值但**不是 MDL**——读报告时不能把 NoMDL 的 scene_cost 与 MDL 的比较。

### 2.3 哪些操作强制 MDL 求值

`poShape` 是惰性字段，被强制的点：(a) `viewOrder` 的 `scTotal`（仅 `rcMDL`）；(b) `sceneJSON` → `jmaybe mdlJSON (poShape o)`（每次写记录 / trace）；(c) `runConfigured` 的 `evaluate (length (show f))`（**总是**，因为 `RegionSearch` 的 `Show` 包含 `rsTrees` → `SceneHypothesis` → `PlacedObject`）；(d) 机制跑分 `evaluate (length (show f))`（RegionMechanism.hs:143）；(e) `rtScene` 参与 `Eq`（`eagerClosure` 的 `t'==t`，仅测试）。结论：在 `rcMDL=True` 的 ARC 批次里，**每个对象的 MDL 和 c_rect 都会被算**，无论是否参与排序；没有任何跨对象、跨 case、跨视图的共享——同一个 1 像素形状在 49540 个对象里重复优化。

### 2.4 `bestShape` 的内存形态

`level`（ShapeMDL.hs:141-157）返回 `(kept, length kept, length (take (limit+1) exprs) > limit)`，`kept = take limit exprs` 被 `fits` 的过滤和 `length kept` 两个消费者共享 → 整个 level 的表达式列表（最多 `smMaxExprs=200000` 个 `ShapeExpr`，第 3 层每个含 3 个 `Rect`）在两者都消费完之前整体驻留。`fits` 对每个表达式 `evalShape` 建 `Set Coord`。这解释了 a64e4611 上 1.21 GB 的峰值 live heap（NoMDL 456 MB）。这是生命周期问题，不是语义问题：改为单遍 fold 可以在不改任何结果的前提下流式化。

### 2.5 预算与单位

| 参数 | 值 | 单位 / 位置 |
|---|---|---|
| `smMaxRects` | 3 | 表达式最多引用的 bbox 子矩形数（`defaultMDLBudget`） |
| `smMaxArea` | 64 | 对象 bbox 面积上限，超过只给 row-run 分区（BoundedBest） |
| `smMaxExprs` | 200000 | 每个对象跨层累计枚举的表达式数；超过即 `cut` → BoundedBest |
| `c_rect` 覆盖预算 | 2000 节点 / 面积 64 / 8 个备选 | `defaultCoverBudget{cbMaxNodes=2000,cbMaxArea=64}`（修补新增） |
| 形状成本 | Rect 5，⊎ +1，\\ +2 | `shapeCost`，与坐标无关（平移不变） |
| 局部坐标 | `normalize`（min x/y → 0） | Scene.hs:85，在 `bestShape` 之前；MDL 结果本身不存偏移量，偏移由 `poSupport` 的 bounds 给出 |

`ProvenOptimalInUniverse` 的宇宙 = "≤3 个 bbox 子矩形的 ⊎/\\ 表达式 ∪ row-run 分区"，`mrUniverse` 字段写明；`BoundedBest` 来自面积超限或表达式预算截断。两者在 `MDLResult` 中只靠 `mrStatus` 字符串区分，没有类型级区分；E3.1 的缓存键必须包含 `MDLBudget` 三元组，避免低预算 Bounded 被当作高预算 Proven。

## 3. 阈值一览（搜索侧）

| 参数 | 值 | 消耗点 |
|---|---|---|
| `rcQuantum` | 6 | 每 goal 每轮取的**候选**数（含被剪枝者） |
| `rcExecutionBudget` | 2400 | `execute` 次数（每次 = 全部 case） |
| `rcFirstFitStop` | True（正式）/ False（差分） | `solved` |
| `PartitionBudget` | 24 / 3 / 2 | 搜索中只用到 `pbMinArea`（决定子节点是否进入 deferred；但 deferred 从不展开） |
| 每题墙钟 | 300 s 内部 + 10 s watchdog | 驱动器 |
| RTS | `-M2g -T -l-au` | 驱动器 |
| 机制实例超时 | 180 s | `RegionMechanism.runMechanismR` |

## 4. 旧 26 解的来源与可复核性

E3 批次 `FullE3`：20 题 Size-first、2 题 content-first（`c909285e`、`0b148d64`）、4 题 Region（`1c786137`、`2dc579da`、`5582e5ca`、`d9fac9be`）。记录中 `program` 为 `show Program` 原文，`execution_witnesses[*].grid` 为每个训练 case 的预测网格（Region 程序经 `runProgramEvidence` 重编码），`region_search.selected_program` 为 Region AST，`region_search.executions[*].exec` 含 region id / bounds / 读写区域 / 输出尺寸。可用 Python 独立比对预测网格与目标（逐格），并对 Region 程序用树 JSON 的 `pixels`（≤400 像素）重放 Selector 基数——但树节点 JSON 目前**不含颜色列表**，`UniqueContentWithColor` 的独立重放需要补字段。

## 5. 未覆盖的边界与潜在不等价点（E3.1 必须处理或声明）

1. **预检查与裁决 reason 的差异**：预检查只能证明"某 case 的 Selector 必失败"，执行器报告的是按 case 序的第一个错误。等价性以 outcome 类别（invalid）与 AST 集合比较，不比较 reason 文本。
2. **quantum 口径**：被跳过（剪枝或预检查）的候选占用 quantum 名额而不占执行预算；保持这一口径可使 `PrecheckOn/Off` 在**无预算截断**时的执行候选顺序完全一致（只是少了无效执行），有预算截断时可达前缀变大。
3. **`show f` 强制一切**：要让 "NotComputed" 真的不算，`poShape` 必须是 `Nothing`（而非 thunk）；仅靠 Haskell 惰性在 ARC 批次里无效。
4. **MDL 共享的合法性**：`shapeCost` 平移不变、`normalize` 已把 mask 平移到局部帧，所以按"精确归一化 mask + MDLBudget + DSL/成本版本"做键是合法的；绝对坐标不进入键，也不进入成本。`c_rect` 的 `minimalCover` 同样平移不变（在归一化 mask 上计算），可共享同一键。
5. **NoMDL 的 `scene_cost` 是代理值**（§2.2），报告中要么标注，要么写 `null`。
6. **搜索树深度恒为 1**：P0-A 的"嵌套 Region 归属"在当前搜索里只影响 `rnObjects`（嵌套对象被计入深度 1 祖先），机制家族要据此设计（例如用嵌套环证明 `UniqueContentWithObjects` 把深层对象计入正确的深度 1 区域）。
7. **动作级输入侧失败**（无背景色的 Clear/Translate、Translate 出界、Stamp 出区域、源目标同区域）不在本阶段预检查范围内，保留为 `execution_invalid_remaining`，报告中单列。
8. **8 workers 的 484b58aa 超时**与 E0/E1 4 workers 的 182 s `no_solution`：本阶段正式批次 4 workers，并单独 1 worker 复查。
9. **Stage B 长套件**（30 min）E3 批次未跑；E3.1 同样需要显式标 `not_run` 或跑完。
10. **GoalLedger 的 `used`/`fits` 在广度模式下恒为 0**（§1.4），E3.1 必须修正记录并在测试中断言 `Σ used = executed`。
11. **没有分阶段耗时**：`scene_build_ms`、`mdl_compute_ms`、`minimal_cover_ms` 需要新增观测计数器（`Diagnostics` 风格的 `unsafePerformIO` 单调时钟累加，纯观测，不影响任何决策），`gc_cpu_ns`/`allocated_bytes` 来自 `GHC.Stats`。

## 6. 本阶段将改动的文件（预告，详见设计文档）

`src/Synthesis/Collection/Region/{ShapeMDL,Scene,Partition,Program,Search}.hs`（预检查、缓存、流式枚举、计数、JSON 字段）、`src/ARC/StageDEvaluate.hs`（E31 配置）、`src/ARC/ContentFirstEvaluate.hs`（`namedConfigsE31`）、`src/ARC/RegionMechanism.hs`（新家族）、`src/ARC/ArcTrainOnly.hs`（RTS/GC/分阶段耗时字段）、`src/Synthesis/Collection/Diagnostics.hs`（耗时计数器）、`app/Main.hs`、`src/ARC/TraceIO.hs`、`scripts/trace_io.py`、`scripts/trace_io_viewer.js`、`test/RegionMain.hs`、新脚本 `scripts/run_stage_e31.{ps1,py}`、`scripts/report_stage_e31.py`、`scripts/verify_stage_e31.py`。不改动 `Geometry.Cover`、`Geometry.View`、旧 Stage A–D、content-first 的数学语义。
