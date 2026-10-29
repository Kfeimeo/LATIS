# LATIS 程序合成泛化：研究调研与下一步方案

调研日期：2026-10-17。范围：当前 R2 主线、place-only 实验、现有实验记录及相关原始论文/作者仓库。本次没有运行新一轮合成实验；下面的现状数字来自仓库已有结果，并与 CSV 交叉核对。所有新机制、工作量和验收门槛均为提案，不能视为已验证增益。

**建议下一版集中做“需求驱动的双向合成 + 经验证的局部抽象反馈”。先让基础语言中已有的通用规则进入候选空间，再评估更大的概念库与学习式搜索。** 同时启动小范围多表示实验，解决真实 ARC 上的覆盖不足。

## 1. 当前最重要的证据

| 测试组 | R2 Full 训练正确 | R2 Full 留出正确 | place-only Full 训练正确 | place-only Full 留出正确 |
|---|---:|---:|---:|---:|
| 核心题 | 1/1 | 1/1 | 1/1 | 1/1 |
| 合成 regression | 16/17 | 16/17 | 16/17 | 16/17 |
| 合成 stress | 9/10 | 6/10 | 6/10 | 3/10 |
| 已打开的 ARC diagnostic | 1/30 | 0/30 | 1/30 | 0/30 |

两版 diagnostic 都有 2 个超时。超时可在固定预算的成功率中计失败，但其缺失的内部搜索/portfolio 证据应视为未知，不能解释成已经证明没有正确候选。58 题的混合总分适合回归对照，不是 ARC 整体泛化率。

证据：[R2 报告](../reports/v03/LATIS_V03R2_REPORT.md)、[R2 CSV](../results/v03r2/metrics.csv)、[Place 报告](../results/place-only/REPORT.md)、[Place CSV](../results/place-only/metrics.csv)。

有四个直接影响路线选择的事实：

1. **R2 已经改善了特定关系规则的泛化。** 例如 scan-reverse 的结构代表、let 共享与 witness 覆盖共同帮助正确程序进入候选集。已有基础值得保留。
2. **当前 Full 的主要剩余空间在候选覆盖。** R2 的 core/regression/stress 中，“portfolio 至少含一个留出正确程序”的题数分别为 1、16、6，恰好等于最终选择成功数；已完成的 diagnostic 也没有额外的留出正确候选。只替换最终排序器，对这些已保存 portfolios 没有可见的增分空间。这只是当前样本上的事后诊断，不是未来排序永远不重要。
3. **语言可表达不等于搜索可达。** Place 的独立参考程序通过了 8 个压力任务的类型、训练和留出检查；但自动搜索仍失败。参考程序没有被喂给合成器，因此是有价值的覆盖审计。
4. **发现很多抽象不代表学到所需概念。** Place 共发现 132 个任务内抽象，却没有带 VecT 参数或包含 coordAdd 的定义。R2 scalar feedback 实验虽有真实 invention hits，却比 NoOnlineAbstraction 使用更多工作与时间。应测迁移收益，而非抽象数量。

## 2. 把“泛化”拆成可验证的问题

需要分别回答：

- **实例泛化**：同一规则，换尺寸、位置、颜色、物体数量后还能执行吗？
- **组合泛化**：基础动作都见过，但新的嵌套方式、依赖关系或组合顺序没见过，能合成吗？
- **表示泛化**：单色连通分量、彩色物体、整体图案、空洞等不同观察方式之间能切换吗？
- **跨任务迁移**：在先前任务学到的抽象，能否降低新任务的求解成本或增加可解覆盖？

训练 exact 是必要条件；单个 heldout exact 也不能单独证明恢复了预期规则。项目中 F-global-better 已给出实例：在有限 heldout 上正确的颜色/坐标算式，可能不同于生成器的反射规律。

建议始终报告三个层次：Base 中存在可执行参考程序；固定预算搜索实际找到了目标泛化候选；冻结选择策略选中了正确输出。没有参考程序时，表达能力保持 unknown，不由搜索失败推断语言缺失。

还应避免把“基础词汇更少”直接视为“泛化更强”。删除 Translate 后，即使 place 与坐标代数保持相关表达能力，程序长度、逆推条件和发现概率也会变化。StructuralPriorCount=0 表示没有所计数的显式结构模板，不意味着系统没有归纳偏置：对象分割、观察域、terminal policy 和 literal prior 都在施加偏置。研究目标应是使这些偏置通用、可审计、可检验，而非仅让 primitive 数量更小。

## 3. 最值得借鉴的研究

| 研究 | 已有研究支持的结论 | 对 LATIS 的启发与限制 |
|---|---|---|
| [FlashMeta，OOPSLA 2015](https://www.microsoft.com/en-us/research/publication/flashmeta-a-framework-for-inductive-program-synthesis/) | 用算子的 inverse semantics / witness functions，把输出规格传递给子表达式 | 当前架构方向合理；关键是每个 witness 的条件化方向与覆盖范围。类型正确不自动保证组合可达 |
| [Alford 等，2021，Neural-guided Bidirectional Program Search](https://arxiv.org/abs/2110.11536) | 将前向执行与逆语义结合；还展示了 ARC 对称任务中的库学习 | 先借鉴双向搜索机制，可以先不引入神经网络。论文的 ARC 实验是受限任务子集，不能等同完整 ARC 成绩 |
| [DreamCoder，PLDI 2021 相关原论文](https://www.neurosymbolic.org/papers/EllisWNSMHCST21.pdf) | 交替进行程序求解、库抽象与合成任务上的搜索指导学习 | 迁移来自“抽象 + 如何使用抽象”的闭环；只保存宏定义并不足够 |
| [Stitch，POPL 2023](https://arxiv.org/abs/2211.16605) | 从程序语料做 top-down abstraction，显著提高库压缩的效率 | 可以借鉴候选抽象挖掘；压缩率的改善不等于 ARC 泛化改善，也不保证补齐当前 witness 缺口 |
| [ARGA，2022/2023](https://arxiv.org/abs/2210.09880) | 通过对象图抽象、约束与搜索求解 object-centric ARC | 把“如何看待网格”纳入假设空间；不能只在固定对象分割之后改坐标 |
| [BUSTLE，ICLR 2021](https://arxiv.org/abs/2007.14381) | 利用可执行中间值及 property signatures 指导 bottom-up 组合 | 项目已有 typed denotations，可先建轻量调度器；其结果主要来自其他合成域，不是 LATIS 的现成增益 |
| [Combining Induction and Transduction，ICLR 2025](https://arxiv.org/abs/2411.02272) | ARC 中显式程序归纳与直接输出预测具有互补性；使用程序变化生成训练任务 | 如果以后引入模型，可用于感知、提案或搜索排序；不必第一步重建完整端到端系统 |
| [SOAR，ICML 2025](https://proceedings.mlr.press/v267/pourcel25a.html) | 用演化搜索与 hindsight learning 交替改进程序生成/修正 | 失败轨迹可以成为学习数据；必须保留新任务与规则族的独立划分 |
| [Narcissus，2026-08 预印本](https://arxiv.org/abs/2608.25657) | 将 LLM 的 AST 提案转成考虑上下文的廉价搜索指导，并给全部语法规则保留正权重 | 与 typed DSL 很匹配，适合作为后续可选实验。保留语法支持并不意味着固定预算搜索完整；不直接套用论文百分比 |
| [ConceptARC，TMLR 2023](https://arxiv.org/abs/2305.07141)；[规则级分析，2025 预印本](https://arxiv.org/abs/2510.02125) | 按概念族和规则理解评估，能揭示单纯输出准确率遗漏的问题 | 需要规则族、干扰变量与组合外推测试，而非只反复检查同一批样例 |
| [RE-ARC 作者仓库](https://github.com/michaelhodel/re-arc)；[ARC-GEN 官方仓库](https://github.com/google/arc-gen) | 提供 ARC 训练题的程序化样例生成，允许大量受控变化 | 适合稳健性审计；新随机 seed 不等于新规则。生成器是作者对规则的建模，需做独立核查 |

[ARC Prize 2025 Technical Report，2026-01](https://arxiv.org/abs/2601.10904) 也把 refinement loop 视为重要进展方向。这里更可借鉴的是“执行—反馈—改进”的机制，而不是把不同数据划分、预训练和计算预算下的成绩当作 LATIS 的可比基线。

上述路线的共同点是：表示决定能提出什么问题，搜索决定能组合出什么程序，学习决定下一次优先探索什么。三者应在保留精确验证的前提下协同。

## 4. 第一优先级：修复需求传播与搜索可达性

### 4.1 先修已被实验暴露的单向条件化

当前 Place 路径可写成：

```text
place(objectOf(o), coordAdd(Anchor(o, TL), displacement))
```

这只是解释所需程序的例子，不应作为整段模板注入搜索。

[Place Witness.hs](../experiments/place-only/src/Synthesis/InducedR2/Witness.hs) 的 coordinateResidual / coordinateJoin 都先条件化右操作数。对 `coordAdd : Coord × Vec → Coord`，右边需要已有 Vec；[Observers.hs](../src/Synthesis/InducedR2/Observers.hs) 的固定观察语言在普通物体/场景环境里没有建立所需的 coordDelta Vec 域。结果是本来已有输入坐标，却无法据目标坐标推导位移规格。

**最小修改：让二元算子的两种条件化方向都可用。** 若目标为 t、已观察左参数 a，则对每个训练环境求 `v = t - a`，形成 Vec 子任务；它随后可由已有 coordDelta 等算子继续合成。若已观察右参数 v，则保留原来的 `a = t - v` 路径。对 subtract、vecAdd 等同样按各自语义处理，不能把非交换算子简单交换参数。

每次分解必须保留跨样例关联、验证算子回代，并最终做完整 Grid exact verification。它是单算子的通用逆语义，不是 Translate 专用 witness。

### 4.2 将缺少观察项变成待处理需求

后续引入小型、按需求触发的 typed bottom-up closure：

```text
Need(type, examples, environment)
    → 先使用已有观察项和逆推
    → 缺少条件化参数时登记 suspended demand
    → 按类型/成本扩展少量普通 Base 表达式
    → 执行得到 denotation，并保留必要结构代表
    → 仅唤醒依赖新增类型/值的 demands
```

先支持 Coord/Vec/Int 及简单对象观察；不一次做全类型 Cartesian closure。新增前向工作、求值、重试都计入统一预算。缓存要包含观察域或字典的版本，避免第一次空域得到的失败结果阻断后续唤醒；没有增长的循环不得持续重启。

[Learn.hs](../src/Synthesis/InducedR2/Learn.hs) 还存在两项需独立审计的限制：

- `forwardGround` 等条件会在匹配到观察项后关闭进一步分解。它是有限搜索策略，不是更长关系表达式不可能更泛化的证明。保留已有解，但将关系替代式放入低优先级、受预算限制的待展开队列。
- 后续 rounds 使用首轮激活的 supported Base 集合。这可以提速，但要给新需求保留探索原 Base 的受控通道；“首轮没用到”不能变成永久不支持。

第一轮不要同时改所有限制。先验证双向 witness 的独立作用，再逐个打开 closure、terminal reopening 和 support fallback。

### 4.3 第一项实验的判定

对照组：R2 原版、Place 原版、Place + 双向 witness、Place + 双向 witness + demand closure；全部共享原数据、总预算与 exact verifier。

旧压力题 A/B/I 用作开发回归；另预先冻结位置、物体数量、尺寸和组合深度变化的生成任务。预期应看到 Vec 子规格被建立、相应 Base 组合进入真实 frontier。不能以手工参考 AST 注入后能执行作为搜索成功。

建议的第一阶段门槛：原 17 个 regression 中已有的 16 个成功任务保持；Place 的 A/I 恢复训练与留出正确作为机制目标；B/F 单独审计，不承诺只改 witness 就能恢复。若未恢复，记录第一个缺失 child demand，而不是直接再扩大预算。

## 5. 第二优先级：让抽象帮助尚未完成的求解

当前 [Learn.hs](../src/Synthesis/InducedR2/Learn.hs) 的发现输入是 `take 32 valid`，即已通过完整训练验证的根程序；[Abstraction.hs](../src/Synthesis/InducedR1/Abstraction.hs) 再从其中挖子树、anti-unification 和 lifting，要求重复出现与正 portfolio MDL saving。反馈主要作用于可达的非根函数子任务。

这形成一个启动障碍：完整程序尚未搜到时，关键重复子计算可能已经局部求解成功，却不能进入该根程序驱动的发现流程。并且前 32 个语法相近程序中的高频，不等于多个独立任务中的可迁移性。

建议增加 **Subproblem Evidence Store**：保存已经满足各自完整局部规格的表达式、类型、环境、denotation、结构依赖和成本。对这些可信片段做 AU/lifting，使任务内抽象能够早于完整根解产生。

实施边界：

- 通过一个已明确的局部规格，才成为 verified fragment；仅匹配部分训练样例的猜测进入 proposal 区，不当作已验证库函数。
- 部分 witness 诱导的局部规格也是一个假设，局部正确不意味着整题正确。宏只能增加候选，最终照常通过根级 exact verifier。
- 按子任务、依赖结构与上下文采样，降低近重复 aliases 对重复次数和 MDL 的主导。
- 反馈覆盖有用的非函数值子任务，或将其显式提升成可调用函数；不能假定当前只处理 ArrowT 的路径已经支持所有片段。

抽象接受分两步：先检查类型、作用域、定义展开与描述成本；再在独立的同任务后续 demands 上测实际收益。建议比较“仅压缩”“允许调用”“调用 + 由定义组合推导需求”三种模式。若宏仍需把全部原始参数组合重搜一次，压缩很漂亮也可能不省搜索。

可采用实验性效用函数：

```text
utility(a) = corpus_compression_gain(a)
           + λ × saved_work_on_separate_demands(a)
           - μ × added_branching_and_lookup_cost(a)
```

这是工程启发式，不是已校准的概率模型；λ、μ 应在开发集固定。发现成本、失败候选、字典检索成本都要算入总成本，独立 demands 不得来自最终留出标签。

若小规模 AU 已足够，不必立即接入 Stitch；当语料与候选挖掘成为瓶颈时，再借鉴或集成其高效压缩方法。

## 6. 第三优先级：扩大对象表示，而不只扩大坐标语法

当前 [Encode.hs](../src/Latent/Encode.hs) 默认背景 0、4 连通、同色连通分量。它可以无损保留网格信息，但无损不代表能给当前 correspondence/witness 路径提供正确的对象划分。

第一版多表示不需要学习式视觉模型。建议固定一个小型候选菜单：

1. 现有单色 4/8 连通视图。
2. 从输入观察到的颜色中提出背景候选，保留原默认视图；同一任务使用一致的背景选择规则，不能按样例任意猜答案。
3. 非背景的多色连通物体视图，保留各像素的真实颜色。
4. 若失败审计支持，再加入同色分离部件的分组或整体网格视图。

将 representation specification 连同程序一起搜索；同一表示规则跨训练与测试使用。跨视图用原始 rendered Grid 比较正确性，内部对象 ID 或排序不能当作语义相同的依据。

跨视图选择时计入 `L(representation) + L(program | representation)`，防止无代价选择特殊分割。先交错分配预算给少数视图，用训练中间结果调度；只保留最早看起来有希望的一个视图会重现过早丢失假设的问题。

这一阶段与固定 Base 的 R2 研究轴应分开记录：改变 encoder/specification 会改变 operational hypothesis space，即使 kernel primitive 没变。若需要新的 split/union/cell constructors，应作为单独的语义扩展实验，不混入 witness-only 对照。

## 7. 排序、反事实与跨任务学习放在什么位置

### 7.1 先把反事实用于辨别假设，不凭空生成答案

[Counterfactual.hs](../src/Synthesis/InducedR2/Counterfactual.hs) 目前只做后置 input-only audit，这个界限是合理的。两个训练一致程序在新输入上不一致，说明它们仍可区分；这本身不说明谁正确。

可以用 probes 引导进一步搜索、保留行为不同的候选，或在交互场景请求标注。但真实 ARC 静态测试没有新标签，不能把 MDL 最短程序的预测当作反例真值，再删除竞争规则。

有已知生成规则时，可以可靠地产生更强的有标签审计样本。不要把任意旋转、平移、颜色置换都视为同一任务的等变性：指定输出红色的任务可能不允许颜色置换；靠左对齐的任务可能不对全局平移等变。对整个任务做可逆变换，通常得到的是共轭后的新规则，而不是证明原规则本身不变。

### 7.2 真正的留一示例验证需要重新合成

若以后加入 leave-one-example-out，应对每一折仅用其余训练对重新建立表示、观察域、字典及搜索，再检查被隐藏的训练输出。把已经使用全部训练标签得到的程序拿去检查某一训练样例，不能提供独立验证。

LOO 更适合比较搜索/排序策略，不能直接把不同折的分数当作所有 full-data 候选的独立泛化分。ARC 示范很少，折间歧义可能很大，应作为辅助证据，并记录额外算力。

最终可以比较按测试预测分组的代表选择，但投票必须防止大量语法 aliases 重复计票。没有校准的 MDL 权重和截断 portfolio，不宜宣称 Bayesian posterior confidence。候选覆盖先提升，排序实验才有更大空间。

### 7.3 跨任务库是第二阶段，不是第一补丁

前两阶段有效后，再做小型跨任务库：收集开发任务中可靠的可展开定义，使用按任务归一化的多候选语料学习；冻结库后求解全新规则组合。保留纯 task-local 基线。

验收要看新任务的 solve rate、time-to-first-solution 与总成本，不看库大小。宏的定义、依赖、参数、调用成本都要计；库学习和外部数据成本单独披露。

如果允许引入模型，优先从轻量搜索排序或少量 typed AST 提案开始，参考 BUSTLE、SOAR、Narcissus。建议给无模型的基础搜索保留预算份额。模型输出经类型检查并展开到可信 Base，再使用原 verifier；错误提案只应影响探索顺序，不能成为删除其他规则的证明。固定预算下仍可能错过解，必须实测。

## 8. 评测协议：把下一次实验变成可证伪的研究

### 数据分层

- **现有 core/regression/stress/30 diagnostics**：全部作为开发和兼容性数据，继续保存，不能重新命名成未见测试。
- **生成器稳健性集**：针对已知规则改变 nuisance variables，包括尺寸、位置、颜色角色、对象数、干扰物、顺序及组合深度。输入必须满足该规则的前提条件。
- **组合留出集**：学习部分原语及组合，在未见组合树/依赖方式上测试。先按规则族或程序骨架划分，再生成样例；不能只随机分 seed。
- **新真实任务集**：从尚未用于项目开发的数据中预先冻结，记录任务 ID、哈希、预算、代码版本及是否被外部训练语料覆盖；开发时不看其输出。若使用 LLM，其预训练接触状况可能未知，应明确这一限制。

RE-ARC/ARC-GEN 可以提供样例，不应根据隐藏测试题身份调用对应 solver/generator 给合成器送标签。新 seed 只支持同规则实例泛化的结论。用于评分的生成器也需独立检查，避免生成逻辑与被测程序共享同一错误。

### 必需指标

| 指标 | 用途 |
|---|---|
| 训练 exact 与留出任务级 exact | 保持与旧协议兼容，多测试输入的任务要求全部正确 |
| oracle-in-portfolio 与 selected exact | 区分覆盖失败和选择失败；oracle 只在预测冻结后审计 |
| 生成器 OOD 全网格正确率，按变化轴分组 | 识别颜色捷径、固定尺寸、固定对象数等过拟合 |
| time/work to first exact 与总开销 | 区分首解更快、候选更多、完整会话更贵 |
| typed demand 建立/阻塞/唤醒次数 | 证实新机制确实打通需求传播 |
| verified fragment 数、实际 invention hits、独立需求净节省 | 检查抽象是否被用到且有帮助 |
| 超时、内存、失败状态未知项 | 防止把缺失数据写成零 |

同时报告固定 work budget 和固定 wall-clock deadline 下的结果，因为不同版本的“一个 work unit”不一定代表相同计算成本。并发负载需固定；随机机制使用多个种子。置信区间按任务/规则族重采样，不把同一题生成的许多相近输入当作独立任务扩大样本量。

### 消融顺序

```text
B0  原 R2 / 原 Place（各自基线）
B1  Place + 双向条件 witness
B2  B1 + 按需求前向域扩展
B3  B2 + 受控 terminal/support reopening
B4  B3 + verified-subproblem abstraction
B5  B4 + 小型多表示搜索
B6  B5 + 跨任务库或学习式调度（独立研究轴）
```

前后相邻对照用于定位贡献；B4 还应增加 NoAbstraction 与 CompressionOnly，B5 增加固定单视图与多视图但相同总预算。最终如需声称“协同增益”，再做关键机制的交叉消融，而不是把整条升级链的提高全归因于抽象。

## 9. 建议的执行顺序与代码落点

以下是熟悉代码的一名开发者的粗略工作量，不是完成承诺；大矩阵计算时间另计。

| 阶段 | 预计工作量 | 交付与停止条件 |
|---|---|---|
| 证据与协议 | 1–2 天 | 固定旧基线；新增需求阻塞原因和真值隔离的 portfolio audit；冻结生成器划分 |
| 双向 witness | 2–3 天 | coord/vector inverse soundness 与 Place 回归；若没有改善，先定位具体 child demand |
| 需求 closure/reopening | 3–5 天 | 有界增量观察域、唤醒和版本化缓存；覆盖提升与开销分开报告 |
| 局部抽象反馈 | 3–5 天 | verified fragment store；独立后续需求上的净收益；没有收益则暂停扩库 |
| 多表示原型 | 3–5 天 | 少量通用视图、共同 Grid verifier、真实任务冻结评测 |
| 跨任务/模型路线 | 后续里程碑 | 只有前述瓶颈有明确改善后再投入，单独标记数据和模型预算 |

最先修改的既有模块：

- `experiments/place-only/src/Synthesis/InducedR2/Witness.hs`：双向 coordinate inverse 与回代检查。
- `src/Synthesis/InducedR2/Observers.hs`、`Learn.hs`：按需 typed closure、挂起与唤醒、可重开 terminal、缓存版本。
- `src/Synthesis/InducedR1/Abstraction.hs` 的新版本副本/新模块：局部证据的 AU/lifting 和效用评估，避免破坏旧 R1 重现路径。
- `src/Synthesis/InducedR2/VersionSpace.hs`：保留上下文、结构代表及提案/验证证据的区别。
- `src/Latent/Encode.hs` 的新表示入口：多视图 codec 与统一输出验证。
- `scripts/run_v03r2.py` 的新 runner：新指标与消融，新目录保存结果，不覆盖旧冻结记录。

可新增 `DemandAgenda`、`SubproblemEvidence`、`RepresentationSearch` 三个明确边界的模块，但具体命名不重要。应先把纯符号机制跑通，再决定是否需要额外依赖。

**若只做一个下一步实验，选择 Place + 双向 witness，并建立“训练需求 → 中间表达式 → 完整候选 → 留出预测”的可追踪证据。** 它改动小、已有明确反例、可在不新增领域 primitive 的前提下检验核心假设。成功后再扩展到需求驱动合成与局部抽象，失败也能定位下一处真实瓶颈。
