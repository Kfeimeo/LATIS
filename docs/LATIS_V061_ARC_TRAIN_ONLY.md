# LATIS v0.6.1：真实 ARC-AGI-1 Train-only Fallback 实验（方法说明）

本轮只做评估：在官方 ARC-AGI-1 `training` split 全部 400 个任务上，测量当前 Feature 算法仅凭任务内 `train` 样例找到 train-exact 程序的比例、触发 R2 普通搜索回退的比例，以及 R2 在回退任务中的恢复率。Feature 算法、DSL、prior、搜索策略、预算上限均未修改，没有任务 ID 特例。结果见 `results/arc_agi1_train_only_fallback/summary.md`。

## 两个阶段对应的代码

| 阶段 | 代码 | 预算（既有默认值，事先固定） |
|---|---|---|
| Feature | `Synthesis.Collection.Front.frontSearch SafeOnline`，配置 `ARC.CollectionV61Evaluate.v61Config`（v0.6.1 默认前端） | `alignmentBudget=400`, `scalarBudget=2000`, `synthesisDepth=2`, `synthesisCostBound=5`；墙钟 60 s |
| R2 | `Synthesis.InducedR2.Learn.inducedSearch Full`，配置 `R2.defaultInduced`（即 `v61Config` 的 `legacyConfig.r2Config`） | `workBudget=250000`, `depthBound=7`, `structuralCostBound=96`, `saturationWorkBudget=25000`；墙钟 300 s |
| 诊断列（不参与回退链） | `Synthesis.Triggered.frontSearch Full V4.defaultConfig`（v0.4 triggered typed feature front） | `sourceBudget=12000`, `constructBudget=12000`, `selectionBudget=100000`, `maxDepth=4`；墙钟 60 s |

“Feature”在本项目中有两个候选：v0.4 的 triggered feature front 与取代它成为当前默认前端的 v0.6.1 collection front。回退链以 **v0.6.1 前端**为准（`runTask61` 的既有链路：前端失败即 R2）；v0.4 前端在相同 train-only 输入上单独运行，只作为诊断列报告，不影响任何回退统计。

## 隔离与判定

- `scripts/arc_train_only.py prepare` 读取官方文件，计算 SHA256，只保留 `train` 字段写出 `train_only/<id>.json`（`"test": []`）。求解器进程只接收这些文件；`ARC.ArcTrainOnly.runStage` 在搜索前检查 `tests` 为空，否则写 `refused_test_pairs` 并以退出码 3 终止。
- 每个 stage 是一个独立进程（`latis arc-train-only-stage --stage feature|feature-v04|r2`），用 `System.Timeout` 做进程内墙钟超时（编译加 `-fno-omit-yields`，保证循环可被中断），驱动器再加 30 s 宽限的硬杀看门狗；RTS 堆上限 `-M4g`。Feature 超时后 R2 在全新进程中运行，不可能继承中断的搜索状态。
- Feature 成功的唯一条件：返回的程序由本模块在**每个** train 输入上重新执行，输出与目标网格完全一致（`train_exact`）。R2 同理（`predictInduced`）。
- 回退原因四分类：`no_solution`（有界搜索结束无 train-exact 程序）、`timeout`（墙钟）、`unsupported`（文件解析失败，或前端在搜索前的接口前提拒绝：v0.6.1 失败串前缀 `layout:` / `grounding:`）、`runtime_error`（异常、堆溢出、进程崩溃）。`RankAlign: unequal input/output cardinality` 是编码并计数对象后由搜索阶段给出的拒绝，计为 `no_solution`。原始失败串逐任务保留。

## 文件

| 文件 | 内容 |
|---|---|
| `src/ARC/ArcTrainOnly.hs` | 单任务单阶段运行器：泄漏守卫、超时、异常分类、train-exact 复核、结构诊断、JSON 记录 |
| `app/Main.hs` | 新子命令 `arc-train-only-stage` |
| `scripts/arc_train_only.py` | `prepare` / `test` / `run` / `report` / `all` |
| `scripts/run_arc_train_only.ps1` | 一键：构建 → smoke（8 任务 + 测试）→ 全量 prepare/test/run/report |
| `data/arc1-training/` | 官方 training split 400 文件的原样副本（含 README 与来源 commit） |
| `results/arc_agi1_train_only_fallback/` | `summary.md`、`per_task.csv`、`metrics.json`、`data_manifest.json`、`code_version.json`、`run_meta.json`、`tasks/<id>/{feature,feature-v04,r2}.json` 与 stdout/stderr、`driver.json`、`tests/test_report.json`、`smoke/` |

## 测试（`scripts/arc_train_only.py test`）

数据完整性（400 文件、哈希稳定、全部可解析、与 v0.3 冻结子集的 30 个哈希一致）；防泄漏（train-only 文件 `test` 为空；对 test 字段真实/损坏/缺失三种来源剥离结果逐字节相同；二进制拒绝含 test 对的文件）；超时（1 ms 预算下 Feature 与 R2 均被分类为 `timeout`，随后 R2 以全预算在新进程独立运行）；回退链（前端可解任务不触发 R2；前端失败任务触发 R2）；Feature 阶段确定性（两次运行记录一致）。

## 复现

```powershell
./scripts/run_arc_train_only.ps1                       # 构建 + smoke + 全量
./scripts/run_arc_train_only.ps1 -SkipBuild -SkipSmoke # 只重跑全量
python -I scripts/arc_train_only.py report             # 只重新汇总
```
