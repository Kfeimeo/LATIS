# LATIS Stage E4 实施前审计

审计对象：git `950859e1`（Stage E3.1 提交后的源码；`results/stage_e31/e31-20261028-main` 的冻结二进制 `8d44dd48b5b39ff9448045339de80e7552eb2d2909280ca64b2492593624c08e` 由同一源码编译，已核对 `code_version.json`）。以下符号、行号以当前源码为准。先审计、后定义 E4 的类型与函数名。

## 1. 训练对的流向与输出的可见范围

| 环节 | 位置 | 训练输出 `O_i` 在此是否可读 | 说明 |
|---|---|---|---|
| 任务加载 / `test=[]` 守卫 | `ARC.ArcTrainOnly.runStage`（`not (null (tests task))` → 写 `refused_test_pairs` 并 `exitWith 3`）；`ARC.TraceIO.runTraceIO` 同样拒绝 | — | 驱动器 `run_stage_e31.py` 只生成 train-only 文件并在 `run` 前断言 `test==[]`；机制任务的 heldout 只在 `ARC.StageAEvaluate.heldExactOf` 中用于评分 |
| 前端入口 | `Synthesis.Collection.Front.frontSearch mode conf examples`，`examples :: [(Grid,Grid)]` | 是 | 整个搜索都能读 `snd` |
| Size-first | `synthesizeSize sa … scenes` 用输出画布尺寸作拟合目标 | 是（目标） | 输出只作目标 |
| 对齐 / Typed / Stage B / C / D | `sizeFirstPaths`、`relationStep`、`unifiedStep` | 是（目标） | 候选由输入侧枚举，输出只用于比对与参数拟合 |
| Content-first | `CFCase input scene target` | 是（目标） | 同上 |
| Region 搜索 | `searchRegions rg examples`：目标用于 `execute` 比对、`prunable`/`sharedRuleOK` 的拟合期证明；Selector 预检查只读输入树 | 是（目标） | E3.1 报告 §2.2 |
| 记录写出 | `runConfigured` 的 `oExtra`：`content_first`、`region_search`、`execution_witnesses` 等 | — | E4 新字段加在这里 |

结论：E4 的 sidecar 在 `Front.main` 的末尾可以直接拿到 `examples` 的全部 `snd`，这正是它的输入；它**不得**写回 `program`/`search_work`/`first_solution_work` 等旧指标，只能追加自己的 Graph 字段与 `e4_*` 计数。

## 2. 输出 Grid → View → Scene / Object / Shape 的可复用路径

| 函数 | 签名 | 对输入/输出的假设 |
|---|---|---|
| `Geometry.View.viewRegions` | `ViewId -> Grid -> Either String ViewResult` | 任意 `Grid`。`LegacyView` 用编码器（背景 0、4 连通），`BackgroundView h` 用 `resolveBackground`（UniformBorderColor / UniqueMostFrequentColor / NoBackground）；Region = 同色 4 连通分量，按首像素光栅序编号 |
| `Region.Scene.sceneFromRegions` | `ShapeSource -> ViewId -> Grid -> ViewResult -> Either String SceneHypothesis` | 任意 `Grid`；检查支持集不交、余像素单色或空（`UniformResidual c | NoResidual`）、`verifyScene` 逐像素重构 |
| `Region.Scene.shapeLookup / ShapeSource` | `NoShapes | EagerShapes | CachedShapes MDLCache` | 形状来源可控；`CachedShapes` 复用 E3.1 缓存（键 = 归一化 mask + 预算 + DSL 版本） |
| `Region.ShapeMDL.bestShape` | `MDLBudget -> PixelSet -> Either String MDLResult` | 局部归一化帧；返回最优 + 同成本备选（`mrAlternatives`，最多 4） |
| `Region.ShapeMDL.attachRectCover / Geometry.Cover.minimalCover` | — | `c_rect` 与 `c_ast` 独立 |
| `Region.Scene.verifyScene` | `SceneHypothesis -> SceneWitness` | 对象像素 + 余像素颜色逐格重构 |

这些函数没有任何“输入颜色”特判，E4 可以直接把 `O_i` 送入。限制：
- **对象 = 单色 4 连通分量**。多色对象、8 连通对象、被其它颜色切开的同一“意向对象”都会变成多个 Object；E4 的第一版只能用多个单色 Object 的组合表达多色结构（提示词 §2.2 允许，须如实报告）。
- `bestShape` 只在**第一个有命中的层**停止（审计 E3.1 §2.5）：`mrAlternatives` 只有同成本备选，不会同时给出“Shell = 外框 \\ 内框（12）”和“4 个矩形的无交并（23）”。E4 需要一个跨层的有界备选枚举（新函数，复用 `level`），否则 `AlternateShapeASTs` 家族无法保留备选。
- `MDLBudget` 默认 3 矩形 / 面积 64 / 200000 表达式；面积 >64 的对象只有 row-run 分区（`BoundedBest`）。E4 的 Shape 模板对这类对象只能用 row-run 无交并或回退到 `RepresentationUnavailable`。

## 3. `ShapeExpr` 的真实语法与语义（E3.1 后）

```
ShapeExpr = SRect Rect | SUnion ShapeExpr ShapeExpr | SDiff ShapeExpr ShapeExpr
eval (SRect r) = cells r（闭区间，局部坐标，由 pixelSetNormalize 把 mask 的 min x/y 移到 0）
eval (SUnion a b) = a ∪ b  当且仅当 a ∩ b = ∅，否则 Left
eval (SDiff a b)  = a \ b  当且仅当 b ≠ ∅ ∧ b ⊆ a ∧ a \ b ≠ ∅，否则 Left
shapeCost: Rect 5, Union +1, Diff +2（与坐标无关）
```
`level n` 枚举“恰好 n 个 bbox 子矩形”的表达式：n=1 `SRect r`（r ⊆ S）；n=2 `SUnion a c`（a<c，均 ⊆ S）与 `SDiff a c`（a 任意子矩形，c ≠ a）；n=3 在 2 层结构上再加一个矩形。顺序固定（矩形按 (x0,y0,x1,y1) 升序）。`ProvenOptimalInUniverse` 的宇宙 = ≤3 矩形的上述表达式 ∪ row-run 分区。可重叠矩形覆盖（`minimalCover`，`c_rect`）与 AST 成本是不同度量，E4 只把 `c_ast` 作为结构成本输入，`c_rect` 只报告。

坐标帧：`SRect` 的坐标是对象局部帧（归一化后）；对象在画布上的位置 = `poSupport` 的 bounds 左上角。因此 E4 的 `ObjectTemplate = Place(ShapeTemplate(local), Colour, Position(absolute))` 与现有数据一一对应，无需新的几何原语。

## 4. 对象身份与位置的记录方式

- `PlacedObject { poId, poView, poSupport :: PixelSet(绝对), poColors :: Map Coord Int, poShape :: Maybe MDLResult }`；`poId` = 该视图 Region 的光栅序号——**不是**跨输出稳定的身份。两个输出里“同一个角色”的对象可能有不同 id、不同位置、不同数量。
- `RegionTree` 节点 id 来自展开顺序；Region Selector 只定义在**输入**树的深度 1 content 节点上，不能用来选择输出对象。E4 的输出侧角色必须由结构匹配给出。
- `SceneHypothesis.shBackground`：`UniformResidual c` 只在余像素非空且单色时产生；`NoResidual` 时**没有**背景色——E4 的 Canvas 模板必须区分 `BgColour c | BgNone`，不能在 `NoResidual` 时推断背景。

## 5. Stage B 抽象指称的可复用部分

`Synthesis.Collection.Referent`：`LTerm l`（一阶标量项，叶 = 作用在 (object, scene, set) 绑定上的原子观察器）、`normalize`（常量折叠 + 全函数恒等式 + 交换参数排序，不按训练一致性合并）、`relate`（一步关系 + `StructuralWitness / CaseWitness(CaseAgree 只是训练共指) / DependencyWitness / TypeWitness`）、`VSA`（hash-cons DAG，`expand` 等于普通候选列表）。

可直接复用：Witness 的词汇与原则（训练一致 ≠ 全域等价；合并只凭规范形恒等式；候选共享 ≠ 候选删除；Opaque 节点不参与证明）。不可直接复用：`LTerm` 的节点是标量 `TOp`，没有 Scene/Shape 构造子；`VNode` 的联合（`VUnion`）是候选集合的因子化，不是模板的 Hole。E4 的模板需要自己的类型（`ShapeTemplate`/`ObjectTemplate`/`SceneTemplate`）与自己的规范化（交换 `Union` 的子节点排序、alpha-renaming of holes）；共享用 `Data.Map` 记忆化而不是复用 `VSA l`，避免把 Scene 结构硬塞进标量 DAG。E4 **不触及** `Referent.hs`，因此 Stage B 长套件不属于本阶段必跑项（仍标 `not_run`）。

## 6. E3.1 开关的真实默认值

`regionConfigOn = {rcEnabled=True, rcRegionFirst=True, rcBreadth=True, rcSafePrune=True, rcMDL=True, rcQuantum=6, rcExecutionBudget=2400, rcFirstFitStop=True, rcPrecheck=False, rcLazyMDL=False, rcMDLRecord=True, rcSelectorPriority=False}` —— E3 行为。E3.1 报告建议的默认（`rcPrecheck=True / rcLazyMDL=True / rcMDL=False / rcRegionFirst=False`）**没有写进代码**；`E31_Full = regionConfigOn {rcPrecheck=True, rcLazyMDL=True}`。E4 的冻结基线配置 `E4_Off`（别名 `E4_FrozenE31`）必须逐字段等于 `E31_Full` 的 `regionSearch` 与 `contentFirst`，sidecar 关闭；`E4_OutputSkeletonOnly` 只多一个 `outputSkeleton` 字段。不改任何既有配置的默认值。

## 7. 记录、trace 与 heldout 评分

- 记录：`ArcTrainOnly.runConfigured` 写 `program`、`counters`、`content_first`、`region_search`、`phase_timings`、RTS 字段；E4 追加 `output_skeleton`（独立顶层字段）与 `e4_*` 计数（进入 `counters`，不进入 `search_work` 的 `operator_applications`）。
- trace：`TraceIO` 把 `record` 的白名单字段嵌入 `solver_record.json`，`trace_io.py render` 只把列出的键（含 `region_search`）放进页面数据；查看器 `TABS` 固定列表。E4 需要在白名单与 `TABS` 各加一项。
- 机制 heldout：`RegionMechanism.runMechanismR` 对 `training task` 搜索，`heldExactOf task f` 只是跑程序比对。E4 的机制跑分必须：训练输出 → 归纳；heldout 输出只做“冻结骨架能否实例化”的结构诊断（`oracle_parameter_structural_reconstruction`），分别记录，不进入归纳、排序或成本。

## 8. 当前能力边界（E4 必须如实写入覆盖范围）

1. Object 提取只有单色 4 连通；没有多色父对象、没有 8 连通。
2. 正式 Region 搜索只展开根（深度 1）；E4 不依赖 Region 树。
3. Shape 代数只有 `Rect/⊎/\\`，≤3 矩形的有界宇宙；超限对象只有 row-run 分区。
4. 没有任何输出侧结构类型；`CrossCaseWitness`（`Geometry.Features`）记录的是输入侧程序的逐 case 绑定与训练一致标签，可借用其 `ObservedCaseAgreement | Varies | Pending` 词汇。
5. 没有输出到输入的参数绑定接口（E5）。

## 9. 最小可行接口与分阶段清单

新模块（不改既有模块的语义）：

- `Synthesis.Collection.Output.Template`：`IntExpr`（字面 / 类型化 Hole / Hole+常数偏移）、`ColourExpr`、`ShapeTemplate`、`ObjectTemplate`（含 `Repeat` 的线性放置关系）、`SceneTemplate`、实例化 `render :: SceneTemplate -> Bindings -> Either String Grid`（逐像素来源）、成本（§2.3 的分项）、退化参考成本、JSON。
- `Synthesis.Collection.Output.Scene`：对每个输出、每个合法视图构造 `OutputSceneCandidate`（复用 `viewRegions`/`sceneFromRegions`/`verifyScene`/`MDLCache`），对象的跨层 Shape 备选（新函数 `shapeAlternatives`，复用 `ShapeMDL.level`）。
- `Synthesis.Collection.Output.Induce`：类型化反统一（`Rect`、`Diff`、`Union` 的交换候选）、角色匹配（同数：有界双射枚举，保留歧义；不同数：线性重复组或 `UnsupportedVariableMultiplicity`）、全体一致性（一次对全部 case 的列式反统一，pairwise-only 只作消融）、状态与失败原因、Witness、E5 工件。
- `Synthesis.Collection.Front`：`Config.outputSkeleton :: OutputSkeletonConfig`（默认关闭）、`Graph.outputSkeletonRun`、`main` 末尾的 sidecar（不改变结果）。
- `ARC.OutputMechanism`（12 个机制家族 × 3 seeds，heldout 结构诊断）、`ARC.StageDEvaluate` 新配置、`ArcTrainOnly`/`TraceIO`/viewer 的记录与展示、脚本 `make_e4_quick40.py`、`run_stage_e4.{py,ps1,sh}`、`report_stage_e4.py`、`verify_stage_e4.py`、`test/OutputMain.hs`。

实施顺序按任务书 §13。
