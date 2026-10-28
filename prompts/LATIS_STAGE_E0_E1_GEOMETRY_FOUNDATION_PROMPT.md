# LATIS Stage E0–E1：背景无关的几何视图、最小矩形并与类型化坐标确界

> **交付任务**：基于已经验收的 Content-first / OutputSpec（ARC-AGI-1 training 前端 **22/400 train-exact**，旧 20 解全部保留），完成下一阶段可复现的 **几何表示基础改造**。本轮重点是 `RawGrid → PixelSet / BackgroundHypothesis → RectangleCover / Bounds → Typed Geometric Features → Content-first`，并建立几何与跨案例证据的最小接口。
>
> **不要**在本轮完成整个 Region DSL、任意几何关系搜索、图案补全、Recognition Model 或大规模 DSL 扩展。**不能**为了指定 ARC 题写 task-ID 特判、读取未知 test 输出或把人工 Oracle 注入正式搜索。
>
> 文档、报告与解释使用**简体中文**。以当前仓库源码为准核对符号/模块名；下文数据类型和接口是**语义要求，不是强制逐字实现的 API**。符号核心仍使用 Haskell，暂不修改 PyTorch 网络。

## 0. 阶段定位、事实和待验证假设

目前从已完成阶段中获知：

- Stage A/B 有 Typed 标量特征、Bounds、Case-relative referent/witness、参数 VSA，但不等于已经具备矩形分解、类型化 Region 集合和跨案例多对多几何对应。
- Stage C 的默认对象视图依赖**颜色 0 作为背景**与**同色四连通**，多色图案可能被拆散；Stage C 的 ShapeMask 有模板分解，但**并不是最少矩形并正规化**。
- Stage D/D+ 具备 Typed 参数、组合、Transform/Render Witness 与逐 branch 搜索诊断；D+ 扩大预算/深度保持 20/400。
- Content-first 已提供 `SelectionPlan`、`CropInputWindow`（读取原始窗口全部颜色）、`EmitSelectedWithOwnCanvas`、从选中内容导出尺寸的 `OutputSpec`；正式 train-only **22/400**，新增 `0b148d64`、`c909285e`，搜索 work 变化约 +0.15%（按旧报告口径）。
- 六题人工抽查和后续试验提示 `e50d258f`（可能涉及多色矩形与颜色统计）、`2dc579da`（可能涉及分隔线区域与包含关系）、`543a7ed5`（可能是非零背景）值得审计；**这些规则是人工假设，尚非经过 Oracle 全训练验证的 Ground Truth。**

**核心研究假设：** 将像素集合的精确语义与矩形分解、背景解释、坐标约束分层，可以提高几何 referent 的表达能力和可审计性，并为下一轮 Region 选择奠定基础。本轮允许 ARC solve rate 不提升；不能将单纯可分解率当作求解收益。

## 1. 必须先做源码审计及三题 Oracle 审计（P0，先于大规模重构）

1. 审计 `Latent.Grid / Encode / Render`、`Synthesis.Collection.Shape / Relation / Size / Typed / Front / ContentFirst`、相关 Witness、Trace、Manifest 与报表代码。逐条列出 `background=0` 在**编码、选择、渲染、Feature、计数及搜索触发**中的使用位置；分清静态约定和可替换的观察视图。
2. 检查现有 `MinX/MaxX/Width/Height` 的类型、坐标系及作用域；新几何 Feature 不得只是旧字段改名。审计现有 ShapeMask 的 canonicalization、预算与语义。
3. 从官方 **training IO** 读取 `e50d258f`、`2dc579da`、`543a7ed5` 全部训练对；逐格展示、人工列出 1–3 个候选规律，尽量构造可执行的 `oracle`（可用最小临时解释器）。独立验证每对；**如果解释不全，就记录失败和歧义，绝不为配合假设硬编码原语**。
4. 输出 `docs/LATIS_STAGE_E0_E1_AUDIT.md`：现有接口图、黑色背景依赖点、三个案例的 Grounding/Oracle 状态、拟修改的最小文件范围、成本风险和回归基准。**审计结论可用于调整优先级，但不可绕过本提示词中的语义与回归验收。**

## 2. E0：RawGrid 保持真值；背景只是可选择的解释，不再是默认场景语义

定义精确的画布坐标宇宙：

\[
U_{W,H}=\{(x,y)\mid 0\le x<W,\;0\le y<H\},\qquad G:U_{W,H}\to\{0,\ldots,9\}.
\]

要求：

- 原始 `Grid` 的**全部像素及颜色始终可访问**；新增 `RawGridView` 或等价抽象，不把颜色 0 在基本几何层特殊处理。
- `Scene` **不能定义为“零色像素集合”**。将 `Residual(U, SelectedRegions) = U ∖ (⋃ SelectedRegions)` 作为依赖**明确的集合选择证据**的操作；`Residual` 不自动等于 `Background`，其中可能包含 marker、分隔线和未选中对象。
- `BackgroundHypothesis` 是一个输入侧可重复执行的**解释性视图**，例如 `Color0`（兼容视图）、`UniformBorderColor`、`UniqueMostFrequentColor`、`NoBackground`。算法与平局/不可适用语义必须明确定义；无法唯一决定时保留多个假设或显式拒绝，**绝不隐式任选一个**。不要凭“ARC 通常为黑底”替代语义证明。
- 在背景假设下生成的 `Object/Region` 必须携带 View ID 与来源证明；同一个 RawGrid 可以共存多种合法对象划分。不得全局修改旧 `Latent.Encode.encode` 的输出、默认排序或对象 ID，从而破坏 Stage C/D/Content-first 的 22 道旧解。建议**并行新增视图**，旧 `Color0+4-connected` 作为明确的 LegacyView。
- 视图在未知输入上仅依赖输入本身。训练目标只能用于候选比较/验证，不得给背景识别、对象划分或 `Region` 构造提供目标尺寸和目标对象。
- 清晰区分 **像素集合的几何支持**、**颜色映射**、**解释视图**：相同位置集合的不同配色应共用几何语义，但彩色 InputWindow 的重放必须保留颜色。
- 不允许“背景无关”以**删除颜色 0 的语义**作为代价；`NoBackground` 下颜色 0 仍是正常颜色。

**E0 最小测试**：非零背景色（如 8）、图案颜色包含 0、多色图案、混色边界/多频率并列、空/满/棋盘格、marker 属于 Residual 而非 Background、同输入不同目标时视图不变、旧 LegacyView 逐像素/对象 ID 完全相同。至少一族**非零背景机制任务**证明新增视图在真实执行/候选追踪中被使用，而不是仅仅序列化出来。

## 3. E1：以 PixelSet 为唯一外延真值的精确 RectangleCover

对非空有限形状 `S ⊆ U_{W,H}`，定义闭区间轴对齐整数矩形：

\[
R(x_0,x_1,y_0,y_1)=\{(x,y)\mid x_0\le x\le x_1,\;y_0\le y\le y_1\}.
\]

\[
Cover(S)=[R_1,\ldots,R_k],\qquad \bigcup_{i=1}^{k}R_i=S.
\]

**语义与证明义务：**

1. 所有矩形必须是有效的画布内矩形且 `R_i ⊆ S`；**不允许通过覆盖背景/孔洞再相减来冒充“矩形并”**，否则不是用户要求的几何范式。矩形可重叠，但 union 精确等于 `S`。
2. 对任意非空 `S`，单像素矩形提供正确的有限兜底；对于 `S = ∅`，提供空覆盖 `[]` 和明确的 `EmptyBounds`（不能调用 `min/max` 崩溃），`k*(∅)=0`。
3. 定义 `k*(S)=min {|C| : union(C)=S}`。区分**已证明最小**、**合法但尚未证明最小**、**预算截断/超时**：
   - `ExactMinimalCover {rectangles, optimalityCertificate, ...}` 只在精确搜索完整、确实证明不存在更小覆盖时返回；
   - `BoundedCover {rectangles, lowerBound, upperBound, truncation, ...}` 保证合法覆盖，但绝不把 `upperBound` 命名为 `k*`。
4. **最小覆盖不唯一**。对于等大最优覆盖，计算稳定的排序键，例如每个矩形的 `(y0,x0,y1,x1)` 再做集合字典序，选出一个用于缓存与稳定展示的 `CanonicalMinimalCover`；同时保留其他最优分解的存在性/数量状态（可以是 `unknown`）及预算内的有限候选。不得把 canonicalization 当成删除所有具有不同内涵的候选程序的许可。
5. **复杂度与终止**：先开发确定性合法覆盖算法，再增加可中断的精确/有界最优化搜索（branch-and-bound、DP 或等价算法自行选择，须讲明搜索完备的有限域）。避免枚举任意所有子矩形后一次性排序形成巨大内存峰值；使用 bitset、局部连通分解、memo/支配消除等合理手段。严格指定 `maxNodes/maxTime/maxAlternativeCovers` 和稳定复现的访问顺序；返回下/上界与预算截断原因。**不要求在所有 30×30 掩码上证明全局最优。**
6. 明确**几何正规化**与**程序代价**不同：最少矩形数不是唯一 MDL / SearchPrior；后续多矩形重复关系可能比最少矩形分解更简洁，因此保留原始 mask 及可选择的 alternative covers。
7. 若需要连通性拆分，必须注明 4/8 邻接的使用范围和跨分量最优性的适用条件，不能把“对角接触”当作必然连通或必然分离而不记录语义。

建议概念结构（可按仓库风格改名）：

```haskell
-- 示意：真实实现必须选择可验证的 Grid/Coord/Bounds 类型
data Rect = Rect { minX :: Int, maxX :: Int, minY :: Int, maxY :: Int }

data CoverResult
  = ProvenMinimal { canonical :: [Rect], alternatives :: [[Rect]], certificate :: OptimalityWitness }
  | ValidBounded   { bestCover :: [Rect], lowerBound :: Int, upperBound :: Int, status :: Truncation }

-- 语义真值始终是 PixelSet；Cover 只是它的有证据解释。
```

## 4. 几何 Feature、坐标确界与类型安全

为每个 `Rect` 提供：

- 四个确界 `XMin/XMax/YMin/YMax`，等价不等式 `x≥XMin, x≤XMax, y≥YMin, y≤YMax`；四角 `TL/TR/BL/BR` **是推导 Feature，不作为八个独立自由参数**。
- `Width = XMax − XMin + 1`，`Height = YMax − YMin + 1`；可用 inclusive/half-open 表示但必须统一、写入 trace 并避免 off-by-one。
- 绝对坐标、相对于父 `Shape/Region` 锚点的相对坐标与平移不变标准化坐标须**有不同类型或明确转换函数**，禁止无证据直接比较不同坐标系的 `XMin`。

为每个 `Shape/Region` 提供**基于 PixelSet 的**整体 `Bounds/Width/Height/Area`，以及 `CoverRectCount`、其下/上界、可证最优标记与矩形列表的集合视图。整体 Bounds 不能被误当作 Shape 的完整像素集合；对于有洞、断开、多色区域必须保持区别。

- `Set[Rect]`、`Set[Region]` 的索引不自带跨案例 role。所有 `Unique/ArgMax/Filter/SelectByRelation` 需要解释，平局失败或保留多个候选，禁止“拿列表第 i 个”作为无条件语义。
- 建议在模块边界使用带画布维度索引或存在包装的安全类型（如 `Rect[W,H]`、`Region[W,H]`），工程上可用经过校验的 smart constructors/运行时 refinement，**不强制本轮完成整个 GADT 重写**。无效/越界/空 Bounds 为显式错误值，不得隐式裁切。
- 至少完成一条**真实搜索可消费的 Feature 通路**：例如 `RectWidth/RectHeight/ShapeBounds/RectCount` 通过现有 Typed Feature/Content-first 受类型检查的读取或显式选择器被使用；**仅写 JSON Feature 列表不算接入 TSL**。新 Feature 的范围、是否已证明最优、输入依赖必须明确，不可把 `bounded upperBound` 当确定的 `MinimalRectCount` 参与语义判断。

## 5. Geometry / Relation / Cross-case Witness 的最小落地边界

在原有 Stage D `TransformWitness`、`RenderWitness` 与 Content-first Pixel provenance 上**增加**证据，不要重写原有校验器：

1. **GeometryWitness**：绑定 `(task,case,view,rawPixelSet,coordinateFrame)`、矩形列表、每个矩形包含于 PixelSet、整体 union 等于 mask、是否有最优性证明、备选最优代表/截断状态；提供**独立重放校验**，不能只相信生成程序自报。记录所有像素集合相等与不等的反例差异。
2. **RegionProvenance**：明确候选源于哪一个 RawGrid、哪一种背景/区域视图、怎样得到 Bounds、哪些颜色由原始输入窗口提供。`Residual` 保存被减去的集合证据；**不能把被排除区域顺手解释为背景**。
3. **RelationWitness（最小原型）**：支持且只支持能独立核验的少数关系：`SameMask`、`SameUpToTranslation`、`BoundingContainment`、`Disjoint/Overlap`，以及仅在明确程序执行结果上成立的 `CropSource`。保留多对多关系候选，不强制一一对齐；不同分解代表但相同 PixelSet 不能误判不同几何。
4. **CrossCaseWitness（最小原型）**：针对训练对集合比较**同一个输入侧程序**在不同 case 上的 typed bindings、背景假设/Region 选择、输出尺寸和像素重放。明确区分 `ObservedCaseAgreement`、结构性证明、`Pending/Unknown`；不把训练 co-denotation 当成全域相等。
5. **信息流约束**：训练期可分析 `(Input,Target)` 的几何差异用于给候选打分或验证，但未知输入上程序仅能依赖其输入。**绝不能**把输出间共性、oracle hints 或目标 Region 直接作为推理输入侧 Feature。

本轮不要求把所有 RelationWitness 合入 Stage B 的 `Int/Bool` VSA，也不声称完成了通用的 `Set[Region]` 抽象泛化。

## 6. 最小 Region 兼容接口与 Content-first 集成（不另起独立 Solver）

使下一阶段 E2 可以以低风险方式构造：

```text
RawGrid + ExplicitView
   → Set[TypedGeometryRegion] (exact PixelSet + colors observed on raw grid)
   → Bounds / RectangleCover / GeometricFeatures
   → Input-side Selection (existing SelectionPlan where applicable)
   → Content-first OutputSpec (Dimensions + CropInputWindow/Emit)
   → Existing RenderWitness + GeometryWitness
```

要求：

- `Region` 的精确语义由 PixelSet 和显式来源决定，**不要求单色或连通**；矩形并作为几何解释，不应把 `RectCover` 序列化顺序当成 Region 身份。
- 只接入一两个最小的、输入侧可以穷举/解释的 Region 候选（例如 raw-grid 矩形域中可证明的固定规则、背景视图得到的连通区域，具体以 Oracle 审计结果决定）；不允许生成任意输出匹配的矩形且将其作为“发现的输入区域”。
- 保留旧的 `SelectionPlan` 和 `Size-first` 优先级；新视图在 Config 下延迟触发，必须有真正的 branch `reached/blocked/executed` trace，避免仅构造候选却未进入搜索。
- 本轮只验证类型和最小 end-to-end 机制，不强求实现 `ArgMax(CountColor)`、完整分隔线发现、任意多步集合操作、Marker 集合复制等 E2/E3 功能。
- 对无法表达的真实案例，记录 `Region/SelectorUnavailable`，不要把它误记为 `SizeFailed` 或 `BudgetExhausted`。

## 7. 实验、消融与严格回归（必做）

### 7.1 不变性测试与属性测试

- 随机生成多种 `PixelSet`（含空集、实心矩形、L/T/U、孔洞、斜线、棋盘格、不连通、全格），验证 `union(cover)=PixelSet`、每个矩形合法、坐标确界、平移正规化、反例可追踪；对小掩码使用完全独立的暴力参考解验证最小矩形数与并列最优的 canonical 规则。
- 属性验证**颜色置换（含把 0 与 8 对换）不会改变纯几何 PixelSet 分解**；背景假设按定义改变时须报告，不得宣称背景视图也必然置换不变。输入一致不同 target 的视图与 Feature 必须相同。
- Witness 的篡改控制：删除/增补一个像素、改 Bounds、改绝对/相对坐标、改 View、改最优性状态，独立校验必须拒绝相应伪证据。
- 对大/复杂 masks 的最优化预算截断保证可返回**精确且合法的覆盖**，不谎报最优；记录内存峰值与是否耗尽。

### 7.2 合成机制任务

至少 5 族、每族不少于 3 seeds，训练对≥3、另有仅评分的 heldout：

1. 非零背景与颜色 0 仍为前景的两种情形。
2. 多色区域使用同一个几何 support 但不同配色。
3. 多矩形 L/T/U 与最小覆盖歧义。
4. 根据矩形/Shape 的确界或长宽决定输出尺寸/位置的 Content-first 程序。
5. Residual 中包含 marker、不可等同 Background 的负控制。

所有机制任务要区分 **Oracle Direct Execute**、**候选可枚举**、**正常盲搜索 train-exact** 和 **heldout-exact**；不可用 Oracle 作为候选集合、Task ID prior 或代码特判。至少一类需证明新 Feature 真正进入 Typed/Content-first 执行；至少一类证明新 Background View 被执行/使用。未盲解的机制任务不能算通过自动合成验收。

### 7.3 ARC 400 train-only 消融

固定同一源码快照、二进制、输入 manifest、搜索预算、worker 配置，至少运行：

| Config | 背景新视图 | 矩形 Cover/Feature | 最小 Region/Content-first 接入 | 用途 |
|---|---|---|---|---|
| `FrozenCF` | 关 | 关 | 关 | 复现 22/400 基准和逐题工作量 |
| `BackgroundViewsOnly` | 开 | 关 | 关 | E0 影响 |
| `GeometryFeaturesOnly` | 关（LegacyView） | 开 | 开最小几何读入 | E1 影响 |
| `FullE01` | 开 | 开 | 开 | 测试交互 |

- **主要回归门禁**：`FrozenCF` 在所有 400 道任务的 train-exact、选中程序、预测网格与旧 SearchWork 完全一致（若旧历史二进制不同，冻结新版并说明范围）。`FullE01` 不丢失此前 22 道程序；若因相同墙钟、内存或候选前缀导致回归，必须报告并定位，不能掩盖。
- 计数包括：train-exact、旧解保留与新增 ID、首解/总 SearchWork、分支耗时、wall/RSS/RTS 峰值、视图数量、候选 Region/Rectangle 数、合法 cover 比率、最优性已证明比率、budget/timeout/deferred、typed geometric feature 访问数、直接解释执行次数与最终 selected AST。
- 原有语义成本与新几何开销单独记账；候选集激增时延迟计算、缓存与限制覆盖族，但不能改变 FrozenCF 的搜索行为。
- 只用官方 ARC-AGI-1 training 输入输出做 train-exact；未知 test 输出、R2 fallback 不进入这次新增解统计。不得把 train-exact 称为 test 泛化。
- 如果由于运行资源限制不能完整执行 400×4，优先 FrozenCF / FullE01 完整 400，再做相同固定子集消融，并明确未执行矩阵；不得把 pilot 的分母伪装为 400。

### 7.4 三道真实失败案例的定向分析

针对 `e50d258f`、`2dc579da`、`543a7ed5`，逐一报告：

- 人工候选 Oracle 的训练对逐格正确性（或失败反例）；
- 当前型别能否表示（并指出缺少的是 `MulticolorRegion`、`CountColor/ArgMax`、`PartitionByLines`、背景解释，还是执行/触发问题）；
- 手工 AST 直接重放能否执行、正常枚举是否包含此 AST、在既定预算内是否访问、是否被 Witness/Renderer 拒绝；
- 新增视图/几何 Feature 在该案例被实际访问的证据与 Pixel Diff；即使未解也要定位**首个有证据的阻塞层**；
- **不得**预设这三题在本阶段一定会新增 train-exact。

## 8. 日志、可视化、交付和验收

复用现有单 IO Trace 工具，至少增加：

- 带网格坐标的 `PixelSet / RectCover / Bounds` 叠加图；覆盖同等最小备选可以切换，截断状态在 UI 明示；
- RawGrid、LegacyView 与新 Background View 的并排比较，明确颜色 0 不再具有基本层特殊语义；
- Region Provenance、绝对/相对框、`Residual` 着色显示；
- 单例到多例的 `CrossCaseWitness` 表，区分输入可观测绑定与训练 target 用于拟合的证据；
- Search Timeline 上记录 `geometry-view-created`、`cover-proven/bounded`、`geometry-feature-evaluated`、`content-first-branch-executed`；仅有静态 JSON 不算可视化完成。

交付：

1. `docs/LATIS_STAGE_E0_E1_AUDIT.md`（实施前审计 + Oracle 初判）。
2. `docs/LATIS_STAGE_E0_E1.md`（数据模型、语义、最优性算法、坐标类型、与 Size/Content-first/Typed 接口）。
3. `docs/LATIS_STAGE_E0_E1_REPORT.md`（机制矩阵、ARC 消融、三案逐项 Oracle 可达性、trace 示例、限制与下一步）。
4. `results/stage_e01/<run_id>/`：冻结 manifest/配置/源码 hash/二进制 hash、原始逐任务 JSON/CSV、Geometry/Relation/CrossCase witness、最优性证书或上下界、搜索事件、负控制、独立复核和再生成脚本。
5. 一条可重复运行的端到端 runner；测试失败退出非零；历史目录只读，不覆盖原始实验数据。

**P0 验收条件（必须全部达成）：**

- `FrozenCF` 完整复现旧 22 解及逐任务旧工作量，正常求解默认仍为兼容模式；开启新视图不能默默修改旧分支。
- `PixelSet = union(Rectangles)` 由独立校验保证；小掩码能够证明真正最小，预算不足时明确返回 `Bounded`；多最小覆盖不被错误地当作独一无二的语义。
- 非零背景、零色前景、Residual 含 marker 的机制和负控制通过；新特征**在真实执行的 Typed/Content-first 调用链中被使用**。
- 几何、相对坐标和 Region 来源 Witness 可伪造检测、可独立重放；无数据泄漏、无对象顺序的伪 role。
- 新增 Branch 和几何叠加可在单 IO Trace UI 实际查看；真实失败题能区分 `RepresentationUnavailable`、`SearchNotReached`、`CandidateRejected`、`BudgetTruncated`、`Unknown`。
- ARC 400 train-only 结果如实报告：可以没有新增解，不能用 test、手写 Oracle 或额外预算制造虚假收益。

**本轮明确不做（P1 后续）：** 完整 `ArgMax(CountColor)`、任意分隔线 Region 搜索、Region-to-Region 多对多变换、Stage B 全类型 VSA、通用 dependent GADT、Recognition Model 训练。可以在报告末尾建议 E2 先实现哪一小组操作，但不得在本轮自行扩展任务范围。

请直接在仓库中实施、运行测试和实验、保存原始结果、输出最终审计/实现/报告文档。不要停留在概念设计或只提交伪代码；如遇到无法在资源条件下完成的实验，诚实注明 `not_run` 及阻塞原因。最终回复请汇报准确的回归、新增真实 ARC ID、覆盖率与搜索成本、Oracle 验证状态和尚存的首要瓶颈。
