# Collection experiment (v0.5)

本轮对应`../prompts/LATIS_next_round_experiment_prompt.md`。实现为新的 `solve-collection` / `collection-experiment` 入口；现有 v0.4 solver、并行分支和 R2 fallback 不改写。实验结果与边界见 `../reports/v05_collection/LATIS_COLLECTION_REPORT.md`。

## 复现

本机一键执行构建、四组测试、完整矩阵与报告审计：`./scripts/run_collection.ps1`。可用 `-Compiler` 指定其他 GHC，用 `-MechanismBudget` 指定合成任务的 R2 工作预算。

常规 Cabal 环境：

```powershell
cabal build exe:latis
cabal test collection-tests triggered-tests induced-r2-tests feature-pipeline-tests
cabal run latis -- collection-experiment --out results/v05
python scripts/report_collection.py
```

本机实际使用 GHC 9.10.3 直接构建（依赖均为已有 boot packages），临时文件限定在工作区，以避免 Windows sandbox 临时目录中 LLVM rename 权限问题：

```powershell
New-Item -ItemType Directory -Force build/collection-tmp | Out-Null
$env:TEMP = "$PWD/build/collection-tmp"
$env:TMP = $env:TEMP
$collectionGhc = 'E:/ghcup/ghc/9.10.3/bin/ghc.exe'
& $collectionGhc -O1 -Wall -XGHC2021 -threaded -rtsopts -isrc -tmpdir build/collection-tmp -outputdir build/collection app/Main.hs -o build/latis-collection.exe
./build/latis-collection.exe collection-experiment --out results/v05
python scripts/report_collection.py
```

测试同样使用以上 flags，将 main 文件依次替换为 `test/CollectionMain.hs`、`test/TriggeredMain.hs`、`test/InducedR2Main.hs`、`test/FeaturePipelineMain.hs`，每次构建后运行对应 exe。不要同时向同一 outputdir 编译多个 Main。

只运行单个任务：

```powershell
./build/latis-collection.exe solve-collection --task data/03560426.json --out results/v05-single --mode Full
```

`--budget` 沿用 R2 budget 配置（默认 250000），用于单题及矩阵的 03560426。矩阵 A–E 所有模式统一使用 `--mechanism-budget`（默认 25000），以约束真实 R2 对照计算量；可显式设为 250000 复现原预算对照。前端 API 中 `alignmentBudget` 默认 36，`scalarBudget` 默认 2000（当前 scalar 语言实际仅 219 项）；`legacyConfig` 沿用 v0.4 的 encoder/R2 配置。旧的 feature-depth/source-budget 不控制这条专用集合分支，应通过上述 Config 字段调整。

`scripts/export_collection_graphs.hs` 可在不重跑 fallback 的情况下以相同默认配置重新序列化 deterministic 前端图；它只适用于默认配置矩阵，不能用于不同配置或数据的实验结果。最终报告脚本读取完整矩阵，审计所有 witness、trigger、size index 与 R2 结果。

## Indexed IR 与对齐

`ObjectSet` 构造函数不导出，内部保存 `Set (SizeSig, Object)`。导出的集合 API 只有构造和 Count；无下标或 toList。构造时去掉对象 ID 和枚举顺序，保留位置及完整像素几何。相同形状放在不同位置仍是不同 Placed。`ObjectT sigma`、`PlacedT sigma`、`SetT ExistsPlacedT` 等是运行时 indexed IR；对象比较先统一 size index，而 Color 与 Position 可观察任意 sigma。

只有 `orderBy` 能构造 `OrderedView`，只有 OrderedView 支持带边界检查的 `rank`。键不在 visible ontology 或触发器不允许时拒绝；相同 key 值拒绝，没有偷偷按 ID、集合枚举或其他值破同分。Lex 是显式的语义键表达式。

一个候选 `(inputKey, outputKey)` 必须用于所有 training cases。RankAlign 先验证每个案例的输入/输出数量相等，然后授权各 rank 的跨 origin 比较；对象 equality 不参与构造 witness。AlignmentLift 对候选 pairing 的无序关系作逐案例复现检查，不因单个案例碰巧相等就提升为抽象。

高层保存的是量化 rank Ref，不是具体 object ID edge。具体 grounding 仅在诊断 witness 中存在。Full 的 `ConcreteCrossItemEdgeCount_high_level` 从实际 highEdges 计算；`UntriggeredExpansionCount` 从 feature 的 provenance/trigger 数据计算。

## 变换与遮挡

标量语法包括 Current/Previous 的 X、Y、Width、Height，以及 −1、0、1 和有限的加法组合。先尝试一个跨所有 rank 共用的表达式；没有共用表达式时才区分 First 与 Following。实现没有特定任务 ID 分支，测试输出不进入学习函数。

输出连通分量有时只是完整对象的可见片段。几何不相等时，NeedConstruct 解锁保留输入完整几何的候选。Previous 尺寸来自这个候选中的完整输入对象，Previous 位置来自已经生成的输出位置。最终调用原 renderer，所有 training grids exact 才接受。size index 不同的 input/observed-output 没有被直接判等；render 校验的是整幅 Scene 候选。

这只是保留完整输入几何的一类重建 hypothesis，不是任意形状生成或遮挡解析器。D 的真实 resize、E 的对象数量变化不会被虚报成功；它们使用原 R2 fallback。

## 抽象与冻结

阶段依次生成 Set、Count、OrderedView、Alignment、Ref、Concept，保留旧 feature，得到单调集合闭包。成功比较立即通过 AlignmentLift 存成抽象 rank Ref；匹配的 feature Frozen，不再作为普通 expansion frontier。后续 refinement 通过只读 witness 使用已冻结证据。此专用分支尚未与旧固定-role 的所有 feature operator 互操作。

封装只针对本轮可生成的 connected sort/align/compare-transform 子图，检查内部 dependency 完整、中间节点只流向该结果，跨训练案例使用相同 symbolic expression；最终整幅训练验证通过后才发布 I_0。高层执行项是 `Call I_0`，Definition 保存 key 与 sequence body。元数据包含 contract、输入输出类型、隐藏 refinement、依赖、provenance 和 cost。NoSemanticCohesion 使用 Inline；该消融不应改变预测。当前未实现一般图挖掘或跨任务抽象迁移，也不声称在线搜索减少。

## 消融定义

| 模式 | 唯一主要改动 |
|---|---|
| Full | 所有 legality、lift 和封装规则开启 |
| NoDependentIndex | 对象 equality 不再先检查 size index；其余规则保留 |
| DirectSetIndexing | 故意使用原 encoder 列表的 runtime 次序 zip，运行时也采用该次序；不发明有解释的 abstraction |
| NoAlignmentExplanation | 在正规候选路径之前开放全部同 object 类型的笛卡尔 equality，保存无 witness 的命中；正规可执行语法不扩充 |
| NoEagerAbstraction | 成功匹配仍保留具体边，其他对齐语法保留 |
| NoSemanticCohesion | 不封装 I_0，使用相同 Inline definition |
| R2FallbackOnly | 不执行集合前端，实际调用原 R2 |

matrix 中前端失败的每一行都实际运行原 R2，没有把“关闭前端”冒充 R2 基线。NoAlignmentExplanation 的额外比较影响可审计搜索次数和不合法 correspondence 数，本轮未显示其准确率下降。NoDependentIndex 的效果是 legality guard 消失，本轮未显示准确率差异。用这些消融不能推导大样本泛化结论。

每次保存 solution.json、derivation_graph.json、trace.txt，以及需要时的 r2-fallback/。features、逐案例 ordering provenance、alignment witness、匿名 refinement 均可独立检查。
