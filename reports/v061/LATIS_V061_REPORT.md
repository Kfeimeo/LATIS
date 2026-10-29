# LATIS v0.6.1 Safe Online Abstraction & Robustness Audit 实验报告

实验日期：2026-10-22。`scripts/report_collection_v61.py` 审计了固定矩阵 99 个运行条目（11 任务 × 9 模式）、154 条候选 deferred/resume 记录，以及 battery 835 个运行条目（140 个有效实例）。所有运行 UntriggeredExpansionCount=0、expanded_frozen_features=0、ConcreteCrossItemEdgeCount_high_level=0。R2 源码与 git 基线无差异；v0.5 模块与 v0.6 的 Indexed/Counterfactual/Online 模块与各自结果清单的 SHA-256 一致；v0.6 `Full` 入口在 03560426 上重跑的全部 v0.6 指标与 results/v06 相同（测试与 results/v061-dev/v6full）。

## 两个核心结论

1. **Online abstraction 加速 first-solution search**：F-repeated-pattern 的 first_solution_work SafeOnline=2536，NoOnlineAbstraction=3078（节省 17.6%）；03560426：2564 对 3050（15.9%）。v0.6 记录的对应值为 Full 2537 / NoOnline 3078 与 2565 / 3050。SafeOnline 与 ExclusiveReuseLegacy 的 first_solution_work 相同。

2. **Online abstraction 不再静默删除有效假设**：SafeOnline 在第一个解之后 resume 全部 deferred slot，最终 class 覆盖 NoOnlineAbstraction 的 class（测试 CollectionV61Main 对 A–H、03560426 逐 slot 检查，Call 经 library 展开后比较）。代价是 total_work_to_exhaustion 上升：F 3059（NoOnline 3078），03560426 3065（NoOnline 3050）。完成枚举比不用抽象略多，因为 Call 节点与 resume 时物化的节点都被计数。

## 固定矩阵（前端 train / heldout）

| 任务 | SafeOnline | ExclusiveReuseLegacy | NoOnlineAbstraction | PostHocOnly | NoCounterfactual | NoIntensionalityPrior | CollapseByTrainingDenotation | FixedAlignmentKeys | NoDependentIndex |
|---|---|---|---|---|---|---|---|---|---|
| A-seed-key | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ |
| B-composite-key | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ | ✓ / ✓ |
| C-runtime-order-trap | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ | ✓ / ✓ |
| D-size-index-trap | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✗ |
| E-first-item-counterfactual | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✗ | ✓ / ✗ | ✓ / ✓ | ✓ / ✓ |
| F-repeated-pattern | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ |
| G-nonunique-reuse | ✓ / ✓ | ✓ / ✗ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ |
| H-partial-reuse | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ |
| P-gridleft | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✗ | ✓ / ✗ | ✓ / ✓ | ✓ / ✓ |
| P-currentx | ✓ / ✗ | ✓ / ✗ | ✓ / ✗ | ✓ / ✗ | ✓ / ✗ | ✓ / ✗ | ✓ / ✗ | ✓ / ✗ | ✓ / ✗ |
| 03560426 | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ |

所有模式使用相同的 grammar bounds（scalar 语法 459 项、key 深度≤2、cost≤5、alignmentBudget=400）、相同 case 集、相同合法性检查与 R2 预算（A–H/P 为 25000，03560426 为 250000）。各模式只在候选次序/表示（reuse policy）、是否发明、prior 分量或 counterfactual 生成上不同。

## 工作量与资源

| 任务 | 模式 | first_solution | total_to_exhaustion | completion | op_apps | refinements | call_attempts | deferred/resumed | recovered | ex_missed | never_explored(align cands) | wall ms (median of 5) | max_live_bytes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| F-repeated-pattern | SafeOnline | 2536 | 3059 | 523 | 3018 | 41 | 6 | 459/1377 | 0 | 0 | 21 | 5.6 | 291137304 |
| F-repeated-pattern | ExclusiveReuseLegacy | 2536 | 2537 | 1 | 2496 | 41 | 6 | 459/918 | 0 | 0 | 21 | 5.3 | 291137304 |
| F-repeated-pattern | NoOnlineAbstraction | 3077 | 3078 | 1 | 3005 | 73 | 0 | 0/0 | 0 | 0 | 21 | 3.9 | 291137304 |
| F-repeated-pattern | PostHocOnly | 3077 | 3078 | 1 | 3005 | 73 | 0 | 0/0 | 0 | 0 | 21 | 5.4 | 291137304 |
| 03560426 | SafeOnline | 2564 | 3065 | 501 | 3027 | 38 | 18 | 459/1377 | 0 | 0 | 15 | 6.0 | 291137304 |
| 03560426 | ExclusiveReuseLegacy | 2564 | 2565 | 1 | 2527 | 38 | 18 | 459/918 | 0 | 0 | 15 | 6.2 | 291137304 |
| 03560426 | NoOnlineAbstraction | 3049 | 3050 | 1 | 2998 | 52 | 0 | 0/0 | 0 | 0 | 15 | 3.5 | 291137304 |
| 03560426 | PostHocOnly | 3049 | 3050 | 1 | 2998 | 52 | 0 | 0/0 | 0 | 0 | 15 | 5.2 | 291137304 |
| G-nonunique-reuse | SafeOnline | 2488 | 3039 | 551 | 3013 | 26 | 18 | 459/1377 | 1 | 0 | 24 | 5.1 | 291137304 |
| G-nonunique-reuse | ExclusiveReuseLegacy | 2488 | 2489 | 1 | 2465 | 24 | 18 | 459/918 | 0 | 1 | 24 | 4.5 | 291137304 |
| G-nonunique-reuse | NoOnlineAbstraction | 3014 | 3015 | 1 | 2990 | 25 | 0 | 0/0 | 0 | 0 | 24 | 4.7 | 291137304 |
| G-nonunique-reuse | PostHocOnly | 3014 | 3015 | 1 | 2990 | 25 | 0 | 0/0 | 0 | 0 | 24 | 5.6 | 291137304 |
| H-partial-reuse | SafeOnline | 3014 | 3015 | 1 | 2990 | 25 | 18 | 0/1377 | 0 | 0 | 35 | 2.9 | 291137304 |
| H-partial-reuse | ExclusiveReuseLegacy | 3014 | 3015 | 1 | 2990 | 25 | 18 | 0/1377 | 0 | 0 | 35 | 3.6 | 291137304 |
| H-partial-reuse | NoOnlineAbstraction | 2993 | 2994 | 1 | 2969 | 25 | 0 | 0/0 | 0 | 0 | 35 | 4.3 | 291137304 |
| H-partial-reuse | PostHocOnly | 2993 | 2994 | 1 | 2969 | 25 | 0 | 0/0 | 0 | 0 | 35 | 5.0 | 291137304 |

actual savings = NoOnline search_work − SafeOnline first_solution_work（已真实发生的减少）；deferred work = SafeOnline completion_work（第一个解之后为保证候选集完整而补做的枚举）；never explored = 成功后未再尝试的 alignment 候选数（所有模式相同，不计为节省）。max_live_bytes 来自 +RTS -T 的进程级最大值（同一进程顺序运行多任务，不是独立峰值）。

## 误导复用反例

**G-nonunique-reuse**：x 轴 following 槽发现 `PrevX+PrevW+1`，promotion 为 I_2；following-AY 上 Call(I_2)(AY,0)=PrevY+PrevH 在阶梯状训练行上拟合。ExclusiveReuseLegacy 只保留 Call，heldout 失败；诊断显示该 slot 有 12 个残余 training-exact 候选从未被看到，完整 class 的选择是 `Atom (Pos Current (Ax AY))`。SafeOnline：deferred 范围 [0, 459]，在第一个解后 resume（step 9），class 从 1 增到 13 个 representative，重新选择 `Atom (Pos Current (Ax AY))`，程序重新通过训练验证，heldout exact。NoOnlineAbstraction 同样选出 `Atom (Pos Current (Ax AY))`。推导路径见 results/v061/G-nonunique-reuse/*/trace.txt 与 candidate_recovery。

**H-partial-reuse**：case 2 不是阶梯，Call(I_2) 在 following-AY 上只拟合部分 case；SafeOnline 记录 3 个 resumed-immediately 事件（shared-AY, first-AY, following-AY），枚举残余语法后选出 `Atom (Pos Current (Ax AY))`。Exclusive 在这种情形下也回到残余语法（v0.6 已如此）；差别只在显式审计。

**结构性事实**：slot 互相独立且要求 whole-row exact，所以拟合全部 rows 的 Call 与任何残余候选在 training 上位置相同，whole-grid realization 不会区分它们。Exclusive 复用在本前端不会在 training 上漏解，它丢失的是 class 多样性（从而改变 heldout 行为），这正是 G 展示的失败。能让 realization 失败而残余候选成功的“局部偶合”在本前端无法构造；我们没有通过放宽合法性来制造它。

## Paired ambiguity（P-gridleft / P-currentx）

两任务训练网格完全相同（运行时断言）。identifiability：non_identifiable_from_train；hypothesis_survival_recall=1.0（GridLeft 与 CurrentX 都在 first-AX class 中）；counterfactual_distinguished_pairs=1；oracle_in_candidate_set：P-gridleft=True，P-currentx=True；选中 `Atom (SceneLow (Ax AX))`（两任务相同的程序），selected_program_accuracy：P-gridleft=True，P-currentx=False。这是不可识别情形：确定性 solver 不可能同时解对两套 heldout，正确的评估是 candidate-set coverage（两条假设都存活）而不是单一 heldout 准确率。

| 模式 | first-AX 选择 | first-AY 选择 | 首项程序 | P-gridleft heldout | P-currentx heldout | survival recall | cf distinguished |
|---|---|---|---|---|---|---|---|
| SafeOnline | `Atom (SceneLow (Ax AX))` | `Atom (SceneLow (Ax AY))` | `(Atom (SceneLow (Ax AX)),Atom (SceneLow (Ax AY)))` | ✓ | ✗ | 1.0 | 1 |
| NoCounterfactual | `Atom (SceneLow (Ax AX))` | `Atom (SceneLow (Ax AY))` | `(Atom (SceneLow (Ax AX)),Atom (SceneLow (Ax AY)))` | ✓ | ✗ | 1.0 | 0 |
| NoIntensionalityPrior | `Atom (Pos Current (Ax AX))` | `Atom (Pos Current (Ax AX))` | `(Atom (Pos Current (Ax AX)),Atom (Pos Current (Ax AX)))` | ✗ | ✗ | 1.0 | 1 |
| CollapseByTrainingDenotation | `Atom (Pos Current (Ax AX))` | `Atom (Pos Current (Ax AX))` | `(Atom (Pos Current (Ax AX)),Atom (Pos Current (Ax AX)))` | ✗ | ✗ | 0.5 | 0 |

NoCounterfactual 与 SafeOnline 在这两个任务上的选择与准确率相同：counterfactual 没有提升准确率，它只把两条假设分到不同签名组（诊断/多样性保留）；选择由 prior（accidental-dependency 惩罚、cross-axis 惩罚、canonical referent bonus）决定。NoIntensionalityPrior 与 CollapseByTrainingDenotation 在 first-AX 上选了 CurrentX，但在 first-AY 上同样选了 `CurrentX`（训练中 CurrentX=0 对 y 槽也 training-exact，v0.6 枚举顺序把 object observer 排在最前，且这两种模式没有 cross-axis 惩罚），得到 v0.5 式的 `(CurrentX,CurrentX)` 首项程序；P-currentx 的真实规则是 `(CurrentX,0)`，heldout 首项 x=3 时预测落在 (3,3) 而不是 (3,0)，所以两套 heldout 都失败。这说明 paired 评估必须看完整程序而不只看单个 slot；first-AX 的 oracle 存活只证明候选集覆盖，不证明选择正确。

## Metamorphic battery

种子：评估用 seedBase=2000（每族 2000+1000·family 起连续取种直到 20 个有效实例），开发期用 1000 起的种子；无 R2 fallback。变体：permuted（enumerationSeed）、translated（输入整体平移、输出按已知规则重生成）。

| 族 | 有效/拒绝 | Safe train/held | Exclusive train/held | NoOnline train/held | NoCF held | 误选(Safe) | Safe first vs NoOnline total (两者都解出的实例) | Safe total | ex_missed | Safe reselected | Safe≠Ex held | Safe≠NoOnline pred | translated |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| SeedKey | 20/62 | 18/13 | 18/13 | 18/13 | 13 | 5 | 109727 vs 113808 (3.6%) | 113192 | 6 | 6 | 0 (+0/−0) | 0 | 19 |
| CompositeKey | 20/28 | 20/20 | 20/20 | 20/20 | 20 | 0 | 291127 vs 291910 (0.3%) | 291147 | 0 | 0 | 0 (+0/−0) | 0 | 20 |
| RuntimeTrap | 20/2 | 20/20 | 20/20 | 20/20 | 20 | 0 | 847090 vs 848233 (0.1%) | 847110 | 0 | 0 | 0 (+0/−0) | 0 | 20 |
| SizeIndex | 20/0 | 20/20 | 20/20 | 20/20 | 20 | 0 | 20846 vs 20866 (0.1%) | 20866 | 0 | 0 | 0 (+0/−0) | 0 | 20 |
| FirstItem | 20/25 | 20/20 | 20/20 | 20/20 | 20 | 0 | 50447 vs 60599 (16.8%) | 60688 | 0 | 0 | 0 (+0/−0) | 0 | 18 |
| RepeatedPattern | 20/18 | 20/20 | 20/20 | 20/20 | 20 | 0 | 51907 vs 62285 (16.7%) | 62092 | 0 | 0 | 0 (+0/−0) | 0 | 18 |
| OverlapChain | 20/15 | 20/17 | 20/17 | 20/16 | 17 | 3 | 51398 vs 59920 (14.2%) | 60142 | 0 | 0 | 0 (+0/−0) | 1 | 20 |

拒绝原因（每族）：SeedKey: output outside canvas ×23, X not strict ×39；CompositeKey: a seed key explains the training pairing ×4, no Area tie ×22, lattice objects overlap or leave the canvas ×2；RuntimeTrap: trap objects overlap or leave the canvas ×2；FirstItem: placement failed ×25；RepeatedPattern: Y not strict ×16, placement failed ×2；OverlapChain: X not strict ×15

属性通过率（SafeOnline plain，每族 20 实例）：

| 族 | permutation_invariant | translation_equivariant | safe_solves_iff_noonline | safe_prediction_equals_noonline | safe_key_equals_noonline | ties_rejected_when_expected | size_index_legal | no_concrete_high_edges | triggered_only |
|---|---|---|---|---|---|---|---|---|---|
| SeedKey | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 |
| CompositeKey | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 |
| RuntimeTrap | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 |
| SizeIndex | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 |
| FirstItem | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 |
| RepeatedPattern | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 | 20 |
| OverlapChain | 20 | 20 | 20 | 19 | 20 | 20 | 20 | 20 | 20 |

失败/误选实例（SafeOnline heldout 不 exact）：SeedKey 2004 (Anchor TL AX -> Anchor TL AX)；SeedKey 2025 (Anchor TL AX -> Anchor TL AX)；SeedKey 2034 (Desc (Anchor TL AY) -> Lex (Extent AX) Color)；SeedKey 2036 (Lex Area (Anchor TL AX) -> Lex Area (Anchor TL AX))；SeedKey 2060 (Anchor TL AX -> Anchor TL AX)；SeedKey 2065 (Lex (Anchor TL AX) Area -> Lex (Extent AX) (Anchor TL AX))；SeedKey 2076 (Color -> Color)；OverlapChain 8008 (Anchor TL AX -> Anchor TL AX)；OverlapChain 8021 (Anchor TL AX -> Anchor TL AX)；OverlapChain 8031 (Anchor TL AX -> Anchor TL AX)

解读：

- SeedKey 族的位移 k∈{1,2,3}，而 scalar 语法的 literal 只有 −1/0/1，k≥2 的实例只能靠偶合表达式（如 CurrentX+CurrentWidth）拟合训练，heldout 随之失败或前端失败并需要 fallback。这是语法边界，不是复用机制的问题；SafeOnline、Exclusive、NoOnline 在这些实例上的训练可解性完全一致。
- 误选（训练 exact、heldout 不 exact）全部是训练不可识别的偶合：选中的解释与真实规则在训练上同值（例如 OverlapChain 中每案例只有 2 个对象时 following 槽只有两行约束，`CountObjects` 或 `PrevH−1` 也拟合）；NoOnline 同样误选。battery 中 Safe≠Exclusive 的 heldout 差异列给出复用策略真正改变结果的实例数及方向；ex_missed 列给出 Exclusive 诊断出完整 class 选择与 Call 不同的实例数，即使 heldout 结果恰好相同。
- safe_prediction_equals_noonline 的例外（若有）来自 Call representative 的 canonical bonus：Safe 的完整 class 与 NoOnline 的候选集合相同，但 Call 的 ranking 比其展开式低 1，可能改变最终选择；这是 v0.6 prior 的已知偏向，报告不把它算作泛化提升。
- permutation_invariant、translation_equivariant、ties_rejected_when_expected、size_index_legal、no_concrete_high_edges、triggered_only 在全部实例成立：ID-free Set 对 encoder 枚举不敏感；合法平移保持 correspondence 解释；tie 只能被拒绝或显式 Lex；跨 size index 的对象 equality 从未被接受。

## 被证实与未被证实的结论

- 证实：SafeOnline 保留 first-solution 节省（F、03560426 与 battery 各族的 first_solution 列）。
- 证实：在有界语法内 SafeOnline 不丢失 NoOnline 的候选（候选完备性测试、battery safe_solves_iff_noonline 与 safe_key_equals_noonline 全部成立）；ExclusiveReuseLegacy 在 G 上可审计地漏掉 12 个候选并选错。
- 证实：RankCorrespondence 复用的 witness 与展开路径逐案例相同，没有合法 key pair 丢失。
- 未证实：counterfactual 提升准确率。NoCounterfactual 与 SafeOnline 在 P 任务与 battery 上准确率相同；counterfactual 的作用仅限于诊断与保留不同签名的假设。
- 未证实：SafeOnline 的 total_work_to_exhaustion 低于 NoOnline；它通常略高（完成阶段补做枚举）。节省只在 first solution。
- 限制：候选完备性只相对本前端的有界 scalar/key 语法；alignment 候选在成功后不再探索（所有模式相同）；Call 的 ranking 偏向是 v0.6 prior 的遗留。

## 复现

```powershell
./scripts/run_collection_v61.ps1
```

设计、搜索语义与命令见 docs/LATIS_V061.md；原始数据：results/v061/metrics.csv、results/v061/battery/metrics.csv、每实例 instance.json / properties.json / 各模式 JSON（含 candidate_recovery 与 trace）。
