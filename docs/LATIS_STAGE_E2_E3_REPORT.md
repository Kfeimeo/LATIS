# LATIS Stage E2–E3 实测报告

设计见 [LATIS_STAGE_E2_E3.md](LATIS_STAGE_E2_E3.md)，审计见 [LATIS_STAGE_E2_E3_AUDIT.md](LATIS_STAGE_E2_E3_AUDIT.md)。本报告中的每个数字都可由 `results/stage_e2_e3/e23-20261027-main/` 下的原始记录重算（`python -I scripts/report_stage_e2_e3.py --out results/stage_e2_e3/e23-20261027-main` 打印全部表格并写 `report_digest.json`）。

## 0. 运行信息

| 项 | 值 |
|---|---|
| run id | `results/stage_e2_e3/e23-20261027-main`（`run_stage_e2_e3.ps1 -Workers 8 -PilotFull400`） |
| 冻结二进制 | `solver.exe`，sha256 `2467dd3c1556888e613acee43eccead54cba2afdabd9711b47987a3e7fa54cf6`（GHC 9.10.3，`-O2`）；源码快照 `source_snapshot.zip` |
| 数据 | ARC-AGI-1 training 400 题，仅训练对（`train_only/`），manifest 哈希与 E0/E1、content-first、Stage D 批次相同 |
| 预算 | 每题每配置 300 s 墙钟（驱动 watchdog +10 s）、RTS `-M2g`；Region 搜索 `rcQuantum=6`、`rcExecutionBudget=2400` 次程序执行（每次含全部 case）、分区 24 次展开 / 深度 3 / 最小面积 2 |
| 覆盖 | 8 个配置 × 400 题全部跑完（`coverage = 400_complete`，无 pilot 子集）；3200 条记录，`runtime_error` 0 条，`.crashed.json` 0 条 |
| 墙钟 | formal 四组 40.2 min，pilot 四组 41.8 min（8 workers） |
| 测试套件 | 9 个套件全部通过：Region 399、Geometry 337、ContentFirst 340、StageD 137、StageDFull 34、StageDControl 10、StageDPlus 22、StageC 493、StageA 304 个 PASS，0 FAIL（`validation/*-tests.log`） |

## 1. 机制矩阵（10 家族 × 3 seeds × 8 配置）

`mechanism/matrix.json`；单元格 = train-exact 数 / heldout-exact 数（每家族 3 个 seed）。

| 家族 | FrozenE01 | E2Only | RegionPriority | BreadthScheduler | RegionBreadth | FullE3 | FullE3_NoMDL | FullE3_NoSafePrune |
|---|---|---|---|---|---|---|---|---|
| ShellVsPixelPatchwork | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| BackgroundByResidual | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| CrossSeparatorPartition | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| RingSeparatorPartition | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| InvalidObjectStraddle（负例） | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 |
| RegionPreserveWithLocalEdit | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| SharedRuleAcrossRegions | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| CrossRegionCopyCounterexample | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| BreadthBeatsDeepWrongView | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| LazyVsEagerFinitePartition | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |

所有正例家族在 7 个 region 配置下 train-exact 且 heldout-exact；FrozenE01 负对照全部不解（且 region 搜索从未进入）；InvalidObjectStraddle 在全部配置下不解（它的"分隔物"会切穿另一个 Object，`splitRegion` 拒绝）。

### 1.1 首个 fit 的曝光序号（按 seed）

| 家族 | E2Only | RegionPriority | BreadthScheduler | RegionBreadth | FullE3 | FullE3_NoMDL | FullE3_NoSafePrune |
|---|---|---|---|---|---|---|---|
| ShellVsPixelPatchwork | 496/576/496 | 776/906/776 | 24/24/24 | 1132/1344/1132 | 456/504/456 | 456/504/456 | 1132/1344/1132 |
| BackgroundByResidual | 758/754/754 | 808/808/808 | 22/18/18 | 180/180/180 | 60/60/60 | 66/66/66 | 180/180/180 |
| CrossSeparatorPartition | 17/18/17 | 55/60/55 | 1/1/1 | 4/4/4 | 2/2/2 | 2/2/2 | 4/4/4 |
| RingSeparatorPartition | 496/576/496 | 776/906/776 | 18/18/18 | 850/1008/850 | 343/378/343 | 343/378/343 | 850/1008/850 |
| RegionPreserveWithLocalEdit | 668/766/577 | 794/924/675 | 290/326/255 | 668/796/545 | 602/721/488 | 602/721/488 | 668/796/545 |
| SharedRuleAcrossRegions | 787/885/881 | 771/868/864 | 111/111/95 | 59/58/54 | 42/45/45 | 42/45/45 | 59/58/54 |
| CrossRegionCopyCounterexample | 813/945/813 | 814/947/814 | 963/1119/963 | 964/1121/964 | 686/800/686 | 686/800/686 | 964/1121/964 |
| BreadthBeatsDeepWrongView | 754/662/754 | 1196/1046/1196 | 18/18/18 | 1336/1170/1336 | 424/405/424 | 429/406/429 | 1336/1170/1336 |
| LazyVsEagerFinitePartition | 18/19/18 | 56/61/56 | 41/54/41 | 163/180/163 | 79/84/79 | 79/84/79 | 163/180/163 |

读法：
- **广度调度**（BreadthScheduler 列）在 10 个正例家族中的 8 个给出最早曝光；BreadthBeatsDeepWrongView 家族为 18 对 754/662（视图顺序穷举）——这是"错误视图先深挖"被广度打败的直接测量。
- **Region-first 尺寸类排序**（RegionPriority / RegionBreadth 相对 E2Only / BreadthScheduler）在多数家族里**推迟**了首个 fit（如 Shell：24 → 1132）。原因：它把 `UniqueSmallestContent`/`ObjectCount` 选择器排到 root/largest 之后，而这些家族的解恰在小区域上。这是一个实测否定结果，见 §8。
- **安全剪枝**（FullE3 相对 FullE3_NoSafePrune）把曝光序号从 1132 压到 456（Shell）、从 1336 压到 424（BreadthBeatsDeepWrongView），因为被剪掉的 `PreserveExcept` 候选不再占用执行配额。
- CrossRegionCopyCounterexample（跨区域 StampAtMarkers）在剪枝开/关下都被找到，且剪枝从不触及它（`CrossRegion` 效果类从不剪枝）。

### 1.2 执行数 + 剪枝数（按 seed，`executed+pruned`）

| 家族 | E2Only | BreadthScheduler | RegionBreadth | FullE3 | FullE3_NoSafePrune |
|---|---|---|---|---|---|
| ShellVsPixelPatchwork | 497+0/577+0/497+0 | 25+0/25+0/25+0 | 1133+0/1345+0/1133+0 | 457+676/505+840/457+676 | 1133+0/1345+0/1133+0 |
| BackgroundByResidual | 759+0/755+0/755+0 | 23+0/19+0/19+0 | 181+0/181+0/181+0 | 61+120/61+120/61+120 | 181+0/181+0/181+0 |
| InvalidObjectStraddle（穷尽） | 1470+0/1710+0/1470+0 | 1470+0/1710+0/1470+0 | 1470+0/1710+0/1470+0 | 924+546/1035+675/924+546 | 1470+0/1710+0/1470+0 |
| RegionPreserveWithLocalEdit | 669+0/767+0/578+0 | 291+0/327+0/256+0 | 669+0/797+0/546+0 | 603+66/722+75/489+57 | 669+0/797+0/546+0 |
| SharedRuleAcrossRegions | 788+0/886+0/882+0 | 112+0/112+0/96+0 | 60+0/59+0/55+0 | 43+17/46+13/46+9 | 60+0/59+0/55+0 |
| CrossRegionCopyCounterexample | 814+0/946+0/814+0 | 964+0/1120+0/964+0 | 965+0/1122+0/965+0 | 687+278/801+321/687+278 | 965+0/1122+0/965+0 |
| BreadthBeatsDeepWrongView | 755+0/663+0/755+0 | 19+0/19+0/19+0 | 1337+0/1171+0/1337+0 | 425+912/406+765/425+912 | 1337+0/1171+0/1337+0 |
| LazyVsEagerFinitePartition | 19+0/20+0/19+0 | 42+0/55+0/42+0 | 164+0/181+0/164+0 | 80+84/85+96/80+84 | 164+0/181+0/164+0 |

InvalidObjectStraddle 行给出同一有限宇宙下穷尽所需的执行数：剪枝开 924+546 = 1470 = 剪枝关 1470，即剪枝只是把"执行"换成"带证据的跳过"，宇宙不变。

### 1.3 差分测试（`validation/Region-tests.log`，`rcFirstFitStop=False`）

- PruneOn/Off 在同一有限宇宙上接受**相同的程序集合**，On 的执行数严格更少：RegionPreserveWithLocalEdit、SharedRuleAcrossRegions、CrossRegionCopyCounterexample 各 3 seed，9/9 PASS。
- 惰性分步展开与急切闭包在小场景上给出相同的树，两者都通过 `verifyPartition`（PASS）；LazyVsEagerFinitePartition 3 seed 均解，嵌套分隔物给出多个 k≥2 split。
- Shape / Scene / Partition 的 witness 重放：篡改 mask、节点、成本、余像素、归属均被拒绝（PASS）。
- Shape MDL 与独立暴力枚举在同一宇宙内成本一致（PASS）。

## 2. ARC 400 × 8 配置消融（冻结二进制）

基线 = FrozenE01（本批次自己跑的一份）。"配对 work 比" = 两配置都完成的 399 题的 `search_work` 之和的比；"配对秒" = 同一 399 题的墙钟之和。

| 配置 | 覆盖 | train-exact | Solve@60s | timeout | 崩溃 | 新增 | 丢失 | 配对 work 比 | 配对秒 基线/配置 | region 触发题 | 执行 | 剪枝 | 预算截断题 | k≥2 题 | 峰值 live 内存 | 独立核验 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| FrozenE01 | 400 | **22** | 22 | 1 | 0 | 0 | 0 | 1.0000 | 2065.8 / 2065.8 | 0 | 0 | 0 | 0 | 0 | 449 MB | — |
| E2Only | 400 | **26** | 26 | 1 | 0 | 4 | 0 | 1.0178 | 2065.8 / 2975.6 | 377 | 535120 | 0 | 24 | 322 | 1215 MB | 4/4 passed |
| RegionPriority | 400 | **26** | 26 | 1 | 0 | 4 | 0 | 1.0179 | 2065.8 / 2980.2 | 377 | 535641 | 0 | 24 | 322 | 1215 MB | 4/4 passed |
| BreadthScheduler | 400 | **26** | 26 | 1 | 0 | 4 | 0 | 1.0178 | 2065.8 / 3216.6 | 377 | 534069 | 0 | 24 | 322 | 1212 MB | 4/4 passed |
| RegionBreadth | 400 | **26** | 26 | 1 | 0 | 4 | 0 | 1.0179 | 2065.8 / 3196.7 | 377 | 535531 | 0 | 24 | 322 | 1215 MB | 4/4 passed |
| FullE3 | 400 | **26** | 26 | 1 | 0 | 4 | 0 | 1.0156 | 2065.8 / 3137.9 | 377 | 442464 | 98432 | 7 | 322 | 1213 MB | 4/4 passed |
| FullE3_NoMDL | 400 | **26** | 26 | 1 | 0 | 4 | 0 | 1.0156 | 2065.8 / 2482.6 | 377 | 442474 | 98434 | 7 | 322 | 456 MB | 4/4 passed |
| FullE3_NoSafePrune | 400 | **26** | 26 | 1 | 0 | 4 | 0 | 1.0179 | 2065.8 / 3165.0 | 377 | 535531 | 0 | 24 | 322 | 1215 MB | 4/4 passed |

- 新增 4 题（全部 7 个 region 配置相同）：`1c786137`、`2dc579da`、`5582e5ca`、`d9fac9be`；丢失 0；旧 22 题在每个配置下都以**相同程序**解出（`common_solved_same_program = 22`）。
- 20 题仍由 Size-first 解、2 题由 content-first 解（`c909285e`、`0b148d64`），region 门从不在它们上进入。
- Solve@60s：22 题有 eventlog `latis-train-exact` 标记（≤ 60 s）；4 个 region 解在冻结二进制中**没有**该标记（见 §8），用整进程墙钟作为上界（1c786137 25.6 s、2dc579da 3.0 s、5582e5ca 1.3 s、d9fac9be 3.0 s），因此记为 26（`metrics.json.solve_at_60s_basis`）。
- 唯一 timeout：`484b58aa`，8 个配置（含 FrozenE01）全部在 310 s 被驱动 watchdog 杀掉。E0/E1 批次（4 workers）它以 182 s `no_solution` 结束（work 76525）。用同一冻结二进制单独重跑（`results/stage_e2_e3/e23-20261027-rerun484b58aa/`，1 worker）：FrozenE01 160.5 s `no_solution`、work 76525（与 E0/E1 逐 work 一致）；FullE3 167.2 s `no_solution`、work 83257。结论：该超时是 8 workers 并发负载造成的墙钟现象，不是 region 代码引起。
- 分类（FullE3）：size_first_train_exact 20、content_first_train_exact 2、region_program_train_exact 4、region_no_separating_split 54（region 进入但没有 k≥2 split）、region_rule_unavailable 313（有树、有限宇宙穷尽、无 fit）、region_budget_truncated 6、timeout 1。NoSafePrune 下 region_budget_truncated 23、region_rule_unavailable 296。

### 2.1 冻结基线对照 E0/E1

`frozen_vs_e01.json`：400 题对照 `results/stage_e01/e01-20261027-main` 的 FullE01：status 相同 399、work 相同 399、程序（忽略新增的 region 字段）相同 400；唯一差异就是 484b58aa 的 timeout（上节）。FrozenE01 因此保持 22/400、逐 work 一致。

### 2.2 新解的程序与各配置下的首个 fit 曝光 / 执行 / 剪枝

| 任务 | FullE3 程序 | E2Only | RegionPriority | BreadthScheduler | RegionBreadth | FullE3 | FullE3_NoSafePrune |
|---|---|---|---|---|---|---|---|
| 1c786137 | `CropRegion[Region <- UniqueSmallestContent] @ LegacyView` | 6 / 7 / 0 | 448 / 449 / 0 | 18 / 19 / 0 | 1336 / 1337 / 0 | 424 / 425 / 912 | 1336 / 1337 / 0 |
| 2dc579da | `CropRegion[Region <- UniqueContentWithObjects] @ BackgroundView(UniqueMostFrequentColor)` | 16 / 17 / 0 | 50 / 51 / 0 | 1 / 2 / 0 | 4 / 5 / 0 | 2 / 3 / 2 | 4 / 5 / 0 |
| 5582e5ca | `PreserveExcept(ClearRegion)[Region <- Root] @ BackgroundView(UniqueMostFrequentColor)` | 574 / 575 / 0 | 571 / 572 / 0 | 4 / 5 / 0 | 1 / 2 / 0 | 1 / 2 / 0 | 1 / 2 / 0 |
| d9fac9be | `CropRegion[Region <- UniqueContentWithObjectCount(1)] @ LegacyView` | 496 / 497 / 0 | 544 / 545 / 0 | 18 / 19 / 0 | 162 / 163 / 0 | 78 / 79 / 84 | 162 / 163 / 0 |

（E2Only / RegionPriority 选到的是语义等价的另一视图或选择器，如 `BackgroundView(NoBackground)`、`UniqueContentWithObjectCount(2)`；视图顺序不同导致。）2dc579da 的 FullE3 曝光序列：#0 `CropRegion[Root]` no_fit（dims 不同）、#1 `CropRegion[UniqueLargestContent]` execution_invalid（区域 2 与 3 并列）、#2 fit；两条 `PreserveExcept` 候选被剪枝（diff 像素不在被选区域内）。5582e5ca 是"把非最频色清掉"类任务（Root 上 ClearRegion），没有 k≥2 split（`NonSeparatingOnly`），但 Root 程序仍可用。

### 2.3 Region 路径在 400 题上的结构统计（FullE3）

- 进入 region 门 377 题；每题合法 Scene 视图数：2 个 27 题、3 个 283 题、4 个 67 题。被拒视图原因：`UniformBorderColor not applicable`（边框非单色）310、`UniqueMostFrequentColor not applicable` 27；**没有**因多色余像素被拒的视图——因为 E0 视图的 Object 覆盖全部非背景像素，余像素天然单色或为空。
- 分区树 3801 棵，全部 `verifyPartition` 通过，0 棵截断；k 直方图（k≥2 的 split）：k=2 911、k=3 240、k=4 219、k=5 101、k=6 66、k=7 46、k=8 45、k=9 96、k≥10 共 ~190（最大 k=85）；叶类型：ObjectLeaf 1896、NonSeparatingOnly 1878、UniformLeaf 574。322 题至少一个 k≥2 split。
- 背景：`UniformResidual 0` 2189 棵树、`NoResidual` 1377、非 0 的 UniformResidual（1/8/5/2/4/3/9/6/7）235 棵，涉及 80 题——背景色是观察出来的，不是写死的 0。
- Object 49540 个，Shape MDL 状态：ProvenOptimalInUniverse 46453（93.8%）、BoundedBest 3087；`c_rect` 在本批记录中恒为 0（未计算，见 §8）。
- 曝光结果：execution_invalid 430701（主要是唯一性选择器失败，如"3 个区域匹配"）、no_fit 11759、fit 4；DependencyWitness 1171 份，共剪掉 98432 个候选。
- 广度调度：FullE3 deferred 87562 次、resumed 87541 次（恢复率 99.98%，未恢复的是 fit 后早停）；E2Only / RegionPriority 为 0。

### 2.4 成本

| 配置 | 配对墙钟（399 题）| 相对基线 | 中位墙钟 | 中位峰值 live | >500 MB 的题 |
|---|---|---|---|---|---|
| FrozenE01 | 2066 s | 1.00 | 1.88 s | 7.7 MB | 0 |
| E2Only | 2976 s | 1.44 | 3.21 s | 52 MB | 6 |
| FullE3 | 3138 s | 1.52 | 3.82 s | 36 MB | 7 |
| FullE3_NoMDL | 2483 s | 1.20 | 2.73 s | 16.7 MB | 0 |
| FullE3_NoSafePrune | 3165 s | 1.53 | 3.87 s | 38.5 MB | 7 |

`search_work`（配对）只增加 1.6%（FullE3）到 1.8%（无剪枝），但墙钟增加 20%–53%：Region 路径的大头不是程序执行，而是每题每视图的 Scene 构建与 Shape MDL 枚举——`rcMDL` 关闭后（NoMDL：MDL 不参与视图排序但 Scene 仍要构建）墙钟从 +52% 降到 +20%，峰值内存从 1.21 GB 降到 456 MB，而 400 题结果、程序、剪枝数完全相同。增幅最大的题：a64e4611（+43 s，1.21 GB）、50846271、3631a71a、780d0b14（+38–41 s）。

## 3. Oracle 可达性审计（五题）

"OracleExecution" = 把审计文档写出的人类程序交给 Region 执行器是否得到训练输出；"Enumerable" = 该程序是否在本任务的有限宇宙内；"Reached" = 盲搜索是否曝光到它；"Accepted" = 曝光后是否被接受为 fit；"BlindSolved" = FullE3 400 题运行的状态。trace 页面：`traces/<task>/<config>/index.html`（10 页 headless-Chrome 自检 `errors=[]`，`validation/trace_selftests.json`）。

| 任务 | Oracle（人类程序） | OracleExecution | Enumerable | Reached | Accepted | BlindSolved |
|---|---|---|---|---|---|---|
| 2dc579da | 十字分隔物 → 4 个 Content 区域，裁出含 Object 的唯一区域 | 是（与盲搜索选中程序相同） | 是（宇宙 1248） | 是，曝光 #2 | 是 | **train_exact**（7/7 region 配置） |
| e50d258f | 0 色分隔物 → 3 个面板，选"某颜色计数最多"的面板裁出 | 否：需要 `CountColor/ArgMax` 选择器，Region 语言没有 | 否 | — | — | no_solution（region_rule_unavailable）：树正确（k=3/4，9 个 split），宇宙 1044 穷尽（720 执行 + 324 剪枝，0 fit，budget_cut=False） |
| 543a7ed5 | 给每个框构造性地画外壳 / 填充 | 否：构造性输出不在 Preserve/Crop/Translate/Stamp 内 | 否 | — | — | no_solution（region_rule_unavailable）：4 视图合法，宇宙 1392 穷尽（1180 + 212，0 fit） |
| c909285e | content-first `Unique(IsShell) + Crop` | 不适用（content-first 先解） | — | — | — | train_exact（content-first，与冻结相同程序；RegionSearch not_entered） |
| 0b148d64 | content-first `NonEmptySet(LeastFrequentColour) + Crop` | 不适用 | — | — | — | train_exact（content-first，同上） |

e50d258f 与 543a7ed5 的结论与审计文档的预判一致：分区机制正确地构造了面板结构（trace 的 Scene/Region 页可见 k=3 / k=4 的 split 与各面板的 Object 归属），缺的是选择器/动作语言，不是分区。

## 4. 广度 vs 深度：曝光与恢复

- 机制层面（§1.1）：BreadthBeatsDeepWrongView 首个 fit 曝光 18（广度）对 754/662（视图顺序穷举）与 1336/1170（region-first + 视图穷举）。
- ARC 400：首解曝光（§2.2）在 BreadthScheduler 下 1c786137 为 18、d9fac9be 为 18；E2Only（无广度）为 6 与 496；FullE3 424 与 78。
- 游标恢复：FullE3 400 题 deferred 87562 / resumed 87541；每个 goal 的 `GoalLedger`（total/cursor/used/allocated/deferred/resumed/status）在 trace 的 "Goal 账本"卡片可见，例如 2dc579da/FullE3 只用了 `BackgroundView(UniqueMostFrequentColor)/L0` 的 3 次执行（status exhausted，其余 8 个 goal pending）。

## 5. 安全剪枝

- 400 题：FullE3 执行 442464 / 剪枝 98432，NoSafePrune 执行 535531（−17.4%）；预算截断题 24 → 7；4 个新解程序逐字相同、旧 22 题相同；1171 份 DependencyWitness 记录了剪枝的骨架、每 case 变化的深度 1 区域与被剪程序和像素证据。
- 机制层面：PruneOn/Off 接受集合相同（9/9 差分 PASS）；跨区域 StampAtMarkers 从不被剪（CrossRegionCopyCounterexample 3/3 在两种模式下都找到）。
- e50d258f：剪枝 324 个 `PreserveExcept` 候选，因为训练对的 diff 像素跨越多个面板（输出尺寸也不同），这正是"跨区域依赖使局部编辑不可能"的证据。

## 6. Trace 示例

- `traces/2dc579da/FullE3/index.html`：Scene/Region 页显示 Legacy / UniqueMostFrequentColor / NoBackground 三个视图的树（k=4，叶 ObjectLeaf+UniformLeaf）、深度 1 分区着色的输入网格、Goal 账本、3 条曝光、2 条剪枝的 DependencyWitness；候选浏览页的 RegionProgram AST。
- `traces/2dc579da/FrozenE01/index.html`：同一题冻结基线，RegionSearch 阶段 `not_entered`，content-first 1185 事件无解。
- `traces/e50d258f/FullE3/index.html`：9 个 goal 全部 exhausted、首个 fit 为空、曝光 720 条（前 600 条内嵌）；top 原因是唯一性选择器在 3 个面板上并列。
- `traces/543a7ed5/FullE3/index.html`：4 视图（含 UniformBorderColor），12 个 goal 穷尽。

## 7. 内存 / 崩溃

- 3200 条记录 0 次 `runtime_error`（E0/E1 批次曾有 5 条随机 exit-1，本批未复现；该异常仍无根因）。
- 峰值 live 内存：MDL 开启的 6 个配置 1.21–1.22 GB（a64e4611），NoMDL 456 MB，FrozenE01 449 MB。`-M2g` 未触发。

## 8. 运行后发现的问题与已做的修补（不在冻结二进制内）

1. **Region fit 没有发 `latis-train-exact` eventlog 标记**，因此 `first_train_exact_seconds` 对 4 个 region 解为空。已修：`Search.hs` 在 outcome 为 fit 时 `traceEvent "latis-train-exact"`；报告脚本在缺标记时用墙钟上界并在 `solve_at_60s_basis` 中标明。本批 Solve@60s 的 4 个 region 解来自墙钟上界。
2. **`c_rect` 恒为 0**：`Scene.sceneFromView` 把 E1 覆盖数硬编码为 0 传给 `bestShape`。已修：用 `minimalCover`（预算 2000 节点 / 面积 64）计算覆盖数并写入 `c_rect`。本批记录中 `c_ast` 正确、`c_rect` 无效；"AST 成本 vs 矩形覆盖数"的对照在本批不可用。
3. **Region-first 尺寸类排序是否定结果**：在机制矩阵的 8/9 个正例家族和 ARC 的 1c786137、d9fac9be 上，它让首解曝光更晚（§1.1、§2.2）。它没有丢失任何解（预算足够），但"区域优先"作为排序启发没有得到支持；广度调度与安全剪枝才是曝光下降的来源。
4. **MDL 视图排序没有收益**：NoMDL 与 FullE3 在 400 题上结果、程序、执行/剪枝数相同，而墙钟 +20% 对 +52%、峰值内存 456 MB 对 1.21 GB。Shape MDL 的作用目前只在 Scene 记录/trace 的可解释性，不在搜索。
5. 两处 Haskell 修补已通过 Region 套件重建验证（399 PASS / 0 FAIL，`build/e23-region-tests3.log`），并用调试二进制在 2dc579da/FullE3 上冒烟（`build/e23-smoke/postfix_2dc579da/`）：仍为同一 region 程序 train_exact；eventlog 现在有 `latis-train-exact`（首解 1.82 s）；`c_rect` 对矩形为 1、对十字为 2（其 `c_ast` 为 17 = 3 个不交矩形，覆盖允许重叠所以只需 2 个——两种度量并列输出）。未重跑 400 题；两处修补不影响搜索结果，只影响记录字段。

## 9. 限制与下一步

- 选择器缺 `CountColor / ArgMax / 比较`（e50d258f 类），动作缺构造性绘制（543a7ed5 类）；Object 仍是同色 4 连通分量。
- 曝光结果 97% 是 `execution_invalid`（唯一性选择器失败）：下一步应在枚举前用树的输入侧性质过滤掉必然非唯一的选择器（这是可证明安全的，因为选择器只读输入）。
- Scene/MDL 成本应惰性化：只在某视图进入调度时构建 Scene，MDL 只在 trace/记录需要时计算；或把 `smMaxArea` 降到 36。
- 排序：用"候选数少的 goal 先"或按 `execution_invalid` 的在线反馈替代尺寸类排序，然后用同一机制矩阵重测曝光。
- 484b58aa 在 8 workers 下超时提示每题墙钟预算与并发数要一起报告；后续批次把 `-Workers` 写进 `run_meta.json`（已有）并在报告中对照。
