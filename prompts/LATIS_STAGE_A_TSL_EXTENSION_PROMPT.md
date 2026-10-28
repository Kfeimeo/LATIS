# LATIS 阶段 A 实验提示词：Grid Size Feature + Typed N-ary Feature Synthesis + ML Parity

你是负责 LATIS 的高级 Haskell 编码模型。请在现有仓库上实现 **阶段 A 的最小、可审计增量**，并运行对照实验。目标是扩充 TSL 可表达的变换类别，而不是重写已有求解器、引入任务特例或追求全程序空间完备性。

## 0. 研究背景与不变量

已有 v0.6.1 `SafeOnline` 具备 dependent-index object representation、无下标 `Set`、带证据的 `OrderedView/Alignment`、counterfactual representatives、在线 abstraction、deferred candidate recovery。此前 ARC-AGI-1 官方 training split（400 题）的 train-only 审计：Feature train-exact **3/400**、fallback **397/400**；其中 **138** 题因输入/输出 canvas 不同而被提前拒绝，**198** 题因输入/输出对象数量不等而无法 RankAlign；画布不变且对象数相等者 **64** 题，仅 **3** 题 train-exact。这个结果只用于界定瓶颈，不能据此承诺新增解题数量。

本阶段要完成：

1. 将 Grid Width/Height/Size 纳入类型化 Feature，并使合成得到的**输出画布大小真正参与最终 Grid 构造**；
2. 将二元 Feature 对比 `P(fi)=fo` 推广为**类型驱动的 N 元算子应用与 Typed Hole 填充**：优先可用输入侧 Feature，找不到或未匹配时再尝试可证明跨案例一致的常数；
3. 在 ML 的基础语义中加入 `mod` 与 `isOdd`，接入类型化 Feature/TSL 可见语法并测试。

**不要**在本轮实现 Shape 代数、E-graph/完整 VSA 重构、抽象指称偏序重构、通用关系式对象生成/分裂、并行化、神经网络或 Branch-and-Bound；它们属于后续阶段。

必须保留既有语义约束：Trigger before Expansion、matched/frozen 不重复展开、No alignment without an explanation、Set 无隐式索引、size-index legality、高层不泄漏 concrete cross-item edges。新代码不能靠任务 ID 分支、test output 泄漏、隐式 enumeration order 或随意放宽 witness 验证提升覆盖率。

## 1. 开工前审计（先读源码再改）

定位并列出当前 ML / TSL 的类型、operator grammar、Feature IR、evaluation、Visible Feature registry、scalar synthesis、output realization、grid-size guard、fallback 入口、VSA/witness 接口，以及 ARC train-only runner。找出 `unchanged canvas` 的**具体检查位置及依赖**，不得仅删除 guard 就认为完成。

写一段简短 implementation plan：新增模块/API、保持不动的模块、最小迁移路径、向后兼容风险。保留 v0.6.1 原入口和默认行为（若必须更改共享模块，请有显式模式/feature flag，并跑旧回归）；不改 v0.4/R2 的核心搜索语义。

## 2. Grid Size 作为一等 Feature

### 2.1 类型与语义

给输入/输出网格暴露：

- `GridWidth : Grid -> NatPos`
- `GridHeight : Grid -> NatPos`
- `GridSize : Grid -> Size2`，`Size2 = (NatPos, NatPos)`，明确坐标轴顺序（width,height）及有效范围。

`NatPos` 应保证大于 0；生成网格时遵循 ARC 的尺寸有效性约束（以仓库既有约束为准，记录实际限制）。在训练时，输出 Width/Height 只能作为 **ground-truth 目标值**，不能当作待求解程序的输入 Feature；推理时求值只依赖输入 Grid、合法已构造中间值和常量。

### 2.2 Size Rule 合成

允许对所有训练 IO 对寻找一套统一的输出大小表达式（例如 `Wout = 2*Win`、`Hout = Hin + 2`、`Wout = Win + CountObjects(Input)`，只作为通用语法的机制例子，不可 hardcode 模式）。Width/Height 可分别合成，但最终合成为一个带 witness 的 `Size2`；允许跨轴和其他输入 Feature 依赖，受类型与成本约束。保留多个训练等价、结构不同的 representatives，不因 train denotation 相同而单独删去候选。

### 2.3 Output Realization

新增或扩充 `ConstructGrid/ResizeCanvas` 一类真正可执行的语义：**先通过输入计算输出 Size2，创建指定大小的画布，再执行已有支持的对象放置/绘制**。明确背景像素、局部/全局坐标、越界、裁剪、对象重叠、整格 exact 的行为；不允许通过 silent crop、clip、默认填充伪造 train-exact。若现有对象变换仍要求输入/输出对象数相等，该条件仍保留在相应 alignment/transform 路径上，不能把 canvas 支持扩展误报为解决 cardinality mismatch。

必须覆盖：尺寸扩大/缩小、横纵轴不同比例、尺寸不变回归、输出无效尺寸、放置越界；对于暂不能表达的任务，准确记录失败环节而不是提前报 `unsupported canvas`。

## 3. N 元 Feature 对比：Typed Hole Synthesis

### 3.1 通用形式

从 `P(fi)=fo` 推广为类型正确的算子实例：

`P : T0 -> A1 -> ... -> Ak -> Tout`，搜索 `P(fi, a1, ..., ak) = fo`（需要时也允许全部参数从 feature sources 填充，不强迫某个“主输入”）。`fo` 必须是训练中的目标 Feature，`fi/aj` 均来自输入侧可见 Feature、合法中间 Feature 或跨案例一致的常数。

基于已有类型系统生成 `Hole[A]`，按 operator type、visibility、ontology slice、dependency legality 过滤。多个同类型参数必须分别实例化且保持有序（例如 `Sub(a,b)` 与 `Sub(b,a)` 不可误合并）。禁止因输出类型匹配便建立缺少 AlignmentWitness 的跨物件对应。涉及 object/shape 时继续检查 dependent size index。

### 3.2 Hole 填充优先级

对每个 hole：

1. **Feature-first**：检索当前已可见、可从输入计算的同类型 referents/features；
2. **Composed feature**：只在合适 Trigger 触发时，按有界深度/成本合成输入侧子表达式；
3. **Fitted constant**：若 feature 无法使整个候选满足全部训练 pair，允许拟合一个**所有案例共享的**类型化常数值（优先由等式/约束推导；否则受明确有限域约束）。

Feature-first 是枚举顺序，不是绝对语义优先；常数也应进入候选语义类并可与输入依赖表达式共存。严禁为各案例单独拟合不同常数，严禁从测试输出构造常数。

支持多个 hole 的联合拟合，而不只是逐 hole 贪心；第一版对实际展开 arity、composed depth、候选数设定可配置上界，报告触发与截断数。避免交叉积爆炸：类型索引、按训练 denotation 分组、共享子表达式、预算控制、确定性枚举与去重。若无法保证某项优化保留不同 intensional representatives，则不要采用该优化。

### 3.3 Witness / VSA（只做接口级整合）

每个候选及匹配证据至少记录：operator、参数绑定来源（input feature / composed / fitted constant）、参数类型、dependency signature、training denotation、cost、目标 Feature、跨案例 exact 检查、各个 alignment/legality witness、失败原因。优先复用现有 VSA/semantic class 的表示；本轮只做必要的共享结构/Union 接口，不重写 VSA 算法，也不将“训练等价”提升为“全域语义等价”。

## 4. ML 增加 `mod` 和 `isOdd`

- `mod`：类型化整数余数运算，除数必须非零；明确 Haskell 风格 `mod` 对负数的符号语义，并在执行与审计中处理除零（拒绝/显式不合法，不能 crash 或默默返回 0）。如使用自然数版本，给出与 `Int` 版本的转换与有效域约束。
- `isOdd : Int -> Bool`：负奇数同样返回 True；与 `mod 2` 的关系应在非负/相应合法域上测试。
- 将这两个运算接入 ML evaluator、typed operator registry 和按 Trigger 可见的 Feature 语法。必须能够被 generic N-ary search 调用，而非另写专用匹配分支。
- 不得为接入这两项而开启无限或无界算术枚举。

## 5. 对照实验与评价

### 5.1 Synthetic mechanism tasks（必须）

新增至少以下机制任务，每类多实例，训练/留出分开：

- `SizeScale`：统一倍数缩放 canvas，能构造对应输出；
- `SizeOffset`：输出宽高有不同常数偏移，验证 fitted constant 在所有训练 case 共享；
- `SizeFromFeature`：至少一个输出尺寸依赖**另一个输入 Feature**（如输入 ObjectCount），不能仅靠单一固定常数泛化；
- `TwoHoles`：一个 n 元算子有两个或以上 hole，验证联合作用与非交换算子的参数顺序；
- `ParityMod`：`mod/isOdd` 的类型、合法性与可匹配行为；
- `SameCanvasRegression`：原对象变换与 03560426 保持正确；
- `CardinalityMismatchStillBlocked`：网格可变化，但尚不具备的对象增删不能被非法对齐绕过。

增加 counterexample：在训练集里常数与 Feature 恰好相等、在留出集分歧；确保两个 candidates 仍被保留并可审计，不宣称 prior 已识别唯一真解。

### 5.2 Ablations（保持其它设置相同）

- `BaselineV061`：现有 SafeOnline；
- `GridSizeOnly`：加入 size feature + grid realization，禁用通用 N-ary hole 扩展（已有一元/固定搜索照常）；
- `TypedNaryOnly`：开启 typed-hole 搜索，但固定画布路径不变；
- `FullA`：GridSize + Typed N-ary + `mod/isOdd`；
- `NoFeatureArg`：额外参数只允许 fitted constant；
- `NoConstantArg`：额外参数只允许 Feature。

实现真正隔离的消融（而非全部复用 FullA 路径）；对不适用某模式的任务输出明确失败原因。

### 5.3 真实 ARC-AGI-1 Train-only（必须）

使用与已完成报告相同的官方 400 道 `training` 任务和一致的 train-only 隔离约束。先验证数据文件与 manifest，再固定预算跑全量实验，**不得用 test 字段参与求解、调参、触发 fallback 或选择候选**。只有全部训练 IO 网格逐格一致才算 train-exact。

完整报告：`Feature train-exact`、`fallback`、`timeout`、`unsupported`、`no_solution`、分错误类别计数、新增成功任务 ID、从 `canvas mismatch` 类别转成“进入搜索”的任务数、`SizeRule-exact` 的任务数、完整 Program-exact 的任务数、candidate/typed-hole 展开数、search work、wall-clock、峰值内存（注明统计口径）。

必须将 **SizeFeature 能拟合目标**、**Grid Realization 成功**、**整体 Grid train-exact** 分开报告；不得把能够预测大小当成完整解题。也不得通过挑选成功的子集作为总成功率分母。继续记录 R2 fallback 的实际触发量，但第一轮可选择只对新成功/状态发生变化的任务运行 R2 诊断，其余若未重新执行不得声称得到新的端到端恢复率。

### 5.4 精确回归与性质测试

验证旧的 03560426、A–H/P、collection v0.5/v0.6/v0.6.1 tests；类型安全、Set 顺序不敏感、tie 拒绝、matched/frozen 不展开、No concrete high-level cross-item edges、counterfactual representatives 不误合并；相同 seed/budget 下运行结果确定性。若新增接口使历史配置路径改变，显式列出变化并保持原模式兼容。

## 6. 验收标准

1. `Width/Height/Size` 在输入和训练目标两侧正确 grounding，合成的输出尺寸能**真正控制网格构造**；可通过大小变化的 synthetic train-exact 任务。
2. 通用 Typed Hole 搜索支持至少两个额外参数、Feature-first 与 fitted-constant 两种绑定，能生成并执行完整 TSL/ML 表达式，参数 provenance/witness 可追踪。
3. `mod/isOdd` 在 evaluator/语法/测试中可用，除零与负值语义明确。
4. 合成任务及旧回归不破坏现有 legality/invariants；真实 ARC 400 道 train-only 评估完成并如实报告新增覆盖与失败模式。
5. 不要求必须超过某个 ARC 成功率阈值；若 train-exact 数量没有改善，仍必须报告 **为何 size 规则可匹配却不能生成完整解**，并提供具体失败样例。

## 7. 交付物

- 新增模块与单元/性质/回归测试；
- `docs/LATIS_STAGE_A.md`：架构、类型签名、算子语义、触发规则、如何复现；
- `docs/LATIS_STAGE_A_REPORT.md`：机制任务、消融、真实 ARC 400 题 train-only 结果及限制；
- `results/stage_a/metrics.csv`、`results/stage_a/per_task.csv`、JSON 审计（含 size rule、hole bindings、witness、失败原因、预算截断）；
- 一键运行脚本与固定环境/代码/数据哈希记录；
- 与 v0.6.1 对照的 regression summary，明确未实现的能力（例如 object count-changing transformations、shape algebra）。

执行顺序：**审计接口 → 最小实现 → 机制测试 → 回归 → 小批真实 ARC smoke test → 全量 400 题对照 → 生成报告**。不要仅写设计提案；本任务要求实际实现和实验。若无法完成某一步，提供已运行的证据、具体阻碍和未完成列表，禁止编造结果。
