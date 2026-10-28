# LATIS 阶段 C：对象数量可变的合成、Shape 代数与目标驱动的抽象搜索

你是 LATIS 项目的高级编码模型。请**直接审计当前仓库、实施最小可工作的完整增量、运行测试和消融，并交付报告**，不要只输出设计文档。全程使用简体中文撰写文档。以仓库实际源码、`LATIS_STAGE_A.md` / `LATIS_STAGE_A_REPORT.md`、`LATIS_STAGE_B.md` / `LATIS_STAGE_B_REPORT.md` 为依据；接口名称以下均为语义示意，先核查再决定具体 Haskell 类型及模块路径。

## 0. 背景与研究目标

已完成阶段 A（Grid Size、N 元 Typed Hole、`mod/isOdd`）和阶段 B（Object Bounds/Bool、常数到输入依赖表达式的结构泛化、Witnessed VSA、抽象层级调度）。在官方 ARC-AGI-1 training 400 道任务的 **train-only** 测试中：

- 当前 Feature 前端 train-exact 为 **7/400**；
- **289/400** 在当前编码/对齐下因输入、输出对象数不等而失败；这**不等于**这些任务都真的需要创建或删除对象，也可能是对象分割视图导致计数变化；
- Stage B 的共享 DAG 显著降低候选签名求值，但大图构建成本高；真实任务快照常触及 **40,000 节点/轴**上界，分层搜索没有提高 7/400 的成功集合。

**本阶段首要目标是解除“输入/输出对象必须一一对应”的硬约束，并让 Shape 代数为对象构造提供具有明确语义的组件。** 次要目标是使 B 阶段抽象图按实际失败目标按需构建，避免为每次 ScalarFailure 枚举巨大的无关宇宙。

本轮**不**追求图灵完备、旧 R2 搜索空间完备、形式化 Branch-and-Bound、全 ARC 正确率或测试集泛化证明。不要求达到任意指定的 ARC 新增解题数量；如果新增为零，应提供真实的失败归因，禁止调任务 ID 或篡改预算。

### 最高约束

1. 维持 Dependent Size Index、typed legality、解释性 Alignment/Witness、Feature Visibility/Trigger、SafeOnline、训练等价候选不永久折叠等原则。
2. **类型正确和训练精确是两件事**：候选需在所有训练输入上实际执行并通过最终整格 exact 验证；仅尺寸正确、形状匹配或对象数正确均不算 train-exact。
3. 不允许任务 ID 特例、按训练样例 ID 选择输出、不允许推理时读取输出 Grid 或目标 Feature、禁止 `test` 数据参与搜索/排序/选择。输出侧对象只能作为训练期间的约束与验证证据。
4. Stage A、Stage B 和旧默认行为必须由配置开关完全复现；新增功能默认关闭。不要直接移除 `RankAlign` 而没有提供合法替代的程序语义。
5. 不要为了本阶段的 Shape 识别将**全局**对象编码改为 8 连通，也不能把无证据的跨对象边包装进高层抽象。

---

## C0. 开工审计和基线冻结（必须先做）

1. 核查 `Latent.Encode` 的连通性、单色分组、对象 ID、局部坐标、Canvas / Render，以及 `Synthesis.Collection.Front` 的 RankAlign、位置/颜色变换、Size Rule、Typed Hole、`realize`。确认对象数量不等的拒绝路径发生在什么阶段。
2. 核查 Stage B 的 `Referent`、`buildClass`、共享 VSA、`snapshotFor`、`scheduleOrder`、四种调度配置，以及调用时序。确认其图构建是按轴/任务/触发事件缓存还是重复构建。
3. 冻结可复现基线：`BaselineA`（Stage A FullA）和 `BaselineB`（报告所用的 FullB 配置）。两者数据与配置分别保存；当前报告与 CSV 可能来自**不同重复实验批次**，不能将两次运行的超时/SearchWork 差异误判为内部统计错误。
4. 对官方 400 道任务做只读 cardinality 诊断：统计输入/输出各自的对象数、像素数、颜色数、组件连通视图、画布尺寸等；给 289 个失败任务做粗分类，不声称可从数量差异直接识别真实操作。输出用于制定通用能力，不得为特定题手写程序。

## C1. Shape 代数：精确定义与最小实现

将 Shape 定义为**单个颜色一致的对象内部**的有限相对像素集合 `ShapeMask = FiniteSet (Int,Int)`，与 Object 的颜色、全局放置位置分离。不要把 `ShapeMask`、`Object` 与 `Set[Object]` 混成一个类型。

### 原语和语义

实现或复用以下类型化 Shape 原语，明确合法参数、坐标约定和边界：

- `Rectangle(width,height)`：实心长方形；
- `Square(side)`：实心正方形；
- `EquilateralTriangle(size,orientation)`：**离散正三角形模板**，先规定明确可复算的像素化规则与朝向；不允许视觉相似即任意通过（如目前底层不具备严格模板，可作为显式受限原语并报告限制）；
- `DiagonalBar(length,direction)`：仅厚度 1，至少两种斜对角方向；
- `Shell(width,height,thickness)`：厚度为 n 的空心矩形，定义厚度过大、退化为实心时的行为；
- `Union(Shape,Shape)`、`Intersection(Shape,Shape)`：在**同一个局部坐标系**里的像素集合运算。

若 Union/Intersection 结果为空或不连通，仍可作为 `ShapeMask`，但不能无证明地自动当成一个合法 `Object`。需要通过明确的连接性/装箱构造或 `Option/Result` 进入对象系统。

### 局部 8 邻域，不改变全局对象定义

当前若默认 4 连通，`#... / .#.. / ..#. / ...#` 会被拆分。为 `DiagonalBar` 实现**局部的候选几何检测视图**，允许相同颜色、坐标满足 `(x+i,y+i)` 或 `(x+i,y-i)` 的严格序列被组合识别，保留其来源像素及原组件 provenance。只有具有几何检测 Witness 的候选区域能够使用此视图；不得将任意斜接触的同色对象全局合并。针对噪声像素、交叉线、弯折、邻近异色像素设置负控制。

### 分解与最简表达

- 一个具体 ShapeMask 可以有多个 Shape 代数表达式；第一版仅对外暴露**最简的一个确定性 canonical decomposition**，以 AST 节点数为主、稳定 tie-break 为辅；把最大表达式大小、Union/Intersection 深度、候选数设为有限预算。
- 可以复用 hash-consed DAG / VSA 存储共有子树；不要求实现 e-graph 饱和。**不能**用训练等价来认定两个不同 ShapeMask 全域等价。
- 在代数不可表示时保留原始 `ShapeMask` 作为底层数据（不是将一个训练目标网格硬编码为推理程序），不能因此丢弃整个输入任务。
- 暴露可参与 TSL 的类型化特征，如 `IsRectangle/IsSquare/IsShell`、`ShapeWidth/Height`、`DiagonalLength`、`ShellThickness`、分解后原语种类等。依赖分解选择的特征须在 provenance 中声明。

## C2. 对象数可变的合法变换：取代强制双射

不要直接解除对象数守卫并继续运行旧 sequence-local body；必须引入具有**可执行语义**的对象集合输出模型。

将现有一一对齐作为一个特例保留，引入带见证的关系：

\[
R\subseteq O_{in}\times O_{out}
\]

允许一个输入对象映射到 0、1 或多个输出对象；一个输出对象也可由多个输入对象联合构造。还需要表示无输入对应物的生成对象及被删除对象的来源/解释。关系只是训练时的候选解释和程序构造证据，不能代替真正的变换程序。

建议按实际代码重构成类似以下的类型化算子（仅示意，不要求照抄）：

```haskell
-- 使用现有依赖类型/存在类型表达对象尺寸和必要前提
data ObjectRelationWitness = ...
data ObjectTransform = Preserve | Recolor ... | Translate ...
                     | Replicate ... | Filter ... | MergeBy ...
                     | SplitBy ... | ConstructFromShape ...

emitObjects :: ObjectTransform -> InputScene -> Either Error (Set PlacedObject)
```

**最低可验收的可执行能力：**

1. `Preserve/Translate/Recolor`：一对一，旧机制仍可使用；
2. **选择或过滤**：从多个输入对象得到更少的输出对象（参数必须是类型正确、由输入计算的谓词或指称）；
3. **复制 / 规则重复**：由一个对象按可合成的偏移、数量或位置规律生成多个对象，不能写死训练案例的最终坐标列表；
4. **合并**：多个输入对象经合法选集/关系与相对位置合成一个输出 `ShapeMask` / Object，颜色一致性与重叠策略明确；
5. **分裂 / Shape 构造**：至少支持一种以 Shape 代数表达的分割或形状派生路径，并具备对应的可执行 Witness；若工程上暂时难以通用实现，明确标为未实现并完成其余 P0，不得伪报覆盖。

要求 `Object[σ]` 的尺寸索引继续有效：改变尺寸的操作必须通过合法的形状变换构造新的 `Object[σ']` 或存在类型封装，而不是直接比较或强制转换不同尺寸的对象。对集合的选择和排序必须有有意义的 ordering/alignment Witness，不允许 `Set` 偷偷按索引取首项。

## C3. 将对象/形状变换接入 Feature、抽象指称与 TSL

1. 在当前的输入侧 Feature 集合加入可见的对象/Shape 信息：单对象 Bounds、局部 Shape 类型、集合计数、合法选择后的 Shape 尺寸、颜色/前景像素计数等。让阶段 A 的 Grid Size 合成可以**经合法 selector 或聚合**引用对象级特征（解决原有 31 道 `size:` 失败中这一类别的一部分），不能任取未命名的某个对象。
2. 将 `Set[Object] -> Set[Object]` 的可执行变换与其参数作为 Typed Hole 搜索目标，复用 Feature-first、fitted constant、VSA/semantic class 和 Witness；新增的对象类型不是通过把 Bool/Int 假装成 Object 接入。
3. 一对多、多对一关系应在训练阶段以所有 train pairs 的一致性求证。推理时同一 TSL 程序必须只用输入侧观察量生成对象及其位置、形状、颜色。多种同训练外延的关系/程序要保留 intensional representatives。
4. 输出构造：先求 Size Rule，后执行 Object Transformation、填充背景、渲染到目标画布，再做**最终逐像素 exact**。明确裁剪、越界、空集合、跨对象重叠与颜色冲突处理；不要悄悄将失败输出当作成功。
5. Trigger：若一一对齐合法且已有前端能解，优先保留旧路径；出现 cardinality mismatch、Shape/realization failure 或目标 Feature 明确需要新算子时才开放相应分支。注意有些 train 对象数量相等的任务仍需要复制/合并或形状变化，因此 Trigger 不得将新搜索永久排除。

## C4. 阶段 B 的轻量优化：目标驱动的抽象指称（独立开关）

阶段 B 已证明共享 DAG 减少签名求值，但固定 40,000 节点宇宙的构建开销很高。本轮**仅实现最小的目标驱动改进**，不要重写 B2 结构泛化定义或加入 Branch-and-Bound。

- 从当前失败目标的类型、预期 Feature 种类和可见输入来源反向建立 `Typed Goal / Hole Query`，仅展开可到达目标的原语/指称；目标为 `Size2`、`ShapeMask`、`Set[Object]` 时选择相关的子语法，禁止不相关的标量宇宙全部展开。
- 让需求驱动的快照可被多次相同查询共享/缓存；使用独立 budget、节点数、签名求值数、命中次数计量。保留旧 `snapshotFor` 路径作为消融对照。
- Witnessed VSA 必须保持候选身份、训练签名、intensional prior 和原始的结构泛化边定义；**不得**仅因为某候选不在小预算下的目标快照里就宣称其不存在。
- 有一个明确可验证的小预算完整性测试：在给定相同的 Typed Goal、同一个有限 DSL 宇宙和同一个成本上限时，目标驱动构建的候选与 exhaustive/reference 的**目标可达候选集合**一致；超预算要记录 `truncated`，不能对外声称完整。
- 这个优化不得影响 Stage A/B 基线结果；可在 C 的对象操作实现之后再接入，若预算不足则作为明确列出的 P1，切勿耽误 C2 的核心正确性。

## C5. 机制任务、消融与真实 ARC 实验

### 机制任务（每族多个随机实例；至少 3 个 train pairs + 独立 heldout，仅用于评分）

要求设计真正区分各能力的**正、负控制**，不能依赖偶然的 train-only 巧合表达式宣称能力被验证。至少覆盖：

- 单对象固定画布平移/重着色：兼容旧路径；
- 保留某类输入对象、删除其余对象：`n_in > n_out`；
- 基于可合成 Count/间距复制对象：`n_out > n_in`，数量及坐标随案例变化；
- 多个同色对象合并成一个 Shape / Object；
- 一个对象拆分为两个由输入规则决定的 Shape，或由 Shell/Rectangle 构造输出；
- 对角像素链（4 连通视图中分离、局部 DiagonalBar 可识别）与不应合并的斜接触负例；
- `Rectangle`、`Square`、`Shell(n)`、`DiagonalBar`、离散三角形、`Union/Intersection` 的精确像素测试，以及不唯一分解的 deterministic minimum；
- 输出画布大小依赖 **选定对象 BoundingBox**、对象集合聚合或颜色/像素计数；
- 训练完全相同但真实规则为复制 vs 依赖常数的成对反例，检查 VSA 保留两者、不能由 train 唯一决定 heldout。

对于颜色不同/不连通/尺寸索引不合法/对齐 Witness 不足的输入，要提供明确失败或保留独立对象，不得强行匹配。

### 配置消融（均为独立开关）

至少比较：

1. `BaselineA`（原 Stage A FullA）；
2. `BaselineB`（原 Stage B FullB，原构建方式）；
3. `ShapeOnly`（Shape 代数和特征开启，仍然使用旧一一对齐）；
4. `RelationsOnly`（对象集合关系/变换开启，不开放新 Shape 原语）；
5. `ObjectShapeFull`（C1–C3 完整启用）；
6. `ObjectShapeGoalDirected`（另开启 C4）；
7. `NoShapeWitness` / `NoRelationWitness` 不应靠非法跳过验证得到更高分；如要设置负控制，只能验证相应非法操作被拒绝，不把破坏合法性的配置作为有效 solver 对照。

先 smoke test，再在**官方 ARC-AGI-1 training 全部 400 个任务**上只用任务内部 `train` 进行 train-exact 评估。沿用 Stage A/B 的数据哈希、train-only 文件与 test 非法读取守卫；所有新配置统一预先固定预算。R2 不必重跑。

### 必须记录、分别报告

- Feature train-exact/fallback、新增/丢失的**任务 ID**；对每道新增任务输出完整 TSL 程序、对象变换 Witness 和逐样本网格复核记录；
- 首次拒绝原因：`size_rule`、`cardinality`、`relation_search`、`shape_decomposition`、`transformation`、`render`、`grid_exact_check`、`timeout`，并区分未尝试与尝试后无解；
- 输入/输出对象数不同的 289 道原始任务里，有多少**进入新的关系搜索**、多少找到**合法可执行关系**、多少达到**完整 train-exact**，不得将这三个数量混同；
- Shape 分解成功率、覆盖原始像素程度、最简 AST size、同一 Shape 的候选数、局部 8-neighborhood 检测的误合并负例；
- `SizeRule-exact`、`Object-Count-exact`、`Object-Transform-exact`、`Full-Grid-exact` 分开计量；
- SearchWork（分 Shape 检测/分解、关系搜索、抽象图构建、VSA 求值、realization）、wall-clock、RTS live heap、超时/截断、每种 Trigger 调用量；
- C4 的 goal-directed 快照 vs 原 Stage B：节点数、节点命中率、signature evaluations、构建工作量、完整性检查及覆盖率；
- 各配置正常单机空闲复测至少一次关键指标，防止同时运行测试套件导致的 CPU 争用；不同批次报告结果可变化，批次 ID/代码哈希/预算/原始文件须明确。**不能**把两次独立运行的确定性计数差异直接判为单次汇总错误。

### 诊断标准

- 若加入对象生成后仍没新增完整解，区分「合法关系/形状变换在 DSL 中不可表达」「可表达但未进入 budget」「已经合成但其他槽/Size/Render 失败」；给出至少若干逐题可审计证明或 witness。
- 针对可表示性，允许挑选少量失败任务做**离线、人工或独立的 witness 程序审计**，但该程序不能进入 solver 的正常候选优先级或用于调参数，以免泄漏诊断答案。
- 不允许将 289 道数量不等任务直接视为真实复制/合并标签；这些是**当前 encoder + RankAlign 的失败分类**。

## 工程约束与交付

- Haskell 符号/类型/TSL 部分实现，PyTorch/ML 神经部分保持不变；若用户语境中的 `ML` 是 LATIS 的低层符号语言，可为 Shape/Relation 所需的纯函数语义做最小扩充，不改神经模型。
- 配置开关默认全部关闭；BaselineA、BaselineB 和现有 v0.6.1 入口应有逐任务/机制回归；禁止替换旧 `SafeOnline` 或删除旧候选；新增路径必须有 provenance 与 Witness。
- 没有能力实现全套关系时，以优先级明确交付：**P0 = C0 + C1 的核心原语/检测 + C2 选择/复制/合并的可执行程序 + C3 集成 + 测试与真实 ARC 指标**；**P1 = Split、完整三角模板覆盖、C4 目标驱动搜索**。未实现项必须在报告中列明，不要暗示已完成。
- 建议产物：`docs/LATIS_STAGE_C.md`（正式类型与语义、与既有模块集成、复现）、`docs/LATIS_STAGE_C_REPORT.md`（完整消融、正负例、真实 ARC 失败归因）、`results/stage_c/{metrics.csv,per_task.csv,mechanism/,arc/,validation/}` 及一键复现脚本。所有数字由原始机器可读结果生成，记录 run_id 与输入文件哈希。

## 验收问题（报告必须逐项回答）

1. 已经不需要在 Feature 前端假设输入输出对象一一双射了吗？具体哪些数量变化类型具有**可执行**的 TSL 程序及可信 Witness？
2. Shape 代数是否精确重建基础形状、保留单色对象语义，并在不改变全局 4 连通的前提下识别局部对角长条？
3. Typed Feature / Referent / VSA 是否能用于对象数量与几何构造，而不局限于标量 `Int/Bool` 槽？
4. 在官方 ARC-AGI-1 的 400 道任务上，哪些失败被转化为 train-exact？哪些仍是表示能力不足，哪些是搜索预算问题？
5. 新功能带来的搜索/内存代价是多少？目标驱动抽象图是否在同一有限语法与预算口径下减少无关求值？
6. 是否保留了旧 LATIS 的类型安全、解释性和训练等价候选差异，以及所有 Baseline 的回归行为？

**请按 C0→C1→C2→C3→C5 的顺序落地；C4 作为独立优化，只有核心正确性验证之后再做。完成后直接给出实验报告、源代码改动、复现命令和真实结果，不需要再次向我索取需求确认。**
