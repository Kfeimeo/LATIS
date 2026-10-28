# LATIS：解除 Size-first 前置约束，新增 Content-first / Goal-coupled OutputSpec 合成

> **任务类型：** 在现有 Stage D / D+ 源码上进行一次**聚焦的控制流与表示扩展**，不是重写 LATIS，也不是全面启动 Region DSL、Shape algebra 或更深搜索。
>
> **核心目标：** 允许程序**先从输入中选出对象/对象集合（或已有的区域视图），再依据选中内容决定输出尺寸并构造输出网格**。保持原有 `Input → SizeRule → ObjectTransform` 路径的所有能力和优先级；新增 `Input → Select/Construct → OutputSpec(size, content) → Render` 路径，且在旧 Size Rule 失败时仍能打开后者。
>
> 全文使用**简体中文**撰写设计、报告和注释；代码遵循仓库既有 Haskell/PyTorch 分工，主要修改 Haskell 符号前端。不得为了好看而宣称新增 ARC 成功。

## 0. 背景和必须解决的反例

现有阶段的报告指出：

- Stage C 的 `Front` 先执行 `Size.synthesizeSize`，只有尺寸规则拟合成功才继续对象对齐或变换搜索；对象级 `Width/Height(UniqueLargest/Smallest)` 等叶子也在尺寸合成阶段独立求值。
- Stage D 已经有 A 的 Typed Hole、B 的参数级 VSA/Witness、C 的 Object Relation、D 的组合式 Pipeline；**这些能力不能因为早期 Size Rule 没有拟合成功而不可达**。
- 2026-10-26 六道真实失败任务抽查中，`2dc579da`、`e50d258f` 的**全训练运行**在尺寸合成处失败，程序候选为零；单对训练可能通过尺寸阶段但仍失败。后四道另有逆向前提和 joint-forward 过窄的问题，本轮不要求一并解决。
- `e50d258f` 的人工假设是“选择红色格子最多的彩色矩形并裁剪”，但**未获可执行 oracle 确认**，且现有 4 连通单色 Object 并不等价于多色 Region。不得以此任务必须 train-exact 作为本轮验收标准。
- Stage D 基准 Feature train-exact 为 **20/400**（官方 ARC-AGI-1 training、train-only）；测试集不得进入求解器。Stage D+ 增预算仍为 20/400，但这不证明预算无关。

需要清楚区分两类情况：

1. **控制流阻塞**：人工构造的有效输入侧选择及裁剪程序在现有原语语义下可执行，但 Size-first 提前失败，导致其从未被尝试。
2. **表达不足**：尺寸前提解除后，仍没有能识别多色面板、十字分隔区域等的输入侧 referent；此时应明确报告 `selection / region unavailable`，**不能**把它再次归咎于 Size Rule，也不能偷偷从训练输出提取候选区域。

## 1. 开工前审计（先写设计与最短调用链）

读取并引用当前仓库真实源码，重点检查：

- `Synthesis.Collection.Front`：`frontSearch` / `main` / `sizeStep` / `relationPath` / `unifiedPath` / `runProgram`，异常、fallback 与 trigger 顺序。
- `Synthesis.Collection.Size`：`SizeRule`、`GFeat`、对象级 size leaves、Size 代表保留和训练拟合。
- `Synthesis.Collection.Relation`：`Selector`、`CropSelected`、`emitObjects`、选择唯一性、依赖输出尺寸的 `KFitAcross/KFitDown`。
- `Synthesis.Collection.Shape`、`Latent.Encode`、`Latent.Render`、`Latent.Grid`：对象范围、像素裁剪、背景 0、越界、覆盖与 4 连通规则。
- Stage A/B/D：Typed 参数的上下文与作用域、`Program`、`TExpr`、Witness/VSA、Deferred Frontiers、逐任务日志与 Stage D+ event diagnostics。
- `ARC.ArcTrainOnly` / 现有 runner：train-only、超时、独立 train-exact 复核、指标口径和原始结果版本记录。

输出一个简短接口表：**哪些能力已存在可复用、哪个 `Either/guard` 导致尺寸失败时整个对象搜索不可达、哪些计算目前错误地依赖预先固定的 output canvas**。不要根据旧文档猜函数名；以现行源码为准。

## 2. 设计 P0：让 OutputSpec 同时承载尺寸与内容

引入一个受类型检查的抽象（名称可适配仓库，但语义必须等价）：

```haskell
-- 示意，不要求逐字照抄

data OutputPlan
  = SizeFirst  SizeRule ExistingContentPlan
  | ContentFirst SelectionPlan ContentConstruction

data OutputSpec = OutputSpec
  { outDims     :: Dimensions
  , outContent  :: OutputContent
  , outWitness  :: OutputSpecWitness
  }

data OutputContent
  = EmitObjects [EmittedObject]
  | CropInputWindow Rect           -- 从输入 grid 的绝对像素矩形读取，锚定输出 (0,0)
```

要求：

1. **Size-first 不变**：对已有 `progSize` / `progTransform` / `progExec` 的执行语义完全兼容，不需要迁移已有 AST 文本来冒充结果变化。新的 Program 字段必须带版本/可选值并有明确回归语义。
2. **Content-first 真正依赖输入选中内容**：`SelectionPlan` 在推理时只观察输入 Grid 及输入派生的 typed Features。先得到选中对象或集合的 `Bounds`/`RegionRef`，再计算 `Dimensions` 和输出内容。
3. **单向、无环依赖**：`Input → Selection → Bounds/Content → OutputDimensions → Render`。选中规则不能反过来依赖尚未确定的输出尺寸。若后续定位/复制表达式需要输出尺寸，只能在尺寸构造后求值，不允许反馈影响选择或尺寸，除非将来单独实现可证明有界的约束求解。
4. **不要用训练输出的对象/尺寸生成推理期输入 referent**。训练目标只能在候选验证、Witness、选择与评估时读取。
5. **不能悄悄取集合中的第一个元素**。支持 `SelectUnique`（无候选/多候选分别失败）及 `BBox(NonEmptySelectedSet)`（多个输入对象合并求范围）；证据记录选择器、匹配集合、唯一性或聚合理由。
6. 对所有现有 Size Rule 训练等价但内涵不同的代表保持 Deferred / 多候选机制；不能因为老 Size Rule 先拟合成功，就永久丢掉依赖内容的 Size candidate。

### 两个最小 P0 构造（必须是真正可执行）

**A. `CropSelectedInput`**：

- 输入：合法的输入侧 selector，要求唯一对象或一个带证据的非空对象集合；边界取选中成员的像素 bbox，端点均包含，尺寸 `(maxX-minX+1, maxY-minY+1)`。
- 输出：**从原始输入 Grid 的 bbox 窗口裁剪全部像素**（包含其中的其他颜色与背景像素），平移到输出原点；不应该只绘制单色选中对象，否则多色区域会无声丢色。
- 必须说明：选中对象仅用于决定裁剪窗口，裁剪内容来自输入 grid，不代表选中对象拥有窗口中的所有像素。独立的像素来源 Witness 应能反映这一点。

**B. `EmitSelectedWithOwnCanvas`**：

- 输入：唯一对象或非空对象集合；尺寸取选中集合 bbox；将选中的成员平移到局部原点并渲染到该 canvas。
- 不允许裁剪越界或隐式覆盖违规；与 `CropSelectedInput` 在存在其他颜色的窗口里**不等价**，必须用反例测试区分。

若仓库已有功能等价的 `CropSelected` / `Merge`，应复用 evaluator 与类型检查，仅新增尺寸决策和输出构造的联合入口，不复制实现。

### 输出尺寸与尺寸安全

- 继续遵守官方 ARC 有效 canvas 尺寸与现有 renderer 的边界约束；越界、空选择、零宽高都显式失败。
- `Bounds` 使用 inclusive 端点，输出尺寸使用 `+1`；以 1×1、贴边、非原点选中、跨颜色、bbox 含空洞为回归样例。
- 遵循现有固定背景语义，禁止将真实输入背景“猜成 8”或改变全局 encoder。非 0 背景与多色区域识别列为 P1，不作为此 P0 的隐藏要求。

## 3. 设计 P0：解除 Size-first 的硬性 Guard

修改 `Front` 搜索控制流，保持 **廉价旧路径优先**，但不得让旧路径失败阻断新路径。预期结构：

```text
Ground / input referents
  ├─ Legacy Size-first → Existing alignment/relation/unified search
  └─ [trigger: old size failed OR downstream exact failed OR deferred alternative requested]
       Content-first Selection → derived OutputSpec → Render → train-grid exact
```

明确实现以下规则：

- **旧尺寸合成失败**：记录其失败原因，打开 Content-first，不直接结束任务；即使此时没有任何输出尺寸规则，也能尝试至少一个输入可见的 `SelectionPlan`。
- **旧尺寸成功、后续程序失败**：如果 Content-first 开关打开，仍应尝试输入选择决定尺寸的候选；不要把 Size 的第一个训练等价表达式当作唯一解释。
- **旧路径已找到首解**：为性能与回归，默认允许早停；若用户要求完整候选对照，通过明确的 `ExploreAlternatives` / Deferred 选项开放同一训练签名的 Content-first 代表。不得夸称默认首解保留了全部可发现的替代程序。
- **触发前不展开**：旧求解能力正常工作时，诊断计数显示 content-first candidate 0；展开时才建立选择器和 OutputSpec 候选。
- **失败原因组合**：保留 size-first 的原始 failure，同时记录 content-first 的尝试、无合法选择、已枚举但无 train-exact、预算截断等；不能最后用 `size:` 覆盖更深的搜索证据。
- **独立预算**：为 `SelectionPlan` 枚举、OutputSpec 生成、每候选跨训练案例执行、整格验证设置可审计的预算与截断证据（先保守默认）；出现 `Timeout` 时未知指标为 null。
- **Determinism**：同一输入、配置和版本下，候选顺序与 Witness 稳定；不要按对象 id/发现顺序选择未经证明的角色。

需要特别处理依赖输出尺寸的旧 `KFitAcross/KFitDown` / D 的位置变换：

- 如果尺寸由选择得出，先建立尺寸再执行这些后置表达式；
- 如果 selector/参数本身反向依赖该输出尺寸，则标记为依赖环、不适用，不能将训练输出尺寸当运行时值。

## 4. 合成入口：不是只手写一个 Oracle 特例

使用已有的 C 选择谓词/typed Features 生成 `SelectionPlan`（如 `ColorIs`、`IsMaxArea`、`IsMinArea`、Shape 谓词、输入侧条件与合理集合组合），在**多个训练案例上统一拟合同一选择表达式**。可增加少量泛型算子，但禁止在源码中 hardcode ARC task ID、输出尺寸、案例位置或“红色最多的矩形”这种任务特定模板。

要求提供两条独立证据：

1. **Oracle injection**（只用于诊断）：人工构造的 `ContentFirst` AST 能被 typecheck/evaluator 直接运行，逐训练案例得到预期网格；不计为自动解决。
2. **Blind synthesis**：同一个训练任务不传 Oracle、不传期望 AST、不传测试标签，普通枚举器自动找到可执行的 `ContentFirst` 程序，并独立验证全训练对逐格一致。

对 B Witness/VSA 的本轮要求限于接入已存在的参数/选择证据与多代表记录；**不要求**在本轮实现完整 `Region` / `Set[Object]` 的新泛化偏序或全类型 VSA。必要时先把 Content-first 的 AST 做可执行、可审计的 reference implementation，避免被图重构拖住。

## 5. 机制任务与必需的反例

用**可复现机制生成器**创建至少以下任务族，每族 ≥3 个 seed，每 seed ≥4 个训练对 + 1 个 heldout；heldout 只用于机制评分，绝不进入合成。

| 机制族 | 任务结构 | 验证点 |
|---|---|---|
| `SelectColorThenCrop` | 颜色为 c 的唯一候选对象，尺寸跨训练对变化且不与唯一最大/最小、全局 grid 尺寸一致 | 先选内容后定尺寸；旧 size-only 前置失败的**实测**负控制 |
| `SelectByPredicateThenEmit` | 选中唯一对象/非空集合并输出自身 bbox 尺寸中的选中成员 | Emit 与 Crop 的不同语义 |
| `CropContainsOtherColors` | 选中对象 bbox 内有其他颜色像素 | Crop 保留原 grid 颜色；Emit 不得误通过 |
| `EmptyAndTieSelection` | 选择器在部分案例为空或不唯一 | 不可偷偷 `head`，明确失败与 Witness |
| `SizeEquivalentAlternatives` | 旧 Grid-size Rule 与 Content-first bbox 在 train 上一致，heldout 刻意区分 | 两种 intension 共同保留；prior 无法保证真值 |
| `NoOutputLeakage` | 改动训练目标但保持输入，禁止输入 selection/output size 值在推理中跟着目标变化 | 目标仅用于训练匹配，不是观察值 |
| `DeferredOnDownstreamFail` | 旧 Size Rule 可训练拟合、后续 Render 失败；Content-first 可 train-exact | 不在旧尺寸成功处错误短路 |
| `RegressionAllOldSolved` | 阶段 C 17 / 阶段 D 20 道旧解 | 开关关时状态、程序执行与 work 不变；开启也不失解 |

机制必须先验证 **基线的真实行为**，再标记正/负控制；如果已有 Size Rule 从偶合算式解出了某样本，调整合成数据的数值/维度以构建真实对照，而不是更改测试预期掩盖失败。

## 6. 真实 ARC 任务：定向验证 + 400 题 train-only

先对六题抽查中的两题做诊断：`2dc579da`、`e50d258f`（官方 training 输入，只允许 train IO）。

- 输出旧 Size-first 的 failure、Content-first 是否被触发、可见的选择器集合、产生的 OutputSpec 数量、首次不能继续的阶段、候选执行/预算/Render 详情。
- **尤其对于 `e50d258f`**：现有同色 Object 无法天然构成彩色矩形 Region。若没有已实现的合法多色候选视图，本轮可以仍然无法解题，但必须明确区分 `size-first blocked`（已解除）和 `multicolor region not expressible`（尚未解决）。不得从输出目标框推断 Region。
- 可人工给出候选规则说明，但无 AST 训练验证前不得称 Ground Truth。

随后跑官方 ARC-AGI-1 training 400 题，至少如下三组：

- `FrozenD`：同源码、Content-first 关闭，冻结 Stage D 已验收配置；基线以**本轮实际实测**为准，历史目标 20/400，不能从历史文件直接复制。
- `ContentFirstOnly`：旧 A/C/D 求解保持不变，仅加入新的 Content-first fallback，不扩大其它搜索预算/语法。
- `ContentFirstExploreAlternatives`（可先在机制与定向任务跑）：旧 Size-first 首解后仍搜索替代解释，测量候选成本与歧义，不必直接全 400。

保留 `train_only` 文件隔离、test 非空拒绝、同 binary 与数据 manifest（或者清楚说明独立版本）、独立程序再执行及整格训练验证；输出版本、原始 JSON、`per_task.csv`、`metrics.csv`、首次解成本、最终搜索成本、超时/null 与逐题诊断；不得覆盖既有 Stage C/D/D+ 原始结果。

重点汇总：旧 Size Rule 失败的任务中，有多少现在**进入** selection、有多少导出了合法 `OutputSpec`、多少完成整格渲染、多少 train-exact；旧 Size-first 成功但下游失败时新增多少解；搜索额外开销和旧解回归。**进入新路径 ≠ 找到程序 ≠ 解题。**

## 7. 必备日志和 Witness

复用现有 Stage D+ `search_events.jsonl.gz` 与 single-IO trace 工具；新增最少的结构化事件/字段：

- `size_first_status`: `fit | no_fit | truncated | timeout | not_entered`；保留最初失败及具体 budget。
- `content_first_trigger`: `size_failed | downstream_failed | explore_alternatives | none`。
- `selection_candidate`：AST、输入侧可见 Feature、候选集合 cardinality、唯一性/非空证据、类型与 precondition。
- `output_spec_candidate`：选中对象/集合 provenance、bbox、width/height 来源、`crop_input` 或 `emit_selected`、执行时的 input-only 依赖路径。
- `content_first_budget`: candidates / executed / rejected / truncated / pending / first_fit_work。
- `execution_witness` / `render_witness`：发射对象或裁剪窗口、input pixel → output pixel 的逐像素映射、颜色、重叠与最终网格差异。
- 最终分类保留 `size_first_failed_but_content_first_succeeded` 与 `content_first_unavailable_due_to_representation` 等诊断标签；**没有完整证据不能写 `ProvenExhausted`**。

在现有单 IO 可视化工具中添加（如果已有则复用）：

1. Legacy Size-first 与 Content-first 并行/分支时间线；
2. 选中对象 bbox 与输出裁剪窗口覆盖层；
3. OutputSpec 中 Size 的依赖来源（例如 `Dimensions ← Bounds(SelectColor(...))`）；
4. Input / Target / Actual / Diff、像素级 provenance；
5. 诊断模式下显示“无法识别多色 Region”，而不是空白候选页。

Trace 的展示不得改变求解语义；调试单对匹配只能标 `pair-exact`，不能冒充任务 train-exact。

## 8. 验收门禁与禁止事项

### P0 必须达成

1. **代码级控制流证据**：旧 Size Rule 失败时，新 Content-first 分支确实能打开并执行训练案例；有独立输入侧 Selection Witness 与 OutputSpec Witness。
2. **正负机制任务**：至少一个原本被独立 Size Rule 阻断的多训练对任务，被新路径的**盲搜索** train-exact；抽象程序在 heldout 上有对应机制评分。负例必须明确拒绝空、非唯一和非法裁剪。
3. **语义完整**：输出尺寸取自被选中内容，程序推理期只读输入；Crop 与 Emit 在多色窗口上区分；不裁剪越界对象；无隐式集合顺序。
4. **回归**：Content-first 关闭时旧基线的解、搜索顺序、执行输出与旧工作量保持一致；开启后旧训练精确解不丢失。
5. **资源边界**：新路径触发前无额外候选展开；分层预算/超时/deferred 正确记账；无全局无界扫描。
6. **真实任务**：6 题抽查中至少两题出具分层诊断；完成 400 题 train-only 正式矩阵并如实报告新增/丢失/无收益，不强制新解数量。

### P1 只有确有必要才做

- 输入侧多色 `Region` 视图及面板/分隔区域候选生成；应独立类型化并证明不依赖输出目标。**不得**为使 `e50d258f` 通过而临时 hardcode 该题模式。
- 选择器使用更一般的 Typed Bool / 颜色统计参数；仅在现有 C selector 不能支撑机制任务时做最小扩充。
- 将新的 Content-first 代表加入 B 的 VSA，按案例相对结构泛化建立关系；本轮可以先保留多代表与完整 witness，推迟高阶图扩展。

### 禁止

- 直接从训练输出 `Bounds`/对象/颜色生成推理输入参照；不得将输出目标缓存进 Program。
- 仅移除 `sizeStep` guard，但仍旧要求预先算出 `Dimensions` 才能搜索 selection。
- 为每个具体 ARC ID 手写 selector 或条件分支。
- 假设当前同色 4 连通对象已经等价于多色 Region。
- 把 Content-first 全面替代旧 Size-first；破坏 Stage D 20 道已解回归。
- 将一对 IO 的 `pair-exact` 写成所有训练对的 `train-exact`。
- 把没有证据的 `no_fit` 写成完整 DSL 不可表达，或把超时工作量记为 0。

## 9. 交付物

- `docs/LATIS_CONTENT_FIRST_OUTPUTSPEC.md`：真实源码调用链、OutputPlan/OutputSpec 类型语义、选择/尺寸依赖、触发与执行顺序、限制。
- `docs/LATIS_CONTENT_FIRST_REPORT.md`：机制测试、真实 ARC 消融、旧解回归、候选/预算/首解成本与人工失败案例。
- 自动化测试（单测/机制/回归），以及至少两道失败案例的可离线 HTML/trace。
- `results/content_first/<run_id>/`：版本 hash、data manifest、机制 JSON、ARC raw JSON、metrics/per_task、逐题诊断，不覆盖旧实验。
- 最终回答四个问题：**(i)** Size-first 失败能否打开 Content-first？**(ii)** 输出 Size 是否真由输入选择决定？**(iii)** 哪些任务仍卡在 Region/Selector 表示而非尺寸入口？**(iv)** 有多少真实 train-exact 新增、代价如何？

**实施顺序：审计 → 类型/执行器 → 控制流 → 合成与 Witness → 机制测试 → 两题定向 Trace → 400 题实验 → 报告。先通过 P0，再讨论 P1；不要用增加预算或深度掩盖流程缺陷。**
