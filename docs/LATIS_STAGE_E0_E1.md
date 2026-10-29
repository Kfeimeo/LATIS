# LATIS Stage E0–E1：背景无关的几何视图、最小矩形并与类型化坐标确界

实施前审计见 [LATIS_STAGE_E0_E1_AUDIT.md](LATIS_STAGE_E0_E1_AUDIT.md)，实测见 [LATIS_STAGE_E0_E1_REPORT.md](../reports/stage_e0_e1/LATIS_STAGE_E0_E1_REPORT.md)。本文描述数据模型、语义、算法、坐标类型与接口，以当前源码为准。

## 1. 数据流

```text
RawGrid（Latent.Grid.Grid，全部像素始终可读）
  ├─ LegacyView         = Latent.Encode.encode(Color0, 4 连通)      —— 逐像素、逐 ID 不变（Stage C/D/Content-first 旧解依赖）
  └─ BackgroundView h   = Geometry.View.viewRegions（h ∈ UniformBorderColor | UniqueMostFrequentColor | NoBackground）
        → Set[Region]（精确 PixelSet + 原始 grid 上观察到的颜色 + ViewId/证据）
        → Geometry.Cover（Bounds / RectangleCover / k* 或 [lower,upper]）与 Geometry.Features（坐标帧、ShapeGeometry、Witness）
        → ContentFirst.SelectionPlan（旧谓词 + GeoRectCount k）→ OutputSpec(Dimensions ← Bounds, CropInputWindow | EmitSelectedWithOwnCanvas)
        → 既有 RenderWitness + GeometryWitness / RegionProvenance / CrossCaseWitness
```

## 2. E0：RawGridView 与 BackgroundHypothesis（`Synthesis.Collection.Geometry.View`）

- 画布宇宙 U_{W,H} 与 G 就是 `Grid`；几何层不给颜色 0 任何特殊地位。
- `BackgroundHypothesis`：`Color0`（兼容）、`UniformBorderColor`（四条边全部同色 → 该色；否则 `Left` 不适用）、`UniqueMostFrequentColor`（计数严格最大者；并列 → `Left`）、`NoBackground`（无背景，颜色 0 是普通颜色）。`resolveBackground` 只读输入，不适用时显式拒绝，**绝不任选**。
- `ViewId = LegacyView | BackgroundView h`；`viewRegions v grid`：非背景像素（NoBackground：全部像素）的同色 4 连通分量，按首像素光栅序编号；每个 `Region` 带 `rgPixels :: PixelSet`、`rgColors :: Map Coord Int`、`rgView`、来源说明。`LegacyView` 直接由旧编码器生成并在测试中逐像素/逐 ID 核对。
- `Residual = U ∖ ⋃ SelectedRegions`（`residualOf`）：记录格数、颜色分布、被选 ID，注释明确"可能包含 marker、分隔线和未选中对象，不是背景"。
- `regionToObject`/`viewScene` 把 Region 转成旧 `Object`/`Scene` 以复用 Relation 选择器与渲染（Scene 的 `background` 字段只作为 own-canvas 的填充色；NoBackground 下 Emit 不适用）。
- 像素集合的几何支持与配色分离：`Region` 同时保存 `rgPixels` 与 `rgColors`；Crop 从原始 grid 读颜色，几何（Cover/Bounds）只看 PixelSet；测试验证 0↔8 置换不改变 NoBackground 几何，而 UniformBorderColor 的背景决定按定义改变并被如实报告。

## 3. E1：PixelSet 上的精确 RectangleCover（`Synthesis.Collection.Geometry.Cover`）

- `PixelSet = Set Coord`；`Rect{rx0,ry0,rx1,ry1}` 闭区间，`mkRect` 拒绝倒置/负坐标；`boundsOfPixels` 返回 `EmptyBounds | PixelBounds Rect`（空集不调用 min/max）。
- `maximalRectangles S`：从每个像素作为左上角、沿行跑程选右边界、向下最大延伸得到候选，再剔除被包含者；确定性 `(y0,x0,y1,x1)` 序。
- `greedyCover`：每次取覆盖最多未覆盖像素的极大矩形（平局按 key），终止且 union = S（任一像素都在某极大矩形内）。
- 下界 `lowerBoundRects`：贪心选取两两"不相容"的像素（其张成矩形不含于 S）；任何 S 内矩形至多含其中一个，故为合法下界。
- `minimalCover budget S`：branch-and-bound——选择被最少极大矩形覆盖的未覆盖像素分支，`depth + lb(剩余) > best` 剪枝；收集等于最优规模的覆盖作为备选（按集合去重，上限 `cbMaxAlternatives`）。结果：
  - `EmptyCover`（k* = 0）；
  - `ProvenMinimal{crCanonical, crAlternatives, crAlternativesComplete, crNodes, crMaximalRects, crLowerBound}`：搜索在节点预算内完整结束；canonical = 排序后矩形列表的字典序最小者；备选为搜索中找到的其它最优覆盖（`crAlternativesComplete=False` 时存在但未穷尽）；
  - `ValidBounded{crBest, crLower, crUpper, crTruncation,…}`：节点预算或 bbox 面积预算截断；上界是找到的最佳覆盖规模，**不称 k***。
- 备选覆盖在**极大矩形正规化**下枚举：任何覆盖都可把每个矩形扩大为极大矩形而不增加个数，因此 k* 不受影响；使用非极大矩形的等大覆盖不单独列出（文档明示，不冒充"所有"最优分解）。
- `verifyCover`：独立检查每个矩形 ⊆ S 且 union = S（双向差异报告）。
- 预算：`predicateCoverBudget`（4000 节点 / 400 面积 / 2 备选，用于选择谓词）、`defaultCoverBudget`（20000 / 900 / 8，用于 witness）。连通性：Cover 不拆分分量；输入的 Region 已是 4 连通同色分量，对角接触的像素属于不同 Region（E0 语义），不在 Cover 内合并。

## 4. 几何 Feature 与坐标类型（`Synthesis.Collection.Geometry.Features`）

- `AbsRect`（画布绝对）、`RelRect`（相对显式锚点，`toRelative anchor`）、`NormRect`（平移不变，`normalizeRect`）为不同 newtype；没有跨帧的隐式比较。`corners` 由四个确界推导（TL/TR/BL/BR 不是自由参数）；`rectWidth = x1−x0+1`。
- `ShapeGeometry`：从 PixelSet 计算 bounds、width/height、area（像素数，不是 bbox 面积）、`CoverResult`；`rectCountStatus` 只在证明最小时给出 `Right k`，否则 `Left`（含上下界与截断原因）。
- 接入真实搜索的通路：`Relation.Pred` 新增 `GeoRectCount k`（`evalPred` 调用 `shapeGeometry predicateCoverBudget` 并要求 `rectCountStatus` 为 `Right`，未证明 → `Left`，不用上界）；仅当 `cfGeometry` 打开时进入 content-first 的 selector 宇宙（k ∈ {1,2,3} 及 `NotP`）。被选中后由 `deriveOutputSpec` 决定 Dimensions ← Bounds，即几何 Feature 既参与选择又参与尺寸。
- 任何 `Set[Rect]/Set[Region]` 索引不自带跨案例角色：选择仍只有 `Unique`（零/多匹配失败）与 `NonEmptySet`（联合 bbox）。

## 5. Witness（在既有 Transform/Render/Pixel-provenance 之上增加）

- `GeometryWitness`（task、case、view、坐标帧、PixelSet 哈希、Bounds、矩形列表、状态、下/上界、备选数、预算）；`verifyGeometryWitness` 以相同预算独立重算：像素哈希、bounds、每个矩形包含于 S、union = S、状态与最小值一致（被记录的覆盖必须是重放找到的最优覆盖之一）。测试覆盖增/删像素、改 bounds、改矩形、改状态、改帧、改哈希的伪证据。
- `RegionProvenance`：原始 grid 哈希、视图、背景决定与证据、region ID、bounds 来源、颜色来源（原始窗口 / 仅选中成员）、残差格数；注明残差不是背景。
- `GeoRelation`（最小原型）：`SameMask`、`SameUpToTranslation dx dy`、`BoundingContainment`、`Disjoint`、`Overlap n`、`CropSource window`；`relate` 返回所有成立的关系（多对多，不选取），`verifyRelation` 独立核验。
- `CrossCaseWitness`：同一输入侧程序在每个 case 的可观测绑定（视图、背景、选中 region、bounds、dims、矩形数状态）与 target 仅用于的 exact 标记；逐字段给出 `ObservedCaseAgreement | Varies | Pending`，明确只是训练 co-denotation。
- 信息流：所有视图/选择/几何只读输入；训练目标仅在候选验证与 exact 标记处读取。

## 6. Content-first 集成与配置

- `ContentFirstPlan` 增加 `cfpView :: ViewId`；`planCost` 对非 Legacy 视图 +1；`enumeratePlans colors shape diagonal views geometry` 在旧宇宙之后追加视图计划与 `GeoRectCount` 计划。两开关都关时宇宙与上一轮逐项相同（测试验证）。
- `deriveOutputSpec opts plan bg grid scene`：按计划视图取场景（Legacy 用调用方的编码场景；其它视图 `viewRegions`，不适用 → 显式失败），选择 → bounds → dims → 内容；Crop 始终从原始 grid 读窗口并用视图对象重放核对；Emit 的填充色 = 视图背景（NoBackground → 不适用）。`doGeometryWitness` 决定是否计算成员的 GeometryWitness（搜索中按 `cfGeometry`；程序执行不计算）。
- 搜索中每 (case, view) 只实例化一次（惰性表）；新 trace 事件：`geometry-view-created` / `geometry-view-not-applicable`、`cover-proven` / `cover-bounded`、`geometry-feature-evaluated`、`content-first-branch-executed`；新计数 `geo_views_created`、`geo_views_not_applicable`、`geo_feature_evaluations`、`geo_cover_proven/bounded`、`geo_selected_rect_count`。
- 配置（`ARC.StageDEvaluate.namedConfigsD`）：`FrozenCF` = ContentFirstOnly（400 plans / 4000 执行）；`BackgroundViewsOnly`（cfViews，1600 / 12000）；`GeometryFeaturesOnly`（cfGeometry，600 / 6000）；`FullE01`（两者，2400 / 16000）。Size-first、A/B/C/D 预算完全不变；旧首解仍优先（content-first 只在 Size-first 失败后触发）。
- 真实失败题的分类沿用 content-first：`content_first_unavailable_due_to_representation`（无任一合法 selection）、`content_first_no_train_exact[_budget_truncated]`（有合法 selection 但无整格匹配）、`timeout`。

## 7. 限制

本轮 Region 仍为同色 4 连通分量（多色 Region、`ArgMax(CountColor)`、分隔线分区为 E2）；Cover 的备选只在极大矩形正规化下枚举；大 mask（bbox > 900）或超预算时只给 Bounded；没有 GADT 级的画布维度索引（运行时 smart constructor 校验）。
