# LATIS v0.6 实验提示词：Counterfactual-Preserving Online Abstraction

请在现有 **LATIS v0.5 / Dependent Collection + Explained Alignment** 基础上实现下一阶段实验。

不要重写已有 v0.4、v0.5 或 R2 fallback；新机制应作为现有 collection front-end 的增量升级。

本轮的核心目标不是继续扩展 benchmark，而是验证三件事：

1. **Counterfactual-preserving abstraction**：有限训练样本上等价的候选，不应过早坍缩为单一解释；
2. **Synthesized alignment views**：alignment key 不再局限于固定手写 ontology key，而应在 visibility/trigger 控制下被合成；
3. **Online semantic abstraction**：语义内聚 abstraction 必须在搜索过程中产生并回馈搜索，而不只是最终解之后封装。

继续保持：

\[
\boxed{\text{Trigger before Expansion}}
\]

\[
\boxed{\text{No alignment without an explanation}}
\]

\[
\boxed{\text{Matched features stop expanding}}
\]

以及：

\[
\boxed{\text{No concrete cross-item edge at high abstraction levels}}
\]

---

## 1. 保留现有集合与 dependent-index 表示

继续使用：

\[
F_0=
Set\left[
\sum_{\sigma:SizeSig}Placed[\sigma]
\right]
\]

其中：

\[
Placed[\sigma]=Object[\sigma]\times Pos.
\]

保留现有规则：

- `Set[T]` 无下标；
- 禁止无语义 `Set -> List`；
- 只有带 ordering provenance 的 `OrderedView` 可以 rank/index；
- object-level equality 必须满足 size-index legality；
- polymorphic observer 可以跨 size index；
- `Count : Set[T] -> Nat` 继续作为普通 feature；
- matched/frozen feature 不再进入普通 expansion frontier。

不要削弱 v0.5 已有 legality invariant。

---

## 2. Counterfactual-Preserving Feature Classes

当前训练数据中，多个 symbolic expressions 可能拥有完全相同 denotation。

例如：

\[
(CurrentX,CurrentX)
\]

\[
(0,0)
\]

\[
GridTL
\]

在现有案例上可能完全相等。

不得仅因为：

\[
Denotation_D(e_1)=Denotation_D(e_2)
\]

就把这些表达式坍缩为同一个唯一 representative。

定义 semantic class：

\[
C=(T,\vec v)
\]

但类内必须保存多个 structural/intensional representatives：

```text
type
training_denotation
expression
dependency_signature
ontology_provenance
intensionality_class
groundedness
cost
counterfactual_signature
```

要求至少区分：

- literal-derived；
- scene-ref-derived；
- object-observer-derived；
- collection-derived；
- alignment-derived；
- invented-abstraction-derived。

不得因为 training denotation 一样而删除结构不同的代表。

---

## 3. Counterfactual Context Generation

对于同一 semantic class 内的多个 representatives：

\[
e_1,\ldots,e_k
\]

如果它们在训练数据上等价，则尝试生成**合法 counterfactual contexts** 来判断它们是否具有不同语义行为。

Counterfactual 不提供目标输出，只用于区分候选，不得作为 supervised oracle。

允许的第一版 counterfactual 操作至少包括：

### 3.1 Scene translation

对整个输入场景做合法平移：

\[
TranslateScene(S,\Delta)
\]

保持：

- object geometry；
- color；
- relative arrangement；
- canvas legality。

用于区分：

```text
GridTL
(CurrentX, CurrentX)
Literal(0,0)
```

等候选。

### 3.2 Canvas resize / padding

在不改变对象本身的条件下扩大 canvas 或改变合法边界，使：

```text
GridBR
Literal coordinate
object-derived coordinate
```

产生不同结果。

### 3.3 Object permutation

仅重命名 / 重排 concrete object identity，不改变 scene semantics。

任何合法高层 Ref/Concept/Alignment 应保持相应 equivariance/invariance。

### 3.4 Irrelevant object insertion

在不违反 task-local ontology precondition 的情况下，加入一个与当前 explanation 无关的对象，用于检测：

- selector 是否真正依赖 semantic property；
- runtime ordering / accidental rank 是否被错误使用。

所有 counterfactual generator 必须保存：

```text
source_case
transformation
legality_proof
preserved_properties
changed_properties
```

---

## 4. Counterfactual Signature

对 representative \(e\) 定义：

\[
CF(e)=
[
e(C_1^*),\ldots,e(C_m^*)
].
\]

只有当：

\[
CF(e_1)=CF(e_2)
\]

且 structural/intensional signatures 也允许合并时，才可以进一步 canonicalize。

否则：

\[
\boxed{
\text{keep both representatives alive}
}
\]

Counterfactual 只能证明候选“不同”，不能自动判断哪个候选是真正正确的。

因此不得：

```text
counterfactual disagreement -> delete one candidate
```

只能：

```text
counterfactual disagreement -> preserve diversity
```

---

## 5. Intensionality Prior

在多个 training-exact candidates 中加入一般化的 intensional ranking prior。

不要硬编码某个 ARC 任务的答案。

优先级原则：

\[
\boxed{
\text{stable intensional reference}
>
\text{context-dependent accidental expression}
>
\text{unexplained literal}
}
\]

例如在成本接近时：

```text
GridTL
```

应优先于：

```text
(CurrentX, CurrentX)
```

若后者只是因为所有训练样本中 `CurrentX = 0` 才成立。

建议将 ranking 写为：

\[
Cost(e)=
L(e)
+\lambda_1 LiteralPenalty
+\lambda_2 AccidentalDependencyPenalty
-\lambda_3 IntensionalReferenceBonus.
\]

`IntensionalReferenceBonus` 不能依赖手写任务 ID，只能来自通用属性，例如：

- canonical scene referent；
- object-ID invariance；
- cross-case stability；
- low free-variable count；
- small ontology boundary；
- counterfactual stability。

保存所有 cost components，方便审计。

---

## 6. Synthesized Alignment Key

v0.5 的 alignment ontology 使用固定：

```text
X
Y
Area
Color
Lex(X,Y)
Lex(Y,X)
```

本轮保留它们作为 seed vocabulary，但不再把 alignment key 限死为固定集合。

定义：

\[
KeyExpr[T,K]
\]

作为可以通过 ML / ontology feature synthesis 得到的 intensional expression。

例如候选可包括：

\[
x(Anchor(o,TL))
\]

\[
y(Anchor(o,BR))
\]

\[
Area(o)
\]

\[
Color(o)
\]

\[
(x(o),y(o))
\]

以及从已 visible feature 中 composition 得到的 key。

---

## 7. Key synthesis 必须受 visibility 控制

只有出现：

```text
NeedOrderedView[T]
NeedCrossItemAlignment[T]
NeedUniqueRef[T]
AlignmentFailure
```

等 trigger 时，才允许进入 key synthesis。

不得全局枚举无限 key expression。

使用：

\[
VisibleKeyGrammar(Q,\Gamma)
\]

约束候选。

至少考虑：

- 当前 unmatched feature type；
- 当前 ontology slice；
- 已使用 observer；
- residual effect；
- key expression depth；
- key cost；
- tie behavior。

---

## 8. Key legality

一个 key candidate 必须：

1. 对所有 training cases 使用同一 symbolic expression；
2. 在每个参与 alignment 的 Set 上产生严格可解释 ordering；
3. 若出现 tie，不允许偷偷使用：
   - object ID；
   - runtime enumeration order；
   - hash order；
   - undocumented fallback field；
4. 若 tie 无法通过另一个**显式语义 key**继续 refinement，则该 ordering candidate 失败。

允许显式 lexicographic refinement：

\[
Lex(k_1,k_2)
\]

但 `k_2` 本身也必须是 visible / synthesized semantic key。

---

## 9. Alignment 仍然必须是 explanation

继续要求：

\[
\boxed{
\text{same type is not enough}
}
\]

任何 cross-origin comparison 都必须经由：

```text
AlignmentWitness
```

或 canonical same-role witness。

RankAlign 仍可使用：

\[
RankAlign:
OrderedView[A,k_1,n]
\times
OrderedView[B,k_2,n]
\to
Alignment[A,B,n].
\]

但 ordering key 现在可以来自 key synthesis。

AlignmentLift 继续要求跨全部 training cases 复现 correspondence。

---

## 10. Online Semantic Abstraction

v0.5 的 `I_0` 主要是在成功 derivation 已经形成后再封装。

本轮必须实现**在线 abstraction**。

在 feature saturation / alignment / transform 搜索过程中，对 partial derivation graph 持续检查 repeated semantic-cohesive subgraphs。

候选 subgraph \(H\) 至少满足：

1. connected；
2. internal dependencies 完整；
3. 中间节点主要只在 \(H\) 内部使用；
4. 对外 interface 小；
5. 跨 training cases 使用相同 symbolic pattern；
6. 已通过局部 witness / legality；
7. 不包含 high-level concrete ID capture。

---

## 11. Online abstraction candidate

当发现重复 subgraph：

\[
H_1,H_2,\ldots,H_m
\]

满足 typed / relational anti-unification 后，生成匿名 abstraction：

\[
I_k
\]

其 metadata 至少包含：

```text
contract
input_types
output_type
free_abstract_parameters
hidden_refinement_graph
dependencies
ontology_slice
witness
provenance
definition_cost
call_cost
```

其自由参数只能来自：

\[
Constant
\cup Ref
\cup Concept
\cup Alignment
\cup already\ accepted\ Abstraction.
\]

不得暴露 concrete object ID 或 case-specific coordinate。

---

## 12. Abstraction 必须立即回馈搜索

一旦 \(I_k\) 被接受：

\[
I_k\in VisibleOps
\]

后续相同或兼容 subgoal 必须优先尝试：

\[
Call(I_k)
\]

而不是重新展开其完整 refinement。

即：

\[
\boxed{
\text{discover abstraction}
\rightarrow
\text{promote}
\rightarrow
\text{reuse during the same synthesis run}
}
\]

这与 v0.5 的 post-hoc wrapping 是本轮最关键的差异。

---

## 13. Promotion utility

不要只依据 AST compression。

定义：

\[
Utility(I)=
\alpha CompressionGain
+\beta SearchReductionEstimate
+\gamma ReuseCount
+\delta DecouplingGain
+\eta SemanticCohesion
-\mu InterfaceCost.
\]

第一版允许简单 deterministic heuristic，但必须输出所有 component。

尤其记录：

```text
occurrence_count
nodes_hidden
boundary_size
estimated_reexpansion_saved
actual_reuse_count
```

只有达到 threshold 才在线 promotion。

---

## 14. Restricted refinement

高层只看到：

```text
Call(I_k)
```

以及 contract/interface。

不得在高层同时看到其内部：

```text
sort
rank
compare
scalar-expression
...
```

只有在：

```text
RefinementTrigger
NoRealization
DebugAudit
```

等合法原因下才展开 hidden refinement。

继续贯彻：

\[
\boxed{
\text{high-level abstraction must not leak implementation decomposition}
}
\]

---

## 15. Dependent-index 机制反例

v0.5 的 `NoDependentIndex` 没有造成最终准确率差异。

本轮必须加入至少一个专门机制任务，使：

- 两个不同 `SizeSig` 的 object 在训练样本中通过某些 observer 产生 accidental equality；
- 如果取消 size-index guard，会形成一个 object-level 非法 correspondence 或错误 abstraction；
- heldout 中该错误必须暴露；
- Full 必须拒绝该路径。

用于真正验证：

\[
Object[\sigma_1]
\not\equiv
Object[\sigma_2]
\quad(\sigma_1\neq\sigma_2)
\]

的 inductive value，而不只是 type checker legality。

---

## 16. Counterfactual 机制任务

新增一组明确区分：

```text
GridTL
Literal(0,0)
(CurrentX,CurrentX)
```

的 synthetic task。

Training 中三者 deliberately observationally equivalent。

构造合法 heldout / counterfactual scene，使其 diverge。

要求：

- semantic class 保留多个 representatives；
- counterfactual signature 检测 divergence；
- Full 不得在 training 阶段错误 collapse；
- 最终 ranking / heldout 结果可审计。

重点不是证明 counterfactual 自动找到真解，而是证明：

\[
\boxed{
\text{counterfactual preserves necessary hypothesis diversity}
}
\]

---

## 17. Synthesized-key 机制任务

新增至少三类：

### A. Seed-key 可解

正确 alignment 使用现有 `X` / `Y`。

### B. Composite-key 必需

单独 X/Y/Area 都产生 tie，只有：

\[
Lex(X,Y)
\]

或其他 synthesized semantic key 才能成功。

### C. Runtime-order trap

runtime index 在 training 上可拟合，但 heldout 失败；semantic synthesized key 应泛化。

---

## 18. Online abstraction 机制任务

构造一个任务，使同一个 semantic-cohesive transform pattern 在同一 solve run 中至少出现多次。

要求比较：

```text
Full
NoOnlineAbstraction
PostHocOnly
```

并记录：

\[
SearchWork
\]

\[
operator\ expansions
\]

\[
refinement\ expansions
\]

\[
abstraction\ reuse\ count.
\]

只有 Full 允许在首次发现 \(I_k\) 后立即用于后续 branch。

---

## 19. 03560426 再次作为 vertical test

继续要求：

- train exact；
- heldout exact；
- fallback_count=0；
- 不手写 Attach / At / Chain；
- 不按 ID 或 runtime Set index 对齐。

重点新增审计：

### 19.1 First-item ambiguity

明确记录所有训练等价的首项候选，例如：

```text
GridTL
Literal(0,0)
(CurrentX,CurrentX)
...
```

并记录：

```text
training_signature
counterfactual_signature
ranking_components
selected_candidate
```

### 19.2 Alignment key

报告最终 ordering key：

- 是否 seed key；
- 是否 synthesized key；
- key derivation；
- tie legality。

### 19.3 Online abstraction

报告：

```text
discovery_step
promotion_step
first_reuse_step
reuse_count
saved_refinement_expansions
```

若 abstraction 未在线复用，不能宣称 search reduction。

---

## 20. Ablations

至少包括：

```text
Full
NoCounterfactual
CollapseByTrainingDenotation
NoIntensionalityPrior
FixedAlignmentKeys
NoAlignmentExplanation
NoOnlineAbstraction
PostHocOnly
NoDependentIndex
R2FallbackOnly
```

定义：

### NoCounterfactual
不生成 counterfactual signature，但仍保留其他 structural diversity。

### CollapseByTrainingDenotation
只要训练 denotation 相同就只保留最低 cost representative。

### NoIntensionalityPrior
去掉 scene-ref / abstract-ref preference。

### FixedAlignmentKeys
恢复 v0.5 固定六 key ontology，不允许 synthesis 新 key。

### NoOnlineAbstraction
完全关闭 relation/abstraction invention。

### PostHocOnly
允许最终封装 abstraction，但不能回馈当前搜索。

---

## 21. 关键指标

至少记录：

```text
semantic_classes
representatives_per_class
counterfactual_contexts_generated
counterfactual_splits
premature_collapses
intensional_candidates
literal_candidates
alignment_key_candidates
synthesized_keys_accepted
ordering_ties_rejected
alignment_witnesses
online_abstractions_proposed
online_abstractions_accepted
online_abstraction_reuses
refinement_expansions_saved
operator_applications
active_frontier_size
visibility_size
search_work
fallback_count
```

继续要求：

\[
UntriggeredExpansionCount=0
\]

\[
ConcreteCrossItemEdgeCount_{high-level}=0
\]

\[
expanded\_frozen\_features=0.
\]

---

## 22. 本轮核心研究问题

本轮必须明确回答：

### RQ1

\[
\boxed{
\text{有限训练案例下 denotation-equivalent 的候选，
是否必须通过 counterfactual/structural diversity 保持多个解释？}
}
\]

以及这种机制是否能避免明显的 premature abstraction collapse。

### RQ2

\[
\boxed{
\text{alignment view 的 key 是否可以由受限 intensional synthesis 自动发现，
而不是依赖固定手写 key vocabulary？}
}
\]

### RQ3

\[
\boxed{
\text{semantic-cohesive abstraction 在同一次搜索中在线 promotion 并复用，
是否真的减少搜索工作？}
}
\]

### RQ4

\[
\boxed{
\text{dependent size index 是否能在专门的反例中阻止错误 object correspondence，
并改善 heldout 行为或搜索合法性？}
}
\]

---

## 23. 不要做的事情

本轮不要优先：

- 加神经网络；
- 做跨任务 global library learning；
- 做大规模 ARC benchmark；
- 做并行优化；
- 扩张到任意 shape generation；
- 手工增加任务专用 `Attach` / `At` / `Chain`；
- 用 heldout output 参与 synthesis；
- 用 counterfactual output 作为 oracle。

首先把：

\[
\boxed{
\text{hypothesis diversity}
+
\text{intensional alignment synthesis}
+
\text{online abstraction feedback}
}
\]

做成一个闭环。

最终目标是让 LATIS 不只“找到一个训练上能解释的程序”，而是逐步形成：

\[
\boxed{
\text{grounded ontology}
\rightarrow
\text{explained views}
\rightarrow
\text{intensional relations}
\rightarrow
\text{online declarative abstraction}
\rightarrow
\text{restricted refinement}
}
\]

的真正层级合成过程。
