# LATIS 阶段 B：Case-Relative Abstract Referents + Witnessed VSA + 分层 TSL 搜索

你是负责 LATIS（Haskell 符号程序合成、PyTorch 神经模块保持不变）的高级编码模型。请**直接审计仓库、实施、测试并报告**本阶段，不要仅输出架构方案。以 `LATIS_STAGE_A.md`、`LATIS_STAGE_A_REPORT.md` 和当前源码为准；遇到文档与源码不一致时，先定位差异并记录，不要猜测接口。

## 0. 目标与边界

本阶段要把「抽象指称」从概念变成 **可生成、可验证、可共享、可用于控制 TSL 原语可见性** 的程序对象：从当前任务的 train 案例构建抽象指称候选与泛化偏序，再从相应原语集合进行类型化搜索。保留现有 Stage A 的 Grid Size、Typed N-ary、`mod/isOdd`、v0.6.1 的 Dependent Index / explained alignment / counterfactual representatives / SafeOnline 不变量。

**本阶段包含 B0–B5；不做** Shape 代数、对象增删/一对多对齐、全局 8-neighborhood、神经网络改动、R2 重构、Branch-and-Bound、对全体 DSL 的完备性证明。不要通过 ARC task ID 特例或更改默认旧算法来提高结果。

设计原则：所有参与 TSL 搜索的候选，都应能表示成类型化指称（最低层允许直接封装现有原始类型化算子/表达式）；**可被更高层泛化不是合法性的必要条件**。抽象用于构建和约束搜索空间，而非在找到程序后必须成功重写的验收条件。对于当前有限预算内找不到泛化的情况，保留具体指称；不要静默删除旧候选。

## B0. Object Bounds + 比较与布尔原语

1. 审计 `Language.ML`、`Language.Schema`、`Synthesis.Collection.Typed`、`Front/Counterfactual` 及已有 `PosX/PosY/ExtX/ExtY/SetMinX`：先确认已有能力，再按实际缺口增量注册，避免重复定义或改变旧语义。
2. 增加单对象 `Bounds : Object -> BoundingBox`，以及 `MinX,MaxX,MinY,MaxY : Object -> Int`。明确坐标系为 x 向右、y 向下，**边界包含端点**；仅在确认 `PosX/PosY` 是 bbox 最小坐标、`ExtX/ExtY` 为宽高时使用 `MaxX = PosX+ExtX-1` 等公式，否则按现有对象几何定义实现并写测试。空对象、失效几何和越界要返回明确错误或带前提的安全类型；单对象 Bounds 与对象集合 Bounds 分开。
3. 在缺失的位置实现并暴露 `Lt (Int,Int)->Bool`、`Gt`、`Eq`、`And (Bool,Bool)->Bool`、`Or`、`Not`；`If`、`TyBool`、`IsOdd` 复用 Stage A。比较和布尔项必须能实际进入类型化 TSL 表达式、`If` 条件以及 evaluator，不接受只有 registry 名称的空实现。`<=,>=,!=` 可由组合生成，避免第一版重复枚举。
4. **Bool 需求触发**：比较运算主要在 `If` 条件或明确需要 Bool 的 typed hole 中展开；对象级边界特征必须遵守对象 grounding / visibility / alignment witness，不能未经证明地从 `Set[Object]` 取第一个元素。给所有新增内容加独立开关，默认关闭，验证 Stage A 兼容。

## B1. 规范 Lambda Term 与特殊值节点

给定固定、版本化的规范原语系 `Σ = AtomicTSL ∪ ML`。抽象指称在内部表示为：

```text
AbstractReferent {
  inputTypes, outputType, precondition,
  canonicalTerm, freeInputDependencies,
  sourceProvenance, caseSignature, abstractionCost
}
```

定义 `O = λx⃗. t : τ⃗ -> ρ`。将引用到的已知复合定义**有界地**展开为 `Σ` 上的带类型 Lambda AST；规范化至少处理 alpha-renaming、可控的 beta-reduction、结构共享和类型检查。**不得**对递归/未知原语无限内联，也不得把「训练集输出相同」当成全域语义等价。无法展开的节点应标为 `Opaque`，不能伪造泛化证明。

「特殊值子树」`E_s` 的定义是：在当前 Lambda 绑定作用域下不依赖 `x⃗` 的封闭常数值表达式（包括可求值的常数子表达式），有明确类型；排除含自由局部变量或依赖输入的子树。需处理捕获避免、重叠子树替换顺序、类型精化及偏函数前提。枚举以 AST 大小/深度/候选数/运行预算为限，给出截断指标。

## B2. Case-Relative Structural Generalization（核心定义）

给定输入参数类型和输出类型相同的 `O_A=λx⃗.t_A`、`O_B=λx⃗.t_B`，定义有向、带证据的一步关系 `O_A ->_C O_B`，当且仅当：

1. 在同一 `Σ` 与同一规范化策略下，存在 `t_A` 内**至少一个**特殊值子树 `E_s`，可被同类型的 `F(x⃗)` 替换，`FV(F) ⊆ {x⃗}`，且 `F` 具有真实的输入依赖证据（不能仅因语法出现 `x-x` 就认定依赖）。
2. 替换后规范 AST 与 `t_B` 相等：`NF(t_A[E_s := F(x⃗), ...]) = NF(t_B)`。此处是可核验的结构替换，不是训练样本上的行为近似。
3. 两个算子在当前所有已合法 grounding 的训练案例上下文 `c ∈ C` 中均可求值，且 `O_A(c)=O_B(c)`。如果训练上下文不足或前提不满足，记录 `Unknown/NotApplicable`，不得伪称全案例成立。
4. 类型、前提以及可用输入来源合法；合成出的 `F` **不能在推理时读取输出 Grid、训练样本 ID 或 test 信息**。输出侧 Feature 仅可作为训练比较目标。

案例一致性只是 **case-relative support**，不是全域语义等价或未来泛化准确率证明。分别保存 `StructuralReplacementWitness`、`CaseAgreementWitness`、`DependencyWitness`、`TypeWitness`；对于「真实依赖」无法静态证明的候选，标记为待证并保留候选，不得将其升格为已确认的严格泛化边。可使用类型安全的 counterfactual 差异输入作为非平凡依赖证据。

例如 `λo. PosX(o)+2 -> λo. PosX(o)+Width(o)`，当训练对象宽度均为 2 时建立受案例支持的泛化；新案例宽度变为 3 后移除案例支持，但不删除两个原始候选。再测 `If(Width(o)>3, a,b) -> If(Width(o)>Height(o),a,b)`。**不要**将这个「常数函数化」关系与 `Rectangle <: Shape` 的输入域泛化混为一谈；后者单独记录 `TypeGeneralization`，只有语义兼容时才可组合。

## B3. Witnessed VSA 与共享表达式结构

先审计仓库现有 VSA、`SemanticClass/Representative`、`Deferred`、canonicalization、e-graph（如果存在）；**复用已有实现，缺少才增量扩展，不平行造一套互不相通的候选系统**。

目标是让 `Add(PosX, Union(Const(2), Width))` 共享公共树结构，但保留分支各自的类型、依赖、训练签名、counterfactual signature、cost、witness/provenance 和确定性排序信息。

严格区分：
- **VSA Union**：表示多个候选，即使它们在未见输入上的行为不同。
- **SemanticClass**：按当前训练行为分组，但不自动消除不同内涵代表。
- **E-graph/e-class**（如使用）：仅合并由可靠恒等式/重写证明的全域语义等价表达式；不得因为 train-denotation 相同就合并。
- **Witness**：提供边、绑定和求值为何有效的可审计依据，不等于预测正确的证明。

第一版 VSA 可用 hash-consed typed DAG + typed Union；禁止因共享而不小心共享 task-dependent 输入环境或丢失候选身份。测试压缩/展开（在小预算下枚举所有 VSA 叶候选）与不共享的参考枚举器的**候选集合完全一致**。无合法 Witness 的泛化不得加入已确认偏序。

## B4. 预构建分层抽象指称集合并搜索

对每道任务，先在 **仅有 train 数据** 的环境里：

1. Ground 可见基础对象/尺寸/边界/比较 Feature，构造最低层 `A_base`；包含既有合法原语的具体指称，不能仅因未能提升抽象就被删除。
2. 对有界候选使用 B2 的替换规则构建 `A_C`，并维护 **结构泛化边**、**case-supported 边**、**类型泛化边** 三类关系；不可比较的算子保持不可比较。
3. 对受支持的边求传递闭包用于索引，但**不要**把闭包边作为独立的语义证明；处理等价节点/环（可做 SCC 商）以构成偏序 DAG。每条边保留完整 Witness、支持案例以及 `Σ`/配置版本。
4. 由抽象图产生受限、类型正确、visibility-respecting 的 **task-specific TSL primitive sets**；主搜索从这些 sets 合成程序。每个层级有独立预算，并记录原始、已暴露、已搜索、已截断候选数。
5. 至少支持 `GeneralFirst / SpecificFirst / CostFirst / Interleaved` 四种可切换调度；若偏序存在不可比较节点，使用稳定的并列顺序和公平轮转，**不要**假定存在唯一的整数抽象 level。训练行为一致不等于必须选更一般的候选。

保持 `SafeOnline` 原语义；先用冻结的抽象图快照验证主搜索，必要时在线 promotion 只能作为独立开关/后续实验，避免本轮变量混杂。不得突破 Dependent Index、无解释跨对象连接、trigger 前不展开的既有约束。无需证明旧 R2 或全 DSL 完备性。

## B5. 测试、消融和真实 ARC 审计

### 必须有的机制测试

- Bounds 四边界：单像素、矩形、带空洞形状、坐标平移、左上原点、极端尺寸；不改变连通性/对象标识。
- `<,>,==,And,Or,Not,If`：类型错误拒绝、条件组合、重复/等价逻辑式处理、求值一致性；条件中禁止访问输出值。
- 常数节点替换：正确例 `X+2 -> X+Width`、Bool 阈值例；错误例类型不匹配、带变量依赖的“假常数”、变量捕获、`x-x` 假依赖、仅训练等价但不存在结构替换、训练不一致与前提不满足。
- 新案例使旧 case support 失效；结构关系仍可保留，不发生永久 candidate collapse；对相互不可比较的泛化保持多个分支。
- VSA 的共享与展开候选集合一致；Wit­ness 能追踪每条替换边；已证明等价与仅 train-equivalent 不混合；规范化/排序确定性。
- 无抽象泛化时最低层具体指称仍可解原有机制任务；含 Grid Size / Typed N-ary / `mod/isOdd` 的 Stage A 原有任务回归。

### 实验矩阵（所有配置同数据、同事先固定的预算口径）

- `BaselineA`：Stage A FullA，无 B 能力。
- `B0Only`：仅 Bounds/Bool 新原语。
- `NoStructuralGeneralization`：B0 + 共享表示/候选基础层，但禁止常数函数化边。
- `NoSharedVSA`：B0 + 泛化/层级调度，用普通 AST 候选作为对照。
- `NoHierarchy`：B0 + 泛化/VSA，但无按偏序的搜索调度。
- `FullB`：B0–B4 全部开启。
- `FullB` 的调度对照：GeneralFirst、SpecificFirst、CostFirst、Interleaved。

先运行可复现小型合成任务与 smoke test，再运行 **官方 ARC-AGI-1 training 400 题 train-only**；训练输出只用于合成和验证，`test` 数据不得进入求解器或触发选择逻辑。保留先前数据清单和隔离校验。输出至少包含：`train_exact/fallback`、与 Baseline 的新增/丢失任务 ID、首个失败阶段、`search_work/wall_clock/RTS max_live_bytes`、抽象节点/边数（已证明与经验待证分别计）、平均/最大 DAG 共享率、VSA 节点数与展开候选数、每层曝光/搜索/截断数、Witness 覆盖率、候选集合完整性核对结果、预算截断次数。

把「候选共享节省内存」和「实际减少 evaluator 工作量」分开报告；把「SizeRule-exact」与「完整 Program train-exact」分开报告；不把训练等价或更一般的候选宣称为 test 泛化正确。

## 工程和交付要求

- 所有 B 能力用 Config 显式开关；旧默认与 Stage A FullA 的行为有逐任务回归。B0 可独立关闭；避免更改 ML 中已有算子的求值约定。
- 若旧代码的 TSL 结构与以上假设冲突，先完成**最小接口审计**，用原生结构实现同等语义，不机械照抄伪类型名；不要重写整个求解器。
- 所有构造器、对齐与绑定保留类型/前提/来源 Witness；严禁 case-ID 特例、偷看 heldout、把输出 feature 当输入变量、训练等价误当全域等价、错误压缩 counterfactual representatives。
- 版本化抽象库快照，确保重跑结果确定；若失败于成本或实现复杂度，请明确记录未实现部分和实际运行的实验，不要填写未测量的数字。
- 交付：`docs/LATIS_STAGE_B.md`（正式语义、结构与复现）、`docs/LATIS_STAGE_B_REPORT.md`（结果、消融、失败案例审计）、机器可读的 `metrics.csv`/`per_task.csv`/候选图与 Witness 样例、自动测试与一键复现脚本。

## 验收优先级

**P0（必须）**：B0 正确接入；B1/B2 有可执行的结构泛化规则与反例；Witness 可信；既有行为不回退。

**P1（必须）**：VSA 共享不丢候选；基于 case support 的 DAG 构建、分层 primitive sets 和至少两种策略的可复现搜索与消融；真实 ARC 400 train-only 报告。

**P2（可延后并说明）**：更广泛的高阶 Lambda 规范化、丰富的类型泛化证明、在线抽象图库更新、复杂 e-graph 饱和。不得为了追求 P2 牺牲 P0/P1 的可审计性。

**最终必须回答：** (1) 抽象指称与泛化边是否真的按形式定义被构建？(2) VSA 共享是否保持候选集合并实测降低内存或计算？(3) 分层搜索相较 Baseline 是否改变 train-exact 覆盖与搜索成本？(4) 失败究竟来自表示能力、抽象构建、搜索预算，还是对象数量对齐硬前提？
