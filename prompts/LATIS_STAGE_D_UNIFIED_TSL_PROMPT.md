# LATIS 阶段 D 编码任务：统一类型化 TSL 与可组合对象变换

> **交付目标**：在不推翻 A/B/C 的前提下，使 **A 的 Typed N-ary / Typed Hole 参数合成、B 的 Case-Relative Abstract Referent / Witnessed VSA、C 的 Shape / Object Relation** 真正参与同一类对象变换程序的合成与执行。重点是**可组合的项语言和参数搜索**，不是再增加一个独立的专用求解器。
>
> 使用**简体中文**编写设计文档、实验报告和诊断说明；代码命名沿用仓库风格。请直接审计、实现、测试并运行实验，不要在完成过程中反复向我确认设计细节。发现工作量过大时优先保证 P0，明确披露未完成的 P1/P2。

## 0. 已知事实及必须首先核实的源码现状

阅读仓库中的 `docs/LATIS_STAGE_A.md`、`docs/LATIS_STAGE_B.md`、`docs/LATIS_STAGE_C.md`、`docs/LATIS_STAGE_C_REPORT.md`、`docs/LATIS_STAGE_C_AUDIT_REPORT.md`，**以当前源码为最终准绳**。这些是已确认的架构差距，不要假装已经解决：

1. **A**：`Synthesis.Collection.Typed` 的 `TExpr/TTy` 主要支持 `Int/Bool`；已用于 Size2 和 sequence-local scalar slot；支持 Typed Hole、跨案例共享常数、`If/Lt/Eq/Mod/IsOdd` 等。
2. **B**：`Synthesis.Collection.Referent` 有规范 Lambda Term、常数节点函数化、四类 Witness、hash-consed VSA 与 case-relative 偏序，但目前主要面向 `Int/Bool` 标量槽；大图构建很昂贵。
3. **C**：`Synthesis.Collection.Relation` 的 `ObjectTransform` 及 `CountExpr/OffsetExpr/Pred` 是**封闭枚举**；`runProgram` 中 `progTransform=Just` 路径与原 sequence-local 位置体互斥。`ShapeMask/Object/Set[Object]` 的 VSA 尚未建立。
4. 基线：阶段 C `ObjectShapeFull` 在官方 ARC-AGI-1 training 400 题 train-only 上 **17/400**，其中较阶段 A 新增 10 题；`RelationsOnly` 13/400；旧成功任务不得被新功能删除。阶段 C 审计已确认该结果；Shape 分解的 21 项重叠是统计类别不互斥，并已修复。
5. **不要将“模块接在同一个 Front 中”当作“统一的 TSL 搜索空间”。** 这次必须提供能够**实际构造、执行、复用 A 参数与 B 指称**的 C 对象变换程序。

开工前给出精确接口审计：当前 `TExpr`、`LTerm`、`ObjectTransform`、`emitObjects`、`runProgram`、`fitBody`、`SizeRule`、`RelationWitness`、`Config`、预算/触发链各在哪里；标出可能复用的代码与改动风险。不要重写 ML 或历史求解器的语义。

## 1. 总体架构约束

目标模型（下列签名是语义示意，不要求逐字采用）：

```haskell
-- 源自输入侧的可求值上下文；输出画布尺寸必须由输入侧 SizeRule 得出
InputContext = { inputGrid, inputObjects, selectedObject?, view, outputSize }

-- 带类型的表达式：复用 A 的求值/枚举，不创建第二套随意解释器
ParamExpr a  -- Int, Bool，以及按需定义的 Color / Position / NonZero / Positive 等

-- C 的操作从封闭参数模板演进为可组合的类型化程序
TransformStep  -- Filter / MapColor / MapShape / MapPosition / Replicate / Merge / Crop 等
ObjectProgram = typed composition of TransformStep
```

在架构上必须遵守：

- **类型正确且有定义域检查**：`Replicate` 数量 ≥ 1，颜色满足 ARC 范围，除数非零，位置/形状构造合法，输出尺寸符合 1..30；不得因类型包装而隐藏非法计算。
- **输入可得性**：推理时参数只能依赖 `InputGrid`、其合法对象/集合 Feature、已由输入合成的 `OutputSize`、前序中间结果。训练输出仅可作为合成约束及训练精确检查，绝不作为运行时 Oracle。
- **明确对象来源与作用域**：`CurrentObject`、`SelectedSet`、`WholeInputSet`、`EmittedObject`、`OutputSize` 等引用必须带类型与 provenance；不得把 `Set` 当成 List 索引。需要顺序时必须构造有 Witness 的 `OrderedView`；生成副本可用显式的 copy index/role，但不能偷换成跨对象的无解释具体边。
- **不改变旧行为**：Feature 开关默认关闭；原 Stage A/B/C 默认配置、SafeOnline、Dependent Index、trigger-before-expansion、counterfactual representatives、原始渲染语义保持可复现。
- **先有合法语义，再谈抽象**：不是所有候选必须已被 B 的偏序确认才可执行；但候选的参数必须是有类型、可解释来源的 TSL 表达式。抽象泛化边只负责组织/调度，不作为程序“真实正确”的证明。

## 2. P0-A：统一类型化参数表达式与旧 C 语法桥接（必做）

1. 对现有 A `TExpr` 做**尽可能小的类型化扩展或适配**。优先复用其枚举器、evaluator、Typed Hole、模板代价和 binding witness。若使用封装的 GADT/存在类型，提供明确的类型检查/消去函数，拒绝非法组合；避免大规模替换整个 ML。
2. 允许以下参数由任意**有界 A 类型化表达式**生成，而不再仅靠 C 的固定 5 种 `CountExpr` / 5 种 `OffsetExpr`：
   - 复制数量 `Count : PositiveInt`；
   - 位移 `Dx, Dy : Int`（或 `PositionDelta`），可同时依赖不同输入 Feature；
   - 颜色 `Color`（在 0..9 范围内，合法常数与输入 Feature 均可使用）；
   - 构造参数（例如 `ShellThickness`）：如能安全复用，可作为 P1。
3. 叶子优先来自合法可见的输入 Feature（`PosX/PosY/Min/Max/Extent/CountObjects/CountColors/GridWidth/GridHeight`、合法选择对象的 bounds 等），再用跨案例共享常数拟合；支持 `Add/Sub/Mul/Mod/IsOdd/Lt/Eq/If` 等已实现算子。禁止把 `output` 的对象 Feature 直接当输入。
4. **兼容迁移**：为旧 `KConst/KCountObjects/KFitAcross/KFitDown/StepRight/StepDiagonal/...` 提供到新表达式/新程序的语义保持翻译。对所有旧可构造候选，用性质测试和独立执行测试证明在同一合法输入上输出或错误类别一致（特别是复制数量、偏移、裁剪、越界）。不要直接删除 C 旧语法与原搜索入口。
5. 新程序与旧程序的成本必须可比较，且参数表达式的 AST 大小、常数惩罚、算子成本可审计；**搜索顺序优先级与最终 semantic prior 分开**，不能因改用 `Call`/VSA 包装便凭空奖励同一语义的程序。

**必须给出一条真实的执行调用链**：某个 `Replicate` 的 `Count` 或 `Offset` 由 A Typed Hole 产生表达式，在 C 的对象集合变换中执行，而非把 A 的结果硬编码为另一个 `K*` 枚举模板。

## 3. P0-B：允许对象操作与位置操作在一个程序中组合（必做）

先实现**小而可控**的顺序组合，而非无限深度的通用图灵完备语言。

- 最低要求：同一个可执行程序中能够包含 **Select/Filter → MapPosition（使用 A 合成的表达式）→ Replicate**，以及 **Select/Filter → Recolor 或 ShapeConstruct → MapPosition**；步骤的具体顺序须有明确语义，允许必要的有限变体。
- 至少支持两个非恒等步骤的组合。建议 P0 深度 ≤2（不计无效恒等与选择器），并显式记录每个步骤的输入/输出类型、可见 Feature、precondition、成本。
- 旧 sequence-local body 不能再因为 `progTransform=Just` 就被**静默忽略**。可以实现安全的适配：例如在被选择的源对象上先求位置体，再执行复制/形状变换；或在发射对象上建立有明确定义的 role 与 `OrderedView` 后求位置体。选择哪一种取决于源码可行性，**但必须真实执行两个步骤且做对照测试**。
- 对复制等一对多操作，`Previous`/`Current` 的意义不得凭列表偶然顺序决定；没有合法 rank witness 的旧 sequence-local 表达式必须显式拒绝或改用对象局部 `MapPosition`，不能伪造排序依据。
- 形状改变后若尺寸索引变化，必须通过合法构造重建 `SizeSig`；不得跨 sort 偷换。`Set[Object]` 可以数量变化，不能重新强制双射。
- 先保证支持确定的两步组合机制任务；更多步、对象间图算法、通用 `SplitBy`、任意颜色混合语义属于 P1/P2。

## 4. P0-C：让 B 的指称/VSA 参与对象变换**参数**合成（必做）

这是判断“A+B+C 真正组合”的核心验收项。

1. 对一个参数子目标（`Count`, `Dx`, `Dy`, `Color`，至少覆盖 `Int/Bool` 及合法 refinement），从 A 的候选表达式中构造 B 可接受的 `LTerm`，按 B 的现有语义签名/案例相对结构泛化规则维护候选、Witness、VSA 共享。
2. 对 `Add(PosX,2)` 与 `Add(PosX,Width)` 这类训练等价而内涵不同的表达式，保留不同 representatives；结构上的共同部分使用 VSA/DAG 共享。`CaseAgree` 不意味着全域相等，不能把它们合并为同一个 e-class。
3. **参数合成不一定有直接监督目标值**：关系程序的输出往往只有最终 Grid。若可以从训练输出和合法关系 witness 推导某个参数约束，可做逆向约束；否则使用**受类型与预算控制的联合参数枚举 + 前向整格验证**。严禁假装所有对象参数都有独立的真实标签。
4. 建立 `TypedGoal`（参数类型、当前输入上下文、可见 leaf、成本/深度/求值预算），仅在关系变换的相应参数 hole 被触发时构建/查询 B 的 referent snapshot；尽量复用已有 DAG 缓存，避免每个对象、每个参数重新建立 40,000 节点宇宙。
5. B 原有 confirmed/pending/rejected witness 规则不变。`Confirmed` 只是“已观测依赖 + 案例一致 + 结构替换”，不得宣传为全域语义证明。被启发式裁剪的 constant-looking leaves 必须保持 deferred 可恢复，不得默默永久删除。
6. 新增可关闭的 `SharedParamVSA` / `NoParamVSA`、`WithReferentOrdering` / `WithoutReferentOrdering` 对照；同一有界候选宇宙里，两者的候选集与训练匹配集必须一致（除明确记录的预算截断）。评估实际执行次数与 DAG 内存，不仅报告抽象边数。

**P0 不要求**把 B 的 VSA 一口气扩展为容纳任意 `ShapeMask` 与 `Set[Object]` 的全类型 E-graph。必要时可先使用对象程序的 hash-consed AST + 参数级 Typed VSA，后续再做类型通用化。禁止将“保存对象 Program 文本”称为已经完成 Object VSA。

## 5. P0-D：Witness 与执行语义必须一致（必做）

修正 Stage C 已暴露的“整格正确但 Object-Transform-exact 为 False”的解释缺口。

建议使用**两层来源证明**：

```text
InputObject(s)
   -> TransformWitness(Select/Map/Copy/Merge; source ids, step, expression bindings)
   -> EmittedObject(s)
   -> RenderWitness(pixel contributions, overlap precedence, clipping/rejection,
                    final colour grid, post-render connectivity if measured)
   -> OutputGrid
```

- `TransformWitness` 保存每个中间/发射对象的来源、操作与参数绑定，允许一对多、多对一、删除；选择不唯一等情形显式失败。
- `RenderWitness` 保存可重放或可校验的像素级来源证据，并按**真实 Render 顺序与覆盖规则**计算；同色物体渲染后合并，不再被错误判为“未解释输出对象”。若是稀疏压缩 witness，提供独立核验器，确保不只是字符串解释。
- 训练时可以对照目标网格检查；**预测时不得读取训练输出或使用目标对象编码来计算程序**。渲染越界继续显式失败，不加入隐式裁剪。
- 将 `Object-Count-exact`、`Emitted-Object-exact`、`Render-exact`、`Train-exact`、`Witness-valid` 明确区分。Pixel witness 的合法性与 train-exact 必须分别计量；不要把旧指标无声改变定义。

## 6. P0-E：搜索调度、触发与资源上界（必做）

- 默认 `stageDOff`；新增能力只在需要的位置/数量/构造组合时开放，旧路径优先；已找到的旧成功解不要因为新枚举的固定成本而超时。
- 在关系候选中优先保留 C 的廉价模板，再依需求展开参数的 Typed Hole 和 B VSA（`legacy → typed parameter → composed program` 可作为首版策略）。这是**优先搜索路径**，不是限制候选合法性的类型规则。
- 采用分层预算：候选 step skeleton、参数表达式、参数组合、训练案例执行、VSA 构建与运行级总预算。每项都应产生 `truncated`、`not-applicable`、`no-fit`、`timeout` 等不同状态。不要把 `budget exhausted` 报为“DSL 不可表达”。
- 最多保留有界数目的 train-exact representatives；未展开候选以 deferred 形式记录且不得错误宣称最优性。VSA 与 cost ranking 在同一固定有界宇宙内可做差分对照。
- 不引入 Branch-and-Bound、全 DSL 形式完备性证明、无限深度搜索、神经模块或大规模并行化。
- 同时报告 **first-train-exact work/time** 与 **total-to-budget work/time**，避免用更快的首解掩盖巨大枚举成本。

## 7. P0-F：必须设计“只有 A+B+C 真组合才能解决”的机制任务（必做）

每族至少 3 个不同种子；训练案例必须改变关键参数（尽可能 3–5 个训练对），另设仅用于评分的 heldout。**不得为了通过测试而注入任务 ID、硬编码模板或查看 heldout 输出选程序**。

至少包含下列正/负控制；实际构造时先验证 BaselineA/B/C 在相同预算与语法下不能直接覆盖目标规则，再验证新增候选有目标 DSL 表达式 witness：

1. **TypedCountReplication**：副本数由 `If(IsOdd(GridWidth),CountObjects,CountColors)` 或另一种训练上变化的输入 Feature 组合决定；不能用旧 `K*` 单独表示。检查生成数量、位置和完整网格。
2. **FeatureDependentOffset**：单对象/多对象复制的 `(dx,dy)` 同时依赖两种输入 Feature（如目标对象 bounds 与当前对象 width）；不仅是 `StepRight g/StepDown g`。
3. **ColorThenMove / ShapeThenMove**：单个程序先 `Recolor` 或 `Hollow/FillBBox`，再用 typed 参数进行定位。旧 C 只能完成其中某一变换，不能在同一 `Program` 中两步都执行。
4. **SelectThenMoveThenReplicate**：过滤、位置变换和复制有独立合法 witness。若 P0 组合深度定义只允许两步，可将 Select 看作前置集合选择而不计入两步。
5. **AmbiguousParamReferents**：训练同时支持 `X+2` 与 `X+Width`（或常数复制数 vs 输入依赖复制数），二者在 heldout 分歧；VSA 两个候选都存在，结构共享但不语义合并。不得声称 prior 总能选中真规律。
6. **NegativeControls**：非唯一选择、跨类型参数、除零、对象越界、颜色冲突、非法 `SizeSig`、未提供排序 witness 的 `Previous`、训练不一致、Shape 局部对角结构误合并。均须明确拒绝。

必须测试输入 Object 集合置换不敏感、确定性、trigger-before-expansion、合法的 copy provenance，以及 `runProgram` 对新旧 AST 的重放一致。

## 8. 消融矩阵与真实 ARC-AGI-1 评估（必做）

至少包含：

| 配置 | 作用 |
|---|---|
| `BaselineA` | 冻结 Stage A FullA |
| `BaselineB` | 冻结 Stage B FullB |
| `BaselineC` | 冻结 Stage C ObjectShapeFull（预期 17/400；两批超时需分开记录） |
| `TypedParamsOnly` | C 的单步 ObjectTransform + A 的新参数表达式，不开放多步、不使用 B |
| `ComposeOnly` | C 的固定参数 + 两步组合，不开放新 Typed 参数/B |
| `TypedCompose` | A+C 组合、无 B 参数图 |
| `FullD` | A 参数 + C 组合 + B 参数指称/VSA |
| `NoParamVSA` | 与 FullD 相同的有界参数宇宙，关闭共享 DAG/分层指称（作真正差分对照） |

有时间可再加 `NoReferentOrdering` 或 `NoWitnessCache`，但不能挤占 P0 的功能正确性。

### 真实 ARC 口径

- 使用与阶段 C 一致的官方 ARC-AGI-1 `training` 400 题及 manifest 校验。求解器**仅接收每题 `train`**，`test` 字段为空并有二进制拒绝守卫；禁止使用 test 或 heldout 反馈调参数。
- 每配置相同预先固定的时间/工作预算；若新增子搜索预算，单列报告，不能将预算优势冒充算法收益。优先使用空闲机器运行，记录并行度与批次 ID；原始结果不覆盖。
- 输出每题状态/失败阶段、是否触发新参数、是否确实执行组合、候选数与预算截断、`train_exact`、旧成功是否保留、`SearchWork`、wall-clock、RTS 最大 live heap、参数 VSA 节点/类/边、Witness 检查结果。
- 对原 C 17 道成功任务至少做运行语义回归；若新 FullD 在 60 s 超时导致丢失，必须单独归因为调度/额外成本，不能静默删除。**目标是 ≥17/400 且无既有解回退**，若未达到应如实报告并提出小范围修复，不得造数。
- 对 Stage C 曾归类为 102 道“输入像素 ⊆ 输出像素”的任务、36 道位置/形状组合失败任务，报告状态迁移；这些只是 encoder/失败阶段诊断组，**不能声称它们都需要复制或相同的真实规则**。
- `FullD` 即使没有新增 ARC 解，只要机制正负控制成立，也可以认定语义集成完成；但**不得宣称解决率有提升**。重点分别报告「表达能力」和「搜索效率」。

### 指标至少包括

```text
train_exact / fallback_rate
new_solutions_vs_BaselineC / lost_old_solutions
first_train_exact_work / total_search_work
parameter_goals_triggered / typed_param_evaluations / param_combinations
composed_programs_enumerated / composed_programs_executed / composition_fits
param_vsa_nodes / param_vsa_classes / param_vsa_edges
param_vsa_candidate_coverage / dag_evaluations / reference_evaluations
transform_witness_valid / render_witness_valid / witness_failures
relation_budget_truncations / param_budget_truncations / timeout
failure_stage (size, cardinality, type, relation, composition, render, exact, budget, timeout)
```

对于超时前未写出的指标，使用 `missing/timeout` 而非 **0**；汇总须区分批次、只在共同完成任务上比较确定性工作量。

## 9. 优先级与禁止范围

**P0（必须完成）**：

- A Typed 参数确实可嵌入并执行 C ObjectTransform；旧 C 参数可无损迁移。
- 同一 Program 真正执行至少两步对象变换（含 A 合成的位置表达式）。
- B 的 Ref/VSA 至少组织和共享对象变换的 **Int/Bool 参数候选**；留有关闭它的消融。
- 双层 Transform/Render Witness 完整、可检查，处理同色合并/覆盖。
- 机制正负对照、旧版本回归、400 题 train-only、完整成本与预算审计。

**P1（有余力再做）**：Color/Position 的完整 refinement GADT；Shape 厚度/形状参数的 Typed Hole；对象级更通用 VSA；更强的局部目标约束与逆向求解；跨步骤共享中间值的 VSA；更低内存的 DAG 构建。

**P2（本轮不做）**：任意多步程序、全类型 E-graph 饱和、通用 SplitBy、证明完备性、Branch-and-Bound、神经网络、任务专用补丁、大规模并行化。

特别禁止：

- 把固定 `K*` 模板换个名称就声称 Typed Parameter 完成；
- 只把 B 的图用于记录日志而未参与候选共享/搜索；
- `progTransform=Just` 时依旧忽略位置体却声称已组合；
- 从训练输出暗中读取程序推理参数；
- 根据训练 denotation 直接合并内涵不同的候选；
- 为新增 ARC ID 写特例、修改训练数据或用 test 选程序；
- 把搜不到或预算截断等价成 DSL 不可表达。

## 10. 交付物与最终报告

请生成：

1. `docs/LATIS_STAGE_D.md`：当前接口审计、统一 Typed TSL AST/类型/求值/组合顺序、参数 Binding/Witness、VSA 接口、合法性与触发/预算设计；精确标出 A/B/C 共享的源码路径。
2. `docs/LATIS_STAGE_D_REPORT.md`：P0/P1 达成情况、消融、机制正负控制、ARC 400 题对比、新增/丢失任务、资源代价、失败归因、未完成项。
3. `results/stage_d/metrics.csv`、`per_task.csv`、`metrics.json`、`audit.json`、`new_solutions.json`、机制任务逐项 JSON/trace 与可验证 derivation graph；原始与汇总分开保存。
4. 新的自动测试、确定性差分与一键复现脚本；记录 git 状态/哈希、编译器、预算、数据 SHA256、run_id 和二进制哈希。
5. 如果只完成部分 P0，必须明确写明缺失的可执行接口、未运行的测试与未运行的实验，不得把计划描述为已完成。

最终用**明确的源码调用链**回答五个验收问题：

1. C 的 `Replicate/Move/Recolor` 参数是否真的能执行 A Typed Hole 合成的表达式？给一个完整表达式及逐案例执行证据。
2. 一个程序是否真的能组合两步变换，并同时保留对象身份/来源与依赖类型正确性？
3. B 的抽象指称、Witnessed VSA 是否真的在参数候选的存储或搜索中发挥作用？证明与关闭 B 的有界候选集一致，并给出实际评估开销。
4. 是否存在完整、可校验的 Transform/Render Witness，而不再要求发射对象与输出编码对象双射？
5. 真实 ARC train-only 的 train-exact、fallback、搜索成本相比阶段 C 到底有什么变化？哪些新增解能由**组合能力**而非旧模板直接解释？

**验收原则**：阶段 D 的成功首先取决于实现真正统一的**类型化、可组合、可解释** TSL，而不是要求本轮 ARC 解题数一定明显增长。任何计算效率或泛化优势都必须用实际测量支持。
