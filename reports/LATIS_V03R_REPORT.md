# LATIS v0.3R — Induced-TSL Rebaseline

独立新 solver 已实现；03560426 的 train 与 heldout 逐格 exact，StructuralPriorCount=0。旧 solver 和数据未改写。覆盖率不能视为 v0.3 的无损替代：17 回归 train=16/17、heldout=14/17（legacy 17/17/17/17）；A–J train=9/10、heldout=5/10（legacy 9/10/9/10）。所有数字来自本次 sequential run；失败与限制在下面公开。

## 可复现协议和定义

`cabal --config-file=scripts/cabal.config build all --offline`；`python scripts/run_v03r.py --tests`；`python scripts/make_v03r_report.py`。CLI：`latis solve-v03r --task PATH --out PATH --mode InducedTSLFull`。核心 trace：[induced_tsl_trace.md](results/v03r/03560426/induced_tsl_trace.md)。完整 source/binary/task hashes：[protocol.json](results/v03r/protocol.json)；全部计数：[metrics.csv](results/v03r/metrics.csv)。四个 test suites 本次全部 PASS，包含 1518 round trips、旧 solver regressions、typed kernel/witness/VSA、core heldout，以及改变画布和首物体 x 的独立扰动检查。

固定 B = typed ML + ARC semantic atoms。Q=(type,specification,typed environment)。TSLτ=Signature(VSroot)∪Iτ。此处 VSroot 是 **bounded discovered support** 的 underapproximation：非空支持必须可审计，但未发现支持不是 operator 不可能支持该 task 的证明。TSL 比 winning program 的 used-symbol closure 更宽：核心有 19 个 BaseActivated，而 winning program 有 15 个 distinct symbols。Base没有 ScanP、Attach、MapPose、Progression 等结构。

基于 [Microsoft PROSE witness 文档](https://www.microsoft.com/en-us/research/project/prose-framework/backpropagation/) 的 operator specification backpropagation 思路，LATIS 为整个 task 推导受支持的 Base signature，并在合成后发现匿名字典项。版本空间的参考是 [Microsoft 的 VSA 文档](https://www.microsoft.com/en-us/research/project/prose-framework/usage/)；未依赖 PROSE SDK 或固定 task DSL。

## Q1：核心是否脱离 privileged structures？

是。new learner 不导入/调用 Synthesis.Skeleton、Joint、Hierarchical 或 Latent.Program。训练 pairs 是 synthesis 唯一参数，没有 task ID/test outputs。实际选中程序为：

```text
(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))
```

它用 sortBy 的 generic key，head/tail，Translate，参数化 Anchor，coordDelta 与 generic scan。canvasSize 是 Base observer。没有 chain/ordered-pose/pointwise family 分支。Registry 与 AST 的 forbidden-symbol 检查通过。StructuralPriorCount=0 是对 registry/witness dispatch/依赖图的结构审计结果；不是仅凭程序名称计数。LegacyFamilies 保留至少 MapP/ScanP/FoldBBoxP/IterateP/PlaceEach 等结构；新路径没有这些 family。

## Q2：scan 支持是否由 witness 推导？

是。根 function graph → lambda binding → mkScene 的 correspondence/Render-valid residual → List PlacedObject specification。Learn 对全部 return-compatible Base ops 求 witness；map 产生逐元素函数约束，scan 产生 seed=y₀、step((yᵢ₋₁,xᵢ))=yᵢ、以及 tail input list。只有所有 child VS 非空才能创建 Join_scan，失败的 map/scan child branches 会记录。Translate 的 vector instance constraints 是 TL(target)−TL(source)，向量表达式从 Anchor 与 coordDelta 的组合中学习；没有 blind vector lattice。step 的 pair parameter 访问路径 `.0/.1` 从 AST 和 witness bindings 自动导出，不使用 depends-on-prev family。

Trace、[version_space.json](results/v03r/03560426/version_space.json) 和 [induced_tsl.json](results/v03r/03560426/induced_tsl.json) 给出 root spec、compatible rules、effect pruning、子任务/MRV、map/scan 支持、Translate vectors、表达式、FV/access paths、VS nodes、inventions、exact/MDL。

## Q3：Attach 是否真正 invention？

是，发现的是匿名 I0；“Attach”只是事后对其语义的解释。发现器只读取 distinct exact-valid portfolio AST，做 alpha-normalized repeated-lambda detection，完全不匹配 Attach 名称或预先给定 BR/TL pattern。

| Name | Occurrences | Portfolio saving | Originating expression |
|---|---|---|---|
| I0 | 32 | 337 | `(lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL))))` |

定义成本=L+2，引用成本=2。**saving 的范围是多程序 portfolio**，不是 selected program。单个 scan 已只写一次 lambda，命名它不能虚报单程序压缩；winning Base AST保持独立计分。NoTaskAbstraction 不影响本次核心 exact/search，只移除字典和相应 TSL符号。当前只有 exact subtree/alpha-equivalence abstraction；一般参数 anti-unification、lambda-lifting 和 invention 引导后续搜索尚未实现。

## Q4：版本空间相对完整 AST enumeration 节省多少？

核心 VSA 有 53 个 nodes，12 Union、15 Join，包含 1088 个 **derivations** 的计数上界，最终 materialize 32 个 complete AST。derivations 可能表达同一 AST/语义，不能称为 1088 个不同程序。

与实际 NoVersionSpaceSharing 相比，VS nodes 减少 748（801→53），child AST constructions 761→754；**complete AST 数量差是 0**，因为两者都受同一个 extraction frontier 限制。不能用 derivation 上界冒充实测完整枚举节省。共享模式保留 Joins 直到 extraction；无共享模式关闭 Learn memo/hash-consing，立即 materialize child products。观察表达式会先 materialize，数量单列 observer_terms，不冒充 complete programs。

## Q5：Witness 相对 bottom-up 的收益？

核心 Full train/heldout=True/True，NoWitness=False/False。Full expanded work=14391，NoWitness=18465；solver seconds 8.210 vs 2.365。收益是同一 Base 上找到受规格支持的正确结构；**本次不支持普遍速度提升的结论**。NoWitness 确实在 typed lambda contexts 和 root 中做 finite bottom-up enumeration，witness_calls=0；没有改用 legacy solver。

Bottom-up beam=8/type、products≤64/operator-instance，lambda-body rounds≤3，body AST≤24，root rounds≤7、AST≤40；Full 的 witness/observer bounds 不同，因此这不是共同穷尽空间上的效率定理。所有模式仍用同一 Base、canonical grounding 和 final exact verifier。NoWitness failures 是 SearchFailure，不能据此声称语言不表达该任务。

## Q6：哪些 symbol Activated / Invented？

核心 BaseActivated：`Anchor, Translate, canvasSize, coordDelta, fst, head, lambda, literal, mkScene, multiply, objects, scan, snd, sortBy, subtract, tail, vec, x, y`。TaskInvented：`I0`。每个 symbol 的支持 specification/witness 记录在 induced_tsl.json；只有 reachable nonempty root VS nodes 进入 Signature，死分支不进入。Observer-composed terms 的支持是 exact forward-observation witness；它们不是无限 grammar 支持证明。原 30 diagnostic set 中发现的 BaseActivated 频数：`{'Anchor': 2, 'Translate': 1, 'canvasSize': 2, 'head': 2, 'index': 2, 'lambda': 2, 'literal': 2, 'map': 1, 'mkScene': 2, 'objects': 2, 'scan': 1, 'snd': 1, 'sortBy': 2, 'subtract': 2, 'tail': 2, 'vec': 1, 'width': 1, 'x': 2, 'y': 2, 'ObjectCells': 1, 'cardinality': 1, 'equal': 1, 'filter': 1, 'objectOf': 1}`。

## Q7：17 回归是否退化？

新 solver 16/17 train、14/17 heldout；本次 legacy 17/17 train、17/17 heldout。数据逐 byte 使用 v0.3 task snapshots，未修改任务以迁就新语言。

| Task | Legacy train/held | Induced train/held | Induced diagnosis |
|---|---|---|---|
| constant-transform | 1/1 | 1/1 | None |
| equivalent-expressions | 1/1 | 1/1 | None |
| filter-color | 1/1 | 1/1 | None |
| fold-bbox | 1/1 | 0/0 | BaseMissing |
| grid-without-prev | 1/1 | 1/0 | AbstractionMissing |
| iterate-chain | 1/1 | 1/1 | None |
| map-recolor | 1/1 | 1/1 | None |
| map-reflectH | 1/1 | 1/1 | None |
| map-rotate90 | 1/1 | 1/1 | None |
| map-scan-ambiguity | 1/1 | 1/1 | None |
| map-translate | 1/1 | 1/1 | None |
| scan-BL-TL | 1/1 | 1/1 | None |
| scan-BR-TL | 1/1 | 1/1 | None |
| scan-TR-TL | 1/1 | 1/1 | None |
| scan-reverse | 1/1 | 1/0 | AbstractionMissing |
| true-scan-lazy-prev | 1/1 | 1/1 | None |
| wrong-early-skeleton | 1/1 | 1/1 | None |

失败优先归为 BaseMissing/WitnessMissing/SearchFailure/SpecificationRepresentationMissing/AbstractionMissing/ImplementationBug，没有加入 task family。BaseMissing 对 intrinsic geometry construction 的判断限定于当前 synthesis literal/witness policy；不声称排除了任意 Base AST 的所有编程可能。canvas corner 与更深 coordinate compositions 的缺失经常是条件 witness/observer 域问题，不是应新增 MoveToCorner。

## Q8：A–J latent stress 是否仍成立？

新 solver 9/10 train、5/10 heldout；legacy 9/10 train、9/10 heldout。

| Task | Legacy train/held | Induced train/held | Induced diagnosis |
|---|---|---|---|
| A-absolute-relative | 1/1 | 1/1 | None |
| B-repeated-progression | 1/1 | 1/1 | None |
| C-scene-axis | 1/1 | 1/0 | AbstractionMissing |
| D-object-sufficient | 1/1 | 1/1 | None |
| E-local-better | 1/1 | 1/0 | AbstractionMissing |
| F-global-better | 1/1 | 1/0 | AbstractionMissing |
| G-fusion | 1/1 | 1/0 | AbstractionMissing |
| H-overfitting-trap | 0/0 | 0/0 | WitnessMissing |
| I-equivalent-representations | 1/1 | 1/1 | None |
| J-no-useful-abstraction | 1/1 | 1/1 | None |

旧 hierarchical discovery 保留并明确为 LegacyFamilies 单独测量。新路径的 secondary observations 是 Base expressions，未调用手写 local/global codecs；因此不宣称保持 v0.3 全部 latent coverage。缺少 aggregate/sequence witnesses、deeper compositional observations 和 residual/codec discovery 时，正确结果是记录退化，而不是把 ProgressionTask/MapPose 改名后重新加入 Base。

## 七个 ablations

| Mode | Train/Heldout | VS nodes | Complete ASTs | Child ASTs | Work | Seconds | Inventions |
|---|---|---|---|---|---|---|---|
| InducedTSLFull | 1/1 | 53 | 32 | 754 | 14391 | 8.210 | 1 |
| LegacyFamilies | 1/1 | None | None | None | None | 0.061 | None |
| NoWitness | 0/0 | 0 | 0 | 0 | 18465 | 2.365 | 0 |
| NoVersionSpaceSharing | 1/1 | 801 | 32 | 761 | 15312 | 8.635 | 1 |
| NoTaskAbstraction | 1/1 | 53 | 32 | 754 | 14391 | 8.006 | 0 |
| NoEffectPropagation | 1/1 | 53 | 32 | 754 | 14445 | 8.274 | 1 |
| NoFVDependency | 1/1 | 53 | 32 | 754 | 14587 | 7.959 | 1 |

Legacy 不具有新 learning-task/VSA metrics，表中的 None 代表 unavailable，不是零。Legacy 的 expanded 与新 total_expanded_work 含义不同，不能按整数预算相同宣称工作量公平一致。核心新 AST L=51、K=15，MDL score=73；J=L+K+sum(lambda-body FV cardinalities)+2×constant exceptions。旧宏程序的 L/J 不与之作直接单位比较。

| Set | Mode | Train exact | Heldout exact | Logged work | VS nodes | Complete ASTs | Seconds | Timeouts |
|---|---|---|---|---|---|---|---|---|
| regression | InducedTSLFull | 16/17 | 14/17 | 161599 | 1250 | 340 | 119.654 | 0 |
| regression | LegacyFamilies | 17/17 | 17/17 | n/a | n/a | n/a | 4.789 | 0 |
| regression | NoWitness | 0/17 | 0/17 | 297342 | 0 | 0 | 21.765 | 0 |
| regression | NoVersionSpaceSharing | 16/17 | 14/17 | 384232 | 15283 | 340 | 157.535 | 0 |
| regression | NoTaskAbstraction | 16/17 | 14/17 | 161599 | 1250 | 340 | 131.292 | 0 |
| regression | NoEffectPropagation | 16/17 | 14/17 | 163649 | 1250 | 340 | 125.426 | 0 |
| regression | NoFVDependency | 16/17 | 14/17 | 172024 | 1250 | 340 | 118.669 | 0 |
| stress | InducedTSLFull | 9/10 | 5/10 | 55992 | 551 | 249 | 28.498 | 0 |
| stress | LegacyFamilies | 9/10 | 9/10 | n/a | n/a | n/a | 3.324 | 0 |
| stress | NoWitness | 1/10 | 1/10 | 180698 | 33 | 32 | 14.079 | 0 |
| stress | NoVersionSpaceSharing | 9/10 | 5/10 | 91400 | 13989 | 249 | 32.511 | 0 |
| stress | NoTaskAbstraction | 9/10 | 5/10 | 55992 | 551 | 249 | 28.429 | 0 |
| stress | NoEffectPropagation | 9/10 | 5/10 | 56828 | 551 | 249 | 28.979 | 0 |
| stress | NoFVDependency | 9/10 | 5/10 | 63323 | 551 | 249 | 25.557 | 0 |

Logged work 对缺失 timeout/legacy 字段不填伪造值；完整 metrics.csv/JSON保留空值。NoEffect 关闭 conditional effect prune，witness/forward checks仍验证结果。NoFV 关闭基于 FV 的实例 coalescing，冲突标签始终不得合并。NoTaskAbstraction 是真实 post-synthesis feature removal；没有编造 solved/time 增益。

## Q9：原 30 diagnostic 的 taxonomy 是否改变？

**PreviouslyOpenedDiagnosticSet**，manifest hash `2a0c08338b17b6f5b29ac650955a3b5549dcf276307a7186f140dbd2c47d9f8d`。不是新的 unseen audit；原 v0.3 首次 audit 与其 source seal 保留不动。两条路径本次重新运行，budget=25000、correspondence=32、legacy solutions=128、新 frontier=32、depth=7、external timeout=60s。相同数据与预算参数不意味着算法计数单位相同。

| Mode | Train exact | Heldout exact | Failure taxonomy | Seconds | Timeouts |
|---|---|---|---|---|---|
| InducedTSLFull | 2/30 | 1/30 | {'BaseMissing': 17, 'WitnessMissing': 2, 'SearchFailure': 8, 'None': 1, 'SpecificationRepresentationMissing': 1, 'AbstractionMissing': 1} | 304.765 | 4 |
| LegacyFamilies | 0/30 | 0/30 | {'LanguageFailure': 20, 'SearchFailure': 3, 'RepresentationFailure-Level1': 1, 'BudgetFailure': 5, 'RepresentationFailure-Level0': 1} | 183.436 | 3 |

旧 taxonomy 是 v0.3 Language/Budget/Level0/Level1 等诊断，新 taxonomy 是本请求的六类；分类标签变化本身不代表 solve-rate 提升或新 generalization。逐题证据：

`5521c0d9` 的新 Base 程序是 map + Translate + scalar subtraction：dy=y(current)−15，因此 y_out=2×y_in−15；本次 train/heldout 都 exact，legacy 为 Level1 failure。`d23f8c26` 只有 train exact、heldout 失败，仍列为 AbstractionMissing。这些是已打开数据上的 rebaseline diagnostics，没有新的 unseen 含义。

| Task | Legacy diagnosis | Induced diagnosis | Induced evidence |
|---|---|---|---|
| 1bfc4729 | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 1fad071e | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 23b5c85d | LanguageFailure | WitnessMissing | no supported complete program under partial witnesses, finite observation domains, depth and frontier bounds; witness-coverage diagnosis within these bounds, not a claim Base cannot express the task |
| 2dc579da | LanguageFailure | WitnessMissing | no supported complete program under partial witnesses, finite observation domains, depth and frontier bounds; witness-coverage diagnosis within these bounds, not a claim Base cannot express the task |
| 363442ee | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 36d67576 | LanguageFailure | SearchFailure | external 60s process budget |
| 39e1d7f9 | SearchFailure | SearchFailure | external 60s process budget |
| 3eda0437 | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 40853293 | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 4347f46a | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 469497ad | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 484b58aa | SearchFailure | SearchFailure | external 60s process budget |
| 54d9e175 | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 5521c0d9 | RepresentationFailure-Level1 | None | finite expanded-work budget reached; no impossibility claim |
| 5ad4f10b | BudgetFailure | SearchFailure | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 5c2c9af4 | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 623ea044 | LanguageFailure | SpecificationRepresentationMissing | no canonical object correspondence in the bounded visibility/D4/color domain; residual specification representation is missing |
| 694f12f3 | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 7837ac64 | BudgetFailure | SearchFailure | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 855e0971 | RepresentationFailure-Level0 | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 868de0fa | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| 8efcae92 | BudgetFailure | SearchFailure | no supported complete program under partial witnesses, finite observation domains, depth and frontier bounds; witness-coverage diagnosis within these bounds, not a claim Base cannot express the task |
| 9f236235 | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| aba27056 | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| c444b776 | SearchFailure | SearchFailure | external 60s process budget |
| d23f8c26 | BudgetFailure | AbstractionMissing | selected exact-training Base program does not generalize to heldout; training specification underdetermines the abstraction |
| d90796e8 | BudgetFailure | SearchFailure | no supported complete program under partial witnesses, finite observation domains, depth and frontier bounds; witness-coverage diagnosis within these bounds, not a claim Base cannot express the task |
| e48d4e1a | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| ef135b50 | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |
| f35d900a | LanguageFailure | BaseMissing | object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof |

## Q10：当前真正缺失什么？

1. **Witness coverage / specification representation**：kernel 的 forward semantics 比 deductive witnesses 宽。sort/argmin/argmax/fold/zip/range/let/if 的通用 inverse 学习没有全部实现；有限 forward observers 只覆盖其中部分非空支持。现有 conditional arithmetic witness要求 residual operand 在观察域内；不做无限整数递归。map/scan 当前是等元素类型、等长度的 partial witnesses，kernel 本身 fully polymorphic。
2. **Recursive composition/search control**：depth=7、64 decompositions/rule、96 observations/type（同语义≤2 alternatives）、finite observer closure、terminal-observation policy、frontier=32 都是公开限制。MRV 使用 surviving immediate domains 作估计。更长 compositions 即使表达式可写，也可能没有 witness 支持。没有完整 VS completeness 宣称。
3. **Base semantic coverage**：cells 是 lossless observer；它不能替代 Object-from-cells / intrinsic-geometry constructor。BaseMissing 在本报告是 direct intrinsic-object construction 的条件性 coverage diagnosis，**D4 shape 检查不证明整个 Scene -> Scene Base 无法表达任务**：有些目标可能通过 cloning/tiling existing objects 再 Render 得到，当前 correspondence/witness 未覆盖这种分解。必须先检查这样的 Base composition，不能只凭该分类就断言需要新 primitive。新增任何真正 atomic constructor 都应先回答复用性、无法简洁 composition、不是 family rename、type/semantics/effect/witness/cost 五项；本次没有以旧任务名称扩 Base。
4. **Hierarchical latent discovery / abstraction**：新路径没有一般 codec synthesis、parameter anti-unification、lambda-lifting 或 discovery/search feedback；旧手写结构只在 legacy ablation存在。portfolio compression 不等于 one-program/codec compression。
5. **Accounting/performance**：work units 包含 learning visits/rules/witness lookahead/spec comparisons；witness calls 包含 MRV lookahead，successful/failed decomposition指尝试 Join 后的结果。observer_terms是 retained forward terms；整个 forward evaluator、correspondence 内部 steps 和 serialization 不都逐步算进 work units。solver monotonic wall time及外部 process elapsed单独记录。first_solution_states 是第一批 extracted AST经过exact检查时的 cumulative work，算法不会在每个子任务提前检验整个 Grid。单次顺序计时不证明统计速度优势。

支持核心研究问题的证据：没有任务结构 family，规格推动 generic scan+Translate+Anchor composition，且 Signature(VS) 包含非 winner 支持、I0 在合成后被发现。尚未解决的研究问题：自动诱导更丰富 secondary languages、完整 witnesses 与低成本广域搜索。现有退化和 diagnostic failures 是测量结果，不能被抽象名称或重新标为 unseen 来掩盖。
