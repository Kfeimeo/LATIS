# LATIS 阶段 C 实验报告：对象数量可变的合成、Shape 代数与目标驱动的抽象搜索

本报告只记录本轮实际测得的数字；设计与语义见 `docs/LATIS_STAGE_C.md`。所有数字由 `results/stage_c/` 下的机器可读结果生成（`metrics.json`、`per_task.csv`、`mechanism_metrics.csv`、`cardinality_diagnosis.json`），可由 `./scripts/run_stage_c.ps1` 复现。**不做任何 test 泛化声明**：ARC 任务只用训练对；heldout 仅在合成机制任务上作为评分信号报告。

## 1. 运行环境、完整性与基线冻结

| 项 | 值 |
|---|---|
| 主运行 | `run_id = stage-c-20261024T080811Z`；git HEAD `a59f1696`，工作区 diff 哈希 `efcc40df…`，二进制 `build/latis-stage-c.exe` SHA256 `42a4c4e1…`（`results/stage_c/arc/code_version.json`） |
| 数据 | 官方 ARC-AGI-1 training 400 题，`combined_sha256 = 92d2c4df…`，与阶段 B 的 manifest 逐字节相同（`identical_data_vs_stage_b = true`）；泄漏保护（train-only 输入文件、含 test 则 exit 3）未触发 |
| 运行 | 400 任务 × 6 配置，4 个并行进程，Feature 墙钟上限 60 s，RTS `-M4g -T`；总墙钟 1782 s |
| 参考基线 | `BaselineA = ARC.StageAEvaluate.fullA`，`BaselineB = ARC.StageBEvaluate.fullB`（逐字节相同配置）。阶段 A 的结果目录（`results/stage_a`）与 v0.6.1 的目录已被提交 `a59f1696 "Stage A-B and clear results"` 删除；Stage A FullA 的逐题参考取自 `results/stage_b/per_task.csv` 的 BaselineA 行（阶段 B 报告已验证其与 FullA 400/400 程序相同）。v0.6.1 的 R2 结果在该 CSV 中为空，因此本轮**无法引用 R2**（表中 `not_run`） |
| 批次说明 | 主运行与阶段 C 测试套件、机制矩阵部分时间并行执行，**墙钟受 CPU 争用影响**；`search_work`、执行计数、`max_live_bytes` 是确定性的，结论以它们为准。空闲复测见 §9 |

## 2. 自动测试（全部通过）

| 套件 | 断言 | 结果 |
|---|---|---|
| stage-c-tests（`test/StageCMain.hs`） | 426 PASS，1 INFO | `All stage-c tests passed.` |
| stage-b-tests | 286 PASS | 通过 |
| stage-a-tests | 304 PASS | 通过 |
| collection-v61 / v6 / collection / triggered / induced-r2 / feature-pipeline | 315 / 73 / 50 / 46 / 1 / 22 PASS | 全部通过 |

阶段 C 套件覆盖：C1 原语逐像素语义与参数校验（含 Shell 退化为显式错误、三角形四朝向、Union/Intersection/At）、识别特征、规范分解（并列、深度 2 内不可表示 vs 预算截断的区分、分解结果与输入 mask 逐像素相等）、对角视图正例与五类负例（交叉、弯折、斜接触同色对象、相邻同色噪声；异色相邻不阻断）；C2 唯一性失败、构造失败、合并冲突、不连通并集、k<1、witness 种类、语法门控与排序、无恒等候选；C3.1 对象尺寸叶子与唯一性失败、Size2 规则只在对象叶子下可达；机制矿阵（2 种子 × 6 配置：不变量、正负控制、witness/exactness 指标、heldout、触发来源、置换不敏感、确定性、反例对）；回归（BaselineA==FullA、BaselineB==FullB 的程序/失败/`search_work`；FullA 的解在 RelationsOnly 下逐字节不变，在 ObjectShapeFull 下仍 train-exact）；C4 完整性与按需深度；Stage A 的 `CardinalityMismatchStillBlocked` 族在 BaselineA 下仍拒绝、在 Full 下进入关系搜索并如实报告。

测试过程中改掉的两个设计错误（都被回归测试捕获）：(1) 把对象尺寸叶子直接并入 Size2 首轮枚举，使 60 000 次评估预算在到达旧规则前截断，ParityIf 失去解——改为 Stage A 叶子失败后才打开对象叶子；(2) 比较整个 `Program` 记录会被新增字段 `progView` 与更长的 size 代表列表干扰——回归比较改为执行部分（exec/defs/transform/size 表达式）与预测。

## 3. C0 只读 cardinality 诊断（`results/stage_c/validation/cardinality_diagnosis.*`）

400 题训练对的 4 连通对象数关系：相等 86、输出更多 167、输出更少 106、混合 41。本轮 BaselineA 在 cardinality 前提处拒绝的 **289** 题中：

| 粗分类（encoder 事实，不是任务语义） | 题数 | ObjectShapeFull 解出 |
|---|---|---|
| 输出更多，且输入像素 ⊆ 输出像素（加法/复制样） | 102 | 0 |
| 输出更少，其它 | 65 | 1 |
| 输出更多，其它 | 49 | 0 |
| 训练对之间关系不一致（mixed） | 28 | 1 |
| 4 连通不等、8 连通相等（分割视图问题） | 25 | 0 |
| 输出更少，单一输出对象（合并/裁剪样） | 16 | 1 |
| 输出更少，输出像素 ⊆ 输入像素（选择样） | 4 | 0 |

其它事实：289 题中 198 题画布不变、106 题输出引入新颜色、57 题对象数之比为常数、51 题对象数之差为常数、21 题所有输出对象形状都出现在输入中。这些数字只说明当前 encoder + RankAlign 下的失败形态，不是复制/合并标签。

## 4. 合成机制矩阵（`results/stage_c/mechanism/mechanism_metrics.csv`，11 族 × 3 种子 × 6 配置 = 198 行）

198 行中**正控制全部 train-exact、负控制全部非 train-exact**（0 违例）。摘要（T/F 为 3 个种子）：

| 族（规则） | BaselineA / BaselineB / ShapeOnly | RelationsOnly | ObjectShapeFull / GoalDirected | heldout（Full） | 选中变换 |
|---|---|---|---|---|---|
| TranslateSingle（右移 2） | T/T/T | T/T/T | T/T/T | F/T/T（种子 1 为巧合语法解） | 旧路径 |
| KeepColor（保留颜色 2，1–2 个） | F（cardinality 拒绝） | T/T/T | T/T/T | T/T/T | `Select(Color==2); drop others; keep each` |
| ReplicateFit（k = 3,4,5 随画布） | F | T/T/T | T/T/T | T/T/T | `replicate (W_out-PosX) div (Width+1) times, step (Width+1,0)` |
| MergeBBox（2–3 同色矩形 → bbox 矩形） | F | F（无 Shape 构造器） | T/T/T | T/T/T | `merge selected: Rectangle(bbox)` |
| MergeColorConflict（负控制） | F | F（4200/4200 候选，0 fit） | F（7740/7740，0 fit） | – | 无 |
| ShellConstruct（实心 → Shell 1，计数相等） | F（整格校验失败） | F | T/T/T | T/T/T | `each := Shell(Width,Height,1)`（回退触发） |
| DiagonalRecolor（链重着色，孤立像素不变） | F（Color 对齐校验失败） | F | T/T/T | T/T/T | `Select(IsDiagonalBar); keep others; recolor 2`（视图接受 6 链/种子，拒绝 0） |
| DiagonalCrossing（负控制） | F | F | F（视图拒绝 12 链，接受 0） | – | 无 |
| CropLargest（画布 = 最大对象 bbox） | F | F（`size:` 失败：无对象叶子） | T/T/T | T/T/T | `Size2 = (Width,Height)(UniqueLargest)`; `Select(Area==max); crop` |
| CounterexampleConstantCount | F | T/T/T | T/T/T | **F/F/F** | `Select(Area==max); keep others; replicate CountObjects times, step (0,Height+1)` |
| CounterexampleFeatureCount（同训练网格） | F | T/T/T | T/T/T | **T/T/T** | 同上 |

- 反例对：训练网格逐字节相同 → 程序相同 → heldout 恰一个正确；`KConst 3` 与 `KCountObjects` 两种复制都作为 representatives 保留（12 个训练精确变换，选择按代价：常数计 4，输入侧计数不计）。
- 所有关系解的 `c_object_count_exact = c_object_transform_exact = 1`，选中变换都带逐案例 `RelationWitness`。
- 回归行（`regression_baselines.csv`，18 任务 × 6 配置）：BaselineA 与 FullA 程序/预测相同 18/18；BaselineB 与 FullB 相同 18/18；RelationsOnly 与 FullA 程序相同 18/18；ShapeOnly / Full / GoalDirected 预测相同 18/18（程序文本在 17 题不同：`progView` 字段与 size 代表列表，执行部分相同）。
- 墙钟（与 ARC 运行并行，有争用）：打开关系搜索的实例 0.4–5.5 s；候选数 3507（RelationsOnly，2 色）至 8477（Full，含形状谓词）；预算（200 000 次案例执行）从未截断。

## 5. 真实 ARC-AGI-1 训练集 400 题（train-only）消融

### 5.1 主表（`results/stage_c/arc/summary.md`、`results/stage_c/metrics.csv`）

| 配置 | train_exact | timeout | 新增 vs FullA | 丢失 | SizeRule-exact | Object-Count-exact | Object-Transform-exact | 进入关系搜索 | 找到可执行关系 | 关系搜索截断 | search_work 总 | 墙钟总 (s，争用) | 峰值 max_live_bytes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| BaselineA | **7/400** | 0 | — | — | 369 | 0 | 0 | 0 | 0 | 0 | 64 391 739 | 387 | 370 MB |
| BaselineB | 7/400 | 4 | — | — | 365 | 0 | 0 | 0 | 0 | 0 | 101 083 605 | 1357 | 660 MB |
| ShapeOnly | 7/400 | 1 | — | — | 382 | 0 | 0 | 0 | 0 | 0 | 90 920 145 | 762 | 358 MB |
| RelationsOnly | **13/400** | 2 | 1f85a75f, 9565186b, a740d043, b1948b0a, c8f0f002, d037b0a7 | — | 367 | 4 | 4 | 360 | 6 | 0 | 66 441 121 | 678 | 372 MB |
| ObjectShapeFull | **17/400** | 3 | 上述 6 + 23b5c85d, 4347f46a, 810b9b61, be94b721 | — | 380 | 8 | 8 | 373 | 10 | 0 | 94 408 939 | 1318 | 357 MB |
| ObjectShapeGoalDirected | **17/400** | 4 | 同 Full | — | 379 | 8 | 8 | 372 | 10 | 0 | 135 475 677 | 2074 | 921 MB |

- **无丢失**：7 个旧 train-exact 任务在所有配置下仍 train-exact（Full 下 7 题程序文本不同，仅因新增 `progTransform/progView` 字段与 size 代表列表；BaselineA 与 Stage A FullA 状态逐题相同 400/400，程序文本相同 393/400，差异恰为这 7 题的新字段）。
- BaselineB 与阶段 B FullB：状态相同 397/400（3 题 `3906de3d, 85c4e7cd, ed36ccf7` 本轮在 60 s 争用下超时，阶段 B 中以 `transformation` 失败），程序文本相同 393/400（同上原因）。
- 超时：RelationsOnly `0dfd9992, 484b58aa`；Full 另加 `264363fd`（ShapeOnly 也在此超时：Shape 审计 + 大对象数）；GoalDirected 再加 `2dd70a9a`（继承 Stage B 层级开销）。它们在 BaselineA 下 3–30 s 内失败，即超时都是新增搜索的开销，不改变 train-exact 集合。

### 5.2 新增的 10 道 train-exact 任务（`results/stage_c/arc/new_solutions.json`，逐题 `results/stage_c/new_solutions/<id>/{solution.json,trace.txt,derivation_graph.json}`）

每题的程序在**每个训练输入上重新执行**并与训练输出整格相等（`arc-train-only-stage` 的 `train_exact` 由独立再执行判定）。触发：card = cardinality 不等，fb = 计数相等但旧路径失败后的回退触发。

| 任务 | 触发 | 配置 | 选中变换（TSL） | Size2 规则 | 幸存变换数 | Object-Transform-exact | 关系 witness（第 1 案例） |
|---|---|---|---|---|---|---|---|
| 1f85a75f | card | RelationsOnly, Full, GD | `Select(Area==unique max); drop others; crop` | `(3, 2+(CountObjects mod CountShapes))` | 2 | ✓ | 83 → 1 对象，`[([30],0)]`，其余 82 个删除 |
| 23b5c85d | card | Full, GD | `Select(Area==unique min); drop others; crop` | `(Width,Height)(UniqueSmallest)` | 1 | ✓ | 2 → 1，`[([1],0)]`，删除 `[0]` |
| 4347f46a | fb | Full, GD | `Select(all); each := Shell(Width,Height,1)` | 恒等 | 11 | ✓ | 4 → 4 一对一（几何变化） |
| 810b9b61 | fb | Full, GD | `Select(IsShell(Shape)); keep others; recolor 3` | 恒等 | 1 | ✓ | 8 → 8 一对一 |
| 9565186b | card | RelationsOnly, Full, GD | `Select(Not(Area==unique max)); keep others; recolor 5` | 恒等 | 1 | ✗（重着色后与邻接对象合并为一个输出对象：整格精确，对象级不一一对应） | 3 → 2，`[([0],0)]`，未解释输出 `[1]` |
| a740d043 | card | RelationsOnly, Full, GD | `Select(IsRectangle(Shape)); drop others; crop` | `(GridWidth-4, 6+(CountObjects-GridWidth))` | 3 | ✓ | 4 → 3，删除 `[0]` |
| b1948b0a | fb | RelationsOnly, Full, GD | `Select(Color==unique most frequent); keep others; recolor 2` | 恒等 | 4 | ✓ | 5 → 5 一对一 |
| be94b721 | card | Full, GD | `Select(Area==unique max); drop others; crop` | `(If(IsOdd(GridWidth),CountObjects,2), Height(UniqueLargest))` | 1 | ✓ | 3 → 1，删除 `[1,2]` |
| c8f0f002 | fb | RelationsOnly, Full, GD | `Select(Color==7); keep others; recolor 5` | 恒等 | 1 | ✓ | 6 → 6 一对一 |
| d037b0a7 | fb | RelationsOnly, Full, GD | `Select(all); replicate (GridHeight-PosY) div Height times, step (0,Height)` | 恒等 | 12 | ✗（复制列与下方对象在输出中连成一个对象） | 3 → 3，`[([2],2)]`，未解释 `[0,1]` |

注意事项（如实）：`1f85a75f`、`a740d043`、`be94b721` 的 Size2 规则是训练精确但显然偶然的算术表达式（如 `2+(CountObjects mod CountShapes)`），因为对象叶子只在 Stage A 叶子失败后打开，而 Stage A 叶子已找到一个巧合规则；`be94b721` 的宽度 `If(IsOdd(GridWidth),CountObjects,2)` 同类。这些程序是训练精确的 TSL，但其 size 部分不是"正确"的解释——本报告不对 heldout 作任何声明。`Object-Transform-exact` 与 `Full-Grid-exact` 的 2 处分离（9565186b、d037b0a7）正是两者分开计量的意义：渲染后同色邻接对象合并，对象级关系不再一一对应。

### 5.3 cardinality 集合（289 题）的三个数量

| 配置 | 进入关系搜索 | 找到可执行关系 | 完整 train-exact |
|---|---|---|---|
| BaselineA / BaselineB / ShapeOnly | 0 | 0 | 0 |
| RelationsOnly | 287 | 3 | 3（1f85a75f, 9565186b, a740d043） |
| ObjectShapeFull / GoalDirected | 286（3 题在进入前超时） | 3 | 3（同上） |

"找到可执行关系"与"train-exact"相等（搜索只接受整格精确的变换，所以不存在"找到关系但不精确"的情况：`found_but_not_exact = []`）。Full 在 289 题上的首次拒绝：`relation_search` 280、timeout 3、train-exact 3、`grid_exact_check` 2（视图改变了计数相等性后进入旧路径）、`alignment_validation` 1。289 题中 Full 的关系搜索：每题尝试候选中位 9222（最大 13 067），案例执行总 2 760 583，**预算截断 0 次**——即 283 题是在**枚举完整个变换语法**后无解，不是预算问题。

### 5.4 首次拒绝原因分布（非 train-exact 任务）

| 配置 | size_rule | cardinality | relation_search | alignment_validation | alignment | transformation | grid_realization | grid_exact_check | timeout |
|---|---|---|---|---|---|---|---|---|---|
| BaselineA | 31 | 289 | 0 | 34 | 2 | 25 | 4 | 8 | 0 |
| ShapeOnly | 17 | 305 | 0 | 29 | 3 | 23 | 3 | 12 | 1 |
| RelationsOnly | 31 | 0 | 284 | 33 | 1 | 25 | 4 | 7 | 2 |
| ObjectShapeFull | 17 | 0 | 298 | 27 | 2 | 23 | 3 | 10 | 3 |
| ObjectShapeGoalDirected | 17 | 0 | 298 | 27 | 2 | 19 | 3 | 13 | 4 |

- 对象尺寸叶子把 `size_rule` 失败从 31 降到 17：14 题得到训练精确的 Size2（如 `6b9890af/b94a9452/e6721834`：`(Width,Height)(UniqueLargest)`；`d631b094`：`(CountCells, CountShapes)`；`469497ad/b91ae062`：`GridWidth×CountColors`），但其中只有 `23b5c85d/be94b721` 随后整格精确；其余在对齐/关系搜索处失败（`size_rule -> relation_search` 8、`-> transformation` 2、`-> grid_exact_check` 2）。
- 对角视图使 ShapeOnly 的 cardinality 失败从 289 **增至 305**：在 20 题（如 `234bbc79, 3de23699, 469497ad, 9172f3a0, a85d4709`）里链合并只发生在一侧，输入/输出对象数由相等变为不等。在有关系搜索的配置里这些题进入 `relation_search` 而非被拒绝，所以 Full 的 `relation_search` 为 298 > 289。
- Full 相对 BaselineA 的迁移：`cardinality -> relation_search` 280、`cardinality -> none` 6（3 解 + 3 超时）、`size_rule -> none` 2、`grid_exact_check -> none` 2、`alignment_validation -> none` 2、`alignment -> none` 1；没有任务从成功变为失败。

### 5.5 Shape 分解与对角视图（Full，400 题；统计单位见下）

统计单位：每个任务内对训练对两侧所有对象的 mask **去重**（`shapeAudit` 的 `M.fromListWith`），各任务的数字再求和，因此同一 mask 出现在两个任务里计两次；对象实例数另列。"已分解"与"截断"不是互斥类别：一个 mask 可以在被预算截断的候选集合内仍找到表达式（`decompose` 第 187 行返回 `Just e` 且 `truncated=True`，其最小性不再有保证）。审计（`scripts/audit_stage_c.py`，`results/stage_c/audit/`）据逐 mask 记录重算如下：

| 量 | 值 |
|---|---|
| 有对象的任务 / 对象实例 / 任务内不同 mask | 397 / 24 931 / 4256 |
| 已分解 | 3297（77.5%），其中 21 个在截断候选集内找到（最小性无保证；保证最小的 3276 = 77.0%） |
| 深度 2 内不可表示（保留原始 mask） | 693（16.3%） |
| 截断且无表达式（面积 > 900 或候选/配对超限） | 266（6.3%） |
| 分区检查 | 3297 + 693 + 266 = 4256 ✓（原报告把 21 个重叠项同时计入"已分解"与"预算截断 287"，故三项之和为 4277） |
| 全数据集去重 mask | 1470，其中已分解 584（39.7%）、不可表示 620、截断无表达式 266：小 mask 跨任务重复，大 mask 多为单任务独有且不可表示 |
| 已分解 mask 的 AST 大小总和 / 平均 | 5623 / 1.71（分母 = 3297 个已分解 mask；无表达式的 mask 计 0） |
| 最小分解并列（Σ max(0, ties−1)） | 7928；`ties` 计所有同最小大小的表达式，**包括原语别名**（1×1 像素同时是 Square/Rectangle/两种 DiagonalBar/四种 Triangle，ties=8），所以它主要反映原语别名而非真正不同的分解 |
| 分解工作（候选 + 配对检查，计入 `search_work`） | 23 234 430 |
| 对角链 接受 / 拒绝（训练两侧） | 1528 / 1436，合并像素 4522，124 题含接受的链 |

拒绝数接近接受数：真实任务中大量斜向像素属于交叉、分叉或与同色对象斜接触的结构，视图按定义拒绝它们（像素保持独立对象），没有全局合并。逐任务计数器与逐 mask 记录在 400 题上无一不一致；修复后的代码新增计数器 `c_shape_decomposed_truncated` 并以回归测试保证分区恒等式（见 `LATIS_STAGE_C_AUDIT_REPORT.md`）。

### 5.6 搜索与内存代价（确定性计数）

| 量 | BaselineA | RelationsOnly | ObjectShapeFull | 说明 |
|---|---|---|---|---|
| `search_work` 总 | 64 391 739 | 66 441 121（+3.2%） | 94 408 939（+46.6%） | Full 的增量主要是 Shape 审计 23.2 M（24.6% 的总量） |
| 关系搜索案例执行总 | 0 | 2 171 368 | 3 611 871 | 候选数随颜色数与形状谓词增长（Full 每题 7011–13 067 候选，全部执行完） |
| 关系搜索触发任务（card / fb） | 0 / 0 | 287 / 73 | 303 / 70 | 回退触发在计数相等但旧路径失败的任务上打开 |
| 峰值 `max_live_bytes` | 370 MB | 372 MB | 357 MB | 关系搜索不增加峰值内存（候选逐个执行、不物化） |
| 墙钟中位 / 总（争用） | 0.34 s / 387 s | 0.70 s / 678 s | 1.44 s / 1318 s | 空闲复测见 §9 |

### 5.7 目标驱动快照（C4）vs 原阶段 B 构建（`ObjectShapeGoalDirected` vs `BaselineB`，36 个打开层级的任务）

| 量 | GoalDirected | BaselineB | 变化 |
|---|---|---|---|
| 快照数 / 节点总 | 84（两级）/ 1 509 313 | 39 / 1 560 000 | 节点 −3.2%（84 个快照中 641 次深度 2 扩展仍到 40 000 上限） |
| 构建工作（DAG 评估） | 16 976 542 | 18 510 994 | −8.3% |
| 参考评估（逐项） | 86 770 171 | 97 300 504 | −10.8% |
| 行查找 | 29 037 729 | 26 537 625 | +9.4%（两级搜索先查深度 1） |
| 层级解出槽 | 611 | 278 | 深度 1 的小宇宙更常给出拟合类（`b_goal_level1_hits` 686） |
| 深度 2 扩展 / 缓存命中 / 查询 | 641 / 1884 / 84 | – | 常数叶子丢弃 128 个（每查询 ≈1.5 个：真实任务里几乎所有叶子都是输入来源） |
| train-exact | 17（与 Full 相同） | 7 | 差异来自 C1–C3，不是 C4 |

结论：在同一有限语法与节点上限下，目标驱动构建少做约 8–11% 的签名求值，并把更多槽在深度 1 解出；但它没有改变 train-exact 集合，而且因为继承了 Stage B 的层级搜索，总 `search_work`（135 M）与峰值内存（921 MB）都显著高于 Full。叶子裁剪在真实任务上几乎不起作用（平均每查询丢弃 1.5 个常数叶子），节省主要来自按需深度。

## 6. 失败归因（ObjectShapeFull，383 个非 train-exact 任务）

| 归因 | 题数 | 证据 |
|---|---|---|
| **DSL 不可表达（关系搜索穷尽，0 截断）** | 298 | `relation_search`：每题 7–13 k 候选全部执行完、无一整格精确；预算 200 000 次执行从未触顶。按 C0 粗分类：102 题"输入 ⊆ 输出"的加法样任务中 0 解——复制语法只有按自身尺寸的等步长副本与常数/计数/贴边数量，没有按其它对象位置或网格线放置的规则；25 题 8 连通题中 0 解——视图只处理严格对角链；输出引入新颜色的 106 题中只有重着色为常数能表达 |
| **表示：Size Rule 无解** | 17 | 对象叶子打开后仍无训练精确的 Size2 |
| **表示：对齐 / 校验**（`alignment_validation` 27、`alignment` 2） | 29 | 计数相等、旧路径与回退关系搜索都无解（关系搜索在这些题上也穷尽） |
| **抽象构造 / 位置**（`transformation` 23、`grid_realization` 3、`grid_exact_check` 10） | 36 | 标量槽或实现阶段失败后，回退关系搜索也无解：需要"位置变化 + 形状/数量变化"的组合，而变换路径不与 sequence-local 位置体合用 |
| **搜索预算（60 s 墙钟）** | 3 | `0dfd9992, 264363fd, 484b58aa`（大对象数：Shape 审计与 7–13 k 候选 × 多案例执行） |

可审计的逐题 witness：`results/stage_c/arc/audit.json` 对每题每配置记录首次拒绝、尝试/执行数、幸存变换与 witness、Shape 分解；`results/stage_c/new_solutions/<id>/trace.txt` 记录 10 道新解的完整触发链。离线人工审计（只读任务文件，不进入 solver）：`d037b0a7`（每个像素向下填充到底边）——选中的 `(GridHeight(Output)-PosY) div Height` 副本数、步长 `Height` 恰好实现"填充到底"，12 个幸存变换中也含常数副本数的巧合读法；`9565186b`（所有非主色单元变为 5）——选中的 `Not(Area==unique max) → 5` 在训练上与之重合，因为主色区域恰是唯一最大对象，这是训练一致但语义不同的读法，heldout 正确性未知且不作声明。

## 7. 验收问题逐项回答

1. **是否不再需要假设一一双射？** 是：`scRelations` 打开后 cardinality 不等的任务进入 `Set[Object] -> Set[Object]` 变换搜索（289 题全部进入，3 题超时除外），计数相等但旧路径失败的任务也进入（70 题）。**可执行且带 witness** 的数量变化类型：选择/过滤（删除，`1f85a75f, 23b5c85d, a740d043, be94b721` 及机制族 KeepColor/CropLargest）、规则复制（`d037b0a7`，机制族 ReplicateFit，副本数与坐标由输入计算）、合并（机制族 MergeBBox，ARC 上 0 解）、Shape 构造（`4347f46a` Shell，机制族 ShellConstruct）、按形状/颜色谓词的重着色（`810b9b61, 9565186b, b1948b0a, c8f0f002`）。旧的一一对齐路径原样保留并优先。
2. **Shape 代数是否精确重建基础形状并识别局部对角长条？** 原语逐像素精确（单元测试），保持单色对象语义（mask 与颜色/位置分离，三类型不混）；ARC 上 77.5% 的不同 mask 在深度 2 内有规范最简分解，16.3% 保留原始 mask，6.7% 超预算。全局编码仍为 4 连通；对角视图在 124 题接受 1528 条链、拒绝 1436 条（交叉/分叉/斜接触），机制族 DiagonalRecolor/DiagonalCrossing 为正负控制。离散正三角形是单一模板（每行 +2 像素）。
3. **Typed Feature / Referent / VSA 是否用于对象数量与几何构造？** 部分：对象数量与几何构造走新的类型化变换语法（谓词/计数/步长/构造器都是类型化、输入侧的），所有训练精确变换作为 representatives 保留（反例对两种读法并存）；Size2 的 Typed Hole 合成通过合法选择器（唯一最大/最小、集合 bbox、颜色数、像素数）引用对象特征（14 题得到新 Size2）。Referent/VSA 层级**没有**扩展到 `Set[Object]`/`ShapeMask` 目标（C4 只做叶子裁剪与按需深度，见 §10）。
4. **400 题上哪些失败被转化？哪些是表示不足、哪些是预算？** 转化：10 题（§5.2），其中 3 题来自 289 cardinality 集合、7 题来自计数相等的回退触发。表示不足：298 + 17 + 29 + 36 = 380 题（关系语法穷尽无解、Size2 无解、对齐/位置组合不可表达）；预算：3 题超时。关系搜索预算截断 0 次。
5. **代价与目标驱动图？** Full 的 `search_work` +46.6%（其中 Shape 审计占 24.6%），关系执行 3.6 M，峰值内存不变（357 MB vs 370 MB），争用下墙钟中位 1.44 s vs 0.34 s；目标驱动图在同一语法/上限下减少 8.3% 构建工作与 10.8% 参考评估，深度 1 解出的槽翻倍，但不改变 train-exact 且总代价高于不开层级的 Full。
6. **是否保留类型安全、解释性、训练等价候选差异与基线回归？** 是：所有新 Feature 带 `NeedConstruct` trigger（`UntriggeredExpansionCount = 0`），无跨对象具体边；非法操作显式失败（唯一性、颜色冲突、不连通、k<1、非矩形 Hollow）；所有训练精确变换保留为 representatives 并记录 witness；BaselineA/B 与 FullA/FullB 状态逐题相同（400/400、397/400，后者 3 题为争用超时），机制回归 18/18；9 个测试套件 1523 条断言通过；旧 `SafeOnline`、候选与默认行为未改。

## 8. 未实现 / 偏离提示词

- `SplitBy`（一对象拆为两个输入规则决定的 Shape）**未实现**（P1 明确列出）；Shape 构造仅 `Hollow`（Shell 1）、`FillBBox`、`MergeFillBBox/MergeUnion`。
- `EquilateralTriangle` 只有一种离散模板；Shape 分解深度 ≤ 2。
- 变换语法无多步管线、无逐对象不同参数、无按其它对象位置的放置规则、不与 sequence-local 位置体合用——这是 102 题"加法样"任务 0 解的直接原因。
- C4 未按目标种类（Size2/ShapeMask/Set[Object]）选择子语法，只做常数叶子裁剪与按需深度。
- R2 未重跑，且 v0.6.1 的 R2 结果目录已被删除，表中无法引用。
- `NoShapeWitness/NoRelationWitness` 不作为 solver 配置；非法操作的拒绝由单元测试与机制负控制验证。

## 9. 空闲复测（`results/stage_c/arc_idle/`，`run_id = stage-c-20261024T083854Z`，同一二进制与数据）

在没有其它作业的机器上重跑全部 400 × 6（4 并行进程，总墙钟 1461 s）：

| 配置 | train-exact（集合与主运行相同） | 超时 空闲 / 主运行 | `search_work` 逐题相同（两轮都未超时的任务） | 墙钟总 空闲 / 主运行 (s) | 墙钟中位 / 最大 空闲 (s) | 峰值 max_live_bytes 空闲 |
|---|---|---|---|---|---|---|
| BaselineA | 7 ✓ | 0 / 0 | 400/400 | 299 / 387 | 0.246 / 22.6 | 371 MB |
| BaselineB | 7 ✓ | 2 / 4 | 396/396 | 1068 / 1357 | 0.246 / 60.0 | 646 MB |
| ShapeOnly | 7 ✓ | 1 / 1 | 399/399 | 614 / 762 | 0.297 / 60.0 | 366 MB |
| RelationsOnly | 13 ✓ | 2 / 2 | 398/398 | 577 / 678 | 0.579 / 60.0 | 373 MB |
| ObjectShapeFull | 17 ✓ | 2 / 3 | 397/397 | 1103 / 1318 | 1.210 / 60.0 | 365 MB |
| ObjectShapeGoalDirected | 17 ✓ | 3 / 4 | 396/396 | 1708 / 2074 | 1.193 / 60.0 | 921 MB |

- 两轮的 train-exact 集合逐配置相同；所有两轮都完成的任务 `search_work` 逐题相同（确定性计数无批次差异）。状态差异只有超时：`3906de3d, 85c4e7cd`（BaselineB）与 `0dfd9992`（Full/GoalDirected）在空闲下 60 s 内完成（`no_solution`），在争用下超时。
- 空闲墙钟比争用运行低 15–23%；Full 的墙钟中位 1.21 s（BaselineA 0.25 s），即关系搜索 + Shape 审计平均每题多约 1 s。
- 目标驱动 vs BaselineB 的比较对超时敏感：空闲轮 BaselineB 多完成 2 个快照任务，36 个共同任务上 GoalDirected 节点 1 509 313 vs 1 720 000（−12.3%）、构建工作 16 976 542 vs 20 679 310（−17.9%）、参考评估 86 770 171 vs 108 697 960（−20.2%）、解出槽 611 vs 298；争用轮为 −3.2% / −8.3% / −10.8%。两轮都没有改变 train-exact。

## 10. 产物索引

| 路径 | 内容 |
|---|---|
| `results/stage_c/validation/` | 9 个测试套件日志、构建日志、`cardinality_diagnosis.{json,csv}`、`arc_full.log`、`arc_idle.log` |
| `results/stage_c/mechanism/` | 每实例每配置 JSON（含 `stage_c`、`relations`、`shapes`、`object_transform`）+ derivation graph、`mechanism_metrics.csv`、`regression_baselines.csv` |
| `results/stage_c/arc/` | `data_manifest.json`、`code_version.json`（`run_id`）、`run_meta.json`、`tasks/<id>/stage-c-<Config>.json`、`metrics.json`、`audit.json`、`new_solutions.json`、`summary.md` |
| `results/stage_c/new_solutions/<id>/` | 10 道新解的 `solution.json`、`trace.txt`、`derivation_graph.json` |
| `results/stage_c/metrics.csv`、`results/stage_c/per_task.csv` | 机器可读汇总与逐题指标（2400 行） |
| `results/stage_c/arc_smoke/`、`results/stage_c/arc_idle/` | 12 题冒烟（旧二进制，仅验证流水线）与空闲复测 |
