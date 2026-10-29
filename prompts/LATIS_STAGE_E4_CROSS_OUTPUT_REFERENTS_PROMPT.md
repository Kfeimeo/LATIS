# LATIS Stage E4：Cross-Output Abstract Referents（跨所有训练输出的抽象指称与共享构造骨架）

> **交给编码模型的工程任务书。请实际审计仓库、修改 Haskell 代码、运行测试并交付可复现的原始结果；不要只给设计、伪代码或未来计划。** 文档统一使用简体中文。路径、符号和旧报告如与实际源码冲突，以审计过的源码为准；记录差异而不是默默修正。
>
> **范围边界：E4 的核心是“输出侧结构归纳”，不是提前实现 E5 的输入参数绑定。** E4 应能从全部训练输出联合归纳共享的参数化 Scene/Object/Shape 构造表达式，并以独立 Witness 证明它能逐一重构全部训练输出。**若自由参数仍依赖训练输出，不能宣称已合成未知输入可运行的 ARC 解题程序，也不得增加 `train_exact`。**

## 0. 依据、总体目标与已有基线

请先查阅并核实（实际路径自行定位）：

- `LATIS_STAGE_E31_REPORT.md`、`LATIS_STAGE_E31.md`、`LATIS_STAGE_E31_AUDIT.md`；
- `LATIS_STAGE_E2_E3_REPORT.md`，以及 Stage B 的抽象指称/VSA 设计、Stage A Typed Feature、Stage C/Content-first、Stage E0/E1 Shape/Geometry 相关代码；
- E3.1 冻结源与结果：`results/stage_e31/e31-20261028-main/`，冻结二进制 SHA256 为 `8d44dd48b5b39ff9448045339de80e7552eb2d2909280ca64b2492593624c08e`（正式使用前仍应核对文件）。

已知实验事实（不得偷换成 E4 的成果）：

1. E3.1 在 ARC-AGI-1 官方 training 400 题上 **26/400 train-exact**，其中 20 道 Size-first、2 道 Content-first、4 道 Region；旧解都保留。E3.1 **没有新增 ARC 解**。
2. Selector 预检查使 Region 实际执行从 444708 降至 28597（约 −93.6%），但单独带来的墙钟收益约 1%；成功之处是预算、证据和执行语义，不是宣称 CPU 等比提升。
3. Shape MDL 可缓存，56329 次对象 Shape 引用约归并为 4485 个 distinct normalized masks；但 MDL 参与 View 排序仍无已测搜索收益，成本不低。**E4 不得默认对所有输出解释 eager 计算 MDL。**
4. E3.1 表明固定“大 Region 优先”没有得到支持；跨 View 的公平广度调度、成本序与可重放 Witness 仍应保留。
5. **当前正式 Region 搜索只展开一次根节点，实际深度为 1**；Region Tree 数据结构具有更深递归的可能，但不能声称正式搜索已使用全部深度。
6. **当前 Object 主要来自单色四连通提取**，Scene 为 `List[(Object, Position)]` 与单色残余/无残余假设；具有 `Rect/无交并/差` 的 Shape 代数、有界最小覆盖及 MDL，Region 分区由 Object 诱导，要求像素完整覆盖且兄弟不重叠。Shape 与 Region 是不同类型。
7. Stage B 的“抽象指称”已有结构、类型、案例支持、依赖 Witness、VSA 框架；不能把“多个输出恰好相同”升级为全域语义等价，也不能按具体对象列表下标强行对应。

### E4 目标

给定所有训练对

\[
\mathcal T=\{(I_1,O_1),\ldots,(I_n,O_n)\},
\]

**不先寻找 `I → O` 的对象变换函数**，独立对每个 `O_i` 构造若干合法场景解释，然后联合发现共享的、带类型和约束的构造骨架 \(Q\)：

\[
\exists\ Q,\theta_1,\ldots,\theta_n:\quad
\forall i,\ \operatorname{Render}(Q[\theta_i])=O_i.
\]

- \(Q\) 是跨 **全部** 训练输出共享的 **结构程序**；\(\theta_i\) 是输出侧推断的实例参数，必须在 Witness 中标为 `OutputObserved` / `UnboundToInput`。
- 如果已经有一个由输入计算的封闭绑定 \(h\)，则最终完整程序可为 \(P(I)=Render(Q[h(I)])\)，但 **这是 E5 的任务**。E4 可定义接口、进行只读可绑定性统计，不得把输出派生的 \(\theta_i\) 假装成输入特征。
- E4 必须寻找真正**共享的算子/关系结构**，而不是 `Q=EntireOutputGridHole`、按 case id 分支、每个输出像素一个参数或任意 `List[Object]` 大洞。
- 保留多个不同的候选 Output Scene/View/Shape AST；不得只选择第一个解释后再归纳，导致正确结构被错误视图抢先排除。
- 提供可枚举、可核验、可压缩表示与费用上界明确的候选空间；必须区分 `NoCandidateWithinGrammar`、`ProvenExhaustedInFiniteUniverse`、`BudgetTruncated`、`NotAttempted`。

## 1. P0：先做实施前源码审计

在修改代码前生成 `docs/LATIS_STAGE_E4_AUDIT.md`，列出实际模块、函数签名、调用链和约束：

1. 当前训练对如何传递给 `Front`、Size-first、Content-first、Region gate；训练输出在哪里可用于评分/程序参数拟合，`test=[]` 的输入隔离保证在哪里实现。
2. 输出 Grid → View → Scene/Object/Shape 的可复用路径：`sceneFromView` / `viewRegions` / `bestShape` / `MDLCache` / `verifyScene` / `minimalCover`；若当前 API 只接受输入 Grid，评估能否复用于输出 Grid（它们都是同类型 Grid），无需特判“输入颜色”。
3. `ShapeExpr` 的真实语法、坐标帧、无交并合法性、差集语义、可重叠 rectangle cover 与 Shape AST 成本的区别；语法枚举顺序和有界最优证明范围。
4. `PlacedObject` / `SceneHypothesis` / `RegionTree` 中对象身份与位置是如何记录的；是否有稳定的 output-object referent 身份，不要假设现有 Region Selector 可直接选择输出对象。
5. Stage B 已有 `AbstractReferent`、Typed DAG/VSA、case-relative structural/dep/type/case Witness 的具体实现；哪些可以直接复用，哪些关系不能拿来当 Scene 结构跨案例等价。
6. E3.1 的可关闭开关及真实默认值；注意报告**建议** `rcPrecheck=True/rcLazyMDL=True/rcMDL=False/rcRegionFirst=False`，不代表代码已修改默认。确保 E4 有冻结兼容配置，不隐式改动基线。
7. 真实的程序输出结构与证据序列化位置、trace viewer 的数据加载路径、机制 heldout 验证方式和训练输出泄露防护。
8. 现有 Object 提取是否缺少多色父对象；Region 正式搜索是否仅深度 1。若缺失，必须写明 E4 的有限覆盖，不允许依赖未来 E5/E6 的能力。

审计后给出最小可行接口和分阶段修改清单。**先审计、再定 E4 具体类型和函数名。**

## 2. P1：输出侧 Scene 假设与可重构对象

### 2.1 每个输出保留一组解释，而不是唯一解释

对每个 `O_i` 生成有界的 `OutputSceneCandidate`：

```haskell
-- 概念草案，具体以现有类型适配，避免平行重造另一套 Scene。
data OutputSceneCandidate = OutputSceneCandidate
  { outputCaseId     :: CaseId
  , outputView       :: ViewId
  , exactScene       :: SceneHypothesis
  , shapeAlternatives :: ...
  , structureCost    :: ...
  , evidence         :: SceneWitness
  }
```

严格维持：

\[
U_i=\Big(\biguplus_{o\in Objects_i} Pixels(o)\Big)\biguplus Residual_i.
\]

若 `Residual_i ≠ ∅`，必须只有一种颜色且被独立重构；`Residual_i=∅` 时记 `NoResidual`，**不能**推断任何背景色。Object 支持集当前采用不交放置，若将来允许覆盖顺序，必须显式变更语义并设独立实验，不在 E4 偷偷引入。

候选视图必须输入合法：可来自 Legacy/NoBackground/UniqueMostFrequent/UniformBorder 等已有提取规则（以源码为准）。不能调用一个“允许任意输出像素任意对象分组”的万能解释器。每份候选可有不同 Shape AST；几何等价不代表 AST 意向等价。

强制 `verifyScene` 或等价独立检验：将对象、颜色、位置、残余准确渲染回原 `O_i`，逐格相等，尺寸相同。记录候选视图、覆盖、Shape 成本来源/证明状态、合法提取规则及被拒理由。

### 2.2 E4 的构造语法必须有真实表达能力

在**现有 Shape 代数**的基础上提供受限的、类型化的输出构造表达式（概念语法；具体类型遵循项目实现）：

```text
ShapeTemplate
  ::= Rect(BoundsExpr)
   | DisjointUnion(ShapeTemplate, ShapeTemplate)
   | Difference(ShapeTemplate, ShapeTemplate)

ObjectTemplate
  ::= Place(ShapeTemplate, ColoringTemplate, PositionExpr)

SceneTemplate
  ::= Canvas(SizeExpr, BackgroundSpec, ObjectCollectionExpr)

ObjectCollectionExpr
  ::= Empty
   | Singleton(ObjectTemplate)
   | DisjointConcat(ObjectCollectionExpr, ObjectCollectionExpr)
   | RepeatTemplate(ObjectTemplate, CountHole, PlacementRelation)
       -- 仅在具有合法、可复核的重复结构 Witness 时启用。
```

- `Rect` 的参数使用合法坐标框架（对象局部 / Scene 绝对坐标）及明确界限语义；Shell 表示为 `RectOuter \ RectInner`，而非强行新增不透明的专用 `Shell` 构造器。
- `DisjointUnion` 需要子集不交 Witness；`Difference` 需要严格集合语义、有限合法 Mask，不引入任意像素 Mask Hole。
- `ColoringTemplate` 至少支持常色、类型化颜色参数、合法的多处共享同一个颜色变量；第一版如果还不能表达多色单 Object，则应使用已验证的多个单色 Object 组合，并如实报告表达局限。
- `PositionExpr` / `BoundsExpr` 可以含整型、宽高、相对差、共享参数，以及已支持的简单关系（例如外框到内框偏移恒为 1）。不强制 E4 完成复杂 Typed Scalar Synthesis：E4 可以先归纳参数之间的等式/差值/常数关系，将开放参数留待 E5。
- `RepeatTemplate` 若纳入第一版，必须有显式集合/重复模式来源、计数参数和放置关系 Witness；不能把任意 Object Set 当作一个完全自由的参数值，让共同结构退化成 `OutputObjectsHole`。不同数量输出的测试**不可通过列表逐项按下标对齐来伪造成功**。
- 不必一次实现无限制生成语法。对超出有限语法的结构，输出 `RepresentationUnavailable`，保留失败轨迹，而不是暗中加硬编码任务专用求解器。

### 2.3 成本与防退化约束

跨输出结构的评分至少区分：

\[
C(Q,\theta_{1:n})=
C_{AST}(Q)
+\lambda_h C_{holes}(Q)
+\lambda_b C_{bindings}(\theta_{1:n})
+\lambda_v C_{views}
+\lambda_m C_{matching}.
\]

这里每项需在设计文档中定义可计算的量与有限语法范围；数值权重可先取固定有理/整数，**实验前冻结**，不能按具体 ARC task ID 调参。成本至少惩罚：任意数量 Hole、每个训练输出重新给出完整对象表、无结构依据的对象对应、多余的 Object/Operator、视图切换与庞大自由常量表。

必须设置“非平凡共享”的判定：共同模板至少保留一个有意义的 Shape/Scene 构造操作或可验证的结构关系；不是只有 `CanvasHole`、`MaskHole`、`WholeOutputHole`、`CaseIdSwitch` 或全自由的 per-pixel 参数。输出整体一致并非自动满足“抽象归纳成功”。

同时报告：

- 单独编码每个输出的参考成本 \(C_{independent}\)；
- 共享模板成本及逐 case 绑定成本；
- 结构压缩量/比值（如适用）、自由 Hole 数、共同 AST 节点数、不同视图数；
- 成本是 `ProvenOptimalInUniverse`、`BoundedBest` 还是仅观察到的一个候选，**不能宣称全域 MDL 最优**。

保持 `c_rect`（可重叠最小矩形覆盖的有限宇宙成本）与 `c_ast`（Shape 代数 AST 成本）独立，不要拿一个代替另一个。Shape MDL 可优先使用 E3.1 的惰性缓存，不在全部输出解释上 eager 展开 200000 个表达式。

## 3. P2：跨所有训练输出的类型化抽象指称与联合结构归纳

### 3.1 关键语义：`CrossOutputReferent` 不是“编号相等”

定义一个带类型、作用域和 Witness 的结构指称：

```text
CrossOutputReferent[T]
  = (TypedAST, StructuralRole, CaseScope,
     OccurrenceConstraints, Dependencies, Provenance, Witness)
```

`T` 可以是 `ShapeTemplate`、`ObjectTemplate`、`RegionRef`、`Color`、`Int`、`Position`、`Bounds`、`SceneTemplate`、`Set[Object]`。`Object`/`Region` 引用必须带各自 Scene/Region Tree 身份和坐标帧；`ObjectRef` 不能与 `RegionRef` 当作同一种几何集合。

**跨案例身份是“相同的构造角色/关系”，不是第几个 Object**。同一共享模板在不同输出中可以对应不同对象 id、位置、颜色，甚至不同对象数量；若无法确定唯一对应，保留有界候选匹配与 Witness 或集合角色，不得任意选第一项。

对于输出 `O_i` 与 `O_j`，需要建立的不是 `object_i[k]=object_j[k]`，而是带结构匹配/参数映射的关系：

\[
Match_{i,j}(Q,\theta_i,\theta_j;\,W_{ij}).
\]

**最终的 `Q` 必须在全部 `O_1...O_n` 上联合成立**。所有 pairwise 关系都应来自一个相容的全局角色与参数实例；不能把各对输出分别找到的、互相矛盾的匹配拼成“全体成立”。对于 \(n\ge2\)，应验证所有 `i<j` 的共享结构约束及全局一致性；采用一次全体求交、约束求解或增量全局合一均可，但须验证结果与“全部训练输出联合重放”一致。

### 3.2 类型化 anti-unification（反统一）

至少实现：

1. `Rect` ↔ `Rect`：保留共享算子，把不同的坐标、宽高提为**有类型的 Hole**；相同变量跨多位置使用时保留相等约束。
2. `Difference(Rect, Rect)` ↔ `Difference(Rect, Rect)`：归纳 Shell 等关系，尤其外框宽高变化、内缩厚度/相对边界保持一致的案例；不能只变成“两个毫无关系的任意矩形”。
3. `DisjointUnion` 的交换不变性：对象集合或无交并不能简单按子节点顺序 zip。需要显式候选配对/交换排序证明；对无法确定的多个对齐保留替代方案。
4. `Scene` 层：背景、Canvas 大小、对象颜色、相对/绝对放置和几何父子结构的共同骨架。
5. 同数对象与不同数对象：同数时按类型、Shape/关系与空间结构进行有界匹配；不同数时允许通过**明确的集合/重复结构**统一，或明确报告当前 DSL 无法表达，而非强制失败为 Object-count mismatch 后就停止全部输出归纳。
6. 输出具有多种 Shape AST 解释时，保持候选 alternatives；结构归纳必须能跨备选解释找到共同形式，不能只按每个输出的局部最低成本解释做贪婪选择。

规范化至少处理 alpha-renaming、可控的几何规范化与结构共享；对集合交换合法的节点可做 canonical form，同时保留使之成立的 witness。不要把“像素相同”直接视为“Shape AST 同一构造含义”。若复用 Stage B VSA/hash-cons DAG，必须保留原语版本、类型、Hole 作用域、案例环境和候选内涵；候选共享 ≠ 候选删除。

`n=1` 时只能报告 `SingleOutputStructuralCompression`，**不能宣称发现了跨输出共同规律**。对 `n≥2` 但共享结构弱、Hole 过多的情况也应保留可重构候选与低置信标签，不能强报成功。

### 3.3 给 E5 预留的 Hole 来源与绑定接口

每个参数 `h` 记录：

```text
HoleId, Type, Scope, StructuralRole, Constraints,
PerCaseOutputObservedValue, Origin=OutputObserved,
InputBindingStatus=NotAttempted | Pending | Verified,
Witness
```

- E4 的 `Verified` **只**适用于结构重构 Witness；`InputBindingStatus=Verified` 必须有完整输入侧程序 \(h(I)\) 且所有 case 验证，E4 默认不会产生。
- E4 允许审计某个 Hole 在所有输出是否固定、是否有相互关系，但不应因为训练目标提供了它的取值，就把 `ColorFromOutput` / `WidthFromOutput` 当作推理时可执行的输入表达式。
- 下一阶段 E5 应可以接收 `(Q, TypedHoles, Constraints, Witness, AlternativeExplanations)` 作为独立工件；不能只能接收某个已 fit case 的输出常量表。
- 有不同输出数量时，集合类型及大小索引必须合法。若使用依赖类型/精化类型，`Set[Object,n]` 不能直接与 `Set[Object,m]` 逐位置比较，必须通过 `Map`/`Filter`/`Repeat`/解释过的对齐/显式 `List` 转换或更高层的关系建立对应。不同 Collection 大小不可通过伪造下标对齐绕过约束。

## 4. P3：可执行的 Output Skeleton Witness 与独立重放

对每个共享候选 `Q`，必须输出：

1. `OutputSceneWitness`：每个 `O_i` 选择哪个合法 Output View/Scene 解释；原始 Grid 的像素、颜色、画布大小、余像素和 Object Extractor 均可重放。
2. `AntiUnificationWitness`：哪些 AST 节点被保持、哪些变为带类型 Hole，哪些参数表达式与跨节点约束被保留，哪些对象匹配是交换或集合关系，以及为什么合法。
3. `CrossOutputReferentWitness`：候选的所有训练输出支持集、全局角色映射、pairwise consistency、是否存在歧义和候选 alternatives；与 Stage B 的 `CaseAgreement/Type/Dependency` Witness 关系明确，不滥用其名称。
4. `OutputConstructionWitness`：针对每个训练输出，代入该 case 的输出观察参数 \(\theta_i\)，`Render(Q[θ_i])` 必须**逐格等于原始输出**，包含颜色/尺寸/背景；每一像素的生成来源可以追踪到模板 AST/对象/残余。
5. `InputBindingWitness`：E4 只有 `NotAttempted` 或显式 `Pending`，不得构造假的输入绑定凭证。

独立核验脚本用与 Haskell 实现不同的重构路径（例如独立 Python Shape/Scene 解释器），至少验证关键正例的全部训练输出及所有机制 heldout 的**结构实例化**。篡改外框/内框尺寸、颜色、背景、对象匹配、Hole 类型/作用域、case 支持集、Region 所属或坐标帧时必须拒绝。

**Heldout 语义必须严谨**：E4 允许在机制 heldout 的真实输出上仅做“结构归纳后，能否存在合法参数实例”的诊断；这不等于输入生成输出的 heldout accuracy。只有 E5 合成封闭输入绑定后，才可能报告真正的 heldout-exact 预测。不要把真实 heldout 输出传入训练候选合成、调参、View 排序或参数拟合阶段。

## 5. P4：以最小侵入方式接入主程序

建议 E4 先作为**可关闭的输出结构归纳分支/诊断 Sidecar** 接入，而不是修改原有求解器已经成功的路径：

```text
Stage A/D/E3.1 existing solver
        │
        ├── train-exact → 原样返回（可选 E4 audit，不改变结果）
        └── 未解或仅记录阶段
                    └── OutputScene candidates from all train O
                          → Joint CrossOutputReferent induction
                          → Verified OutputSkeleton hypotheses
                          → Unbound typed holes (for E5)
```

至少提供 `E4_Off` / `E4_OutputSkeletonOnly` 两个配置，二者使用相同编译产物、预算与原有求解语义。可加 `E4_NoCrossOutput`（各输出独立压缩）、`E4_PairwiseOnly`（不施加全局一致性）、`E4_NoMDLScore`、`E4_SingleExplanation` 作为成本有限的机制消融，重点证明全局归纳相较独立/贪婪方案的作用。

**E4 输出结构候选不能流入现有 `train_exact` 路径**；结果必须独立标记：

```text
OutputSkeletonStatus
  = StructureVerifiedAllOutputs
  | StructureVerifiedSubset
  | NoNontrivialSharedStructure
  | RepresentationUnavailable
  | ExhaustedInBoundedGrammar
  | BudgetTruncated
  | NotAttempted
```

另设 `prediction_ready=false`、`input_binding_status=NotAttempted`，不可将 `StructureVerifiedAllOutputs` 转写为 `train_exact`。未来 E5 的接口应支持用输入侧 Typed Feature 绑定所有自由 Hole 再封闭程序。

不要在 E4 默认同时增加 `CountColor/ArgMax` Region Selector、完整递归 Region 搜索、神经先验、复杂渲染 DSL 或输出到输入的 case-specific 查表。这些属于独立后续任务。如果为 E4 必要的输出骨架需要极小通用算子，必须明确语法、有限枚举与独立机制证明，不要针对具体 ARC 图案特殊判断。

## 6. P5：搜索空间、预算与公平性

E4 采用**宽而浅**、预算可恢复的结构候选搜索。避免在一个输出的某个 Shape 解释上深挖，再被迫忽略另一个更简单的共同模板。

- 分离 `OutputViewBudget`、`SceneAlternativesBudget`、`ShapeASTBudget`、`MatchingBudget`、`AntiUnificationBudget`、`SkeletonCandidatesBudget`、`WallTime`；每项单位明确（条目、节点、对象匹配、搜索节点、秒）。默认设偏小、有界上限，实际选取须机制试验校准并在 Quick40 运行前冻结。
- 优先尝试低成本共同骨架与相对坐标关系，不按最大 Region 或最多像素优先；跨输出 View/Scene 候选应公平曝光。
- 记录可恢复的候选 frontier/游标、Deferred/Resumed；不能把超时/预算截断写成 `NoFit` / `Exhausted`。
- 若一个候选结构无法跨全体输出匹配，记录最早冲突的 case、对象类型或 Hole 约束；只在存在结构或类型证明时安全剪枝，不能由于“当前训练数据频率低”删掉候选。
- 若采用对象/集合匹配，限定合理的精确/候选数量，并给出歧义数。不能使用输出对象 ID 的列表位置、字典遍历顺序或任意平局决策来产生伪唯一角色。
- 处理输出同色但坐标改变、输出数量变、不同背景、相同 Shape 多个角色、左右镜像、多个等价模板、多个训练输出看似相同等情形。
- E4 的 MDL/解释成本要包括 **实际运行 CPU 与 heap**。既有 Stage E3.1 的 `rcMDL=False` 只是默认省钱策略，E4 若为结构归纳需要某些 Shape AST，须真正计算其 AST，不能用未计算的 `0` 替代；反之也不应强制全部输出对象计算最优 Shape AST 才肯进入搜索。

## 7. 机制矩阵：先验证理论主张，不要依赖 ARC 运气

至少包含下面机制家族，每族 ≥3 seeds。独立明确每族 train O 的参数实例、E4 能看到的数据和 heldout 的评分隔离；正例与负例都要有结构 Witness 或明确拒绝原因：

| 家族 | 必须测试的机制 |
|---|---|
| `VariableShellGeometry` | 多个输出 Shell 宽高变化、内缩常量保持；`RectOuter \ RectInner` 的联合反统一，Hole 关联保持。 |
| `DisjointUnionPermutation` | 两个输出对象列表顺序交换，但 Scene 构造角色不变；对象集合不能 zip 下标。 |
| `DifferentObjectCounts` | 训练输出对象数不等；有合法重复模板时归纳集合模式，没有时准确报语法不可表示。 |
| `SameShapeDifferentColorAndPlacement` | 相同局部 Shape、颜色/位置变化；类型化 Color/Position Hole 与共享关系。 |
| `DifferentBackgroundViews` | 0 也可以是前景，8 可以是背景，余像素为空时无背景推断；多种有效 View 保留。 |
| `AlternateShapeASTs` | 同一 Mask 有矩形无交并、差集等不同意向解释；保留备选，跨案例共同结构可能不在逐例最廉价 AST 中。 |
| `SharedRelativeConstraints` | 外框与内框关系、多个对象共享同一参数、平移等相对关系；不能独立自由 Hole 冒充规则。 |
| `PairwiseInconsistentAlignment` | 每对输出都有某种局部匹配，但不存在共同的全局角色映射；必须拒绝虚假的全体指称。 |
| `SingleCaseCoincidence` | 只 1 个训练输出或某两输出偶然相似，不能被报作全体跨输出抽象成功。 |
| `DegenerateMemorizationNegative` | 每像素一个 Hole、每 case 完整 Object List、CaseIdSwitch、直接 Blob Mask；必须拒绝或在指标中判为非平凡共享不成立。 |
| `NonUniqueRoleAssignment` | 重复相同 Shape 的多个对象，不能依据任意 id 破除对称；保留多解/集合角色。 |
| `OutputOnlyNotInputExecutable` | 同一 Q 可构造全部训练输出，但参数与输入独立或无可检验输入函数；必须输出 `StructureVerifiedAllOutputs` 且 `prediction_ready=false`，不计 train-exact。 |

重要：机制 heldout 必须在 **冻结训练归纳结果后** 才用于评分；即使给 heldout 输出的已知结构参数，也只能报告 `oracle_parameter_structural_reconstruction`，不能写成 `heldout_prediction_exact`。

推荐额外正控制：`RegionAsWholeOutput`，验证 Root/Region 内容可当作共享模板的内部结构引用，但不允许把 Region/Shape 混为一个类型或把输出整个 Grid 当万能 Hole。

## 8. 真实 ARC 定向审计：明确训练目标与实际成功标准

至少覆盖：

- `543a7ed5`：此前 Oracle 是构造外框/填洞，E3.1 的动作 DSL 不具备相应构造能力。E4 应重点检查是否能在**所有训练输出**中识别有共同 Shape/Scene 构造骨架；若现有单色 Object 抽取或模板语法挡住它，精确报告在 `View`、`ObjectExtract`、`ShapeAST`、`Alignment`、`Skeleton` 哪一步失败。**不要预先承诺必然能生成该任务的正确生成程序。**
- `e50d258f`：之前的主要缺口是 Region 的 `CountColor/ArgMax` 输入侧选择器，而非已证明的输出构造缺口。E4 可以分析它的输出结构，却不应据此宣称解决了本任务。
- `2dc579da`：已由 E3 Region `CropRegion` 解出，主要作为不能破坏已有简单程序的回归/对照；不要将它写进“未解题”。
- `1c786137`、`5582e5ca`、`d9fac9be`：旧 Region 解对照；`c909285e`、`0b148d64`：旧 Content-first 解对照。
- 若旧审计列出的 `363442ee`（跨标记复制）、`90f3ed37`（参考图案修复）、`a87f7484`（唯一 Shape 选择）在当前 Quick40 中，可作失败分类诊断；不要假设 E4 的输出结构归纳一定足以求解。

每个定向任务必须区分：`OutputSceneReconstruction` / `AllOutputSkeletonInduced` / `SkeletonEnumerable` / `SkeletonReached` / `WitnessAccepted` / `InputBindingReady` / `ActualTrainExact`。若真实数据中没有合格的共同骨架，明确报告负结果，不得反复调整专用规则直到符合预期。

## 9. 新测试制度：Quick40 为默认，禁止每轮跑 400×多配置

### 9.1 固定且可审计的 Quick40

从 E3.1 的**既有冻结逐题结果**生成一次 `manifests/e4_quick40.json`，包含恰好 40 个不同 ARC-AGI-1 training task ID：

| 类别 | 配额 | 选取原则 |
|---|---:|---|
| 已解回归 | 8 | **必须包含** 4 道 Region 解、2 道 Content-first 解；另 2 道 Size-first 解以固定排序/种子选取。 |
| Scene/Region/表示失败 | 12 | 优先包含 `e50d258f`、`543a7ed5`，其余从已审计失败任务中按固定规则选取。 |
| 参数合成/输出构造失败 | 8 | 依据冻结失败阶段标签和人工 Oracle 可达性分类，不根据 E4 新结果挑选。 |
| 高成本 | 4 | 包含 `484b58aa`，从旧数据按明确 wall/MDL/search-work 排序取余者；不可重复。 |
| 其余未解的固定随机样本 | 8 | 从剩余任务以公布种子、稳定排序抽样。 |

- 类别重叠时依优先级分配并从下一个合法候选补足；完整记录 `task_id, stratum, selection_reason, prior_status, prior_work, prior_wall, seed, source_run, manifest_sha256`。
- **在开始跑 E4 前冻结 Quick40**；后续不得因为 E4 表现差而替换任务。必须提供 manifest 生成器与 hash 校验，防止被改写。
- Quick40 是面向机制的分层诊断集，**不是 400 题解题率的无偏样本**。报告一律写 `/40`，不得把新增数乘十推断 `/400`。
- 如果 E4 主要是纯 Output-only 结构归纳，即使原有求解器在这 40 题中已解，也可以在 `audit_mode` 分别归纳输出结构；但 audit-mode 绝不能影响旧程序最终选择。

### 9.2 日常运行层级与预算

1. **单元 + 机制**：修改某个 AST/匹配/Witness 后优先运行受影响的测试与小型完整宇宙差分；这是最快的内循环。
2. **Quick40**：默认只运行 2–3 个必要配置，例如 `E4_FrozenE31` / `E4_OutputSkeletonOnly` / `E4_NoCrossOutput`；如果只改结构归纳而非旧求解器，不需每次重复历史 9 配置。建议先用 60s/确定性节点预算进行诊断，对截断题再运行 300s；两种预算必须分列，不能混用作为等价比较。
3. **26 道旧解回归**：每次涉及公共 AST、Front/Program、Scene、Feature/VSA、Render 时运行旧 26 道并做逐格重放；可与 Quick40 重叠，但须报告 26/26 完整覆盖。Stage B 长套件前一次报告 `not_run`，**E4 触及 Stage B 指称核心代码前应补跑一次**；以后只在相关大改/里程碑运行。
4. **Full400**：**仅当 E4 机制与 Quick40 稳定、阶段需要冻结时，才显式启用一个全量里程碑开关**（如 `-Full400`）；默认脚本绝不运行 400×多配置。不要求每个小迭代跑 Full400。若未执行，报告 `full400=not_run`，不得写 26/400 是本阶段新实测值（只能注明历史冻结基线 26/400）。
5. 需要墙钟性能结论时，同一环境/二进制对要比较的配置做配对运行；历史结果可用于语义回归参照，但**跨不同负载批次的时间不能直接声称优化倍数**。建议并发不高于 4 workers，并记录 CPU、内存、系统争用、RTS、任务 watchdog。

**推荐实现**：`scripts/run_stage_e4.{ps1,py,sh}` 以 `quick40` 为默认模式，`mechanism` / `regression26` 为独立模式；`full400` 必须显式参数启动。不要让默认脚本意外跑 400×9。

## 10. 需要记录的诊断与消融

E4 日志必须区分**旧 solver 工作**与**新增输出结构归纳工作**，不能把后者隐藏在旧 `search_work` 口径中：

```text
output_scenes_generated / verified / rejected
output_views_attempted / selected
output_shape_ast_enumerated / matched / deferred
pairwise_match_checks / ambiguous_matches
joint_consistency_checks / rejected
antiunify_nodes / memo_hits / frontier_deferred / resumed
shared_skeletons_enumerated / verified_all / partial / rejected
holes_total / holes_by_type / holes_with_constraints
per_output_binding_cost / independent_cost / shared_cost
witness_replay_pass / fail
old_search_work / e4_structural_work / total_wall / cpu / gc / peak_live
budget_exhausted_by_stage / timeout / error / not_attempted
input_binding_status / prediction_ready
```

至少做以下消融（小宇宙和机制全做，Quick40 视预算选 2–3）：

- `E4_Off`：E3.1 原基线，不开展输出结构归纳；与 E4 sidecar 开启时旧 train-exact 及程序的等价性。
- `E4_IndependentOutputs`：每个 O 单独压缩，不做跨输出合一；验证共享成本下降来自联合结构而非纯 Shape DSL 能力。
- `E4_JointAllOutputs`：全部输出共同的 typed anti-unification + Witness。
- `E4_PairwiseOnly`（可选）：只求两两共同骨架、不检验全局一致性，用负例证明它可能接受伪结构。
- `E4_FirstSceneOnly`（可选）：逐输出先选局部最便宜解释，再联合归纳；与保留替代解释对照。
- `E4_NoStructuralSharing`（可选）：不用 VSA/DAG 共享，独立枚举同一有限 AST 宇宙，比较候选集合与实际工作量。

验证可压缩 AST/DAG 的展开集合与不共享参考枚举器在小有限宇宙**完全一致**；不同候选的 Output 训练值偶合不能被错误合并；成本比较必须说明有没有计入自由参数与匹配成本。

报告失败原因须具体：`NoLegalOutputView`、`ObjectRepresentationUnavailable`、`ShapeASTMissing`、`UnsupportedVariableMultiplicity`、`NoJointRoleAlignment`、`HoleConstraintConflict`、`OnlyTrivialSkeleton`、`BudgetTruncated`、`NotAttempted`。不要将任何 `BudgetTruncated` 算作“证明 DSL 不可表达”。

## 11. 工件、冻结与报告要求

至少真正生成：

1. `docs/LATIS_STAGE_E4_AUDIT.md`：修改前代码路径、复用点、局限、泄漏审计、预算及状态分类。
2. `docs/LATIS_STAGE_E4.md`：完整类型/语法、跨输出联合归纳算法、合法匹配、全局一致性、共享参数约束、成本与 Witness 语义、复杂度和可恢复边界。
3. `docs/LATIS_STAGE_E4_REPORT.md`：机制 train/heldout **结构** 结果、Quick40 精确覆盖、新旧 26 解、耗时与内存、各项消融和负结果、目标任务的 Oracle/可枚举/可达性诊断。
4. `manifests/e4_quick40.json`、生成器与冻结 hash；不许以修改后的 E4 结果挑选/替换任务。
5. `scripts/run_stage_e4.py` 及 Windows `.ps1`（Linux `.sh` 可附），`scripts/report_stage_e4.py`、`scripts/verify_stage_e4.py`；重复执行同一报告产生相同摘要。
6. `results/stage_e4/<run_id>/` 下完整原始 JSON、构造骨架 AST、各输出 Hole 值及来源、匹配/反统一/结构重放 Witness、配置/预算/版本/二进制 SHA256、Quick40 manifest hash、mechanism、`per_task.csv`、`metrics.json`、`verification.json`、失败案例 trace、CPU/内存及 `report_digest.json`。不得覆盖 E3/E3.1 冻结记录。
7. 单案例 trace 中可查看：各个训练输出候选 Scene/View、保留的 Shape AST 备选、跨案例匹配（显示歧义）、共享 Skeleton、Hole 与约束、逐格重构、首个冲突、预算 frontier；只能展示实际产生/核验的数据。
8. 一组能被后续 E5 直接读取的版本化 `OutputSkeletonArtifact`（无测试标签、无训练 case ID 分支程序），含有类型 Hole、参数约束和来自 E4 的构造 Witness。

当功能部分完成，按 `implemented / partially_implemented / not_run / failed` 如实填写，绝不编造 Full400 或输入预测结果。

## 12. 验收要求与明确禁止事项

### 必须验收

- [ ] 在至少 3-seed 机制正例中，存在一个**非平凡**跨全部训练输出共享的 typed Scene/Object/Shape Skeleton，允许尺寸、位置、颜色变化；能独立逐格重构所有训练 O。
- [ ] 至少有一组“对象顺序被打乱”的机制任务成功，不把集合按索引 zip；重复对象歧义能够保留多个合法解释或集合角色。
- [ ] 至少有一组“对象数量不同”的机制任务成功归纳有证据的集合/重复结构；如确实受语法限制而失败，**本项不得标完成**，必须报告具体不可表达点而非假装对齐。
- [ ] `Shell = RectOuter \ RectInner` 的跨输出共享 AST 及相对几何关系被归纳，而不是只有多个自由坐标 Hole。
- [ ] 多个 pairwise 匹配并不满足全体一致的负例，能够拒绝，且全局 Witness 有独立重放。
- [ ] 反记忆化负例拒绝 CaseIdSwitch、全像素参数洞、全自由 Object Set；结构成本惩罚空洞模板。
- [ ] `OutputObserved` 参数的溯源、`InputBindingStatus=NotAttempted`、`prediction_ready=false` 精确记录；**输出结构 fit 不增加 `train_exact`**。
- [ ] Sidecar on/off 时，旧 26 道解都能被逐格回归（如有失败先定位）；不能把 E4 结构重构当新 ARC 已解任务。
- [ ] Stage B 的原有候选类型/泛化 Witness/VSA 不因 E4 引入训练等价错误合并；小宇宙共享/非共享枚举集一致。
- [ ] 默认测试只跑 Quick40（及机制/必要回归），`Full400` 显式选择；数据清单冻结、可重算、每项结果注明覆盖和预算。

### 明确禁止

1. 用任何 ARC 官方 test output、mechanism heldout output 参与训练结构归纳、参数合一、排序或调参。
2. 使用 Output 派生参数作为输入时可执行参数，或把 Output-only 模板宣称为完整 `I→O` 求解器。
3. 依赖对象列表顺序建立跨输出身份；强制不同大小的 `Set[Object]` 逐位置对齐；使用隐式 tie-break 伪造唯一性。
4. 将 Shape 与 Region 合并成同一类型；破坏 Scene 单色余像素、Object 诱导完整不重叠分区、原有几何 Witness。
5. 硬编码 task ID、特定颜色/具体样例输出、训练案例编号开关、任意完整输出 blob、逐像素自由模板，或偷偷用训练目标信息建立 `InputFeature`。
6. 只保留每个输出的第一个解释，或因为训练网格相同把不同内涵候选删去；把 `BoundedBest` 写成全局证明。
7. 跑很久的 400×多配置矩阵代替机制测试；让未经核验的 Work、CPU、内存或结构 heldout 指标冒充程序泛化能力。

## 13. 实施顺序（请按此顺序执行，不要一次性大改）

**Audit → Quick40 冻结 → 输出 Scene 多候选重构 → Typed Shape anti-unification → 无序对象/集合角色对齐 → 全部训练输出联合一致性 → 非平凡 Scene Skeleton + Hole 约束 → Witness/独立重放 → Sidecar 接入与 26 解回归 → 机制矩阵与 Quick40 消融 → 报告及 E5 接口。**

优先证明每一个小模块的语义再增加下一层搜索；若跨输出 Scene 骨架太难，先交付 Shape/Object 层有严格 Witness 的部分结果，保留 Scene 层 `partially_implemented`，不要用编造结果完成验收。

### 本阶段最终必须回答的问题

1. LATIS 能否在不先确定任何 `I→O` 对象变换对应的情况下，从**全部训练输出**归纳出同一个可执行、可参数化的非平凡构造骨架？
2. 不同输出数量、对象顺序、颜色和几何尺寸变化时，哪些共享角色是可证明的？哪些只是训练案例偶合？
3. 保留多种输出 Scene/Shape 解释并联合归纳，相比逐输出局部最优/独立编码能否找到更简单、跨所有输出一致的 Skeleton？真实 CPU、内存和候选数的代价是什么？
4. 哪些任务 `OutputSkeleton` 已找到，但参数仍 `UnboundToInput`；哪些卡在对象提取、AST 表示、无序集合对齐、全局约束或预算？
5. E5 若要实现真正的 Output-first Synthesis，具体需要绑定哪些 Typed Holes，哪些输出侧约束可以降低输入特征合成的搜索空间？

**不要以 E4 的输出重构数量冒充 ARC 求解数量；E4 的主要贡献是提供可信且可复用的跨输出结构指称，为 E5 的输入参数绑定奠定基础。**
