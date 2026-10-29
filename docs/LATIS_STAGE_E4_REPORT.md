# LATIS Stage E4 实测报告

设计见 [LATIS_STAGE_E4.md](LATIS_STAGE_E4.md)，审计见 [LATIS_STAGE_E4_AUDIT.md](LATIS_STAGE_E4_AUDIT.md)。每个数字都可由 `results/stage_e4/e4-20261029-final/` 重算：`python -I scripts/run_stage_e4.py report --out <run>`、`python -I scripts/verify_stage_e4.py --out <run>`、`python -I scripts/report_stage_e4.py --out <run>`。**E4 不产生 `I→O` 程序，不增加 `train_exact`**；本报告所有"Verified"都指"共享骨架能逐格重构全部训练输出，参数为输出观察值"，`prediction_ready=false`。

## 0. 运行信息

| 项 | 值 |
|---|---|
| run id | `results/stage_e4/e4-20261029-final`（`scripts/run_stage_e4.ps1 -Workers 4`，默认模式：单元套件 → 机制矩阵 → Quick40 60 s → regression26 300 s → report/verify → trace） |
| 冻结二进制 | `solver.exe` sha256 `fd6172e1978b20c1dac6df4fe5735da2a3ca61c0f7ec0ec4c74d8d0d76a5abd6`（GHC 9.10.3 `-O2`）；源码 git `950859e1` + E4 改动（提交为 `b30c45a3`）；相对 E3 快照新增 `Output/{Template,Scene,Induce}.hs`、`ARC/OutputMechanism.hs`、`test/OutputMain.hs`，改动 14 个 `.hs` |
| 基线语义 | `E4_Off` = `E31_Full` 的 `regionSearch`/`contentFirst`；所有 E4 配置共用同一求解器语义与预算，只增减 sidecar |
| Quick40 | `manifests/e4_quick40.json`，task-id sha256 `a9f7e7652d354b40ae81c4405e6222c77bb703514a2ef780ebe351f6274b4ac4`，由 `scripts/make_e4_quick40.py` 从 E3.1 冻结结果（`E31_Full` 行）按固定规则 + 种子 20261029 生成，运行前冻结并在 prepare/run 时校验 hash |
| 测试套件 | Output（148 PASS，`validation/Output-tests.log`）、Region（1469 PASS）；其余套件本阶段 `not_run`（E4 不触及对应模块；上次全套运行在 `results/stage_e31/e31-20261028-main/validation`）；Stage B 长套件 `not_run`（`Referent.hs` 未改动） |
| 预算 | 求解器与 E3.1 相同；E4：shape_alts 8 / max_objects 8 / matching 400 / structures 6 / skeletons 6 / view_combos 16 / MDL 3 矩形·面积 64·200000 表达式；Quick40 每题 60 s、regression26 每题 300 s（+10 s watchdog），RTS `-M2g -T -l-au`，4 workers |
| Full400 | **not_run**（默认脚本不跑；历史冻结基线 26/400 来自 E3.1，不是本阶段数据） |

## 1. 机制矩阵（14 家族 × 3 seeds × 7 配置，`mechanism/matrix.json`）

训练 3 对 + heldout 1 对；输入为空白/噪声网格，旧求解器在 294 条记录中 **0 次 train_exact**，`prediction_ready=true` **0 次**。联合配置（`E4_OutputSkeletonOnly / E4_NoMDLScore / E4_NoStructuralSharing / E4_PairwiseOnly`）**168/168** 条记录的状态等于家族期望（`verification.json.mechanism`）。h = heldout 输出上冻结骨架的结构实例化（`oracle_parameter_structural_reconstruction`，不是预测）。

| 家族 | 期望 | OutputSkeletonOnly（3 seeds） | holes | relations | shared / independent（同视图） | ambiguity | h | SingleExplanation | PairwiseOnly（每对） |
|---|---|---|---|---|---|---|---|---|---|
| VariableShellGeometry | Verified | Verified ×3 | 2 | 3 | 33 / 60 | 1 | t | Verified | — |
| DisjointUnionPermutation | Verified | Verified ×3 | 3 | 1 | 54 / 111 | 1 | t | Verified | — |
| DifferentObjectCounts | Verified（Repeat） | Verified ×3 | 1 | 0 | 31 / 120 | 1 | n（Repeat 骨架本版不做 heldout 实例化） | Verified | — |
| SameShapeDifferentColorAndPlacement | Verified | Verified ×3 | 3 | 0 | 49 / 102 | 1 | t | Verified | — |
| DifferentBackgroundViews | Verified | Verified ×3 | 2 | 0 | 32 / 66 | 1 | t | Verified | — |
| AlternateShapeASTs | Verified | Verified ×3（共享结构 = C 形的 3 矩形并，非其最廉价 Diff） | 4 | 2 | 47 / 65 | 1 | t | **RepresentationUnavailable ×3**（只保留最廉价 AST 时无共同结构） | — |
| SharedRelativeConstraints | Verified | Verified ×3 | 1 | 2 | 29 / 66 | 1 | t | Verified | — |
| PairwiseInconsistentAlignment | NoNontrivial | NoNontrivial ×3（8 Hole，65 vs 66） | 8 | 0 | 65 / 66 | 4 | t | NoNontrivial | **每对 Verified**（伪结构） |
| SingleCaseCoincidence | Single | SingleOutputStructuralCompression ×3 | 0 | 0 | 29 / 29 | 1 | f | Single | — |
| DegenerateMemorizationNegative | ReprUnavail | RepresentationUnavailable ×3；退化参考成本 > 独立编码 | — | — | — / 129 | — | n | ReprUnavail | — |
| NonUniqueRoleAssignment | Verified | Verified ×3，**ambiguity 4** | 2 | 0 | 35 / 66 | 4 | f | Verified | — |
| OutputOnlyNotInputExecutable | Verified | Verified ×3，train_exact=false | 1 | 1 | 26 / 60 | 1 | t | Verified | — |
| NonLinearCounts | ReprUnavail | RepresentationUnavailable ×3（`UnsupportedVariableMultiplicity`） | — | — | — / 84 | — | n | ReprUnavail | — |
| RegionAsWholeOutput | Verified | Verified ×3（`BgNone`，`Rect(0,0,?w-1,?h-1)` 偏移） | 3 | 2 | 29 / 36（任意视图最便宜 12，背景色即整幅） | 1 | t | **NoNontrivial**（最廉价 Scene 是背景色画布） | — |

读法：
- 验收项"非平凡跨全部输出的 Shell 共享 AST"：`VariableShellGeometry` 的骨架为 `Place((Rect(0,0,?0,?1) \ Rect(1,1,?0-1,?1-1)), colour c, at (?x,?y))`——内框是外框的 `IOff` 偏移，2 个 Hole、3 个关系（审计家族也在 `OutputOnlyNotInputExecutable` 上重现：1 Hole + 1 关系）。
- "对象顺序被打乱"：`DisjointUnionPermutation` 的角色成员在各 case 的光栅 id 不同，颜色全为字面（按结构 + 成本对齐，不按下标）。
- "对象数量不同"：`DifferentObjectCounts` 归纳出 `Repeat(Place(Rect(0,0,1,1), colour c, at (1,2)), count ?0, step (3,0))`；无线性结构的 `NonLinearCounts` 精确报 `UnsupportedVariableMultiplicity`——本项**完成但覆盖有限**：只有等差放置的同 mask 重复能表达，heldout 上的 Repeat 实例化未实现（记 `not_attempted`）。
- "pairwise 不一致"：`PairwiseInconsistentAlignment` 每对输出单独归纳都 Verified（每对共享一个完整对象），全体联合只剩 8 个自由 Hole（65 vs 66），判 `NoNontrivialSharedStructure`；它同时暴露了一个设计教训：2×2 方块的局部 `Rect(0,0,1,1)` 永远是字面，非平凡判定因此排除每个形状第一个矩形的归一化锚点（设计 §1）。
- 反记忆化：退化参考成本（每像素 Hole / 整幅 Hole / case 分支）在所有家族都高于独立编码；`DegenerateMemorizationNegative` 没有合法对齐。
- 对称角色：`NonUniqueRoleAssignment` 的 2^(n−1)=4 个角色分配成本相同，骨架规范形相同，`ambiguity=4` 写入记录，没有 id 破对称。
- `SingleCaseCoincidence`：n=1 只报 `SingleOutputStructuralCompression`，heldout 实例化失败（全字面骨架）。
- 消融：`E4_NoCrossOutput` 42/42 `NotAttempted`（只有独立编码成本）；`E4_SingleExplanation` 丢掉 `AlternateShapeASTs`（备选 AST 的价值）和 `RegionAsWholeOutput`（最廉价 Scene 是背景色画布）；`E4_NoMDLScore`/`E4_NoStructuralSharing` 与 OutputSkeletonOnly 状态全同（小宇宙上共享/非共享给出相同骨架，单元测试逐实例断言）。机制墙钟：Off 37.5 s、OutputSkeletonOnly 48.5 s、PairwiseOnly 71.8 s、NoStructuralSharing 70.2 s（42 实例）。

## 2. Quick40（40/40，60 s，4 workers，6.7 min）

| 配置 | train-exact | 与 E4_Off 同程序且同 exactness | 逐格重放 | E4 状态 | holes 中位 | 压缩比中位 | 配对墙钟 off / cfg（共同完成题） | 峰值 live | prediction_ready |
|---|---|---|---|---|---|---|---|---|---|
| E4_Off | 8 | — | 8/8 | （关闭） | — | — | — | 133 MB | 0 |
| E4_OutputSkeletonOnly | 8 | **40/40** | 8/8 | Verified 9，RepresentationUnavailable 28，timeout 3 | 5 | 0.59 | 226.1 / 239.5 s（+5.9%，37 题） | 169 MB | 0 |
| E4_NoCrossOutput | 8 | **40/40** | 8/8 | NotAttempted 37，timeout 3 | — | — | 226.1 / 239.6 s（+5.9%，37 题） | 172 MB | 0 |

- 旧 8 道解（4 Region + 2 content-first + 2 Size-first）在三配置下程序与 exactness 完全相同，预测网格逐格等于目标；sidecar 从未改变求解器结果（`solver_invariance_violations=0`）。
- 超时（60 s 诊断预算）：`0dfd9992`、`264363fd`、`484b58aa`（高成本分层，E3.1 下分别 82 / 179 / 215 s）在三配置都超时；`7837ac64`（E3.1 62.6 s）在第一轮运行中只在 `E4_NoCrossOutput` 超时、最终轮三配置都完成——60 s 预算边缘的调度噪声，不是 sidecar 行为差异。本阶段未对这 4 题补跑 300 s（`-Quick40Also300s` 开关存在，未启用）。
- 按分层（OutputSkeletonOnly）：solved_regression 4 Verified / 4 ReprUnavail；representation_failure 2 / 10；construction_failure 1 / 7；random_unsolved 2 / 6；high_cost 0 / 1（+3 timeout）。
- 9 道 Verified 的骨架：

| 任务 | 旧 solver | 骨架（Hole 数 / 关系数，shared / independent 同视图） |
|---|---|---|
| 2dc579da | train_exact（Region） | `Canvas(?0x?0, background ?1) { Place(Rect(0,0,0,0), colour ?2, at (?3,?4)) }`（5 / 0，38 / 39）：输出是一个方形画布上的单像素 marker，画布边长共享同一 Hole |
| 5582e5ca | train_exact（Region） | `Canvas(3x3, no residual) { Place(Rect(0,0,2,2), colour ?0, at (0,0)) }`（1 / 0，17 / 36） |
| d9fac9be | train_exact（Region） | `Canvas(1x1, no residual) { Place(Rect(0,0,0,0), colour ?0, at (0,0)) }`（1 / 0，18 / 48） |
| aabf363d | train_exact（Size-first） | 7×7 画布上一个 5 矩形 row-run 并的对象，6 Hole / 4 关系（65 / 74）：形状来自 row-run 分区备选（面积 >64 的对象只有该解释），关系为相邻行的偏移 |
| 25d8a9c8 | no_solution | `Canvas(3x3, background 0) { Place(Rect(0,0,2,?0), colour 5, at (0,?1)) }`（2 / 0） |
| 27a28665 | no_solution | `Canvas(1x1, no residual) { Place(Rect(0,0,0,0), colour ?0, at (0,0)) }`（1 / 0） |
| 6773b310 | no_solution | 3×3 画布，两个颜色 1 对象（5 / 0） |
| b94a9452 | no_solution | `Canvas(?0x?0, no residual) { Place((Rect(0,0,?0-1,?0-1) \ Rect(?1,?1,?2,?2)), colour ?3, at (0,0)); Place(Rect(0,0,?4,?4), colour ?5, at (?1,?1)) }`（6 / 2）：外框差内框 + 内方块，方形关系与画布边长偏移 |
| bb43febb | no_solution | 10×10 画布，Shell `Rect(0,0,?0,4) \ Rect(1,1,?0-1,3)` + 内部对象，5 Hole / 11 关系 |

- 28 道 `RepresentationUnavailable` 的原因：`NoJointRoleAlignment` 20（某个 (颜色, 签名) 对象类在各输出的数量不同且不是等差重复，如 e50d258f `[3,4,7]`、543a7ed5 `[7,6]`）、对象超预算 7（每个合法视图 >8 个对象：1c786137、c909285e、90f3ed37、4c5c2cf0、6e19193c、8731374e、af902bf9——第一轮运行记为 `NoLegalOutputView`，最终运行记为 `ObjectRepresentationUnavailable`，见 §7）、`UnsupportedVariableMultiplicity` 1（d9f24cd1）。
- sidecar 成本（OutputSkeletonOnly，40 题和）：shape 备选枚举 15.4 s（最大 444801d8 约 1.5 s）、反统一约 1 ms、渲染约 2 ms；墙钟 +13.4 s（+5.9%）；峰值 live 169 vs 133 MB。`E4_NoCrossOutput` 也要枚举备选（15.1 s），说明成本几乎全在输出 Scene/Shape 解释而不在联合归纳。

## 3. regression26（26/26，300 s，4 workers，1.3 min）

| 配置 | train-exact | 同程序且同 exactness | 逐格重放 | E4 状态 | 配对墙钟 |
|---|---|---|---|---|---|
| E4_Off | **26/26** | — | 26/26 | — | 92.9 s |
| E4_OutputSkeletonOnly | **26/26** | **26/26** | 26/26 | Verified 13，NoNontrivial 2，RepresentationUnavailable 11 | 102.4 s（+10.3%） |

Verified 13：1caeab9d、1f85a75f、23b5c85d（`Canvas(?0x?1, no residual){Place(Rect(0,0,?0-1,?1-1), colour ?2)}`）、25ff71a9、2dc579da、5168d44c（Shell + `Repeat` 标记列，8 Hole / 1 关系，74 / 213）、5521c0d9、5582e5ca、681b3aeb、a79310a0、aabf363d、c8f0f002（12 Hole / 5 关系）、d9fac9be。NoNontrivial 2：05f2a901（13 Hole，100 vs 96）、9565186b（8 Hole，67 vs 58）——成本不低于独立编码，诚实拒绝。RepresentationUnavailable 11：数量变化无重复结构 7（0b148d64、4347f46a、810b9b61、be94b721、beb8660c、d037b0a7、1cf80156）、对象超预算 2（1c786137、c909285e）、背景类型不一致 2（a740d043、b1948b0a：部分输出有单色余像素、部分无——同视图下不能统一，混合视图分配也未成功）。

## 4. 独立核验（`verification.json`，Python 解释器）

| 项 | Quick40 | regression26 |
|---|---|---|
| 记录 / 含骨架 | 120 / 9 | 52 / 15 |
| Python 重渲染逐格等于训练输出 | 9/9 | 15/15 |
| 篡改测试（绑定 +1、删 Hole、改背景）全部破坏 | 9/9 | 15/15 |
| 来源标记（OutputObserved / NotAttempted / prediction_ready=false / 角色成员互异） | 9/9 | 15/15 |
| 求解器不变性（E4_Off vs sidecar：程序文本 + train_exact） | 0 违反 | 0 违反 |

机制：联合配置 168/168 状态如期；`E4_Off` 42 条无骨架；`E4_NoCrossOutput` 42 条 NotAttempted；heldout 结构实例化 true 132 / false 30 / not_attempted 132（Repeat 与关闭的配置）。trace 页（543a7ed5 / e50d258f / 2dc579da × OutputSkeletonOnly）headless Chrome 自检 `errors=[]`，2dc579da 页渲染 5 行 Hole、1 行角色、3 行构造 Witness。

## 5. 定向任务诊断

| 任务 | OutputSceneReconstruction | AllOutputSkeletonInduced | SkeletonEnumerable / Reached / WitnessAccepted | InputBindingReady | ActualTrainExact | 失败步骤 |
|---|---|---|---|---|---|---|
| 543a7ed5 | 是（Legacy 视图，7 / 6 个单色对象，Shell 类 `D(R,R)`） | 否 | — | NotAttempted | 否 | **Alignment**：颜色 3 的 Shell 类在两输出中 7 对 6 个，位置不是等差序列 → `UnsupportedVariableMultiplicity`（`NoJointRoleAlignment`）；对象提取与 Shape AST 都没有挡住它，挡住的是可变数量的集合表达 |
| e50d258f | 是 | 否 | — | NotAttempted | 否 | **Alignment**：颜色 2 对象类数量 `[3,4,7]`；E3 已知的输入侧缺口（`CountColor/ArgMax`）本阶段未触及 |
| 2dc579da | 是 | **是**（5 Hole） | 是 / 是 / 是 | NotAttempted | 是（Region，E3 程序不变） | — |
| 1c786137 | 否（每个合法视图 17 / 10 / 24 个对象 > 8） | 否 | — | NotAttempted | 是（Region） | **ObjectExtract/预算**：对象数超过 `obMaxObjects=8` |
| 5582e5ca | 是 | 是（1 Hole：颜色） | 是 / 是 / 是 | NotAttempted | 是 | — |
| d9fac9be | 是 | 是（1 Hole：颜色） | 是 / 是 / 是 | NotAttempted | 是 | — |
| c909285e | 否（9–12 个对象 > 8） | 否 | — | NotAttempted | 是（content-first） | ObjectExtract/预算 |
| 0b148d64 | 是 | 否 | — | NotAttempted | 是（content-first） | Alignment：颜色 2 类 `[4,5,5]` |
| 90f3ed37 | 否（9–30 个对象 > 8） | 否 | — | NotAttempted | 否 | ObjectExtract/预算 |
| 484b58aa | — | — | — | — | 否（60 s timeout；E3.1 下 215 s） | 预算 |

543a7ed5 的结论与任务书的预判一致：E4 **不能**在 `Shape/Scene` 骨架层表达"每个框各画一个外壳"这种数量可变、位置不规则的集合；需要的是把输出对象与输入对象建立关系（E5 的参数绑定/`Map`），不是更深的输出侧归纳。

## 6. 成本与资源

| 量 | 值 |
|---|---|
| Quick40 配对墙钟（37 共同完成题） | E4_Off 226.1 s → OutputSkeletonOnly 239.5 s（+5.9%），NoCrossOutput 239.6 s（+5.9%） |
| regression26 配对墙钟 | 92.9 → 102.4 s（+10.3%） |
| sidecar 分项（OutputSkeletonOnly，Quick40 和） | `e4_shape_alternatives` 15.4 s、`e4_antiunify` 约 1 ms、`e4_render` 约 2 ms；regression26：9.8 s / 约 8 ms / 约 14 ms |
| 峰值 live（Quick40） | 133 MB（Off）→ 169 MB（OutputSkeletonOnly） |
| 机制墙钟（42 实例） | Off 37.5 s、OutputSkeletonOnly 48.5 s、PairwiseOnly 71.8 s、NoStructuralSharing 70.2 s |

成本结论：E4 的开销几乎全部是输出对象的跨层 Shape 备选枚举（E3.1 的 MDL 缓存在这里以"每题按归一化 mask 去重的惰性表"复用，`icSharing=False` 时机制墙钟 +45%；两轮正式运行间墙钟相差约 5%，属机器负载噪声）；反统一与渲染是毫秒级。

## 7. 运行中发现并修正的问题

1. 机制家族设计三次被数据否定并修正：`BackgroundViewSelectorDivergence`（E3.1 遗留）之外，本阶段 `NestedRegionOwnership` 类似问题不存在；`PairwiseInconsistentAlignment` 初版被联合归纳找到了意外关系（位置 = 尺寸−1）和 2×2 方块的恒定局部矩形，改为"三个方块两两共享一个完整对象"并用 Python 穷举全部双射核对无共同字面/偏移；`NonUniqueRoleAssignment` 初版两个方块可被位置区分（ambiguity 1），改为镜像放置。
2. `renderScene` 的 `Repeat` 实例未按 k·(dx,dy) 平移（`DifferentObjectCounts` 全部 render 失败 → `StructureVerifiedSubset`）：已修。
3. 非平凡判定初版把归一化锚点 `(0,0)` 当作对象字面，使 8 Hole 的平凡骨架以 65 < 66 通过：改为排除锚点与画布常量。
4. `shapeAlternatives` 对 5×3 bbox 的第 3 层被 200000 表达式预算截断（状态 `Truncated`），测试按状态接受。
5. 第一轮正式运行（`results/stage_e4/e4-20261029-main`）把"所有合法视图对象数超预算"的输出标为 `NoLegalOutputView`；最终二进制改为 `ObjectRepresentationUnavailable`（`rejected_views` 中原始原因一直可查）。除该原因文本外，最终运行与第一轮的状态、骨架、计数逐题相同（`172 条逐题记录对照：status / train_exact / 程序 / E4 状态 / 骨架全部相同，只有 7 条 E4 reason 文本变为 ObjectRepresentationUnavailable，以及 7837ac64 在 E4_NoCrossOutput 下第一轮 60 s 超时、最终轮未超时`）。
6. Haskell JSON 写出 `show (i,j)` 产生非法 JSON（机制矩阵），已改为数组。

## 8. 验收对照

| 要求 | 结果 |
|---|---|
| 3-seed 机制正例存在非平凡跨全部输出的 typed Skeleton，允许尺寸/位置/颜色变化，逐格重构 | 满足：9 个正例家族 ×3 seeds（§1），Python 独立重渲染 |
| 对象顺序打乱不按下标 zip；重复对象歧义保留 | 满足：DisjointUnionPermutation（成员 id 跨 case 不同）、NonUniqueRoleAssignment（ambiguity 4） |
| 对象数量不同时归纳有证据的集合结构，否则报具体不可表达点 | **部分完成**：等差放置的同 mask 重复 → `Repeat`（DifferentObjectCounts、5168d44c）；其它数量变化 → `UnsupportedVariableMultiplicity`/`NoJointRoleAlignment`（NonLinearCounts，Quick40 20 题）；heldout 上的 Repeat 实例化 `not_attempted` |
| Shell = RectOuter \ RectInner 的跨输出共享 AST 与相对几何 | 满足：VariableShellGeometry（2 Hole / 3 关系）、b94a9452、bb43febb |
| pairwise 一致但全体不一致的负例被拒绝，全局 Witness 独立重放 | 满足：PairwiseInconsistentAlignment |
| 反记忆化负例拒绝；成本惩罚空洞模板 | 满足：DegenerateMemorizationNegative；退化成本 > 独立编码；非平凡判定 |
| OutputObserved / NotAttempted / prediction_ready=false 精确记录；不增加 train_exact | 满足：294 + 172 条记录中 `prediction_ready=true` 0、train_exact 与 E4_Off 完全相同 |
| Sidecar on/off 旧 26 解逐格回归 | 满足：26/26 同程序、同 exactness、逐格相同 |
| Stage B 候选/VSA 不受影响；小宇宙共享/非共享一致 | 满足：`Referent.hs` 未改动；`E4_NoStructuralSharing` 与 OutputSkeletonOnly 状态/骨架一致（单元测试逐实例断言） |
| 默认只跑 Quick40（+机制/回归），Full400 显式 | 满足：`full400=not_run` |

## 9. 任务书最终问题的回答

1. **能否不先确定 `I→O` 对象对应就从全部训练输出归纳出同一个可执行、可参数化的非平凡骨架？** 能，在有限语法内：机制 9 个正例家族全部 3/3，Quick40 9/40、regression26 13/26 的任务得到逐格可重构的共享骨架；骨架是真正的构造程序（`Rect/⊎/\`、`Place`、线性 `Repeat`、`Canvas`），参数带类型与偏移关系，不是输出 blob。
2. **哪些共享角色可证明，哪些是偶合？** 可证明的是在全部输出联合成立且成本低于独立编码的字面/偏移关系（如 Shell 内缩、方形画布、等差重复）；pairwise 共享对象、单 case 偶合、每像素/每 case 参数都被拒绝或判为平凡；`NonUniqueRoleAssignment` 表明对称角色只能作为歧义集合报告。
3. **保留多解释 + 联合归纳 vs 局部最优/独立编码？** `AlternateShapeASTs` 只有在保留备选 AST 时可对齐（SingleExplanation 失败）；`RegionAsWholeOutput` 只有在不取最廉价 Scene 时才有对象级骨架；代价是备选枚举（Quick40 13.9 s / 40 题），反统一本身毫秒级。
4. **哪些任务找到了骨架但参数 `UnboundToInput`，哪些卡住？** 找到：2dc579da、5582e5ca、d9fac9be、aabf363d、25d8a9c8、27a28665、6773b310、b94a9452、bb43febb（Quick40）及 regression26 的 13 道；卡住：数量可变的对象类（20 + 7 道，含 543a7ed5、e50d258f、0b148d64）、对象数 >8（7 + 2 道，含 1c786137、c909285e、90f3ed37）、背景类型不一致（2 道）、成本不优于独立编码（2 道）。
5. **E5 需要绑定什么？** `OutputSkeletonArtifact` 中每个 Hole 的类型（Int/Colour）、角色路径、逐 case 观察值和约束：Quick40 Verified 任务的 Hole 中位数 5、regression26 中位数 6；多数是画布尺寸、对象位置和颜色，偏移关系已把 Shell 内框、方形画布等约束消去，E5 只需为独立 Hole 合成输入侧 Typed Feature；可变数量的集合则要求 E5/E6 先提供输出对象到输入对象的 `Map/Filter` 关系。

## 10. 限制

- 对象 = 单色 4 连通分量；对象 >8 的输出直接 `ObjectRepresentationUnavailable`；面积 >64 的对象只有 row-run 分区解释。
- `Repeat` 只覆盖同 mask、等差放置；没有 `Map/Filter`、没有多色父对象、没有 Shape 以外的关系（镜像、旋转）。
- 混合视图分配只在同视图全部失败后尝试且上限 16；成本权重为冻结整数，`BoundedBest` 只在枚举宇宙内。
- Quick40 60 s 预算下 3–4 题超时未补跑 300 s；Full400 未跑。
