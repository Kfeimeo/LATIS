# LATIS Dependent Collection + Explained Alignment 实验报告

实验日期：2026-10-21。由 `scripts/report_collection.py` 审计 42 个运行条目生成。

03560426：新集合前端训练与留出均 exact，fallback_count=0。原 v0.4 和 R2 solver 源码保持不变。

## 七组消融

表格为前端 train / heldout；R2FallbackOnly 列为真实 R2 的 train / heldout。失败行均实际运行原 R2，完整结果在各目录 solution.json。

| 任务 | Full | NoDependentIndex | DirectSetIndexing | NoAlignmentExplanation | NoEagerAbstraction | NoSemanticCohesion | R2FallbackOnly |
|---|---|---|---|---|---|---|---|
| 03560426 | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ |
| A-variable-count | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ |
| B-runtime-trap | ✓ / ✓ | ✓ / ✓ | ✓ / ✗ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ |
| C-accidental-equality | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✓ / ✓ | ✗ / ✗ |
| D-size-index | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ |
| E-count-mismatch | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ | ✗ / ✗ |

## 03560426 的派生

F0 是携带 SizeSig 的无序对象集合，三个训练案例 cardinality 为 4、3、3。输入按 XCoord 排序，输出按 YCoord 排序；每个案例内部数量相等，排序表达式跨案例相同。先生成 RankAlign witness，再验证 Color 观察器；AlignmentLift 重新验证整个配对关系。

可执行匿名抽象 I_0 由排序、对齐、比较与 sequence-local 变换的连通派生封装。学出的首项表达式是 (CurrentX,CurrentX)，在现有训练和留出中均为 (0,0)；后续位置为 PreviousX + PreviousWidth − 1、PreviousY + PreviousHeight − 1。Previous 的尺寸来自重建的完整对象，不来自被遮挡的输出片段。首项表达式与固定原点在当前样本上无法区分，不能据此保证任意平移输入上的行为。

```text
Program (EncoderConfig {connectivity = Four, encoderBackground = 0}) (Call "I_0") (fromList [("I_0",Definition XCoord (Body (Observe CurrentX) (Observe CurrentX) (Plus (Plus (Observe PreviousX) (Observe PreviousWidth)) (Literal (-1))) (Plus (Plus (Observe PreviousY) (Observe PreviousHeight)) (Literal (-1)))) False)])
```

对象级 equality 的 size index 不一致时仍然拒绝。未匹配几何触发 NeedConstruct，提出保留输入完整几何的候选，再通过所有训练输出的整幅 render exact 检验。输出较晚 rank 覆盖较早 rank，沿用既有 render 语义。没有添加 Attach、At、Chain 或按 ID 对齐。留出输出只用于评分，未进入 synthesis。

## 三个研究问题

1. 在本次有限唯一键 ontology 与任务族中，可变数量集合能通过统一 rank expression 对齐。A–C 的训练数量 2、3，留出数量 4；03560426 的 4、3、3 也无需固定角色。并列键、数量不相容及跨案例更换排序均被拒绝。

2. C 上 Full 仅尝试 5 次对象比较，NoAlignmentExplanation 尝试 18 次，并产生 13 个无对齐说明的 equality 命中。DirectSetIndexing 在 B 上 train=true、heldout=false；Full 两者均 true。这是机制反例，不是 ARC 全集泛化提升的统计证明。

3. Full 的成功程序调用 I_0，内部排序键、sequence body 保存在 definition/refinement 中。NoSemanticCohesion 使用 inline definition，预测不变但没有抽象。这证明了受限派生结构的封装与可执行展开；未证明任意子图发现能力或在线搜索加速。

## 合法性与范围

审计了 295 个逐案例 alignment witnesses：同一 cohort 的 symbolic expression 一致，数量约束满足，key 严格有序，所有 Placed 的声明尺寸与几何一致。Full 高层 concrete edge 为 0；所有模式的 UntriggeredExpansionCount 和 expanded_frozen_features 为 0。

NoDependentIndex 撤去对象比较的尺寸统一检查；本轮未观察到因此提高或降低最终准确率。NoAlignmentExplanation 在正常候选路径前开放笛卡尔 equality，并将命中保留在消融图中；可执行候选仍来自同一有界排序/变换语法，因此不能据此宣称该消融必然降低准确率。NoEagerAbstraction 保留具体边；NoSemanticCohesion 不封装。

前端是与 v0.4 共用 encoder、renderer、配置与原 R2 fallback 的专用集合饱和分支，旧 solve-v04 路径保持原样。闭包以 Set→Count→OrderedView→Alignment→Ref→Concept 阶段单调扩展，冻结的证据只作为只读依赖使用。未把所有 v0.4 operator 都提升到集合，也未实现完整 dependent theorem prover。

ontology 固定为 X、Y、Area、Color、Lex(X,Y)、Lex(Y,X) 六个可见键，最多 36 组 alignment。Scalar 为 Current/Previous 的位置、宽高与 −1/0/1 的有界加法表达式；优先共享所有 rank 的表达式，再允许 First/Following 分支。scalar_candidate_bound 是候选上界，不是真实执行次数。当前仅支持同画布、保留完整输入几何的 realization；无法解释的缩放、新对象、数量变化正常 fallback。

合成任务专门构造以检测机制，规模很小；语法对齐不保证唯一正确解释。本轮没有神经网络或并行优化。

## 复现与测试

通过 Collection、Triggered、InducedR2、FeaturePipeline 四组测试，日志位于 results/v05/validation。R2 源码与 Git 基线无差异，SHA-256 清单保存在 source-hashes.json。Windows 实测 GHC 9.10.3、-O1，使用工作区临时目录避免系统临时目录链接权限问题；wall-clock 是单次观察，不用于性能结论。

本次保存矩阵：合成任务 A–E 所有模式统一配置 R2 workBudget=25000；03560426 为 workBudget=250000。开发时初次以 250000 跑同色机制任务，对照耗时很长，故中止该未完成运行，将默认合成任务预算设为 25000 重新执行，未改变 R2 实现。不能将较小预算内失败解释成 R2 在原预算下不能求解。

```powershell
./build/latis-collection.exe collection-experiment --out results/v05
python scripts/report_collection.py
```

完整构建方法与边界见 docs/LATIS_COLLECTION.md。原始表格：results/v05/metrics.csv。
