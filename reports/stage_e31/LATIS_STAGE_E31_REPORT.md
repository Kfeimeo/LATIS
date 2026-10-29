# LATIS Stage E3.1 实测报告

设计见 [LATIS_STAGE_E31.md](../../docs/LATIS_STAGE_E31.md)，实施前审计见 [LATIS_STAGE_E31_AUDIT.md](../../docs/LATIS_STAGE_E31_AUDIT.md)。本报告的每个数字都可由 `results/stage_e31/e31-20261028-main/` 下的原始记录重算：`python -I scripts/run_stage_e31.py report --out <run>` 重建 `per_task.csv`/`metrics.json`，`python -I scripts/verify_stage_e31.py --out <run>` 重建 `verification_e31.json`，`python -I scripts/report_stage_e31.py --out <run>` 打印全部表格并写 `report_digest.json`。

## 0. 运行信息

| 项 | 值 |
|---|---|
| run id | `results/stage_e31/e31-20261028-main`（`scripts/run_stage_e31.ps1 -Workers 4`，git `858dadb2` 工作树 + 本轮改动，之后提交为 `4802ebec`/`950859e1`） |
| 最终冻结二进制 | `solver.exe` sha256 `8d44dd48b5b39ff9448045339de80e7552eb2d2909280ca64b2492593624c08e`（GHC 9.10.3 `-O2 -fno-omit-yields -rtsopts -eventlog`）；**9 个配置全部用这一个二进制**；源码快照 `source_snapshot.zip` sha256 `e4b211bf…3b7e` |
| 相对 E3 冻结快照的源码差异 | 14 个 `.hs` 改动 + 新增 `Region/MDLCache.hs`（`code_version.json.source_diff_vs_e3_snapshot`）；E3 评测后的两处修补（`c_rect`、`latis-train-exact`）包含在内 |
| E3 对照记录 | `results/stage_e2_e3/e23-20261027-main`（二进制 `2467dd3c…`，8 workers） |
| 数据 | ARC-AGI-1 training 400 题，只送训练对（`train_only/`，`test=[]` 守卫），manifest 哈希与 E3/E0E1/D+ 批次相同 |
| 预算 | 每题每配置 300 s 内部超时 + 10 s watchdog，RTS `-M2g -T -l-au`；Region：`rcQuantum=6`、`rcExecutionBudget=2400`；MDL 预算 3 矩形 / 面积 64 / 200000 表达式；`c_rect` 覆盖 2000 节点 / 面积 64 |
| 覆盖 | 9 配置 × 400 题全部完成（3600 条记录，`runtime_error` 0、timeout 0、`.crashed.json` 0）；正式批次 4 workers 143.3 min；484b58aa 单 worker 复查 3 配置 11.2 min |
| 测试套件 | Region（1469 PASS，含全部 E3.1 新测试）、Geometry、ContentFirst、StageD、StageDFull、StageDControl、StageDPlus、StageC、StageA 全部通过（`validation/*-tests.log`）；Stage B 长套件 **not_run**（`validation/tests_passed.json`） |
| 机器 | Windows 11，16 逻辑核；本机还同时承担编译/其它负载，墙钟只能做同批次配对比较 |

## 1. 机制矩阵（15 家族 × 3 seeds × 9 配置）

`mechanism/matrix.json`；单元格 = train-exact / heldout-exact（3 seeds）。

| 家族 | FrozenE01 | PatchedBaseline | PrecheckOnly | LazyMDLOnly | Full | FullNoMDL | FullNoSafePrune | FullSelectorPriority | FullCostOrder |
|---|---|---|---|---|---|---|---|---|---|
| E3 的 9 个正例家族 | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| InvalidObjectStraddle（负例） | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 |
| SelectorCardinalityCaseDependent | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| SelectorEmptyInOneCase | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| BackgroundViewSelectorDivergence | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| NestedRegionOwnership | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |
| OneCaseCoincidence | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 | 3/3 |

所有正例家族在 8 个 Region 配置下 train-exact 且 heldout-exact；FrozenE01 负对照全部不解（Region 搜索从未进入）；InvalidObjectStraddle 在全部配置下不解（宇宙穷尽：`75 执行 + 1304 预检查跳过 + 91 剪枝 = 1470 = E3 的 924+546`，固定宇宙不变）。两个新家族在设计中途被 FrozenE01 意外解出（左区域背景 blob 的 bbox 恰等于目标；颜色 7 选择器在 heldout 上失效），生成器据此修正（左区域加顶行、点颜色随 case 变化），修正记录见设计文档 §6；最终矩阵是修正后的生成器。

### 1.1 预检查不改变首个 fit 的候选位置，只减少执行

`首个 fit 的候选位置`（含被跳过候选的固定宇宙位置）在 PatchedBaseline / PrecheckOnly / LazyMDLOnly / Full / FullNoSafePrune 五列**逐 seed 完全相同**（如 Shell 1132/1344/1132，Ring 850/1008/850，Nested 219/219/202），而`已执行曝光序号`从 456/504/456 降到 95/90/95（Shell）、343/378/343 → 72/72/72（Ring）、602/721/488 → 106/111/98（RegionPreserveWithLocalEdit）。执行数+预检查+剪枝（Shell seed 1）：基线 457+0+676，PrecheckOnly 96+894+143——执行减少 79%，其中 533 个原本被依赖剪枝接住的候选改由预检查接住（审计 §1.5 预告的现象），剪枝从 676 降到 143。

### 1.2 PriorityVsBreadth（允许负结果）

42 个正例实例上三种排序的首个 fit 候选位置（越小越早）：

| 排序 | 共同最早（次） | 候选位置之和 | 执行数之和 |
|---|---|---|---|
| E31_Full（E3 默认：广度 + 尺寸类） | 3 | 17567 | 2119 |
| E31_FullCostOrder（广度 + 成本序，去掉尺寸类） | 23 | 4905 | 932 |
| E31_FullSelectorPriority（广度 + 有效候选数优先） | 25 | 4121 | 963 |

逐家族（Full / CostOrder / SelectorPriority，seed 1）：Shell 1132/24/24、Ring 850/18/18、BreadthBeatsDeepWrongView 1336/18/18、RegionPreserveWithLocalEdit 668/290/146、SharedRuleAcrossRegions 59/111/72、CrossRegionCopyCounterexample 964/963/932、CrossSeparatorPartition 4/1/7、BackgroundViewSelectorDivergence 4/1/13。结论：E3 的"尺寸类优先"再次被否定；成本序与有效候选数优先接近，后者在 Shell/Ring/Preserve/Nested 类略早、在层 0 单候选家族（CrossSeparator、Divergence）略晚（它把 Root 候选排在有效候选数少的 goal 之后）。两者都没有改变任何家族的可解性。

## 2. ARC 400 × 9 配置（同一二进制）

基线 = `E31_PatchedBaseline`（E3 `FullE3` 的语义，在最终二进制上重跑）。"配对"= 与基线共同完成的 400 题求和。

| 配置 | train-exact | Solve@60s（事件/上界） | 留存/新增/丢失 vs E3 FullE3 | 配对 work 比 | 配对墙钟 s（基线 2866） | 执行 | 预检查跳过 | 依赖剪枝 | 执行后 invalid | no_fit | 预算截断题 | 峰值 live | 分配字节比 | GC CPU 比 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| FrozenE01 | 22 | 22（22/0） | 22/0/4 | 0.985 | 2044 | 0 | 0 | 0 | 0 | 0 | 0 | 452 MB | 0.638 | 0.499 |
| E31_PatchedBaseline | **26** | 26（26/0） | 26/0/0 | 1.000 | 2866 | 444708 | 0 | 98432 | 432886 | 11818 | 7 | 476 MB | 1.000 | 1.000 |
| E31_PrecheckOnly | **26** | 26（26/0） | 26/0/0 | 0.991 | 2839 | 28597 | 498500 | 18234 | 16775 | 11818 | 0 | 472 MB | 0.999 | 0.993 |
| E31_LazyMDLOnly | **26** | 26（26/0） | 26/0/0 | 1.000 | 2579 | 444708 | 0 | 98432 | 432886 | 11818 | 7 | 460 MB | 0.843 | 0.845 |
| E31_Full | **26** | 26（26/0） | 26/0/0 | 0.991 | 2517 | 28597 | 498500 | 18234 | 16775 | 11818 | 0 | 482 MB | 0.843 | 0.839 |
| E31_FullNoMDL | **26** | 26（26/0） | 26/0/0 | 0.991 | 2245 | 28600 | 498508 | 18235 | 16776 | 11820 | 0 | 467 MB | 0.702 | 0.677 |
| E31_FullNoSafePrune | **26** | 26（26/0） | 26/0/0 | 0.991 | 2534 | 46831 | 498500 | 0 | 17299 | 29528 | 0 | 457 MB | 0.843 | 0.839 |
| E31_FullSelectorPriority | **26** | 26（26/0） | 26/0/0 | 0.991 | 2529 | 28501 | 497322 | 18061 | 16679 | 11818 | 0 | 457 MB | 0.848 | 0.842 |
| E31_FullCostOrder | **26** | 26（26/0） | 26/0/0 | 0.991 | 2436 | 28499 | 497317 | 18053 | 16679 | 11816 | 0 | 476 MB | 0.843 | 0.814 |

- **旧 26 解全部留存，无新解，无丢失**；8 个 Region 配置中 6 个的 26 道程序文本与 E3 逐字相同；`E31_FullSelectorPriority`/`E31_FullCostOrder` 在 d9fac9be 上选到语义等价的 `CropRegion[UniqueSmallestContent]`（E3 为 `UniqueContentWithObjectCount(1)`），两者都逐格独立核验通过（§5）。20 题 Size-first、2 题 content-first（`c909285e`、`0b148d64`）、4 题 Region（`1c786137`、`2dc579da`、`5582e5ca`、`d9fac9be`）与 E3 一致。
- **Solve@60s 全部来自 eventlog 标记**（上界 0 条）：Region 首解的 `latis-train-exact` 修补生效（E3 批次 4 个 Region 解只能用墙钟上界）。首解时间（E31_Full）：1c786137 17.7 s、2dc579da 2.2 s、5582e5ca 1.2 s、d9fac9be 2.9 s。
- **timeout 0**：4 workers 下 484b58aa 全部配置 191–221 s 完成（`no_solution`）；单 worker 复查 160–171 s；E3 8 workers 下的 310 s 超时确认为并发争用（§6）。
- `search_work` 配对比 0.991：`search_work` 由 Size-first/content-first 的工作量主导（如 2dc579da 的 227946 中 Region 部分只有个位数），Region 执行的变化在这里只占 1%。Region 自身的工作量见执行/跳过/剪枝列。

### 2.1 修补后基线 vs E3 冻结 FullE3（逐题）

`metrics.json.patched_baseline_vs_e3_fullE3`：400 题中 status 相同 399、程序文本相同 **400**、`rg_executed` 相同 399、`rg_pruned` 相同 399、`search_work` 相同 399；唯一差异 484b58aa（E3 timeout，本批 `no_solution` work 83257 / 执行 2244 / 剪枝 0——与 E3 单 worker 重放 `e23-20261027-rerun484b58aa` 的 83257 一致）。`FrozenE01` 对 E3 `FrozenE01` 同样 399/400 相同，差异只有 484b58aa。结论：**两处评测后修补不改变搜索结果**（程序、执行、剪枝、work 逐题相同），`c_rect` 修补是记录层修补（审计 §2.1 的源码论证得到 400 题实测确认）。

但修补后基线**不是**成本上的同一程序：E3 FullE3 的配对墙钟 3138 s / 峰值 live 1213 MB（a64e4611），本批 PatchedBaseline 2866 s / 476 MB（峰值来自 484b58aa；a64e4611 为 47 MB）。原因是 `ShapeMDL.level` 的流式化（设计 §3.5）在共享代码里，eager 路径同样受益——这是审计 §2.4 诊断的 20 万表达式驻留问题；它不影响任何结果（上段），但说明 E3 报告里 "MDL +52% 墙钟 / 1.2 GB" 中的大部分是生命周期问题而不是 MDL 的固有代价。

### 2.2 P0-A：输入侧预检查

PatchedBaseline → PrecheckOnly（其余不变）：

| 量 | 基线 | PrecheckOnly | 说明 |
|---|---|---|---|
| 候选宇宙（377 题 Region 触发） | 固定 | 固定 | `universe_accounting.consistent` 在全部 3600 条记录为真 |
| 执行 | 444708 | 28597 | **−93.6%** |
| 预检查跳过 | 0 | 498500 | InvalidRootUnsplit 272025、InvalidEmpty 139338、InvalidNonUnique 85077、InvalidSameRegion 2060 |
| 依赖剪枝 | 98432 | 18234 | 下降是预期的：Selector 无效的 `PreserveExcept` 候选先被预检查接住（审计 §1.5） |
| 执行后 `execution_invalid` | 432886 | 16775 | 剩余原因：`TranslateRegion` 需要背景色 6393、出画布 6071、无对象 1226、压到对象 809；`StampAtMarkers` 无 marker 893、出画布 530、源无对象 501；`ClearRegion` 无背景色 282——全部是动作级输入侧条件，不在本阶段预检查范围内 |
| `no_fit` | 11818 | 11818 | 相同 |
| 预算截断题 | 7 | 0 | 预检查不耗执行预算；原先 7 题 2400 次执行耗尽的宇宙现在全部穷尽（`region_rule_unavailable` 313 → 319） |
| 首个 fit 的候选位置 | 相同 400/400 | | `verification_e31.json`：`first_fit_candidate_equal 400`，接受集合相同 400/400，`executed+pruned`（基线）= `executed+prechecked+pruned`（预检查）在 393 题成立，差的 7 题正是基线被预算截断的 7 题 |
| 预检查成本 | — | 15904 个 (视图, Selector) 条目、51617 次逐 case 判定、23.1 s | 相对基线少掉的 27.5 s 执行时间 + 4.5 s 剪枝时间；净墙钟 2866 → 2839 s（−1%）。预检查本身不是墙钟收益的来源（见 §2.5），它的收益是确定性的执行数与预算语义 |

`E31_PatchedBaseline` 的执行序列与 `PrecheckOnly` 在无预算截断的 393 题上只差被跳过的无效候选（曝光序列相同的题只有 23——因为曝光序号本身随跳过而变化，这是预期的；候选位置相同 400/400 才是不变量）。

### 2.3 P0-B：Shape MDL 缓存与成本

| 量 | 基线（eager） | LazyMDLOnly | Full | FullNoMDL |
|---|---|---|---|---|
| 对象（引用）数 / distinct masks | 56329 / — | 56329 / **4485**（静态命中 51844，92%） | 同 | 56329 / 未计算 |
| `mdl_compute` | 未单独计时（eager 路径不在计时器内） | 257.0 s（4485 次） | 247.6 s | 0 |
| `minimal_cover`（`c_rect`） | 未单独计时 | 0.20 s（4485 次） | 0.20 s | 0 |
| 证明状态 | Proven 51946 / Bounded 3091 / `c_rect` 已算 55037 | 相同 | 相同 | NotComputed 55037，`c_rect: null` |
| 配对墙钟 | 2866 s | 2579 s（−10%） | 2517 s | 2245 s（比 Full 再 −11%） |
| 分配字节 / GC CPU 比 | 1.000 / 1.000 | 0.843 / 0.845 | 0.843 / 0.839 | 0.702 / 0.677 |
| 搜索结果 | — | 曝光序列、接受集合、scene cost、每个对象的 shape/`c_ast`/status/`c_rect` 与基线相同 **400/400** | 同 PrecheckOnly 400/400 | 程序相同；视图顺序在 55 题改变曝光序列，2 题（2dc579da、5582e5ca）执行/跳过计数不同，接受集合 400/400 相同 |

- 缓存**不改变 MDL-enabled 模式的任何成本或顺序**（独立核验 `LazyMDLOnly_vs_PatchedBaseline` 400/400 五项全等），把 56329 次形状优化压成 4485 次；`mdl_compute` 仍占 Full 墙钟的 9.8%，是 Region 路径里最大的单项（其次 partition_expand 24.9 s、selector_precheck 25.3 s）。
- `c_rect` 的覆盖算法在归一化 mask 上一次只需 0.2 s/400 题，E3 修补的 CPU 顾虑在缓存下不成立；在 eager 路径（基线）它仍对 55037 个对象各算一次，但未单独计时。
- **MDL 参与视图排序仍然没有收益**：NoMDL 与 Full 的 26 解相同，首解候选位置 398/400 相同，而 NoMDL 少 272 s 墙钟、少 14% 分配、少 16% GC CPU。E3 的否定结果在修补后、缓存后依然成立。
- 重点任务（`per_task.csv`）：

| 任务 | E3 FullE3 墙钟 / live | PatchedBaseline | LazyMDLOnly | Full | FullNoMDL |
|---|---|---|---|---|---|
| a64e4611 | 91.0 s / 1213 MB | 59.9 s / 47 MB | 46.4 s / 43 MB（MDL 7.3 s） | 43.1 s / 41 MB | 35.3 s / 55 MB |
| 50846271 | 51.6 s / 857 MB | 22.9 s / 38 MB | 14.5 s / 36 MB（8.0 s） | 14.0 s / 36 MB | 6.4 s / 25 MB |
| 3631a71a | 68.2 s / 884 MB | 60.4 s / 161 MB | 54.9 s / 203 MB（17.7 s） | 52.1 s / 140 MB | 31.6 s / 137 MB |
| 780d0b14 | 45.6 s / 544 MB | 23.5 s / 35 MB | 13.4 s / 35 MB（6.2 s） | 13.2 s / 35 MB | 6.5 s / 35 MB |

（E3 列为 8 workers 墙钟，仅作量级参考；live 内存不受并发影响。）全批次中位墙钟：FrozenE01 1.78 s、基线 3.17 s、Full 2.78 s、FullNoMDL 2.34 s；中位 live：7.8 / 24.0 / 22.6 / 9.5 MB。

### 2.4 P0-C：调度（仅排序变化）

| 任务 | Full（尺寸类） | FullCostOrder | FullSelectorPriority | 读法 |
|---|---|---|---|---|
| 1c786137 | 候选位置 1336，执行 55，首解 17.7 s | 18，7，16.3 s | 18，7，22.6 s | 尺寸类排序把 `UniqueSmallestContent` 排到最后（E3 已指出） |
| 2dc579da | 4，2 | 1，2 | 13，4 | 有效候选数优先把 Root 候选推后 |
| 5582e5ca | 1，2 | 4，2 | 1，2 | |
| d9fac9be | 162，57 | 18，7（等价程序 `UniqueSmallestContent`） | 24，7（同） | |
| 400 题配对墙钟 | 2517 s | 2436 s | 2529 s | |
| 接受集合 vs Full | — | 399/400 相同（d9fac9be 等价程序） | 399/400 | |

结论：去掉尺寸类（CostOrder）在 ARC 的 4 个 Region 解上两题大幅提前、一题略晚、一题不变，墙钟 −3%；"有效候选数优先"没有比成本序更好（机制 25 vs 23 次共同最早，ARC 上 2dc579da 更晚、墙钟持平）。本阶段**不**把任何新排序设为默认；建议下一阶段默认 `rcRegionFirst=False`（成本序），`rcSelectorPriority` 保留为关闭的实验开关。

### 2.5 安全剪枝消融

`E31_FullNoSafePrune`：执行 46831（Full 28597，+64%），剪枝 0，`no_fit` 29528（被剪候选执行后 no_fit 17710、invalid 524），26 解与首解候选位置 400/400 相同，墙钟 2534 vs 2517 s。预检查接住了 Selector 无效的候选之后，依赖剪枝剩下的作用是省掉 18234 次会得到 `no_fit`/`invalid` 的执行（4.1 s）；`CrossRegionCopyCounterexample` 在开/关下都解，跨区域 `StampAtMarkers` 从未被剪枝也从未被预检查误剪（机制矩阵 3/3）。DependencyWitness 机制完整保留。

## 3. 独立核验（`verification_e31.json`，Python 重放）

| 项 | 结果 |
|---|---|
| Selector 预检查重放 | 6 个预检查配置 × 378 题：15904 份 (视图, Selector) 证据、51617 次逐 case 判定，用独立实现（深度 1 content 节点的 area / 对象数 / 颜色表）重算 kind 与匹配 id，**0 不一致**；证据的树 hash 与记录的树 hash **0 不一致**；每个被跳过候选都有对应证据条目（0 条无证据跳过） |
| 固定宇宙记账 | 9 配置 × 400：`considered = executed + prechecked + pruned`、`universe = considered + remaining` 全部成立 |
| 26 解逐格重放 | 9 配置的每个 train-exact 记录：`execution_witnesses[*].grid` 与训练目标逐格相同（26/26，FrozenE01 22/22） |
| Region 程序 Python 重放 | 4 道 Region 解 × 8 配置：`CropRegion` 用记录的 region bounds 从输入裁窗、`PreserveExcept(ClearRegion)[Root]` 用 Scene 背景色填满，均等于目标（32/32 通过；d9fac9be 的两个等价程序都通过） |
| LazyMDL ≡ eager | 400/400：接受集合、曝光序列、执行/剪枝计数、首解候选位置、scene cost 全等 |
| Precheck 等价 | 400/400 接受集合相同、首解候选位置相同；393/400 计数恒等式成立（其余 7 题基线被预算截断） |
| 结构核验（E3 的 `verify_region_record`） | 4 道 Region 解 × 8 配置 `passed` |
| 查看器自检 | 9 个 trace 页（2dc579da / 1c786137 / e50d258f × PatchedBaseline / Full / FullNoMDL）headless Chrome `errors=[]`；预检查证据行 39–51、被跳过候选行 2–300、goal 进度行 9（基线页 0/0/9，与配置一致） |

## 4. 分阶段耗时（全部任务求和，`phase_timings`）

| 配置 | scene_build | partition_expand | selector_precheck | dependency_prune | candidate_execution | mdl_compute | minimal_cover | 配对墙钟 |
|---|---|---|---|---|---|---|---|---|
| PatchedBaseline | 1.3 s / 4215 | 23.1 s / 3810 | — | 7.1 s / 543140 | 29.7 s / 444708 | 未计时（eager） | 未计时 | 2866 s |
| PrecheckOnly | 1.2 s | 22.7 s | 23.1 s / 15904 | 2.5 s / 46831 | 2.2 s / 28597 | — | — | 2839 s |
| LazyMDLOnly | 0.9 s | 25.5 s | — | 7.1 s | 32.2 s | 257.0 s / 4485 | 0.20 s | 2579 s |
| Full | 1.0 s | 24.9 s | 25.3 s | 2.4 s | 2.3 s | 247.6 s | 0.20 s | 2517 s |
| FullNoMDL | 1.2 s | 24.0 s | 24.4 s | 2.4 s | 2.2 s | — | — | 2245 s |

计时器只覆盖 Region 路径的纯计算（设计 §3.1）；Region 路径之外（Size-first/content-first、JSON 记录写出、`show` 强制）占墙钟的大部分（FrozenE01 本身 2044 s）。Region 路径的增量：基线 +822 s（+40%），Full +473 s（+23%），FullNoMDL +201 s（+9.8%）。eager MDL 的成本只能从差值推断：基线与 LazyMDLOnly 的执行完全相同，墙钟差 287 s 即缓存省下的重复优化。

## 5. 机制与 ARC 的否定结果（明确保留）

1. **MDL 视图排序**：E3 与 E3.1 两批、缓存前后，400 题结果都与 NoMDL 相同；MDL 只提供记录/trace 的可解释性。建议默认 `rcMDL=False`，`rcMDLRecord` 按需。
2. **尺寸类优先**（`rcRegionFirst`）：机制 42 实例中只有 3 次共同最早，ARC 上把 1c786137/d9fac9be 的首解候选位置推到 1336/162。
3. **有效候选数优先**：不劣于成本序，也不明显更好；不设默认。
4. **预检查的墙钟收益很小（−1%）**：它减少的是执行次数（−93.6%）与预算截断（7 → 0），不是 CPU；Region 执行本来只占 29.7 s。它的价值在于预算/早停语义变得明确，以及把"无效"从执行后分类变成输入侧可重放证据。
5. **没有新解**：26/400 与 E3 相同；e50d258f/543a7ed5 仍 `region_rule_unavailable`（宇宙穷尽），缺的是 `CountColor/ArgMax` 选择器与构造性动作，不是搜索效率。

## 6. 并发与 484b58aa

| 运行 | workers | 状态 | 墙钟 | work |
|---|---|---|---|---|
| E3 FullE3 / FrozenE01 | 8 | timeout（310 s watchdog） | — | null |
| E3 rerun484b58aa FrozenE01 / FullE3 | 1 | no_solution | 160.5 / 167.2 s | 76525 / 83257 |
| 本批 FrozenE01 / PatchedBaseline / Full / FullNoMDL | 4 | no_solution | 206.9 / 220.5 / 215.2 / 212.3 s | 76525 / 83257 / 78937 / 78937 |
| 本批 tasks_w1 PatchedBaseline / Full / FullNoMDL | 1 | no_solution | 163.0 / 160.7 / 171.4 s | 83257 / 78937 / 78937 |

work 与 E3 单 worker 重放逐值一致（FrozenE01 76525、FullE3 语义 83257）；4 workers 比 1 worker 慢 30%，8 workers 超过 300 s——超时是并发争用，不是搜索行为。本批所有配置 timeout 0。

## 7. 运行中发现并修正的问题

1. E3 的 GoalLedger 在广度模式下 `used`/`fits` 恒为 0（审计 §1.4）：E3.1 合并两份记录，单元测试断言 `Σ used = executed`。记录层修正，不影响搜索。
2. 差分测试的最初表述把 `no_fit`/`invalid` 集合跨剪枝开关比较，这是错的（被剪候选不属于两者）；正确不变量见设计 §6，已在测试中改为按剪枝设定分别比较。
3. 两个新机制家族的初版被 FrozenE01 解出（§1），生成器修正后重跑。
4. 流水线用 PowerShell `*>` 重定向长输出的测试进程时，进程大部分时间阻塞在写管道上（3 h 只用了 34 min CPU）；改为 `Start-Process` 直接重定向到文件后 Region 套件 41 min 跑完。Linux 版 `scripts/run_stage_e31.sh` 同步提供。
5. eager MDL 路径没有计时器（表中"未计时"），只能由差值推断；下一阶段若保留 eager 对照应补上。

## 8. 验收对照

| 要求 | 结果 |
|---|---|
| 不改 Region/Shape/Scene/OutputSpec 语义、不加规则/原语、不用 test | 满足：`PatchedBaseline` 400/400 程序、399/400 执行/剪枝/work 与 E3 相同（差异仅 E3 的 484b58aa 超时）；Selector/动作语言未变；预检查只读输入树 |
| 预检查跳过有可独立重放的输入侧证据；完整固定宇宙差分接受集合相同；Unknown 回退 | 满足：51617 次判定 0 不一致；机制四组合差分（单元测试）与 ARC 400 题接受集合 400/400 相同；`decideFromChecks` 的 Unknown 路径有合成测试（当前语言不产生 Unknown） |
| Lazy MDL 不改变 MDL 模式的成本/语义；`c_rect` 未计算为 null；区分 Proven/Bounded | 满足：400/400 全等；`c_rect: null + NotComputed`；Proven 51946 / Bounded 3091 分列；缓存键含预算与 DSL 版本 |
| 正式二进制含修补；26 解保留 | 满足：26/26，程序文本 6 配置逐字相同、2 配置等价（d9fac9be），全部逐格核验 |
| 400 题同 binary 多配置消融、原始记录与独立重算 | 满足：9 配置 × 400，`per_task.csv`/`metrics.json`/`verification_e31.json`/`report_digest.json` |
| 排序策略无收益时保留负结果；不隐瞒 MDL 成本 | 满足：§2.4、§5；MDL 247.6 s / 14% 分配 / 16% GC 单列 |
| Stage B 长套件 | **not_run**，已标注 |

## 9. 下一阶段建议

- 把 `rcPrecheck=True`、`rcLazyMDL=True`、`rcMDL=False`（记录按需）、`rcRegionFirst=False` 作为 E4 之前的新默认（本阶段未改任何默认，`regionConfigOn` 仍是 E3 行为）。
- 动作级输入侧条件（Translate 的背景/出界/碰撞、Stamp 的 marker/源对象）可以用同样的预检查框架在输入侧判定（剩余 16775 次 invalid 的全部来源），仍需四组合差分证明。
- `partition_expand`（25 s）与 `selector_precheck`（25 s）已与 Region 执行同量级；若继续优化，先按 (case, 视图) 缓存 `legalSeparators` 的分量计算。
- E4（跨所有训练输出的结构指称、Output-first、`CountColor/ArgMax`）本阶段未实现；e50d258f/543a7ed5 的失败原因未变。
