# LATIS Stage B 实验报告：抽象指称层级（Bounds / 布尔原语 / 案例相对结构泛化 / Witnessed VSA / 分层搜索）

本报告只记录本轮实际测得的数字。设计与语义见 `docs/LATIS_STAGE_B.md`；所有数据可由 `./scripts/run_stage_b.ps1` 复现。**本轮不做任何 test 泛化声明**：ARC 任务只用训练对，heldout 仅在合成机制任务上作为评分信号报告。

## 1. 运行环境与完整性

| 项 | 值 |
|---|---|
| 代码 | git HEAD `d7fb0bb5…`，工作区 diff 哈希 `6e72ce12…`（`results/stage_b/arc/code_version.json`），二进制 `build/latis-stage-b.exe` SHA256 `7d38a911…` |
| 数据 | 官方 ARC-AGI-1 training 400 题，`combined_sha256 = fda04e22…`，与阶段 A、v0.6.1 的 manifest 逐字节一致（`identical_data_vs_stage_a = true`）；泄漏保护（train-only 输入，exit 3 守卫）未触发 |
| 运行 | 400 任务 × 9 配置，4 个并行进程，Feature 墙钟上限 60 s，RTS `-M4g -T`；总墙钟 2957 s |
| 注意 | 全量 ARC 运行与阶段 B 测试套件、机制矩阵部分时间并行执行，**墙钟数字受 CPU 争用影响**；`search_work`、评估计数与 `max_live_bytes` 是确定性的，结论以它们为准 |

## 2. 自动测试（全部通过）

| 套件 | 断言数 | 结果 | 日志 |
|---|---|---|---|
| stage-b-tests（`test/StageBMain.hs`） | 286 PASS，5 条 INFO | `All stage-b tests passed.` | `results/stage_b/validation/StageB-tests.txt` |
| stage-a-tests | 304 PASS | 通过 | `StageA-tests.txt` |
| collection-v61-tests | 315 PASS | 通过 | `CollectionV61-tests.txt` |
| collection-v6-tests | 73 PASS | 通过 | `CollectionV6-tests.txt` |
| collection-tests | 50 PASS | 通过 | `Collection-tests.txt` |
| triggered-tests | 46 PASS | 通过 | `Triggered-tests.txt` |
| induced-r2-tests | 通过（单行汇总） | 通过 | `InducedR2-tests.txt` |
| feature-pipeline-tests | 22 PASS | 通过 | `FeaturePipeline-tests.txt` |

阶段 B 套件覆盖（对应提示词 B5 的机制测试清单）：

- **B0**：`And/Or` 在 ML 与 registry 中的求值与类型错误拒绝；`Gt(a,b) ≡ Lt(b,a)`；枚举器中阶段 A 的模板列表是阶段 B 列表的子序列（旧默认不变）；Bool 只出现在 `If` 条件下；`And/Or/Not` 与 `Lt` 阈值可达；`Bounds` 的单像素/矩形/带洞/平移/30×30 案例、空对象与非法对象返回 `Left`、`MaxX = PosX+ExtX−1` 恒等式、`SetMax`、`boundsAtoms ∉ atoms`。
- **B1**：NF 的常数折叠、全函数恒等式、`Gt→Lt`、交换律排序、**偏函数子项不折叠**（`x mod 0` 不消去）、`Opaque`、幂等/确定性、特殊值子树、类型检查、有界内联。
- **B2**：正例 `X+2 → X+W`（Confirmed）与 Bool 阈值；反例全部被拒：类型不匹配、非特殊值路径（训练中恒为 2 的 `Width` 叶子）、`x−x` 假依赖（`DependencyNone → Rejected`）、仅训练等价但 NF 不等、训练不一致（`CaseDisagree`）、前提不满足（`CaseUnknown`）、无 counterfactual 时为 `PendingDependency` 而非 Confirmed。
- **B3/B4**：类/边/不可比较分支/generality/SCC/闭包/witness 覆盖；VSA 展开 == 参考枚举；共享构建工作 < 参考；`NoSharedVSA` 得到相同的类与边且 DAG 评估数为 0；proven 与 train-equal 不混合；四种调度产生的排序是同一节点集合的置换；`refreshGraph` 在换上下文后撤销边但**不删除候选**，恢复上下文后边数恢复；类搜索与 flat 搜索给出相同的 fit 集合，类搜索的行查找数小于 flat 的行求值数；每层预算截断被报告。
- **前端**：5 族 × 2 种子 × 9 配置的不变量（`ConcreteCrossItemEdgeCount_high_level = 0`、`UntriggeredExpansionCount = 0`、`b_vsa_expansion_mismatch = 0`）；正控制；置换不敏感（定义、执行、测试预测、快照哈希）；确定性；反例对；BaselineA 与阶段 A FullA 在 14 个阶段 A 机制实例 + 03560426 上程序、失败与 `search_work` 完全一致。

测试中**改为报告而非断言**的两项（INFO 行）：

1. `ThresholdIf` 的 BaselineA 不是负控制：阶段 A 的 typed holes 以合成（如 `isOdd(Height div 3)`）达到同一真值表，BaselineA 也 train-exact。原提示词设想的“无 `Lt` 则无解”在现有 typed 层上不成立，这是一个真实的审计发现。
2. 反例对的 heldout：`CaseSupportedWidth = False`、`ConstantTruthWidth = True`（恰一个正确，见 §3）。

## 3. 合成机制矩阵（`results/stage_b/mechanism/mechanism_metrics.csv`，5 族 × 3 种子 × 9 配置 = 135 行）

所有 135 行的 `expected_train_exact ⇒ front_train_exact` 成立，无不变量违反；`regression_stage_a.csv` 的 135 行（15 个阶段 A 任务 × 9 配置）全部 `same_program_as_fulla = same_predictions_as_fulla = True`。

| 族（规则） | 配置 | train-exact（3 种子） | heldout（3 种子） | 快照节点 | 类 | 确认边 | 待证边 | 类检查 | flat 行求值 | typed-hole 评估 |
|---|---|---|---|---|---|---|---|---|---|---|
| MoveToOwnRightEdge（`x' = MaxX`） | 全部 9 个 | T/T/T | T/T/T | 0（语法层 `Pos+Ext−1` 直接解出，层级未打开） | – | – | – | 0 | 0 | 0 |
| ThresholdIf（`y' = if Height>2 then PosY else SceneLow`） | BaselineA / B0Only | T/T/T | T/T/T | 0 | – | – | – | 0 | 0 | 180 k–540 k |
| | NoStructuralGeneralization | T/T/T | T/T/T | 40 000 | 7331/6880/7158 | 0 | 0 | 21 993/41 280/21 474 | 0 | 0/360 k/0 |
| | NoSharedVSA | T/T/T | T/T/T | 40 000 | 同上 | 2914/2907/2912 | 286/284/284 | 同上 | 0 | 同上 |
| | NoHierarchy | T/T/T | T/T/T | 40 000 | 同上 | 同上 | 同上 | 0 | 134 438/296 818/147 910 | 同上 |
| | FullB 及 3 种调度 | T/T/T | T/T/T | 40 000 | 同上 | 同上 | 同上 | 21 993/41 280/21 474 | 0 | 同上 |
| CaseSupportedWidth（`x' = PosX+2·Width`，训练宽 2，heldout 宽 3） | BaselineA | T/T/T | **F/F/F** | 0 | – | – | – | 0 | 0 | 60 000 |
| | B0Only | T/T/T | **T/T/T** | 0 | – | – | – | 0 | 0 | 60 000 |
| | NoStructuralGeneralization | T/T/T | F/F/F | 40 000 | 1672/1606/1606 | 0 | 0 | 1672/1606/1606 | 0 | 0 |
| | NoSharedVSA / NoHierarchy / FullB×4 | T/T/T | F/F/F | 40 000 | 1672/1606/1606 | 5076 | 296 | 1672/1606/1606（NoHierarchy：flat 41 067） | – | 0 |
| ConstantTruthWidth（`x' = PosX+4`，与上一族相同训练网格） | BaselineA | T/T/T | T/T/T | 0 | – | – | – | 0 | 0 | 60 000 |
| | B0Only | T/T/T | **F/F/F** | 0 | – | – | – | 0 | 0 | 60 000 |
| | 其余 7 个 | T/T/T | **T/T/T** | 40 000 | 1672/1606/1606 | 5076（NoStructuralGeneralization：0） | 296 | 同上 | – | 0 |
| IncomparableBranches（`x' = PosX+4`，Width≡2 ∧ Count≡2） | BaselineA | T/T/T | T/T/T | 0 | – | – | – | 0 | 0 | 60 000 |
| | B0Only | T/T/T | F/F/F | 0 | – | – | – | 0 | 0 | 60 000 |
| | 其余 7 个 | T/T/T | T/T/T | 40 000 | 1672/1672/1498 | 5076/5076/5108 | 296 | 同上 | – | 0 |

读法与发现：

- **反例对按设计工作**：CaseSupportedWidth 与 ConstantTruthWidth 的训练网格逐字节相同（共用随机流），每个配置给出**相同的程序**，因而 heldout 恰有一个正确。FullB 选 `PosX+4`（对 ConstantTruthWidth 正确），B0Only 选 `PosX+Ext+Ext`（对 CaseSupportedWidth 正确）。两者的差异**不是 prior 的差异而是候选集差异**：B0Only 的 typed-hole 层在 60 000 次评估预算内只产出 72 个 feature fit、0 个 constant fit（`typed_hole_truncations = 1`），`PosX+4` 根本没有进入它的类；FullB 的层级宇宙（常数 ≤ 1、域 [−4..4]）在深度 1 即含 `PosX+4`，所选类同时含 `PosX+4`、`MaxX+3`、`PosX+Ext+Ext`、`PosX+Ext+SetMin`、`PosX+Count+Count` 等 11 个代表（`semantic_classes` 记录），由 v0.6.1 prior 选出 `PosX+4`。这正是提示词要求“保留两个不可比较分支、不把同训练外延的候选合并为一个”的直接证据；它同时表明在训练上不可辨识的任务，heldout 正确与否取决于候选集与 prior，而非“更一般=更对”。
- **IncomparableBranches**：选中类同时保留 `Ext`、`Count`、`SetMin` 三种读法（三者在训练上都等于 2），SCC 数 = 节点数（无互相泛化的环），`b_layers = 2`。
- **ThresholdIf**：B0 的 `Lt` 进入 `If` 条件后层级可直接解出，但 BaselineA 也以 typed 合成解出（见 §2）；heldout 9/9 配置都正确（报告，不断言）。
- **MoveToOwnRightEdge** 是健全性族：语法层已含 `Pos+Ext−1`，Bounds 叶子不需要打开层级。
- 确认边 5076 条全部带完整四 witness（`b_witness_full = b_edges_confirmed`）；待证边 296 条（NF 后仍有自由叶子但 counterfactual 未观察到变化）**不进入已确认偏序**；`TypeGeneralization` 边在这些族中为 0（grounded 域不是单一 sort）。
- 墙钟（并行运行、有争用）：打开层级的实例 10–33 s，其中快照构建 `b_snapshot_work = 240 924`（宽度族）/ `803 080`（ThresholdIf）次 DAG 评估；NoSharedVSA 的参考评估为 1 266 384 / 4 221 280（5.3×）。

## 4. 真实 ARC-AGI-1 训练集 400 题（train-only）消融

主表（`results/stage_b/arc/summary.md`、`results/stage_b/metrics.csv`）：

| 配置 | train_exact | timeout | 快照任务 | 节点总 | 类总 | 确认边 | 待证边 | 类型边 | 类检查 | 行查找 | flat 行求值 | typed-hole 评估 | search_work 总 | 峰值 max_live_bytes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| BaselineA（= 阶段 A FullA） | 7/400 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 32 762 481 | 64 391 739 | 384 MB |
| B0Only | 7/400 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 32 520 096 | 64 165 753 | 384 MB |
| NoStructuralGeneralization | 7/400 | 1 | 32 | 1 760 000 | 184 399 | 0 | 0 | 0 | 3 629 199 | 30 460 563 | 0 | 27 780 082 | 113 086 878 | 499 MB |
| NoSharedVSA | 7/400 | 1 | 32 | 1 760 000 | 184 399 | 105 755 | 33 157 | 5367 | 3 629 199 | 30 460 563 | 0 | 27 780 082 | 214 949 238 | 1083 MB |
| NoHierarchy | 7/400 | 1 | 32 | 1 800 000 | 181 099 | 111 005 | 36 855 | 5367 | 0 | 0 | 31 089 151 | 29 880 073 | 113 790 128 | 640 MB |
| FullB（GeneralFirst） | 7/400 | 2 | 31 | 1 720 000 | 172 277 | 108 178 | 36 206 | 5367 | 3 658 533 | 28 653 615 | 0 | 27 420 067 | 107 911 929 | 1053 MB |
| FullB-SpecificFirst | 7/400 | 1 | 32 | 1 800 000 | 181 099 | 111 005 | 36 855 | 5367 | 3 861 846 | 29 873 493 | 0 | 28 680 070 | 111 530 767 | 1057 MB |
| FullB-CostFirst | 7/400 | 1 | 32 | 同上 | 同上 | 同上 | 同上 | 5367 | 3 861 846 | 29 873 493 | 0 | 28 680 070 | 111 530 767 | 962 MB |
| FullB-Interleaved | 7/400 | 1 | 32 | 同上 | 同上 | 同上 | 同上 | 5367 | 3 861 846 | 29 873 493 | 0 | 28 680 070 | 111 530 767 | 1141 MB |

- **BaselineA 与阶段 A FullA 在 400 题上程序与状态逐题相同**（`same_as_stage_a_fulla: 400/400`）：阶段 B 的所有开关默认关闭时零回归。
- **train-exact 集合在 9 个配置下完全相同**：`05f2a901, 1caeab9d, 1cf80156, 25ff71a9, 5521c0d9, 681b3aeb, beb8660c`（与 v0.6.1、阶段 A 相同的 7 题）。**没有新增，也没有丢失**。
- SizeRule-exact：369/400（BaselineA、B0Only），FullB 367（2 个超时任务未计）。size rule 仍走阶段 A 的 typed 搜索，层级不参与。
- 超时（60 s 墙钟，含争用）：FullB `2dd70a9a`、`3906de3d`；三种其它调度与 NoHierarchy 仅 `2dd70a9a`；NoStructuralGeneralization/NoSharedVSA 仅 `ed36ccf7`。这些任务在 BaselineA 下 3–14 s 内以 `transformation` 失败；打开层级后它们在 27–58 s 完成或超时，即**超时全部是层级的额外开销造成的**，不改变 train-exact。
- **FullB 与 BaselineA 都 train-exact 但程序不同的 3 题**（层级确实参与了选择）：
  - `05f2a901`：FullB 用 B0 原语 `first-AX = If(Lt(CountObjects, MaxX(Current)), PosX, ExtX)`（层级解出 4/6 个槽），typed-hole 评估从 1 080 127 降到 360 000，`search_work` 1 147 525 → 1 157 823（快照构建工作计入）。
  - `1caeab9d`：FullB `AY = SetMaxY − (GridHeight mod CountObjects)`（层级解 1/1 槽，typed-hole 评估 180 017 → 0，`search_work` 244 416 → 458 895）。
  - `681b3aeb`：FullB `AY = ((MaxY mod SetMaxY) mod SceneHighY)` 替代 `3 − ExtY`（层级解 2/2 槽，typed 360 009 → 0，`search_work` 425 019 → 609 501）。
  三者都是训练一致的不同候选被 prior 选中；本轮不评价哪一个更“对”。

### 4.1 失败环节分布（非 train-exact 任务）

| 配置 | size_rule | cardinality | alignment_validation | alignment | transformation | grid_realization | grid_exact_check | 超时 |
|---|---|---|---|---|---|---|---|---|
| BaselineA / B0Only | 31 | 289 | 34 | 2 | 25 | 4 | 8 | 0 |
| FullB | 31 | 289 | 34 | 2 | 22 | 4 | 9 | 2 |
| 其它 B 配置 | 31 | 289 | 34 | 2 | 23–24 | 4 | 8–9 | 1 |

FullB 相对 BaselineA 的迁移：389 题环节不变；`transformation → none`（超时）2 题；`transformation → grid_exact_check` 1 题（`6150a2bd`：层级解出 50/50 个槽后进入实现阶段才失败）。**289 题（占 400 题的 72%）在 cardinality 前提（输入/输出对象数不等）处失败，任何指称层改动都触不到它们。**

### 4.2 预算截断与 witness 覆盖

| 配置 | universe 截断（40 000 节点/轴） | 边预算截断 | 层/槽截断 | 运行级层级预算耗尽（`b_global_truncations`） | typed-hole 截断 | 全 witness 边 / 确认边 | VSA 展开不一致 |
|---|---|---|---|---|---|---|---|
| FullB | 43/43 快照 | 0 | 0 | 1265 次 | 457 | 108 178 / 108 178 | 0 |
| NoHierarchy | 45/45 | 0 | 48 个槽 | 1714 | 498 | 111 005 / 111 005 | 0 |
| NoSharedVSA | 44/44 | 0 | 0 | 1206 | 463 | 105 755 / 105 755 | 0 |

每个快照都到达 40 000 节点上限（`b_graph_truncations = 快照数`），即在深度 2、常数 ≤ 1 的宇宙里真实任务的候选数远超预算（例如 `05f2a901` 一轴 85 791 个模板、264 999 个闭项）。所有确认边都带完整四 witness；VSA 展开与参考枚举逐快照一致（`b_vsa_expansion_mismatch = 0`，43 个快照）。

### 4.3 Witnessed VSA：内存与计算分开报告

在 31 个打开层级的任务上（`results/stage_b/per_task.csv`）：

| 量 | FullB（共享 DAG） | NoSharedVSA（逐项求值） | 比 |
|---|---|---|---|
| 签名构建评估数 | `b_dag_evaluations` 20 438 386 | `b_reference_evaluations` 125 794 144（FullB 同口径参考 107 431 576） | **5.3× 更少** |
| `search_work` 总（31 题） | 82 881 321 | 189 918 630 | 2.3× 更少（逐题 1.3×–4.5×，30/30 可比题都更少；`ed36ccf7` 在 NoSharedVSA 下超时） |
| VSA 节点 / 展开候选 | 2 108 268 / 1 720 000（Union 节点 98 932） | 1 766 776 / 1 760 000 | DAG 比扁平项集多 20% 节点 |
| 共享率（类内项大小和 / 可达 DAG 节点，×100） | 均值 174，最大 2258 | 100（定义） | — |
| `max_live_bytes` 中位 / 峰值 | 369 MB / 1053 MB | 402 MB / 1083 MB | 逐题比较：FullB 更低 15 题、更高 15 题（30 题可比） |

结论：共享 DAG **可测地减少评估工作**（5.3× 的签名评估、2.3× 的总 `search_work`），但**没有减少峰值内存**：hash-consed DAG 加上 witness 边与类索引的驻留量与扁平项列表相当，内存由 40 000 节点 × 上下文签名与 `NotSupported` 计数以外的边结构主导。这与提示词 P1“VSA 不丢候选”一致（展开检查 0 不一致），而“可测地节省内存”在本轮**没有被证实**。

### 4.4 分层搜索 vs flat 搜索

| 量（31 个快照任务） | FullB（类搜索，GeneralFirst） | NoHierarchy（flat） |
|---|---|---|
| 层级解出的槽 / 尝试的槽 | 409 / 633 | 162 / 426 |
| 类检查 → 行查找 | 3 658 533 → 28 653 615 | flat 行求值 31 089 151 |
| 免评估成员（`b_candidates_covered`） | 44 861 467 | 0 |
| 槽预算截断 | 0 | 48 |
| `search_work` 总 | 82 881 321 | 88 759 520 |
| train-exact | 7 | 7 |

类搜索以 3.66 M 次类检查覆盖 4.49 千万候选成员，解出的槽数是 flat 的 2.5 倍且无槽截断；但这些额外解出的槽**没有转化为任何新的 train-exact 任务**（后续槽、对齐或实现阶段失败）。总工作相近，因为运行级预算 `sbTotalBudget = 1.2 M` 在两者下都被反复耗尽（FullB 1265 次、NoHierarchy 1714 次）。

### 4.5 调度

| 调度 | 快照任务 | 解出槽 | 类检查 | `search_work` 总 | 超时 |
|---|---|---|---|---|---|
| GeneralFirst（FullB） | 31 | 409 | 3 658 533 | 107 911 929 | 2 |
| SpecificFirst | 32 | 409 | 3 861 846 | 111 530 767 | 1 |
| CostFirst | 32 | 409 | 3 861 846 | 111 530 767 | 1 |
| Interleaved | 32 | 409 | 3 861 846 | 111 530 767 | 1 |

三种非 GeneralFirst 调度在 400 题上的所有确定性计数完全一致（同一 fit 集合，prior 决定选择；它们只改变了类检查顺序，而每个槽要么找到类要么耗尽预算），GeneralFirst 少一个快照任务（`3906de3d` 超时于 60.3 s，其它调度 50–58 s）。**调度不改变 train-exact 覆盖，也几乎不改变计数**；墙钟差异在争用噪声内。

### 4.6 失败归因（FullB，非 train-exact 的 393 题）

| 归因 | 题数 | 说明 |
|---|---|---|
| **cardinality 前提**（输入/输出对象数不等，RankAlign 拒绝） | 289 | 指称层未被调用 |
| **表示：size rule / 对齐**（size_rule 31、alignment_validation 34、alignment 2） | 67 | 在 ScalarFailure 触发之前失败；size rule 仍是阶段 A typed 搜索 |
| **表示：实现/精确检查，未触发 ScalarFailure**（grid_exact_check 7、grid_realization 2） | 9 | 语法层给出训练一致的标量但整体网格不等（对象增删/形状变化不在表示内） |
| **抽象构造：层级打开、解出部分槽，后续槽或实现阶段失败** | 10 | 如 `ed36ccf7`（111/123 槽解出）、`ac0a08a4`（91/91 槽解出后 realization 不等）、`6150a2bd`（50/50 槽解出，网格检查失败）：标量层面训练一致的候选存在，但“所有槽同时一致 + 实现”不可达——现有对象/Anchor 表示或 prior 选择问题 |
| **抽象构造 + 搜索预算：层级打开、有 fitting class 但无槽被接受** | 15 | 层级给出 165–52 960 个 fit，但 `buildClass` 的 counterfactual 分裂/对齐后无一被接受；其中 10 题同时出现运行级预算耗尽（`b_global_truncations` 7–145 次） |
| **表示：层级打开、无 fitting class**（目标在宇宙外） | 1 | `952a094c`（8 个槽，0 fit，58 次预算耗尽） |
| **搜索预算：60 s 墙钟超时** | 2 | `2dd70a9a`、`3906de3d`（BaselineA 分别 3.1 s、9.7 s 失败于 transformation） |

## 5. 对提示词四个问题的回答

1. **指称与边是否按形式定义构建？** 是，并且可被反例测试否定：NF 由 `sigmaVersion` 固定（常数折叠 + 仅全函数恒等式 + 交换排序，偏函数子项不折叠）；`O_A →_C O_B` 要求 `NF(t_A[E_s := F]) = NF(t_B)`、类型一致、F 在 NF 后仍是子项、所有 grounded 训练上下文一致、依赖被 counterfactual 观察到；`x−x`、非特殊值路径、仅训练等价、前提不满足都被拒绝或标记 Unknown；无 counterfactual 证据的边停留在 `PendingDependency`（ARC 上 36 206 条，占确认+待证的 25%），不进入偏序。ARC 400 题上 108 178 条确认边 100% 带完整四 witness，`TypeGeneralization` 边（5367 条）单独计数。未实现：高阶 binder、更丰富的类型泛化证明（P2）。
2. **VSA 是否保留候选并可测地减少内存/计算？** 候选保留：43 个快照的展开与参考枚举全部一致，`NoSharedVSA` 得到相同的类与边。计算：签名评估 5.3× 更少、`search_work` 2.3× 更少（31/31 题）。**内存：未减少**（逐题 15 低 / 15 高，峰值 1053 MB vs 1083 MB）。
3. **分层搜索是否改变 train-exact 覆盖/成本？** 覆盖：**不变**（7/400，与 BaselineA、v0.6.1 同一集合，无新增无丢失）。成本：相对 BaselineA，在 33 个（任一配置下打开层级的）任务上 `search_work` 从 39.4 M 增至 82.9 M（2.1×），墙钟中位 4.2 s → 34.8 s，并带来 2 个超时；相对 flat（NoHierarchy）类搜索少 7% 工作、多解出 2.5× 的槽、无槽截断；调度之间无差异。
4. **失败来自哪里？** 按 §4.6：**74% 是 cardinality 前提**（289/393），19% 是触发前或未触发 ScalarFailure 的表示失败（size rule、对齐、实现，76 题），6% 是抽象构造（层级给出训练一致的标量候选但整体程序不可达，25 题，其中 10 题伴随运行级预算耗尽），0.3% 是宇宙外（1 题），0.5% 是墙钟预算（2 题）。层级在 31 题上实际打开、在 10 题上解出全部或大部分槽，但这些任务的瓶颈是其它槽/实现阶段，不是标量指称的表达力。

## 6. 未完成 / 偏离提示词之处

- 提示词的 ThresholdIf 负控制在现有 typed 层上不存在（§2），改为 INFO 报告。
- `NotSupported` 边只保留前 200 条完整 witness，其余仅计数（ARC 上 3.47 M 条）；它们不进入任何排序或搜索。
- 增加了提示词未列出的运行级预算 `sbTotalBudget = 1.2 M`（与 `saTotalHoleBudget` 对称）；没有它 NoHierarchy 在难任务上不终止。该预算在 ARC 上被频繁耗尽（FullB 1265 次），是层级在 ARC 上“打开但未被充分搜索”的主要原因之一。
- R2 未重跑：回退任务引用 v0.6.1 的 R2 记录（328 no_solution、63 timeout、2 train_exact）。
- P2 项目未做：Shape 代数、一对多对齐、全局 8 邻域、R2 重构、BnB、e-graph 饱和、在线快照更新（`sbOnlinePromotion` 保持关闭）。
- 墙钟数字在争用下测得；重新运行 `./scripts/run_stage_b.ps1 -SkipBuild -SkipTests -SkipMechanism -SkipSmoke` 可在空闲机器上复测。

## 7. 产物索引

| 路径 | 内容 |
|---|---|
| `results/stage_b/validation/*-tests.txt` | 8 个测试套件日志；`app-build.txt` 构建日志 |
| `results/stage_b/mechanism/` | 每实例每配置 JSON（含 `stage_b` 指标与 `referents` 快照摘要）、`*.graph.json` derivation graph、`mechanism_metrics.csv`、`regression_stage_a.csv` |
| `results/stage_b/arc_smoke/` | 8 题冒烟（旧二进制，仅验证流水线） |
| `results/stage_b/arc/` | `data_manifest.json`、`code_version.json`、`run_meta.json`、`tasks/<id>/stage-b-<Config>.json`、`metrics.json`、`audit.json`（每题每配置的失败环节、size rule、stage_b 指标、指称摘要）、`witness_samples.json`（31 题的确认/待证/类型边文本样例）、`summary.md` |
| `results/stage_b/metrics.csv`、`results/stage_b/per_task.csv` | 机器可读汇总与逐题（3600 行）指标 |
