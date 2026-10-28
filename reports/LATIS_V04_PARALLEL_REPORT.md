# LATIS v0.4 并行候选求值报告

日期：2026-10-21。本报告记录单任务 source closure 候选表达式并行求值（`--workers N`）的实现验证与性能实测。设计与语义见 [docs/LATIS_V04.md](docs/LATIS_V04.md) 的“并行候选求值”一节。原始数据在 `results/v04-parallel/`（新目录，未覆盖 `results/v04/` 的历史结果）。

## 改动摘要

- `src/Synthesis/Triggered.hs`：纯串行 `sourceClosure` 原样保留；`frontSearch` 拆为 `frontPrepare` / closure / `frontFinish`；新增逻辑计数 `evaluation_failures`；`Result` 增加 `closureSeconds`；`solve` 通过 `solveClosure` 实现，行为不变。
- `src/Synthesis/Triggered/Parallel.hs`（新）：有界 worker 池（STM `TBQueue`，容量 = window）+ 单一权威调度线程；worker 只做跨案例求值并在线程内完全求值；调度器按串行顺序提交，提交前以权威图重新计算守卫、费用、term；推测结果只按 term 匹配使用，失效即丢弃；推测上限 `speculationCap` 保证 `parallel_discarded ≤ cap`；worker 异常原样传播并由 `bracket` 清理线程。
- `app/Main.hs`：`--workers`（默认 1）、`--window`、`--speculation-cap`；capability 少于 workers 时打印警告；新增 `v04-bench`。
- `latis.cabal`：可执行文件与新测试套件 `-threaded -rtsopts`；库依赖加 `stm`（GHC boot 包，离线可构建）。
- `src/ARC/TriggeredEvaluate.hs`、`src/ARC/TriggeredStress.hs`：`saveWith` / `runMatrixWith` 记录并行设置与 closure 耗时；矩阵保持串行。
- `test/TriggeredParallelMain.hs`（新）、`scripts/report_v04_parallel.py`（新）。

## 验证命令与结果

| 命令 | 结果 |
|---|---|
| `cabal test triggered-parallel-tests --test-options="+RTS -N4 -RTS"`（GHC 9.14.1） | PASS，139 条断言 |
| 同一二进制 `+RTS -N1`（仅绿色线程） | PASS，139 条断言 |
| `cabal test triggered-tests latis-tests feature-pipeline-tests induced-r2-tests`（GHC 9.14.1） | 4/4 PASS |
| `cabal build -w ghc-9.10.3 all` | 成功；新改文件无警告 |
| `cabal test -w ghc-9.10.3 triggered-parallel-tests`（`+RTS -N4`）、`triggered-tests latis-tests feature-pipeline-tests induced-r2-tests` | 5/5 PASS |
| `v04-stress --workers 1` 与 `v04-stress --workers 4 +RTS -N4` 的 70 个条目 | `scripts/report_v04_parallel.py` 比较 metrics.csv、solution.json、derivation_graph.json、contexts.json、trace.txt 的全部逻辑字段：0 处差异 |
| `solve-v04 --task data/03560426.json --workers 4 +RTS -N4` | 前端在 grounding 失败（与串行相同），fallback R2 训练/留出 exact，`fallback_count=1`，R2 work 151856 |

测试覆盖：7 任务 × 9 模式 × scheduler(1/2/4 workers) 与串行参考的 program、失败原因、最优性标记和剥离 `parallel_*` 后的整张图完全相等；预算边界（含 0 和不足一次跨案例求值）不超额；前一提交解释目标后，后续来源的推测被丢弃（`parallel_discarded_invalid ≥ 1`，`depth_end = 0`）；定义首次费用只计一次；求值失败、重复语义状态与多别名在 1/2/4 workers 下一致；worker 异常（含发生在随后被丢弃的推测中的异常）传播到调用方且线程全部结束；worker 数、window、推测上限各自生效，上限耗尽后退化为内联求值且结果不变；MVar 门控强制第 0 个推测晚于第 1 个完成，验证确有两次求值重叠且结果仍等于串行；`solveWith` 与 `solve` 的 fallback 决策、R2 失败原因和逻辑指标一致。

一个实现层面的观察：source 特征的冻结状态只在它自身与某个目标 denotation 相等时改变，而目标集合固定，因此一个来源不可能因自己的展开被冻结；冻结守卫仍在每次提交前按权威图重新读取，但“前一候选使后续推测失效”的实际途径是前一提交解释了目标、使后续来源在展开时没有可见算子。测试夹具按此构造。

## 性能

环境：AMD Ryzen 7 5800H（8 核 / 16 线程）、32 GB、Windows 11 Home 10.0.26300；GHC 9.14.1，`-O2`，cabal 3.16.1.0；RTS 参数 `+RTS -N<k> -T`（另测 `-N4 -T -qg`）。`v04-bench` 对每个压力任务预热 2 次后重复 9 次，仅对 source closure（`closure_seconds`）计时，不含编译与结果序列化；期间未运行其他实验。下表为 closure 中位耗时（秒）；`actual/discarded` 为实际跨案例求值数与丢弃的推测数。

| 任务 | work | w1 | w2 (-N2) | w4 (-N4) | w4 (-N4 -qg) | w2 加速 | w4 加速 | w4 实际求值/丢弃 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| A-match-pruning | 61 | 0.0007 | 0.0009 | 0.0010 | 0.0010 | 0.84x | 0.72x | 8/0 |
| B-transform-reuse | 83 | 0.0008 | 0.0011 | 0.0011 | 0.0011 | 0.73x | 0.71x | 24/0 |
| C-depth-three | 3678 | 0.1308 | 0.1254 | 0.2143 | 0.1612 | 1.04x | 0.61x | 1736/0 |
| D-irrelevant-library | 61 | 0.0022 | 0.0012 | 0.0016 | 0.0017 | 1.78x | 1.37x | 8/0 |
| E-scene-construction | 1109 | <0.0001 | 0.0001 | 0.0002 | 0.0002 | — | — | 0/0 |
| F-intensional-ref | 9951 | 0.3559 | 0.4165 | 0.4839 | 0.4600 | 0.85x | 0.74x | 4680/0 |
| G-invalid-abstraction | 9890 | <0.0001 | 0.0001 | 0.0002 | 0.0002 | — | — | 0/0 |

结论：**在现有任务上并行求值没有带来加速，F 与 C 变慢 15–40%**。A/B/D 的 closure 本身不到 3 ms，差异在线程池创建量级；E/G 的 closure 没有候选（0 次求值），差异就是池的创建与销毁。D 的 1.78x 处在 1 ms 量级的噪声内，不作结论。

原因由 `v04-bench` 的 `eval_only_seconds` 列量化：把本次 closure 提交的全部 term 在调度器外串行重新求值，F 需 0.015 s（4680 个 term），C 需 0.008 s（1736 个），分别只占 closure 时间的 4.3% 与 5.8%。即使求值时间降为零，Amdahl 上限也只有约 1.05x。closure 的其余 95% 是权威提交路径——`rematch` 全量重算匹配、Map 插入、`visible`/类型可达性、只读参数扫描与 `edges ++ [edge]`——按本轮范围这些都必须保持串行且未做任何优化。额外的 `TBQueue`/`MVar` 交接和 worker 线程调度则是净开销，`-N4` 下 F 的 mutator CPU 从 281 ms 升到 500 ms。`parallel_discarded = 0` 说明推测本身在这些任务上没有浪费求值；`-qg`（关闭并行 GC）略好于默认但仍慢于串行。

内存：`+RTS -T` 的 `max_live_bytes` 为进程级峰值，F 单任务约 9.5 MB（w1）/ 10.1 MB（w4）；并行版本的常驻增量在 1 MB 以内。

GHC 9.10.3 构建的同一基准（`results/v04-parallel/bench/ghc-9.10.3/`）结论相同：F 为 0.455 s（w1）对 0.546 s（w4）。

## 限制与未验证项

- 只在 Windows 11 / x86_64 上实测；Linux 命令按 cabal 通用形式给出，未在 Linux 上运行。
- GHC 9.14.1（默认）与 9.10.3（ghcup）均完成构建和全部相关测试；未测试其他版本。
- 现有压力任务的候选求值过于廉价，不能据此评价并行化在求值开销较大的任务（大对象、多案例、昂贵算子）上的收益；本轮没有为了制造收益改变任务或预算。
- 推测窗口不跨深度；`parallel_discarded_evaluated/_cancelled` 取决于线程时序，其余 `parallel_*` 计数可复现。
- 若要获得实际加速，瓶颈在串行提交路径（见上），这属于后续轮次的算法优化，本轮明确不做。

## 完整 v0.4 实验中的重复测量

2026-10-21 的完整 v0.4 实验链（`scripts/report_v04.py` 审计，结果在 `results/v04/bench/`）在更安静的机器状态下重复了同一基准，方向一致：F 的 closure 中位耗时 0.210 s（workers=1）/ 0.232 s（2）/ 0.246 s（4），C 为 0.076 s / 0.083 s / 0.091 s；A/B/D 在 1.3 ms 以内；推测丢弃仍为 0。该次 `v04-stress --workers 4` 的 70 个条目与串行矩阵同样零逻辑差异。
