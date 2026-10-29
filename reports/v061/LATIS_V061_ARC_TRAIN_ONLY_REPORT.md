# LATIS v0.6.1：真实 ARC-AGI-1 Train-only Fallback 实验报告

对应 `docs/LATIS_V061_ARC_TRAIN_ONLY.md`（方法）与 `results/arc_agi1_train_only_fallback/`（原始数据）。本轮只做评估：Feature 算法、DSL、prior、搜索策略、预算上限均未修改，没有任务 ID 特例。所有数字来自 `metrics.json` / `per_task.csv`，报告不是实现正确性的替代证据。

## 1. 数据、代码与预算

| 项 | 值 |
|---|---|
| 数据 | ARC-AGI-1 官方 `training` split 全部 400 个任务，来源 https://github.com/fchollet/ARC-AGI `data/training/`，commit `399030444e0ab0cc8b4e199870fb20b863846f34`；原样副本 `data/arc1-training/`（逐文件 SHA256 见 `data_manifest.json`，组合哈希 `fda04e2284cf637ebf1d8dd931813ebd4dd3adeba5bf79e5d68e3fa2ee25695b`；v0.3 冻结子集 30 个文件哈希全部一致） |
| 代码 | git HEAD `d7fb0bb5`（工作区含本轮新增文件，diff 哈希 `25b29c94f867e7e7…`），二进制 `build/latis-arc-train-only.exe` SHA256 `2694403e3cb9ef18…`，GHC 9.10.3，`-O2 -fno-omit-yields` |
| Feature 阶段 | v0.6.1 collection front：`frontSearch SafeOnline v61Config`（`alignmentBudget=400`, `scalarBudget=2000`, `synthesisDepth=2`, `synthesisCostBound=5`），墙钟 60 s |
| R2 阶段 | `inducedSearch Full R2.defaultInduced`（`workBudget=250000`, `depthBound=7`, `structuralCostBound=96`, `saturationWorkBudget=25000`），墙钟 300 s |
| 诊断列 | v0.4 triggered feature front `V4.frontSearch Full V4.defaultConfig`，墙钟 60 s；只记录，不影响回退 |
| 隔离 | 求解器只接收 `train_only/<id>.json`（`test: []`）；含 test 对的文件被二进制拒绝（exit 3）；每个 stage 独立进程，RTS `-M4g`，驱动器硬杀宽限 30 s；6 个任务进程并行 |

预算在 8 任务 smoke test 后、全量运行前固定（`code_version.json`），之后未调整。

## 2. 端到端指标（分母 = 全部 400 个官方任务）

| 指标 | 值 |
|---|---|
| total_tasks | 400 |
| feature_train_exact_count / rate | 3 / 0.75% |
| fallback_count / rate | 397 / 99.25% |
| fallback_reason_no_solution | 259（64.75%） |
| fallback_reason_timeout | 0 |
| fallback_reason_unsupported | 138（34.50%） |
| fallback_reason_runtime_error | 0 |
| r2_train_exact_count / r2_train_exact_rate_among_fallbacks | 5 / 1.26%（5/397） |
| pipeline_train_exact_count / rate | 8 / 2.00% |
| Feature wall-clock | 合计 32.6 s，中位 0.0009 s，最大 5.9 s；超时 0（硬杀 0） |
| Feature search_work | 合计 4 599 091，中位 0，最大 794 039 |
| R2 wall-clock（397 个回退任务） | 合计 23 071.8 s（6.4 h CPU），中位 1.53 s，最大 300.1 s；超时 64（硬杀 0） |
| R2 search_work（`total_expanded_work`） | 合计 1 125 968，中位 37，最大 250 176 |

条件指标（分母 = 可解析且被 Feature 接口接受的 262 个任务，即 feature 状态 ∈ {train_exact, no_solution, timeout}）：feature train-exact 3/262 = 1.15%，fallback 259/262 = 98.85%，R2 在这些回退中恢复 3/259 = 1.16%，pipeline 6/262 = 2.29%。

## 3. 对五个问题的回答

1. **Feature train-exact rate**：3/400 = 0.75%（条件分母 1.15%）。任务 `1caeab9d`（work 4402，0.012 s）、`25ff71a9`（1222，0.005 s）、`beb8660c`（27909，0.19 s）。三个程序均由运行器在全部 train 输入上重新执行并逐格一致。
2. **仅因训练精确解缺失或超时而回退的比例**：259/400 = 64.75%，其中 no_solution 259、timeout 0。Feature 阶段在全部 400 个任务上都没有触达 60 s 墙钟；它的失败是有界搜索自行结束。
3. **因输入不受支持或运行错误而回退**：138/400 = 34.50%，全部是 `layout: collection frontend requires unchanged canvas`（输入输出画布尺寸不同，前端在搜索前拒绝）；runtime_error 0；文件解析失败 0。
4. **R2 在回退任务中恢复的 train-exact**：5/397 = 1.26%：`05f2a901`（work 188 026，172 s）、`1cf80156`（146 706，74 s）、`681b3aeb`（153 471，166 s）、`aabf363d`（78 178，34 s）、`d23f8c26`（125 417，103 s）。其中 `1cf80156` 与 `681b3aeb` 属于 Feature 的 unsupported（画布变化）任务，说明 R2 的 Base 语法能覆盖部分画布变化任务。另有 64 个任务 R2 耗尽 300 s 墙钟（在 `-O2` 单线程下 `workBudget=250000` 对这些任务不够在 5 分钟内跑完），其余 328 个在预算内结束而无解。
5. **Feature 算法的主要失败原因**（按失败串前缀，占 397 个回退）：
   - `RankAlign: unequal input/output cardinality` 198（49.9%）：输入与输出编码后的对象数不等，collection front 要求对象一一对齐；
   - `layout: ... unchanged canvas` 138（34.8%）：画布尺寸变化；
   - `alignment validation: aligned Color observer differs` 31（7.8%）：对齐后颜色观察器不一致（对象被重新着色）；
   - `feature transformation` 19（4.8%，如 `no uniform first-AX scalar expression`）：标量语法内无统一位置表达式；
   - `realization: final grid exact check failed` 9（2.3%）：候选程序整格检查失败；
   - `alignment` 2。
   
   结构性事实：400 个任务中 262 个画布不变，仅 64 个同时满足"画布不变且逐例对象数相等"这两个前端硬前提；Feature 的 3 个成功全部落在这 64 个里。也就是说当前前端的假设类（固定画布、对象双射对齐、标量位置规则）与真实 ARC 训练集 84% 的任务在接口层就不相交。

## 4. R2 回退结果分布

| R2 状态 | 数量 |
|---|---|
| no_solution: BaseExpressibilityUnknown | 231 |
| timeout（300 s） | 64 |
| no_solution: SearchFailure | 41 |
| no_solution: SpecificationRepresentationMissing | 35 |
| no_solution: WitnessMissing | 21 |
| train_exact | 5 |

`BaseExpressibilityUnknown` 的 231 个任务中位 work 仅 37：R2 在根规格阶段即无法构造 witness，几乎不消耗搜索。真正进入搜索并耗尽墙钟的 64 个任务是 R2 成本的主要来源（64 × 300 s ≈ 19 200 s，占 R2 总墙钟的 83%）。

## 5. 诊断列：v0.4 triggered feature front

同一 train-only 输入上单独运行：train-exact 2/400 = 0.50%（`25ff71a9`、`a79310a0`），unsupported 365（`grounding: semantic role coverage: missing, tied, or varying object cardinality`），no_solution 33，超时 0。仅 v0.4 解出 `a79310a0`；仅 v0.6.1 解出 `1caeab9d`、`beb8660c`。两个前端的接口前提不同，但在真实训练集上的覆盖都在 1% 量级。

## 6. 测试与运行记录

- `tests/test_report.json`：13/13 通过。数据完整性（400 文件、哈希稳定、全部解析、与 v0.3 冻结子集一致）；防泄漏（train-only 文件 test 为空、剥离结果与 test 字段真实/损坏/缺失无关、二进制拒绝含 test 文件）；超时（1 ms 预算下 Feature 与 R2 均分类为 timeout，随后 R2 以全预算在新进程独立求解 03560426 成功）；回退链（03560426 前端成功不触发 R2；007bbfb7 前端失败触发 R2）；Feature 阶段确定性。
- 首次全量运行在 360/400 时被运行环境终止（控制台会话被关闭，子进程退出码 0x40010004 / 0xC000026B），驱动器把这些进程记为 runtime_error。处理：删除 93 个带有"进程无结果文件"痕迹的任务目录，以脱离控制台的方式用驱动器的断点续跑补跑 127 个任务（`run_log_resume.txt`，`run_meta.json` 的 `resumed_skipped=273`）。最终 400 个任务没有任何 runtime_error 记录；详见 `results/arc_agi1_train_only_fallback/run_notes.md`。
- 数据副本的一个细节：Windows 上 git `core.autocrlf=true` 曾把 5 个带末尾换行的文件转为 CRLF，导致与 v0.3 冻结哈希不一致；已改为从 git blob 直接导出，400 个文件与上游逐字节一致后才运行全量实验。

## 7. 结论与边界

- 当前 v0.6.1 Feature 前端在真实 ARC-AGI-1 训练集上的 train-exact 率为 0.75%，回退率 99.25%；回退中 65% 是前端搜索自行结束无解，35% 是画布变化导致的接口不支持，没有超时与运行错误。
- R2 在回退任务中恢复 1.26%，整条链 train-exact 2.00%（8/400）。
- 主要失败不是搜索预算不足（Feature 无超时，中位 work 为 0），而是假设类覆盖：对象数不等（50%）与画布变化（35%）在搜索开始前或开始时就排除了 85% 的任务。
- 本轮不评估 test 泛化，不根据 test 输出选择程序，train-exact 不等价于真实规则正确；R2 的 64 个超时在更大墙钟下可能有不同结果，但本轮预算事先固定，不作调整。
