# LATIS v0.6.1：Safe Online Abstraction & Robustness Audit

本轮对应 `../prompts/LATIS_V061_EXPERIMENT_PROMPT.md`，在 v0.6 代码上实现。v0.6 入口（`solve-collection-v6`、`collection-v6-experiment`，默认 `ExclusiveReuse` 策略）、v0.5、v0.4 与 R2 fallback 行为不变；`results/v06` 不重算。v0.6.1 的新入口：`solve-collection-v61`、`collection-v61-experiment`、`collection-v61-battery`。结果与结论见 `../reports/v061/LATIS_V061_REPORT.md`。

## 模块变化

| 文件 | 变化 |
|---|---|
| `src/Synthesis/Collection/Front.hs` | 新增 `ReusePolicy`（`ExclusiveReuse` / `SafeReuse`）、`Mode` 增加 `SafeOnline` 与 `ExclusiveReuseLegacy`、`Deferred` 记录、`resumeDeferred`、`diagnoseExclusive`、Call 合法性检查、RankCorrespondence 复用 witness 校验、`enumerationSeed` 枚举置换、`first_solution_work` 等工作量计数；class 派生指标改为在 `finish` 中由最终 class 记录重算（resume 后替换记录而不是重复计数） |
| `src/ARC/CollectionV6Evaluate.hs` | v0.6 矩阵改为显式的 11 个模式列表；JSON 增加 `deferred_candidates` |
| `src/ARC/CollectionV61Evaluate.hs` | 新入口：G/H/P 任务、九模式矩阵、重复计时中位数、RTS 峰值内存、`candidate_recovery` / `work_accounting` / `paired_ambiguity` 审计、metamorphic battery runner |
| `src/ARC/CollectionV61Generate.hs` | 七个任务族的种子生成器（含已知规则、拒绝原因、平移变体、重放信息） |
| `test/CollectionV61Main.hs` | 候选完备性、误导复用、paired ambiguity、排序/类型属性、metamorphic smoke |
| `scripts/run_collection_v61.ps1`, `scripts/report_collection_v61.py` | 一键脚本与审计报告 |

## 复现

```powershell
./scripts/run_collection_v61.ps1          # 六组测试、应用、矩阵（+RTS -T）、battery、审计报告
./build/latis-collection-v61.exe solve-collection-v61 --task data/03560426.json --out results/v061-single --mode SafeOnline --repeats 5
./build/latis-collection-v61.exe collection-v61-battery --out results/v061/battery --seed-base 2000 --per-family 20
python scripts/report_collection_v61.py
```

本机直接用 GHC 9.10.3，临时目录限定在工作区；每个 Main 用独立 `-outputdir`。`--repeats`（默认 5）控制前端 wall-clock 的重复次数（报告中位数）；`+RTS -T` 打开 RTS 统计以记录 `max_live_bytes`（进程级最大值，不是每次运行的独立峰值）。battery 不运行 R2 fallback，只报告前端 exact 与 `fallback_needed`。

## SafeOnline 搜索语义

v0.6 的复用：slot 上 `Call(I_k)` 一旦拟合所有 training rows，class 只含 Call representatives，残余 scalar 语法不再枚举。v0.6.1：

1. **Preferred branch**：`Call(I_k)` 仍先尝试。它经过与普通候选相同的检查：family/contract 为 `SequentialScalar`、输出类型 `Int`、ontology slice `scalar`、arity 与定义一致（`call_legality_checks` / `call_legality_rejections`），在相同 rows、相同 dependent-size 上下文、相同 alignment witness 下求值，并进入同一个 whole-grid realization 检查。
2. **Deferred，不删除**：Call 命中时，该 slot 的残余语法范围 `[0, |grammar|)` 作为 `Deferred` 记录保存（slot、范围、abstraction、promotion step、创建 step、状态、原因、class 大小与选择），搜索状态中保留 rows 与 Call representatives（`stPending`），没有立即展开。
3. **Resume 条件**（均写入 `candidate_recovery`）：
   - preferred branch 在 training rows 上失败：立即枚举残余语法（状态 `resumed-immediately`）；
   - 当前 alignment 的 realization 失败：先 resume 本 alignment 的所有 deferred slot，重试一次（`resume_retries`），再放弃该 alignment；
   - **第一个解找到后**：exhaust preferred branch，resume 所有 deferred slot，补全 class，用同一 prior 重新排序；若选择改变则重建程序并再次 training 验证（`reselected_after_completion`、`recovered_solutions`）。
4. **候选语义集合不变**：SafeOnline 只改变候选顺序与表示；唯一的候选合并仍是 v0.6 的 canonicalization（counterfactual 签名、intensionality class、dependency signature 三者全同），其记录即 soundness certificate。测试 `CollectionV61Main` 检查：对 A–H 与 03560426，NoOnlineAbstraction 的每个 slot class（Call 按 library 展开后做语义规范化）都是 SafeOnline 最终 class 的子集，预测相同。
5. **RankCorrespondence**：复用路径把 `Call(I_1)(kIn,kOut)` 的 witness 与展开路径的 `rankAlign` 结果逐案例比较（`rank_reuse_witnesses_verified`），alignmentEvidence 与 NoOnline 逐项相等；不会丢失合法 key pair。
6. **ExclusiveReuseLegacy**：v0.6 行为；搜索结束后运行诊断枚举（不计入 search_work，记为 `diagnostic_operator_applications`），报告 `exclusive_reuse_missed_candidates` 与 `exclusive_reuse_missed_solutions`（完整 class 的选择与 Call 不同的 slot 数）。

工作量字段：`first_solution_work`（第一个 training-exact 程序时的 operator_applications + refinement_expansions）、`total_work_to_exhaustion`（最终）、`completion_work`（差值）、`alignment_candidates_remaining`（成功后未探索的 alignment 候选：never explored due to early success）、`deferred_candidates` / `resumed_candidates`。

### 结构性事实

本前端的 slot 彼此独立且要求 whole-row exact：`Call(I_k)` 若拟合某 slot 的全部 training rows，则它与该 slot 任何残余候选在 training 上给出相同位置，因此 whole-grid realization 不会区分它们。Exclusive 复用在 training 上不会漏掉可解的任务；它丢失的是 class 多样性，从而改变最终选择与 heldout 行为（任务 G）。"Call 对部分 case 失败" 的情形（任务 H）在两种策略下都回到残余语法，v0.6.1 只是把它作为显式 resume 事件记录。

## 任务

| 任务 | 机制 |
|---|---|
| G-nonunique-reuse | 首项移到 (GridLeft,GridTop)，后续项 x = PrevRight+2、保持输入行；训练行呈阶梯（rank k 在第 k 行，高度 1），x 轴 promote 的 `PrevY+PrevH` 在 following-AY 上偶合；heldout 行不是阶梯、高度混合 |
| H-partial-reuse | 同规则，case 2 不是阶梯：preferred Call 对部分 case 失败 |
| P-gridleft / P-currentx | 训练网格完全相同；heldout 分别按 GridLeft / CurrentX 规则生成（`non_identifiable_from_train`） |
| A–F, 03560426 | v0.6 任务 |

Battery 任务族：SeedKey、CompositeKey、RuntimeTrap、SizeIndex、FirstItem、RepeatedPattern、OverlapChain（03560426 型重叠链）。每族从 `seedBase + 1000*family` 起连续取种子直到 20 个有效实例，拒绝原因写入 `*-rejections.csv`；开发期使用 1000 起的种子，报告使用 2000 起的种子。变体：`permuted`（`enumerationSeed`）与 `translated`（输入整体平移、输出由已知规则重生成）。属性：permutation_invariant、translation_equivariant、safe_solves_iff_noonline、safe_prediction_equals_noonline、safe_key_equals_noonline、ties_rejected_when_expected、size_index_legal、no_concrete_high_edges、triggered_only。

## 限制

- SafeOnline 的"完备性"只相对本前端的有界 scalar 语法与 key 语法成立；alignment 候选在成功后不再探索（所有模式相同，计入 `alignment_candidates_remaining`）。
- 完成阶段会把 deferred slot 全部枚举，因此 `total_work_to_exhaustion` 通常等于或高于 NoOnlineAbstraction；节省只体现在 `first_solution_work`。
- Call 的 ranking 仍用 v0.6 prior（长度按 Call 节点计，canonical bonus +1）；它可能偏向 Call（见报告中 F/03560426 完成后未改变选择）。
- 生成器的规则偶合（例如 RuntimeTrap 某些种子上 `PrevW+1` 与 `PrevY+PrevH+1` 在 training 上同值）会产生训练上不可识别的实例；这些作为"误选解释"统计，不按 heldout 调参。
- 峰值内存来自 RTS 统计的进程级最大值。
