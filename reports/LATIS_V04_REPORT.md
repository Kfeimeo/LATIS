# LATIS v0.4 实验报告

实验日期：2026-10-21。此报告由 `scripts/report_v04.py` 从保存的结果生成。

新增前端在 A–F 六个机制任务上训练及留出均正确；G 拒绝当前语法内只能靠具体坐标记忆的候选。03560426 前端失败后，原版 R2 训练与留出均正确。

## 剪枝与共享

| 比较 | Full work | 消融 work | 消融 / Full |
|---|---:|---:|---:|
| A-match-pruning / NoMatchedFeaturePruning | 61 | 4713 | 77.26 |
| D-irrelevant-library / NoVisibility | 61 | 861 | 14.11 |
| B-transform-reuse / NoTransformReuse | 83 | 139 | 1.67 |

work 是定义构建、案例求值、构造和全局选择的逻辑费用，不是耗时。D 的 200 个不可见噪声算子没有增加 Full 的 operator applications。该结论限于注册 ontology slice；不是任意外部库增长下的复杂度证明。

## Full 与独立 R2 基线

| 任务 | 前端 train / heldout | 前端 work | R2 train / heldout | R2 expanded work |
|---|---|---:|---|---:|
| A-match-pruning | True / True | 61 | True / True | 30125 |
| B-transform-reuse | True / True | 83 | True / True | 32831 |
| C-depth-three | True / True | 3678 | True / True | 109473 |
| D-irrelevant-library | True / True | 61 | True / True | 30125 |
| E-scene-construction | True / True | 1109 | False / False | 37 |
| F-intensional-ref | True / True | 9951 | True / True | 96245 |
| G-invalid-abstraction | False / False | 9890 | False / False | 37 |

两种 work 的计量不同，不应据此直接计算跨 solver 加速比。保存的 wall-clock 为单次、部分并行运行，不能作为稳定性能统计。机制矩阵的 R2FallbackOnly 行只表示前端关闭；上表引用另行真实运行的 `r2-baseline/`。

## 03560426 vertical slice

前端失败点：`grounding: semantic role coverage: missing, tied, or varying object cardinality`。

训练输入的对象数量为 4、3、3，颜色也随案例变化。当前固定语义角色向量不能完整覆盖这些可变对象集合，因此在进入 saturation 前明确失败；没有用对象下标或手写 Attach/At/Chain 绕过。

fallback_count=1；R2 expanded work=151856；训练、留出 exact 均为 true。R2 源码没有更改。

## 不变量与验证

70 个前端矩阵条目均满足 UntriggeredExpansionCount=0、ConcreteParameterExposureCount=0；脚本逐条检查 graph 节点、hyperedge 引用和 trigger/argument evidence。Full 中 expanded_frozen_features=0。

通过测试套件：triggered-tests、latis-tests、feature-pipeline-tests、induced-r2-tests、triggered-parallel-tests。新增测试覆盖三层 closure、共享成本全局最优、硬预算、多个结构别名、负向 capture 检查、层级 refinement 和 controlled widening。

## 并行候选求值（`--workers`）

`solve-v04 --workers N` 只并行化单任务 source closure 中候选表达式的跨案例求值；调度、预算、冻结、匹配和提交顺序由一个权威线程按串行规则执行。`v04-stress --workers 4 +RTS -N4` 的 70 个条目与串行矩阵在 metrics.csv、solution.json、derivation_graph.json、contexts.json、trace.txt 的全部逻辑字段上零差异；03560426 在 4 workers 下的 fallback 决策与串行相同，训练、留出 exact。

| 任务 | work | workers=1 | workers=2 (-N2) | workers=4 (-N4) | w4 加速 | 求值占 closure | w4 实际求值/丢弃 |
|---|---:|---:|---:|---:|---:|---:|---:|
| A-match-pruning | 61 | 0.0008 s | 0.0009 s | 0.0010 s | 0.82x | 2.3% | 8/0 |
| B-transform-reuse | 83 | 0.0007 s | 0.0009 s | 0.0010 s | 0.66x | 4.1% | 24/0 |
| C-depth-three | 3678 | 0.0757 s | 0.0833 s | 0.0906 s | 0.84x | 5.8% | 1736/0 |
| D-irrelevant-library | 61 | 0.0009 s | 0.0011 s | 0.0013 s | 0.74x | 1.8% | 8/0 |
| E-scene-construction | 1109 | 0.0000 s | 0.0000 s | 0.0001 s | — | — | 0/0 |
| F-intensional-ref | 9951 | 0.2102 s | 0.2316 s | 0.2465 s | 0.85x | 4.7% | 4680/0 |
| G-invalid-abstraction | 9890 | 0.0000 s | 0.0001 s | 0.0001 s | — | — | 0/0 |

closure 耗时为 `v04-bench` 预热 2 次、重复 9 次的中位数，不含编译与序列化；“求值占 closure”是把该次提交的全部 term 在调度器外串行重算的耗时占比。E、G 没有可求值的候选（closure 不到 0.2 ms），不计加速。候选求值只占 closure 的百分之几，其余是必须串行的权威提交路径，因此并行求值在这些任务上没有加速，C 与 F 反而变慢；推测丢弃为 0，额外实际求值为 0。详细环境、RTS 参数、内存与 GHC 9.10.3 对照见 [并行报告](LATIS_V04_PARALLEL_REPORT.md)，语义见 [设计说明](../docs/LATIS_V04.md)。

## 结论与限制

极小 Object/Position 起点能覆盖本次有限任务族；冻结与可见性在 A、D 上显著减少逻辑工作。E 展示了 source 无对象时通过全输出 witness 构造；F 展示了跨尺寸 GridBR 指称。

C 中匿名关系来自成功派生拓扑，最终程序实际调用这些关系；较大关系沿已登记依赖构成多层级。关系发现目前发生在完整解释之后，search-reduction 是结构估计：NoRelationInvention 和 FlatRelations 没有展示在线搜索收益，不据此宣称收益。

前端仍是固定角色、有限 typed wrappers 与矩形构造语法的原型，未覆盖可变数量对象的关系闭包、遮挡及一般稀疏形状构造。全局最优仅限已生成的候选图，不能推导 ARC 整体泛化提升。失败 fallback 保持 R2 的原预算和搜索行为；前端训练 exact 不等于未知案例上的正确性保证。

实现与复现命令见 [设计说明](../docs/LATIS_V04.md)。原始矩阵见 [metrics.csv](../results/v04/stress/metrics.csv)，R2 基线见 [baseline metrics](../results/v04/r2-baseline/metrics.csv)。
