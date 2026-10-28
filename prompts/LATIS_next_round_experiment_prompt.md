# LATIS 下一轮实验：Dependent Collection + Explained Alignment

请在现有 **LATIS v0.4** 基础上实现下一轮实验。不要重写既有 solver，不修改 R2 fallback；本轮主要解决 v0.4 固定 semantic-role representation 无法处理 variable-cardinality object sets 的问题。

核心原则：

\[
\boxed{\text{No alignment without an explanation}}
\]

以及既有：

\[
\boxed{\text{Trigger before Expansion}}
\]

\[
\boxed{\text{Matched features stop expanding}}
\]

---

## 1. 将 F0 从固定角色向量改为无序集合

不要再假定不同 training cases 的第 \(i\) 个 object 可以直接对齐。

定义：

\[
F_0=
Set\left[
\sum_{\sigma:SizeSig}
Placed[\sigma]
\right]
\]

其中：

\[
Placed[\sigma]=Object[\sigma]\times Pos.
\]

`Object` 必须携带 size-dependent type index，例如：

```text
Object[width,height]
Placed[width,height]
```

不同 size index 的 object 不得直接进行 object-level equality/comparison。

但 polymorphic observers 可以作用于任意尺寸：

\[
Position:\forall\sigma.Placed[\sigma]\to Pos
\]

\[
Color:\forall\sigma.Object[\sigma]\to Color.
\]

不需要实现完整 dependent type theorem prover；可以用 indexed IR + unification constraints 完成。

---

## 2. Collection 必须保持 unordered semantics

`Set[T]` 不允许：

```text
set[i]
```

也不要提供没有语义的：

```text
toList : Set[T] -> List[T]
```

因为 runtime enumeration order 不能成为 synthesis semantics。

加入：

\[
Count:Set[T]\to Nat
\]

作为正常 feature。

---

## 3. 只有带语义的排序才能产生 ordered representation

加入：

\[
OrderBy:
Key[T,K]\to
(S:Set[T])
\to
OrderedView[T,K,Count(S)].
\]

例如：

```text
OrderBy(XCoord, objects)
OrderBy(YCoord, objects)
OrderBy(Area, objects)
```

其中 key 必须来自当前 visible ontology / intensional feature language，不得无限制枚举。

`OrderedView` 必须保存排序 provenance：

```text
source_set
ordering_expression
ordering_key
cardinality
trigger
derivation
```

只有 `OrderedView` 可以进行 rank/index 操作。

例如：

\[
index:
OrderedView[T,K,n]\times Fin(n)\to T.
\]

---

## 4. 修改 cross-item matching 规则

目前不能再因为：

\[
type(x)=type(y)
\]

就直接测试：

\[
x=y.
\]

所有来自不同 semantic origin 的 feature/object，如果要建立 comparison edge，必须先存在：

\[
AlignmentWitness(x,y).
\]

也就是：

\[
\boxed{
\text{Equality only validates an alignment; equality cannot justify an alignment.}
}
\]

Same-role canonical feature 可以直接比较。

其他 cross-item comparison 必须先 synthesis 出一个可跨所有 training cases 成立的 alignment explanation。

---

## 5. 第一版 alignment：Ordered Rank Alignment

至少实现：

\[
RankAlign:
OrderedView[A,k_1,n]
\times
OrderedView[B,k_2,n]
\to
Alignment[A,B,n].
\]

只有 cardinality 相容时才可得到 total rank alignment：

\[
Count(S_I)=Count(S_O).
\]

然后才允许：

\[
I_i\leftrightarrow O_i.
\]

例如：

```text
InputSet
 -> OrderBy(X)
 -> InputOrdered

OutputSet
 -> OrderBy(X)
 -> OutputOrdered

(InputOrdered, OutputOrdered)
 -> RankAlign
 -> [(I_1,O_1),...]
```

这整条 derivation 本身就是“为什么这两个项值得比较”的 explanation。

排序规则必须在所有 training cases 使用同一 symbolic expression；禁止每个 case 分别选择不同排序来拟合 correspondence。

---

## 6. Alignment lifting

如果系统从 concrete examples 发现一组 pairing：

\[
Pairs_1,\ldots,Pairs_N,
\]

不得直接把 concrete pairing 提升为高层 relation。

尝试 synthesis 一个共同 alignment expression \(A\)，使：

\[
A(S_I^{(e)},S_O^{(e)})=Pairs_e
\]

对所有 training examples 成立。

例如将 concrete pairings lift 成：

\[
RankAlign(
OrderBy(X,S_I),
OrderBy(X,S_O)
).
\]

把这个过程实现为：

```text
AlignmentLift
```

与既有 value-level `IntensionalLift` 并列。

---

## 7. Eager abstraction

成功建立任何 cross-item match 后，不要长期保存：

```text
object_7 <-> object_3
```

这种 concrete edge。

立即尝试重新表示为：

```text
Ref
Concept
Alignment
```

例如：

```text
Leftmost(Input) <-> Leftmost(Output)
```

或：

```text
Rank(OrderBy(X, Input), i)
<->
Rank(OrderBy(X, Output), i)
```

如果找不到可跨案例成立的 abstract explanation：

- 不允许该 edge 进入高层 explanation graph；
- 可以保留在 low-level/fallback branch。

增加 invariant：

\[
\boxed{
ConcreteCrossItemEdgeCount_{high-level}=0.
}
\]

---

## 8. Semantic-cohesive abstraction

不要把：

```text
sort
index
zip/rank-align
compare
```

永远视为四个独立高层操作。

如果一个 connected derivation subgraph：

1. intermediate values 主要只在该 subgraph 内使用；
2. 对外 interface 很小；
3. 跨 training cases semantics 稳定；

则允许把整个 subgraph invention 成一个 declarative abstraction。

例如：

```text
sort both sets by X
rank-align
compare aligned elements
```

高层应可表示成类似：

```text
OrderedCorrespondence(X, ...)
```

而不暴露内部 `sort/index/rank-align` implementation。

本轮不要求发明人类可读名称，使用匿名 `I_k` 即可。

新 abstraction 必须保存：

```text
contract
input/output types
hidden refinement graph
dependencies
provenance
cost
```

高层搜索只看到 contract/interface；低层 decomposition 仅在 refinement 时展开。

---

## 9. 与现有 feature saturation 整合

保留 v0.4：

\[
F_{k+1}
=
F_k\cup TriggeredExpand(F_k).
\]

但 collection feature 现在可以包含：

```text
Set[T]
Count(Set[T])
OrderedView[T,K,n]
Alignment[A,B,n]
Ref[T]
Concept[T]
```

所有新 feature 仍必须携带完整：

```text
type
denotation vector
symbolic expression
provenance
trigger
cost
status
```

Matched/frozen feature 继续不进入普通 expansion frontier。

---

## 10. Visibility

不得因为新增 `OrderBy` 就枚举所有可能排序。

只有出现类似：

```text
NeedCrossItemAlignment[T]
NeedOrderedView[T]
NeedUniqueRef[T]
```

等 trigger，才允许激活 ordering/search。

排序 key 必须来自当前 ontology slice 或已生成 feature。

要求继续保持：

\[
UntriggeredExpansionCount=0.
\]

---

## 11. 03560426 作为主要 vertical test

必须重新尝试 03560426。

不得：

- 固定跨 case object index；
- 手写 Attach；
- 手写 At；
- 手写 Chain；
- 根据 object ID 对齐。

期望路径大致为：

\[
Objects(Scene)
\]

\[
\to OrderBy(...)
\]

\[
\to OrderedView
\]

\[
\to Current/Previous\text{ 等 sequence-local roles}
\]

\[
\to feature transformation
\]

\[
\to repeated derivation pattern
\]

\[
\to anonymous abstraction
\]

\[
\to executable realization.
\]

实际学出的排序或 abstraction 不要求与以上名称一致，但所有 correspondence 必须有可追踪的 semantic explanation。

如果新前端仍失败，正常 fallback 到原 v0.3R.2，并精确报告失败阶段。

---

## 12. 最小 ablations

至少比较：

```text
Full
NoDependentIndex
DirectSetIndexing
NoAlignmentExplanation
NoEagerAbstraction
NoSemanticCohesion
R2FallbackOnly
```

其中：

### DirectSetIndexing

故意允许 Set 按 runtime index 对齐，用来证明这种做法是否产生 training-fit / heldout-fail 或不合理 correspondence。

### NoAlignmentExplanation

同 type 即可尝试 equality，用来衡量 explained alignment 的搜索与泛化效果。

---

## 本轮核心研究问题

回答：

\[
\boxed{
\text{variable-cardinality object sets 是否能在不假设固定角色的情况下被可靠对齐？}
}
\]

以及：

\[
\boxed{
\text{要求每个 cross-item correspondence 都有跨案例成立的 intensional alignment explanation，是否能减少偶然 equality 和错误 correspondence？}
}
\]

以及：

\[
\boxed{
\text{能否把 sort + align + compare 这类低层多步 derivation 自动封装为不泄露 implementation 的 semantic-cohesive abstraction？}
}
\]

不要优先做并行优化，也不要加入神经网络。首先验证 representation、alignment legality、eager abstraction 和 03560426 vertical slice。
