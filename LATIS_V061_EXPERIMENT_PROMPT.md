# LATIS v0.6.1 实验提示词：Safe Online Abstraction & Robustness Audit

请在现有 **LATIS v0.6** 代码上实现 **v0.6.1**。首先阅读 `docs/LATIS_V06.md`、`LATIS_V06_REPORT.md`、`LATIS_v06_experiment_prompt.md`，然后核对实际 Haskell 代码和 `results/v06` 原始 JSON/CSV；**报告不是实现正确性的替代证据**。保留 v0.6、v0.5、v0.4 和 R2 fallback 的既有入口及行为，新增独立 v0.6.1 实验入口与报告。不要重写前端或做不必要的架构迁移。

## 0. 本阶段研究目标

v0.6 已在 7 个任务上实现 Full heldout 7/7；03560426 train/heldout exact、fallback=0。`F-repeated-pattern` 中 Full `search_work=2537`，NoOnlineAbstraction `3078`；03560426 分别为 `2565` 和 `3050`。但存在两项尚未解决的问题：

1. `NoCounterfactual` 在 E 上同样成功：目前验证了 **hypothesis diversity + intensional prior** 的作用，尚未验证 **counterfactual generator 自身** 对最终求解的独立贡献。
2. `SequentialScalar` 在线复用后，部分 slot 只保留 `Call(I_k)`，跳过其他 scalar representatives；目前节省搜索的机制可能造成 **premature hypothesis collapse / loss of bounded search completeness**。

本轮聚焦：**保留假设多样性前提下的在线复用、不可识别歧义的正确评估、自动生成的稳健性测试**。不以扩大 benchmark 或优化运行速度为主要目标。

## 1. Safe Online Abstraction：复用不等于删去候选（最高优先级）

重构 v0.6 的 `SequentialScalar` / `RankCorrespondence` 在线复用逻辑，将：

```
accept I_k -> Call(I_k) replaces all alternatives
```

改为：

```
accept I_k -> Call(I_k) is a preferred candidate
           -> compatible original representatives remain recoverable
           -> on failure / contradiction / exhausted preferred branch,
              explicitly resume residual candidates
```

要求：

- `Call(I_k)` 必须通过与原始候选相同的 type、dependent-size、alignment witness、dependency、ontology slice、contract 和 realization legality 检查；不得因抽象而绕过验证。
- **搜索状态需显式保存 deferred alternatives**：可用延迟生成器、continuation、版本空间或可恢复的候选 frontier；不要为保多样性而在每次 reuse 时立即全量展开。
- 保存候选 provenance、原始语法枚举范围、已访问/未访问状态、promotion step、调用与恢复事件；抽象展开仅限既有合法 refinement trigger。
- 抽象复用 **只改变搜索优先级/表示，不改变可达的候选语义集合**。若使用剪枝，必须有可审计的 soundness certificate；没有证明的剪枝只能延迟，不能删除。
- 不能把 `Call(I_k)` 与仅在训练集 denotation 一致的其他结构不同表达式视为无条件语义等价；需沿用 v0.6 的 structural/intensional/counterfactual signature 约束。
- `RankCorrespondence` 的 reuse 也要检查是否造成不可恢复的合法 key pair / alignment witness 丢失；不能只修 `SequentialScalar`。
- 不强求全任务无限搜索完备性；只要求 **在相同有限 grammar、同一合法性规则、足够预算下**，SafeOnline 可枚举/恢复 NoOnlineAbstraction 所有有效候选（按语义规范化去重）。明确报告任何其他刻意限制。

建议保留一个 `ExclusiveReuseLegacy` 消融，对照 v0.6 原始“仅保留 Call”策略；默认模式改为 `SafeOnline`。不要静默修改 v0.6 的历史结果。

## 2. 构造反例，证明恢复机制真的被调用

新增至少两类 **在线抽象误导（abstraction-misleading）** 任务：

- **局部模式偶合**：一个较早 slot/branch 促成合法 `I_k`，后续 slot 的 `Call(I_k)` 对部分 training cases 或最终 residual/realization 失败，而原始 scalar grammar 中存在正确的非 Call 候选；SafeOnline 必须恢复该候选并解出，`ExclusiveReuseLegacy` 应出现漏解、失败或可审计的候选集缺失。
- **合法但非唯一的 reuse**：`Call(I_k)` 与其他表达式在训练 denotation 一致、结构或合法 counterfactual 行为不同；必须保留多个 representatives，并允许在后续约束出现时重新选择。

请确保反例不会通过 task ID、solution hardcode、特定颜色常量捷径或 heldout 输出监督来解决。记录：`reuse_attempts`、`reuse_hits`、`deferred_candidates`、`resumed_candidates`、`recovered_solutions`、`exclusive_reuse_missed_solutions`，并提供具体推导路径。

## 3. Paired Ambiguity：区分不可识别性、prior 与 counterfactual

实现成对任务生成器：两个 task **训练输入与训练输出完全相同**，但真实规则不同，例如 `GridLeft` 与 `CurrentX`；在训练输入首项 x=0 时观测等价，在合法 heldout 首项 x>0 时产生不同输出。

严格区分三件事：

1. **Identifiability**：训练信息是否足以唯一选出正确规则？对上述 paired task，答案应标记为 `non_identifiable_from_train`，不得声称确定性 solver 应同时解对两套 heldout。
2. **Diversity**：两条有效假设是否都存活于 candidate class / deferred frontier？记录其训练 denotation、结构、counterfactual signature、cost/rank 与最终状态。
3. **Selection prior**：系统实际选了哪条，哪些 cost components 导致选择？`NoCounterfactual` / `NoIntensionalityPrior` / `CollapseByTrainingDenotation` 的差别分别是什么？

Counterfactual **只用于诊断或保留不同假设，绝不提供目标输出**；不能用 heldout output 反向调参、选程序或决定是否恢复。增加 `counterfactual_distinguished_pairs`、`hypothesis_survival_recall`、`oracle_in_candidate_set`（仅离线评估，可在生成器已知规则时计算）及 `selected_program_accuracy`。在报告中明确：如果 NoCounterfactual 与 Full 在准确率上无差异，不能宣称 counterfactual 提升了准确率。

## 4. 自动生成稳健性 / Metamorphic 测试

围绕 A–F 及 03560426 的 **机制类型** 生成多实例、可复现的任务族，不要只复制固定案例。建议每类至少 20 个有效实例，记录 seeds、生成分布、有效率和拒绝原因；若某类难以生成则明确报告实际数量，不要以非法样本凑数。

应覆盖：对象数、尺寸签名、位置、画布尺寸、颜色重命名、同分 key、对象枚举重排、训练偶合程度、无关对象插入、合法平移，以及多个候选 key 的 cost 顺序变化。

重点验证：

- **Permutation invariance**：无 ID 的 Set 不能因 encoder enumeration 改变而变更求解语义。
- **Alignment equivariance**：合法整体平移等不改变对应规则的变换，应保持 correspondence；不要错误假设旋转后 `ExtentY` 必然不变。
- **Size-index legality**：不同 `SizeSig` 不得发生非法 object-level equality；多态 observer 仍可合法跨 index。
- **Ordering provenance**：tie 必须拒绝或显式 `Lex` refinement；不允许 runtime index、hash、ID 偷偷破同分。
- **Abstraction robustness**：不同 seed/对象数下，SafeOnline 不应比 NoOnline 丢失可行解。

采用训练、验证、留出生成种子分离；不得按 heldout 结果改规则或调参。至少报告按任务族汇总的 exact solve、fallback、误选解释、搜索工作量和失败案例，并保存每个实例的重放信息。

## 5. 消融与公平评估

至少比较：`SafeOnline`、`ExclusiveReuseLegacy`、`NoOnlineAbstraction`、`PostHocOnly`、`NoCounterfactual`、`NoIntensionalityPrior`、`CollapseByTrainingDenotation`。必要时保留 `FixedAlignmentKeys`、`NoDependentIndex` 用于对应任务族。

- 对所有模式使用**相同**的 grammar bounds、case sets、合法性检查与资源预算；指出语法可见性或候选次序差异。
- 不只统计 `search_work`：分别报告 `operator_applications`、`refinement_expansions`、`call_attempts`、`deferred/resumed`、`first_solution_work`、`total_work_to_exhaustion`（有界时）、wall-clock（多次重复并报告中位数）、内存峰值。
- 明确区分 **actual savings**、**deferred work** 和 **never explored due to early success**；不允许把尚未展开的候选全部计为永久节省。
- 对照 v0.6 的 F / 03560426 数据，判断 SafeOnline 是否仍获得显著 first-solution 节省；若完整枚举代价上升，必须真实披露。
- 对所有非 identifiable paired tasks，报告 candidate-set coverage，不把单一 heldout 准确率当作唯一成功标准。

## 6. 回归不变量与交付

持续验证：

```
UntriggeredExpansionCount == 0
expanded_frozen_features == 0
ConcreteCrossItemEdgeCount_high_level == 0
```

保留 `Set[T]` 无下标、`OrderedView` 携带 provenance、object equality 先统一 size index、cross-origin comparison 必须有解释、matched feature 不扩张；禁止新增 task-specific `Attach` / `At` / `Chain` 或以 runtime object ID 偷渡关系。03560426 必须仍然 train/heldout exact，`fallback_count=0`；保留旧 v0.6 入口与回归测试。

交付：

1. 可运行的 Haskell 源码、自动化测试、固定 seeds 的任务生成器和一键实验脚本；不要只写概念说明。
2. `docs/LATIS_V061.md`：新增/改动模块、SafeOnline 搜索语义、恢复条件、命令、限制。
3. `LATIS_V061_REPORT.md`：原始统计、消融、失败路径、paired ambiguity 分析、被证实与未被证实的研究结论。
4. `results/v061/`：`metrics.csv`、每任务 `solution.json`、`derivation_graph.json`、候选保存/恢复审计、随机种子与重放说明。
5. 通过既有五组回归测试，以及新加入的候选完备性、误导复用、反事实、排序/类型与 metamorphic property tests。

**验收最重要的不是 Full 解出更多固定题，而是同时证明：**

\[
\boxed{\text{Online abstraction accelerates first-solution search}}
\]

且在既定有界搜索空间内：

\[
\boxed{\text{Online abstraction does not silently erase valid hypotheses}}
\]

如果这两条无法同时成立，请给出最小反例、精确原因与量化 trade-off，不要通过放宽合法性或使用 heldout oracle 掩盖失败。本轮不要引入神经网络、全局 library learning、大规模 ARC benchmark 或任意形状生成。
