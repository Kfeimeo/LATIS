# LATIS Stage E0–E1 实施前审计与三题 Oracle 初判

审计对象：Content-first 验收后的源码（git HEAD `95c2fe8b` + 未提交改动，即 `results/content_first/cf-20261026-main` 的快照）。以下所有符号以当前源码为准。

## 1. 现有接口图（与几何相关的部分）

```text
Grid (Latent.Grid: Dimensions, [[Int]], cell, gridFromCells bg)
  └─ Latent.Encode.encode (EncoderConfig Four 0)  ──►  Scene{canvas, background=0, objects=[Object id pos geometry]}
        ├─ Synthesis.Collection.Indexed / Counterfactual   (Placed/SizeSig/Bounds bMinX.. 旧标量 referent，绝对坐标)
        ├─ Synthesis.Collection.Shape (ShapeMask: 归一化局部坐标；decompose = 深度≤2 的 Square/Rectangle/Shell/Diagonal/Triangle 并/交模板分解)
        ├─ Synthesis.Collection.Relation (Pred/Selector/emitObjects/renderWitness, objColor = 单色对象)
        ├─ Synthesis.Collection.Size (GFeat 叶子：GLargestW/H、GSmallestW/H、GSetW/H、GColors、GPixels)
        ├─ Synthesis.Collection.Parameter (ParamLeaf: WholeMinX/MaxX/SelectedMinX.. 绝对坐标，Int)
        ├─ Synthesis.Collection.Unified (DCase.dOutputDims 预先固定画布)
        └─ Synthesis.Collection.ContentFirst (Bounds bMinX.. inclusive；selection→bounds→dims→Crop/Emit；bg 参数来自 encoderBackground)
Latent.Render.render: gridFromCells canvas background pixels（背景填充，越界拒绝）
```

## 2. `background = 0` 的使用位置（逐条）

| 位置 | 性质 | 本轮处理 |
|---|---|---|
| `Latent.Encode.defaultEncoder = EncoderConfig Four 0`；`encode` 只把 `c /= encoderBackground` 的像素作为对象像素 | **静态约定**（对象划分） | 保持不变 = `LegacyView`；并行新增 `Geometry.View` |
| `Synthesis.InducedR2.Learn.defaultInduced … defaultEncoder`（`Front.frontSearch` 的 `enc`）| 静态约定 | 不变 |
| `Latent.Render.render`/`gridFromCells bg` | 渲染填充色 | 不变；content-first 自带 `oswCanvasFill`（视图背景色） |
| `Relation.renderWitness/verifyRenderWitness dims bg` | witness 填充色 | 不变 |
| `Relation.objColor`、`evalPred (ColorIs c)`、`ColorMostFrequent` | 单色对象假设（来自编码器） | 不变；新视图的 Region 仍是同色分量（多色 Region 为 P1） |
| `Size.gridValue GColors/GPixels`（`O.objects` 上的计数）| 依赖编码器对象 | 不变（Size-first 未改） |
| `ContentFirst.deriveOutputSpec … bg`、`renderOutputSpec bg`、crop 重放 `gridFromCells dims bg` | 填充/重放色 | 改为按计划的 View 决定（`sceneForView`），Legacy 保持 encoder 背景 |
| `Front.runProgramObjects`：`encoderBackground enc` 传给 content-first | 填充色 | 不变（Legacy）；视图计划在 `deriveOutputSpec` 内部切换 |
| `Front.groundingTrace`、`TraceIO.grids.json` 的 `background` 字段 | 观测 | 新增 `views` 并排记录 |
| `ARC.ContentFirstEvaluate.programSpecsCF`、`TraceIO.replayContentFirst` 的 `bg` | 评估重放 | 同上 |
| 机制生成器（Stage A–D、Content-first）`gridFromCells … 0` | 测试数据约定 | 不变 |

**搜索触发**：没有任何触发条件直接读背景色；Size-first 触发只看尺寸拟合；content-first 触发只看 Size-first 结果。

## 3. 现有 MinX/MaxX/Width/Height 与 ShapeMask

- `Latent.Object.width/height` = 几何映射键的最大值+1（对象局部坐标，inclusive+1）；`position` 为绝对左上角。
- `Counterfactual.Bounds{bMinX,bMaxX,bMinY,bMaxY}`、`Parameter.ParamLeaf WholeMinX..SelectedMaxY`：**绝对画布坐标**的 inclusive 极值（Int，无帧类型）；`ContentFirst.Bounds` 同义（字段顺序不同）。三者都没有把相对坐标/归一化坐标与绝对坐标区分为不同类型。
- `Shape.ShapeMask`：按最小 x/y 平移到 0 的像素集合（归一化）；`decompose` 是**模板分解**（一个原语，或两个原语的 Union/Intersection，预算 `DecompBudget`），不是最少矩形并；`isRectangle` 等谓词为精确识别。
- 结论：E1 的 `Rect`/`AbsRect/RelRect/NormRect` 与 `PixelSet` 上的 `Bounds/Cover` 是新语义，不是旧字段改名；旧字段保留不动。

## 4. 三题 Oracle 初判（官方 training IO，临时 Python 解释器，仅诊断）

| 任务 | 人工候选规律 | 全训练对 | 当前型别缺什么 |
|---|---|---|---|
| `e50d258f` (3 对) | 非 0 像素的 4 连通**多色**分量 = 矩形面板；取颜色 2 计数唯一最大的面板；裁剪其窗口 | 3/3 逐格精确（counts2 = [3,1,2]、[1,4,5]、[3,2]）| `MulticolorRegion`（当前 Region 仍按同色分量）、`CountColor/ArgMax` 选择器 |
| `2dc579da` (3 对) | 整行/整列单色分隔线（颜色 3/2/1 逐例不同）把画布分成 4 格；计数为 1 的颜色像素为 marker；输出 marker 所在格 | 3/3 逐格精确 | `PartitionByLines`、"包含 marker 的分区" 选择；背景不是 0（无 0 像素）：`UniqueMostFrequentColor` 视图能给出主色但分区不是分量 |
| `543a7ed5` (2 对) | 边框色 8 为背景；每个颜色 6 分量的 bbox 外圈一格画 3（只画在背景格上、画布内裁剪）、分量 bbox 内被包围的 8 格填 4 | 2/2 逐格精确 | 同尺寸构造任务：需要 bbox 外圈构造与孔洞填充，不在 Content-first/Relation 原语内；背景解释（`UniformBorderColor`→8）可表达 |

这些规律是人工假设经临时解释器验证的 **diagnostic oracle**，不是 Ground Truth，也不进入求解器；没有为它们添加任何特判原语。

## 5. 拟修改的最小文件范围

- 新增：`Synthesis.Collection.Geometry.Cover`（PixelSet/Rect/RectangleCover）、`Geometry.View`（RawGridView/BackgroundHypothesis/Region/Residual）、`Geometry.Features`（坐标帧、ShapeGeometry、Geometry/Provenance/Relation/CrossCase Witness）、`ARC.GeometryMechanism`、`test/GeometryMain.hs`、`scripts/run_stage_e01.{py,ps1}`、`scripts/report_stage_e01.py`。
- 修改：`Relation.Pred` 增加 `GeoRectCount k`（只在 content-first 的几何开关下枚举）；`ContentFirst`（计划带 `ViewId`、`cfViews/cfGeometry`、几何 witness、新 trace 事件）；`Front`（宇宙开关、新计数）；`StageDEvaluate`（四个配置）；`ContentFirstEvaluate`/`TraceIO`（witness JSON、视图并排、replay 解码）；`trace_io.py`/查看器；`latis.cabal`。
- 不改：`Latent.Encode.encode` 及其输出、对象 ID/顺序；Size-first 路径；Stage A–D 文法与预算。

## 6. 成本风险与回归基准

- 风险：视图把 content-first plan 宇宙放大 4 倍（约 140 → 560），FrozenCF 的 400-plan 预算必须保持不变；新配置使用单独声明的更大预算，否则视图计划根本到不了（首轮机制测试即因此截断）。精确覆盖搜索有节点/面积预算，谓词用小预算（4000 节点/400 面积），witness 用大预算（20000/900/8 备选）。
- 回归基准：`results/content_first/cf-20261026-main` 的 `ContentFirstOnly`（22/400，逐题 `search_work`），FrozenCF 必须逐题相同（程序文本只允许多出 `cfpView = LegacyView` 字段）。
- 由于本轮的 Region 仍是同色分量、没有 `MulticolorRegion/ArgMax/PartitionByLines`，三道审计题在 E0/E1 内**预期仍不可解**；报告按首个有证据的阻塞层记录。
