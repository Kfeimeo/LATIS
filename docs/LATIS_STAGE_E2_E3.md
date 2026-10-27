# LATIS Stage E2–E3：Shape-MDL、Scene 重构、Object 诱导的 Region 分区树与 Region-first 广度搜索

审计见 [LATIS_STAGE_E2_E3_AUDIT.md](LATIS_STAGE_E2_E3_AUDIT.md)，实测见 [LATIS_STAGE_E2_E3_REPORT.md](LATIS_STAGE_E2_E3_REPORT.md)。模块：`src/Synthesis/Collection/Region/{ShapeMDL,Scene,Partition,Program,Search}.hs`、`src/ARC/RegionMechanism.hs`、`test/RegionMain.hs`。

## 1. 四个概念的类型化区分

| 概念 | 类型 | 含义 |
|---|---|---|
| Shape | `ShapeMDL.ShapeExpr`（`SRect r | SUnion a b | SDiff a b`）与其 `PixelSet` 外延 | Object 的局部几何；AST 只是解释，外延真值是像素集合 |
| Placed Object | `Scene.PlacedObject {poId, poView, poSupport, poColors, poShape}` | 身份 =（视图，视图内 region id）；精确支持集与原始颜色；绝对坐标 |
| Region | `Partition.RegionNode {rnId, rnParent, rnDepth, rnRole, rnPixels, rnSplitObject, rnChildren, rnLeaf, rnObjects}` | 候选树内的空间作用域；可含多个 Object 与余像素；不要求同色或连通 |
| Scene | `Scene.SceneHypothesis {shView, shObjects, shResidual, shBackground}` | 整张 Raw Grid 的一个解释；根 Region = 画布；同一输入可有多个合法 Scene |

Region 树内兄弟两两不交且并为父；祖先包含后代。E1 的最小矩形覆盖（允许重叠）与 Region 分区（不交）是两套运算，`c_rect` 与 Region 树分别记账。

## 2. E2-A Shape 代数与 MDL（`ShapeMDL`）

- 语义：`eval(Rect r)=cells(r)`；`eval(DisjointUnion a b)=a∪b` 当且仅当 `a∩b=∅`，否则 `Left`（无效程序，不回退为普通并）；`eval(Difference a b)=a∖b` 当且仅当 `b⊆a`、`b≠∅`、结果非空（受限语法，显式记录；`b⊄a` 的差集因此不完备）。`Shell = RectOuter \ RectInner` 是一般的两矩形差，不是专用原语。
- `ShapeWitness`：逐节点（类型、输入大小、输出大小、输出哈希）与最终 mask；`verifyShapeWitness` 重算，篡改 mask/节点/成本均被拒绝。
- 成本（实验前冻结）：`Rect = 1 + 4`（节点 + 4 个坐标参数）；`DisjointUnion = 1 + …`；`Difference = 2 + …`。`C_ast(S)=min cost`，`C_rect(S)` 为 E1 覆盖数，两者并列输出。
- 最优化：按矩形数分层枚举 bbox 子矩形上的表达式（level 1：Rect；level 2：`a⊎b`、`a∖b`；level 3：`(a op b) op c`），成本随层数单调（5 / ≥11 / ≥17），因此第一个出现拟合且完整枚举的层给出 `ProvenOptimalInUniverse`（宇宙 = ≤3 个矩形 + 行跑程分区）；表达式预算截断 → `BoundedBest`；bbox 面积 > 64 → 只用行跑程分区（合法、`BoundedBest`）。同成本的不同 AST 保留（`mrAlternatives`）；缓存只按精确 mask。
- 独立暴力解 `bruteForceBestCost` 在同一宇宙内无剪枝枚举，测试比对。
- 退化防护（`Scene.sceneCost`）：Scene 成本 = Object 数 + Σ shape MDL（未优化时 5×像素数）+ 2×Object 数（放置）+ 背景（1/0）+ 视图先验（Legacy 0，其它 1）；"每像素一个 Object"因 Object/放置项昂贵，"整图一个 Object"因 shape MDL 昂贵。MDL 只用于视图排序（`rcMDL`），不是正确性证明。

## 3. E2-B Scene（`Scene`）

`sceneFromView mdl withShape view grid`：Object = 视图的同色 4 连通分量（E0 视图，`poSupport` 两两不交，重检）；`Residual = U ∖ ⋃ M_i`；背景合法性：`B≠∅ ∧ G|B ≡ c → UniformResidual c`；`B=∅ → NoResidual`；多色 → `Left`（该视图不构成单色余像素 Scene，不改 Raw Grid）。`verifyScene` 逐像素重放（冲突/未覆盖/余像素颜色），`sceneHypotheses` 返回全部合法视图（按成本排序）与被拒视图及原因。背景色来自观察（0、8 皆可），Residual 中的 marker 会使该视图被拒绝而不是被当作背景。

## 4. E2-C Region 分区树（`Partition`）

`splitRegion scene R d`：`d` 必须是 Scene 中的 Object 且 `D⊆R`、`D≠∅`、`D≠R`；`C_i = ConnectedComponents4(R∖D)`；任何其它 Object（支持集 ⊆ R）必须整体落在某个 `C_i`，否则拒绝（"would be cut"）；返回 `Separator(D)` 与 `k≥1` 个 Content。`k` 由形状决定（十字 4、闭合框 2、独立 Object 1）。`k=1` 合法但非分离，最低优先级。

树：`rootNode`（根 = 画布）；`expandLazy`（取面积最大的 deferred 节点，叶判定 `ObjectLeaf | UniformLeaf`，否则取 k≥2 的最佳 separator，否则 `UnsplitLeaf(NoLegalSeparator) | NonSeparatingOnly`，深度上限 → `DeferredLeaf(depth)`）；`eagerClosure` 在预算内展开到没有 deferred 节点，截断时 `rtTruncated=True` 且 deferred 列表保留（不假称无合法划分）。终止：每个子区域是父的真子集（`D≠∅`），深度 ≤ 像素数；预算限制展开次数。

`verifyPartition`：根 = 画布；每个已展开节点重算 `splitRegion`，Separator 子节点 = 对象支持集，Content 子节点集合 = 分支集合，并集 = 父、面积和 = 父（不交）、parent/depth 一致、对象归属与重算一致。`PartitionWitness`（树 + 哈希）可独立重放；测试覆盖伪 Separator、不完整覆盖、篡改归属、错误 split 对象。`owningRegion` = 最深完整包含该 Object 的节点（Separator 的 owning region 是其 Separator 节点）；`adjacency` = 兄弟间 4 邻接像素接触数 + `SeparatedBy`（同一 split 产生的内容区域对）。

单色 4 连通视图下"切穿"条件在数学上不会触发（Object 不能跨越 `D`），检查保留给多色/8 连通视图；单元测试用手工合并的 Object 场景验证拒绝路径。

## 5. E2-D Region 程序（`Program`）

`RegionProgram {rpView, rpSelector, rpAction}`；选择器只读树的输入侧性质：`Root | UniqueLargestContent | UniqueSmallestContent | UniqueContentWithObjects | UniqueContentWithoutObjects | UniqueContentWithColor c | UniqueContentWithObjectCount n`（唯一性失败 → `Left`，无隐式选择）。动作：`CropRegion`（Region bounds 的原始窗口，复用 content-first 的裁剪语义）、`PreserveExcept (RecolorObjects c | ClearRegion | FillRegion c)`（只写被选 Region；Root 上的 Recolor 不改 Separator，即"各内容区域共享同一规则"）、`TranslateRegion dx dy`（区域内 Object 平移，空出处填 Residual 色，越界/覆盖其它 Object 失败）、`StampAtMarkers src`（读源区域图案，写到目标区域每个 1 像素 marker）。每个程序声明 `EffectClass`（Local / Selection / CrossRegion）；执行返回 `RegionExec`（读/写 Region、输出）。`runProgram` 通过 `progRegion` 字段执行，`runProgramEvidence` 给出重编码 witness。

## 6. E3-A 调度（`Search`）

- Goal = `(view, layer)`，候选 = 该视图该层的程序（有限宇宙：选择器 × 动作 × 合法视图）；层：L0 = Root/最大区域/含或不含对象区域的 Crop、Root/最大区域的 Clear；L1 = 其它选择器与 Recolor/Fill/Translate；L2 = StampAtMarkers。
- `rcRegionFirst`：候选按（层，区域尺寸类 root<largest<other<smallest，成本）排序；关闭则（层，成本）。
- `rcBreadth`：逐层 deficit round-robin，每轮每 Goal `rcQuantum` 次执行，候选未尽 → Deferred（游标保存，`glDeferred++`），下一轮从游标恢复（`glResumed++`），不重复枚举；关闭则按视图顺序逐 Goal 穷尽（旧式）。全局预算 `rcExecutionBudget`（程序执行次数，每次含全部 case）；`rcFirstFitStop` 控制首解早停（差分测试关闭）。
- `rcMDL`：视图顺序按 Scene 成本（关闭：固定视图顺序）。
- 记录：`GoalLedger`（total/cursor/used/allocated/deferred/resumed/status）、`Exposure` 序列（序号、视图、层、程序、结果）、`rsFirstViewExposure`、`rsFirstFitExposure`、`rg_*` 计数；终止语义：`FoundFit | NoFitYet(有限宇宙穷尽 → ProvenExhausted，范围声明为本任务的 Region 程序宇宙) | BudgetCut`。

## 7. E3-B 安全剪枝（`Search.prunable / sharedRuleOK`，`DependencyWitness`）

- 骨架 `PreserveExcept(edit)[Region ← sel]`：声明写集 = 被选 Region，其它像素逐格复制输入，输出尺寸 = 输入。证明：若某训练对的 `diff = {p | input(p) ≠ target(p)}` 不包含于被选 Region 的像素集，或尺寸不同，则该程序不可能拟合 → 跳过（`PrunedCandidate` 记录原因与像素证据）。只读训练目标做拟合期判定；推理期程序只读输入。
- 共享规则：`PreserveExcept(RecolorObjects c)[Root]` 要求每个深度 1 内容区域的 Object 在目标中都是 `c`，执行的颜色集 = 各区域拟合集的交集（而非笛卡尔积）。
- `CropRegion`（Selection）、`TranslateRegion`（写集需执行后才知）、`StampAtMarkers`（CrossRegion）**从不剪枝**。
- 差分：`rcFirstFitStop=False` 下 PruneOn/Off 在同一宇宙接受的程序集合相同（测试），On 的执行数 ≤ Off。

## 8. 与旧路径的接口

`Front.main`：Size-first → content-first → `regionGate`（仅 `rcEnabled`，且仅在前两者失败后；ExploreAlternatives 下只记录）。`Program.progRegion` 为新字段（旧程序为 `Nothing`，`runProgram` 语义不变）。配置（`StageDEvaluate`）：`FrozenE01` = FullE01；`E2Only`（无 region-first、无广度、无剪枝）；`RegionPriority`；`BreadthScheduler`；`RegionBreadth`；`FullE3`；`FullE3_NoMDL`；`FullE3_NoSafePrune`。预算：`rcQuantum=6`，`rcExecutionBudget=2400`，分区 24 次展开 / 深度 3 / 最小面积 2。

## 9. 限制

实测（[LATIS_STAGE_E2_E3_REPORT.md](LATIS_STAGE_E2_E3_REPORT.md)）：FrozenE01 22/400 与 E0/E1 逐 work 一致；7 个 region 配置均 26/400（+1c786137、2dc579da、5582e5ca、d9fac9be，0 丢失）；安全剪枝把执行数降 17.4%、预算截断题 24→7；Region-first 尺寸类排序与 MDL 视图排序在 400 题上没有可测收益（后者还使墙钟 +52%、峰值内存 1.2 GB）。运行后修补（不在冻结二进制内）：region fit 现在发 `latis-train-exact` eventlog 标记；`Scene` 现在用 `minimalCover` 填 `c_rect`（本批记录里为 0）。

Object 仍为同色 4 连通分量（多色 Region 为 P1）；选择器无 `CountColor/ArgMax`、无分隔线分区以外的 Region 来源；MDL 宇宙 ≤3 矩形；Region 程序只有 4 类动作；剪枝只覆盖 `PreserveExcept` 骨架；调度只有 3 层。
