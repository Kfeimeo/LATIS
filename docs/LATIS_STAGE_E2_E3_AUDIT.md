# LATIS Stage E2–E3 实施前审计

审计对象：E0/E1 验收后的源码（`results/stage_e01/e01-20261027-main` 快照，FullE01 22/400）。以下以当前源码符号为准。

## 1. 已有组件与复用点

| 组件 | 位置 | E2/E3 复用 |
|---|---|---|
| 精确 PixelSet、`Rect`（闭区间）、最小矩形覆盖（允许重叠）`minimalCover`、`verifyCover`、`BoundsE` | `Synthesis.Collection.Geometry.Cover` | Shape AST 的 `Rect` 与 `C_rect` 指标直接复用；**不**把覆盖当作无交并 |
| 背景视图 `LegacyView / BackgroundView{UniformBorderColor,UniqueMostFrequentColor,NoBackground}`、`Region`（同色 4 连通分量，带 `rgPixels`、`rgColors`）、`residualOf` | `Geometry.View` | Scene 假设的 Object 列表来源（每个视图一个候选 Scene）；Residual 的单色检验是新增的 Scene 合法性条件 |
| 坐标帧 `AbsRect/RelRect/NormRect`、`ShapeGeometry`、`GeometryWitness`、`RegionProvenance`、`GeoRelation`、`CrossCaseWitness` | `Geometry.Features` | Region 节点的 bounds/帧；GeometryWitness 不变 |
| 旧 Shape 模板分解（`decompose`：Square/Rectangle/Shell/Diagonal/Triangle 的 Union/Intersection，深度 ≤ 2）| `Synthesis.Collection.Shape` | 保留为 Stage C 审计；E2 的 Shape AST 是新的 `Rect/⊎/\` 代数，另有独立 MDL；两者都不替换 |
| Content-first `OutputSpec`（selection → bounds → dims → Crop/Emit）、`cropWindow`、`renderOutputSpec`、`CFRun`、trace 事件 | `ContentFirst` | `CropRegion` 复用 `cropWindow` 与 provenance；Region 程序作为新的 `progRegion` 分支，不改旧 plan |
| 搜索 gate：`Front.main → sizeStep → sizeFirstPaths → contentFirstGate` | `Front.hs:430-500` | Region/Breadth 搜索以新 gate `regionGate` 接在 content-first 之后（旧首解优先；只在显式开关下触发） |
| D+ 诊断（`DG.diagnostic`、scope/branch/stop_reason/exhaustiveness）、单 IO trace 事件（`traceAt/traceCand`） | `Diagnostics`, `TraceIO`, `trace_io.py` | 新 scope `Scene/Partition/RegionSearch`，沿用终止语义 |
| 旧 Deferred 记录（`Graph.deferred`） | `Front` | Goal 的 Deferred 游标以新的 `GoalLedger` 记录，同时写一条 `Deferred` 兼容记录 |

## 2. 旧搜索优先级与尺寸前置约束

`main`：SizeRule → （等基数）alignment/typed/B → Relation → D unified → content-first（size 失败或下游失败触发）→ 本轮新增 Region 搜索（content-first 失败后触发；ExploreAlternatives 下也记录）。Size-first 首解仍早停；Region 分支只在显式配置下展开，触发前候选数为 0。Size 前置约束对 Region 分支不存在：`CropRegion` 的尺寸由 Region bounds 决定，`PreserveExcept` 的尺寸等于输入画布。

## 3. 作用域/类型边界

- Object（E0 `Region`/旧 `O.Object`，同色分量）≠ Region（分区树节点：任意颜色、可含多个 Object 与余像素）≠ Scene（整张 Raw Grid 的一个解释：Object 列表 + 单色 Residual/NoResidual）≠ Shape（Object 的局部 mask，AST 描述）。本轮在新模块 `Synthesis.Collection.Region.{ShapeMDL,Scene,Partition,Program,Search}` 中分别类型化，不复用 `Geometry.View.Region` 作为树节点类型。
- 背景 0 的硬编码只在旧编码器与旧渲染填充中（见 E0 审计）；新 Scene 分支的背景来自 Residual 的实际颜色（`UniformResidual c | NoResidual`），不读 0。
- 训练输出只在候选验证、变更 Region 判定（剪枝证明）与 witness 的 exact 标记中读取；Scene/Partition/选择器只读输入。

## 4. 预算与性能事实（E0/E1 报告）

FullE01 的 SearchWork 只多 0.58% 但墙钟多 35%：原因是 `deriveOutputSpec … deriveWithGeometry` 在搜索中对每个派生 spec 的每个选中成员都重新做 branch-and-bound（trace 中 `cover-proven` 9167 次/题），没有按 PixelSet 缓存。本轮：(a) Shape/Cover 结果按归一化 PixelSet 做 memo（`Data.Map` 惰性缓存，每任务一张表）；(b) 几何 witness 只对 train-exact 的候选计算；(c) 新计数 `geometry_cover_calls`/`cache_hits` 独立记账。异常退出（5 条 exit 1 空 stderr）未定位；本轮运行器记录退出码、stderr、最后 checkpoint 事件、OS 信息，并原样保留 `*.crashed.json` 与重跑记录。

## 5. 三题 Oracle 与可达性预判

- `2dc579da`：在 `UniqueMostFrequentColor` 视图下分隔十字是一个真实 4 连通 Object（行列同色相交），marker 为另一个 Object，Residual 为象限主色、单色 → Scene 合法；由十字分区得到 k=4 个内容区域；需要选择器"唯一含 Object 的内容区域"+ `CropRegion`。预判 **可枚举、可到达**；是否盲解取决于调度到达该 Goal。
- `e50d258f`：背景 0；面板是多色块，没有任何单色 Object 把画布分成多个分支（0 像素在 NoBackground 视图下是对象，但它们形成一个大连通的"背景对象"，以它为 separator 得到的 CC 就是各面板的非 0 像素集合）。这条路径是合法的：separator = 颜色 0 的大 Object，内容区域 = 面板。然后需要 `CountColor(2)` 的 ArgMax 选择器——本轮未实现（P1）。预判 `RegionRuleUnavailable`。
- `543a7ed5`：输出构造（外圈+填孔）缺原语，保持负控制。

## 6. 真实改动文件

新增 `src/Synthesis/Collection/Region/ShapeMDL.hs`、`Scene.hs`、`Partition.hs`、`Program.hs`、`Search.hs`（调度+剪枝）、`src/ARC/RegionMechanism.hs`、`test/RegionMain.hs`、`scripts/run_stage_e2_e3.{ps1,py}`、`scripts/report_stage_e2_e3.py`。修改：`Front.hs`（`progRegion` 字段、`regionGate`、计数）、`StageAEvaluate.typedBindings`、`test/StageDMain.hs`（位置构造子）、`StageDEvaluate.namedConfigsD`（8 个配置）、`ContentFirstEvaluate`（JSON）、`TraceIO`/`trace_io.py`/查看器（新 scope 与页面）、`latis.cabal`。
