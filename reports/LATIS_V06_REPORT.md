# LATIS v0.6 Counterfactual-Preserving Online Abstraction 实验报告

实验日期：2026-10-21。由 `scripts/report_collection_v6.py` 审计 77 个运行条目、545 个逐案例 alignment witness、537 个 semantic class、153 条 abstraction 记录后生成。

v0.6 是 v0.5 collection front-end 的增量升级，位于 `src/Synthesis/Collection/{Indexed,Counterfactual,Online,Front}.hs` 与 `src/ARC/CollectionV6Evaluate.hs`。v0.5 模块、v0.4 solver 与 R2 fallback 源码未改动（审计比对了 SHA-256 与 git diff）。

03560426：前端训练与留出均 exact，fallback_count=0；首项选择 GridTL，对齐键为 seed 键，online abstraction 在同一次搜索中被复用。

## 十一组消融

表格为前端 train / heldout；R2FallbackOnly 列为真实 R2 的 train / heldout。前端失败的行都实际运行了原 R2，结果在各目录 solution.json 与 r2-fallback/。

| 任务 | Full | NoCounterfactual | CollapseByTrainingDenotation | NoIntensionalityPrior | FixedAlignmentKeys | NoAlignmentExplanation | NoOnlineAbstraction | PostHocOnly | NoDependentIndex | DirectSetIndexing | R2FallbackOnly |
|---|---|---|---|---|---|---|---|---|---|---|---|
| A-seed-key | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ |
| B-composite-key | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ | ✗ / ✗ |
| C-runtime-order-trap | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ | ✓ / ✗ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✗ | ✗ / ✗ |
| D-size-index-trap | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✗ | ✓ / ✓ | ✗ / ✗ |
| E-first-item-counterfactual | ✓ / ✓ | ✓ / ✓ | ✓ / ✗ | ✓ / ✗ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ | ✗ / ✗ |
| F-repeated-pattern | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ |
| 03560426 | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ | ✓ / ✓ |

## RQ1：denotation-equivalent 候选是否必须保持多个解释

E-first-item-counterfactual 训练中首项对象都在 x=0，GridLeft、Literal 0、CurrentX、SetMinX 在训练上同值。Full 的 first-AX class 保留 13 个 representative，counterfactual 把它们分成 5 组（TranslateScene/margin 使 CurrentX、SetMinX 改变，scene referent 与 literal 不变），选择 `Atom (SceneLow (Ax AX))`，留出 exact。

CollapseByTrainingDenotation 按训练 denotation 只保留最低结构成本的 representative（枚举顺序为 v0.5 的 observer 优先），premature_collapses=18，留出失败；NoIntensionalityPrior 保留全部 representative 但只按长度排序，选中 `Atom (Pos Current (Ax AX))`，留出失败；NoCounterfactual 的 first-AX class 仍保留结构多样性（11 个 representative，没有 counterfactual 签名时更多结构相同的候选被 canonicalize），splits=0，依靠 accidental-dependency 惩罚和 canonical referent bonus 仍选中 scene referent。

counterfactual 不删除候选、不提供目标输出：签名不同只用于保留多样性，排序由通用 prior 决定。GridLeft 与 Literal 0 在任何合法 counterfactual 下都不可区分，二者都保留在 class 中，仅由 prior 分出先后。

## RQ2：alignment key 能否由受限 intensional synthesis 发现

B-composite-key 输入侧 X、Y、Area、Color 全部 tie，Lex(X,Y)/Lex(Y,X) 给出错误配对。seed 阶段的候选全部失败后触发 AlignmentFailure，synthesized 语法（深度≤2、cost≤5）被打开，Full 以 `Extent AY` / `Anchor TL AY` 完成对齐，ordering_ties_rejected=51，synthesized_keys_accepted=75。FixedAlignmentKeys 在 B 上前端失败，进入 R2 fallback。B 与 C 的 synthesized 阶段有 62 个可见 key，合法 key 对按 cost 排序后在 alignmentBudget=400 处截断（trace 记录 alignment budget exhausted），正确的 cost-3 候选在预算内。

C-runtime-order-trap 训练上 encoder 枚举顺序恰好等于高度顺序：DirectSetIndexing train=True / heldout=False，NoAlignmentExplanation（无 witness 的 Color 相等配对）train=True / heldout=False；Full 用 synthesized key `Extent AY` 留出 exact。所有 ordering tie 都被拒绝，没有隐式 tiebreaker；refinement 只能通过显式 Lex 键。

## RQ3：在线 promotion 与复用是否减少搜索工作

| 任务 | 模式 | search_work | operator_applications | refinement_expansions | online_accepted | posthoc_accepted | reuses | saved |
|---|---|---|---|---|---|---|---|---|
| F-repeated-pattern | Full | 2537 | 2496 | 41 | 2 | 0 | 4 | 32 |
| F-repeated-pattern | NoOnlineAbstraction | 3078 | 3005 | 73 | 0 | 0 | 0 | 0 |
| F-repeated-pattern | PostHocOnly | 3078 | 3005 | 73 | 0 | 1 | 0 | 0 |
| 03560426 | Full | 2565 | 2527 | 38 | 2 | 0 | 1 | 14 |
| 03560426 | NoOnlineAbstraction | 3050 | 2998 | 52 | 0 | 0 | 0 | 0 |
| 03560426 | PostHocOnly | 3050 | 2998 | 52 | 0 | 1 | 0 | 0 |

F 中 RankCorrespondence 在第一个完整 seed 候选上被 anti-unify 并 promotion，后续候选以 Call 复用；SequentialScalar 在 following-AX 槽发现后，following-AY 先尝试 Call(I_k) 而不再展开 scalar 语法。NoOnlineAbstraction 完全不发明；PostHocOnly 搜索工作与 NoOnlineAbstraction 相同，搜索结束后对同一派生做 anti-unification 得到同样的 SequentialScalar 抽象（posthoc_accepted=1）并改写最终程序，但 reuse=0、saved=0：封装本身不减少搜索。search_work 的减少来自 operator_applications（跳过的 scalar 枚举）与 refinement_expansions（未展开的 per-case 节点）两部分；utility 的每个分量与阈值都保存在 derivation_graph.json。

## RQ4：dependent size index 的归纳价值

D-size-index-trap 的输出按不同 indexed shape 的数量平移。2×1 与 1×2 bar 的 payload 都是 [5,5]：Full 选中 `Plus (Atom (Pos Current (Ax AX))) (Atom CountShapes)`（留出 exact）；NoDependentIndex 擦除 σ 后 CountShapes 少 1，训练上拟合为 `Plus (Plus (Atom (Pos Current (Ax AX))) (Atom CountObjects)) (Lit (-1))`，留出失败。这不是类型检查上的差异，而是 accidental equality 导致的错误 abstraction 在留出上暴露。

## 03560426 审计

### 19.1 First-item ambiguity：first-AX class 有 13 个 representative，training_signature=[0, 0, 0]，选中 `Atom (SceneLow (Ax AX))`；候选含 `Lit 0`、`Atom (Pos Current (Ax AX))`、`Atom (SetMin (Ax AX))` 等，各自的 counterfactual_signature 与 ranking_components 保存在 solution.json 的 audit 字段。v0.5 选中的 (CurrentX,CurrentX) 现在作为 accidental 候选保留但排在 scene referent 之后。

### 19.2 Alignment key：输入 `Anchor TL AX`（seed=True），输出 `Anchor TL AY`（seed=True）；synthesized=False。Tie legality：strict ordering on every case; ties rejected (metric ordering_ties_rejected); refinement only via explicit Lex key。

### 19.3 Online abstraction：

- I_1 (RankCorrespondence): discovery_step=1, promotion_step=1, first_reuse_step=None, reuse_count=0, saved_refinement_expansions=0, accepted=True, search_reduction_claimed=False
- I_2 (SequentialScalar): discovery_step=5, promotion_step=5, first_reuse_step=8, reuse_count=1, saved_refinement_expansions=14, accepted=True, search_reduction_claimed=True

只有 reuse_count>0 的 abstraction 才宣称 search reduction。03560426 Full：search_work=2565，NoOnlineAbstraction：3050，PostHocOnly：3050。

```text
Program {progEncoder = EncoderConfig {connectivity = Four, encoderBackground = 0}, progExec = CallTop "I_0", progDefs = fromList [("I_0",Definition {defKey = Anchor TL AX, defBody = Body {bodyFirst = (Atom (SceneLow (Ax AX)),Atom (SceneLow (Ax AY))), bodyNext = (Plus (Plus (Atom (Pos Previous (Ax AX))) (Atom (Ext Previous (Ax AX)))) (Lit (-1)),Call "I_2" [ArgAxis AY,ArgInt (-1)])}, defUnsafe = False})], progLibrary = fromList [("I_2",AbsDef {absBody = Plus (Plus (Atom (Pos Previous (AxisVar 0))) (Atom (Ext Previous (AxisVar 0)))) (ConstVar 0), absParamKinds = ["Concept Axis","Constant"]})], progDependent = True}
```

## 关键指标（Full）

| 任务 | classes | reps | max/class | cf_ctx | splits | premature | intensional | literal | key_cands | synth_keys | ties | witnesses | abs_prop | abs_acc | reuses | saved | op_apps | frontier | visibility | search_work | fallback |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| A-seed-key | 2 | 12 | 7 | 18 | 2 | 0 | 12 | 0 | 25 | 0 | 2 | 2 | 2 | 2 | 0 | 0 | 1087 | 2 | 8 | 1104 | 0 |
| B-composite-key | 15 | 79 | 7 | 122 | 0 | 0 | 65 | 14 | 400 | 75 | 51 | 14 | 2 | 1 | 6 | 30 | 14031 | 2 | 63 | 14104 | 0 |
| C-runtime-order-trap | 31 | 157 | 10 | 240 | 0 | 0 | 127 | 30 | 400 | 79 | 43 | 32 | 2 | 2 | 15 | 75 | 31580 | 2 | 64 | 31732 | 0 |
| D-size-index-trap | 2 | 11 | 9 | 18 | 2 | 0 | 11 | 0 | 9 | 0 | 6 | 2 | 2 | 1 | 0 | 0 | 1103 | 2 | 7 | 1120 | 0 |
| E-first-item-counterfactual | 4 | 28 | 13 | 16 | 4 | 0 | 26 | 2 | 20 | 0 | 3 | 2 | 2 | 2 | 1 | 5 | 2453 | 2 | 8 | 2473 | 0 |
| F-repeated-pattern | 4 | 10 | 4 | 27 | 0 | 0 | 8 | 2 | 25 | 0 | 2 | 12 | 2 | 2 | 4 | 32 | 2496 | 2 | 8 | 2537 | 0 |
| 03560426 | 4 | 28 | 13 | 16 | 4 | 0 | 26 | 2 | 16 | 0 | 4 | 3 | 2 | 2 | 1 | 14 | 2527 | 2 | 8 | 2565 | 0 |

所有运行：UntriggeredExpansionCount=0，expanded_frozen_features=0；除两个故意使用 runtime/无解释配对的消融外，ConcreteCrossItemEdgeCount_high_level=0。

## 范围与限制

- 合成任务是机制反例，规模很小；它们证明机制在构造情形下的行为，不是 ARC 全集上的统计结论。
- Online abstraction 的发现基于搜索自身标记的 per-case 实例子图做 typed anti-unification，不是通用子图同构挖掘；两个 family 是 RankCorrespondence 与 SequentialScalar。
- 复用的槽位只保留 Call representative，不再枚举 scalar 语法，因此在该槽位用搜索减少换取了多样性；首次发现的槽位保留完整 class。
- Counterfactual 只有平移、画布扩展/边距、对象置换、无关对象插入四类，并各自带合法性证明；无法合法生成的 context 被记录为 rejected。GridLeft 与 Literal 0 无法被任何合法 counterfactual 区分。
- 合成 key 语法限制为深度≤2、cost≤5，且只在 AlignmentFailure 之后打开；对齐仍只支持同画布、数量相等、保留输入几何的 realization，其他任务正常 fallback 到原 R2。
- Intensionality prior 的权重 (4,2,1) 与 cross-axis 惩罚是通用的、未按任务调节；所有 cost 分量保存在 audit 中。

## 复现与测试

通过 CollectionV6、Collection、Triggered、InducedR2、FeaturePipeline 五组测试，日志在 results/v06/validation。合成任务 A–F 的 R2 fallback 预算为 workBudget=25000，03560426 为 250000。Windows、GHC 9.10.3、-O1；wall-clock 只是单次观察。

```powershell
./scripts/run_collection_v6.ps1
```

构建方法、模块边界与消融定义见 docs/LATIS_V06.md。原始表格：results/v06/metrics.csv。
