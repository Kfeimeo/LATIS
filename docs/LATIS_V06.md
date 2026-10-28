# LATIS v0.6：Counterfactual-Preserving Online Abstraction

本轮对应`../prompts/LATIS_v06_experiment_prompt.md`。实现为 v0.5 collection front-end 的增量升级，新增入口 `solve-collection-v6` / `collection-v6-experiment`。v0.5 的 `Synthesis.Collection`、`ARC.CollectionEvaluate`、v0.4 solver 与 R2 fallback 源码不改动（报告脚本对比 SHA-256 与 git diff）。实验结果与边界见 `../reports/LATIS_V06_REPORT.md`。

## 模块

| 模块 | 内容 |
|---|---|
| `Synthesis.Collection.Indexed` | dependent-index IR：`Placed[σ] = Object[σ] × Pos`，`Object[σ]` 是 σ 包围盒的行主序 cell 向量；私有 `ObjectSet`（无下标、无 toList，只有 order-free 聚合）；`objectEqual` 先统一 size index；`KeyExpr` 语法、`visibleKeyGrammar`、私有 `OrderedView`、`rankAlign`、`alignmentLift`、`legalComparison` |
| `Synthesis.Collection.Counterfactual` | sequence-local scalar 语言（Current/Previous/Scene/Set 原子，无 Attach/At/Chain、无 ID）、`parametrize`/`instantiate`、semantic class 与 representative、intensionality prior、counterfactual context 生成器 |
| `Synthesis.Collection.Online` | refinement 节点、typed/relational anti-unification、utility 分量、cohesion 检查 |
| `Synthesis.Collection.Front` | 11 个模式、搜索状态、触发式 key 阶段、slot 拟合、在线 promotion/reuse、realization、`Program`/`runProgram` |
| `ARC.CollectionV6Evaluate` | 机制任务 A–F、矩阵运行、solution/derivation_graph JSON（含 19.1–19.3 审计字段） |

## 复现

```powershell
./scripts/run_collection_v6.ps1          # 构建五组测试与应用，跑完整矩阵，审计并生成报告
```

常规 Cabal：

```powershell
cabal build exe:latis
cabal test collection-v6-tests collection-tests triggered-tests induced-r2-tests feature-pipeline-tests
cabal run latis -- collection-v6-experiment --out results/v06
python scripts/report_collection_v6.py
```

本机直接用 GHC 9.10.3 构建（临时目录限定在工作区，避免系统临时目录的 LLVM rename 权限问题）；每个 Main 使用单独的 `-outputdir`，不要向同一 outputdir 同时编译多个 Main：

```powershell
$env:TEMP = "$PWD/build/collection-v6-tmp"; $env:TMP = $env:TEMP
E:/ghcup/ghc/9.10.3/bin/ghc.exe -O1 -Wall -XGHC2021 -threaded -rtsopts -isrc -tmpdir build/collection-v6-tmp -outputdir build/collection-v6 app/Main.hs -o build/latis-collection-v6.exe
./build/latis-collection-v6.exe solve-collection-v6 --task data/03560426.json --out results/v06-single --mode Full
```

`--budget`（默认 250000）用于 03560426 的 R2 fallback，`--mechanism-budget`（默认 25000）统一用于 A–F 所有模式。前端 `Config`：`alignmentBudget=400`（候选 key 对上限）、`scalarBudget=2000`（scalar 语法实际 360 项）、`synthesisDepth=2`、`synthesisCostBound=5`、`promotionThreshold=4`。

## 保留的 v0.5 不变量

`Set[T]` 无下标；只有带 ordering provenance 的 `OrderedView` 可以 rank/列举；`orderBy` 遇到 tie 直接拒绝，不按 ID、枚举顺序、hash 或任何未记录字段破同分，refinement 只能通过显式 `Lex(k1,k2)` 键；object-level equality 先统一 size index；Color/Position/Extent 等 polymorphic observer 可跨 σ；`Count : Set[T] → Nat` 是普通 feature；matched/frozen feature 不进入 expansion frontier。全部运行 `UntriggeredExpansionCount=0`、`expanded_frozen_features=0`，Full 的 `ConcreteCrossItemEdgeCount_high_level=0`。

## Counterfactual-preserving feature classes

每个 slot（shared-AX、first-AX、following-AX、同样 AY）枚举整个有界 scalar 语法，所有 training-exact 的表达式进入同一 semantic class `(Scalar, training denotation)`。每个 representative 记录 expression、dependency_signature、ontology_provenance、intensionality_class（literal / scene-ref / object-observer / collection / alignment / invented-abstraction / mixed）、groundedness、cost 分量、counterfactual_signature。

Counterfactual context 按案例生成，只提供 context，不提供目标输出：`TranslateScene(Δ)`（四个单位方向，越界即记为 ILLEGAL）、`PadCanvas right/bottom +2`、`PadCanvas left/top margin +2`、`PermuteObjects`（ID-free Set 下按构造不变）、`InsertIrrelevant`（新色 1×1 像素或现有对象副本：画布内、与所有既有 cell 的 Chebyshev 距离≥2、key 值严格大于所有既有对象以保持既有 rank）。无法满足合法性的 context 记录在 `rejected_counterfactual_contexts`。

签名不同只用于分组（`counterfactual_splits`），从不删除候选。只有签名、intensionality class、dependency signature 三者都相同的 representative 才被 canonicalize 为最低 cost 的一个（`canonical_merges`）。

排序：`Cost = L + 4·Literal + 2·Accidental + CrossAxis − (Canonical + FreeVar + Boundary + Determinacy)`。Accidental 指训练各行上取值恒定、因而未被验证的 observer/collection 依赖；CrossAxis 指 y 槽依赖 x 轴观察量（反之亦然）；Canonical 指 scene referent 或已接受的 abstraction；FreeVar=max(0, 2−依赖数)；Boundary 指所有依赖在一个 ontology slice 内；Determinacy 指在所有 counterfactual context 上可求值。没有任务 ID 分支。

## Synthesized alignment key

seed 词汇仍是 X、Y、Area、Color、Lex(X,Y)、Lex(Y,X)。只有 `NeedCrossItemAlignment`/`NeedOrderedView`/`NeedUniqueRef` 触发时才有可见 key；seed 对全部失败后记录 `AlignmentFailure`，`visibleKeyGrammar` 才打开合成层：`Anchor{TL,BR}{X,Y}`、`Extent{X,Y}`、`Area`、`Color`、`Desc k`、`Lex a b`，深度≤2、cost≤5（Anchor BR 计 3：position+extent+组合）。每个 key 先在所有 case 的对应 Set 上检查严格排序（tie → `ordering_ties_rejected`），只有在输入/输出两侧都合法的 key 才按 cost 组成候选对。FixedAlignmentKeys 永远只看到 seed。

## Online semantic abstraction

搜索把每个候选的派生节点物化为 refinement 节点（`refinement_expansions`）。两个 family：

- `RankCorrespondence`：每个 case 的 order-in / order-out / rank-align 三节点，在第一个完整候选上 anti-unify，kIn/kOut 成为 Concept 自由参数；promotion 后后续候选只物化一个 Call 节点（saved = 3·cases − 1）。
- `SequentialScalar`：slot 选中表达式的 per-case 实例，axis Concept 与 literal Constant 经 typed parametrization 成为自由参数；promotion 后后续 slot 先尝试 `Call(I_k)` 的参数组合，命中则跳过 scalar 语法枚举（saved = nodes_hidden·cases − 1，operator_applications 同时减少）。

anti-unification 要求实例在 operation、dependency 结构、ontology slice 上逐位一致；不同的参数必须是 Constant/Concept 才能成为自由参数，Ref/Alignment/Abstraction 保持绑定，PConcrete（具体 ID 或坐标）直接拒绝。`Utility = Compression + SearchReductionEstimate + ReuseCount + DecouplingGain + 2·SemanticCohesion − InterfaceCost`，阈值 4，所有分量和 occurrence_count / nodes_hidden / boundary_size / estimated_reexpansion_saved / actual_reuse_count 写入 derivation_graph.json。

最终成功的派生按 v0.5 方式封装为 `I_0`（cohesion 门控，不是 utility promotion），高层只看到 `Call(I_0)` 与 contract；隐藏 refinement 图只在执行（RefinementTrigger）与 DebugAudit（JSON）下展开。报告脚本检查 high_level_view 不含 OrderBy/RankAlign/Plus/Lit 等内部符号。

## 消融定义

| 模式 | 唯一主要改动 |
|---|---|
| Full | 全部机制开启 |
| NoCounterfactual | 不生成 counterfactual 签名，结构多样性保留 |
| CollapseByTrainingDenotation | 训练 denotation 相同只保留最低结构成本（长度+literal 惩罚，枚举顺序破同分）的 representative；premature_collapses 仅作诊断统计 |
| NoIntensionalityPrior | cost 只有长度，按枚举顺序（observer 优先，与 v0.5 相同）破同分 |
| FixedAlignmentKeys | 恢复 v0.5 六键，不允许合成 |
| NoAlignmentExplanation | 在解释式搜索之前允许无 witness 的 Cartesian Color 相等配对（枚举顺序），能拟合训练就接受 |
| NoOnlineAbstraction | 完全关闭 abstraction 发明（含最终封装） |
| PostHocOnly | 搜索中不发明；搜索结束后对最终派生做同样的 anti-unification 与封装，不回馈搜索 |
| NoDependentIndex | object equality 与 shape 集合擦除 σ |
| DirectSetIndexing | 按 encoder 枚举顺序 zip（v0.5 消融，用于 runtime-order trap） |
| R2FallbackOnly | 不运行前端，直接用原 R2 |

## 机制任务

| 任务 | 机制 |
|---|---|
| A-seed-key | v0.5 的 move 任务；seed X 键可解，留出数量 4 |
| B-composite-key | 输入 X/Y/Area/Color 全部 tie，Lex 配对错误，只有合成的 Height（Extent AY）键可解 |
| C-runtime-order-trap | hook 形状使 encoder 枚举顺序 ≠ Lex(Y,X)，训练上枚举顺序恰等于高度顺序，留出打破 |
| D-size-index-trap | 输出平移量 = 不同 indexed shape 的数量；2×1 与 1×2 bar payload 相同，擦除 σ 后得到训练可拟合、留出失败的 `CountShapes+1` |
| E-first-item-counterfactual | 训练首项在 x=0，GridLeft/Literal 0/CurrentX/SetMinX 同值；留出首项 x=3 |
| F-repeated-pattern | 链顺序为输入 Y 顺序，多个 seed 候选完整但验证失败（RankCorrespondence 复用），同一 anchor 模式出现在两个轴（SequentialScalar 复用） |
| 03560426 | vertical test |

## 限制

- 子图发现基于搜索自身标记的实例集合，不是通用图挖掘；复用的槽位只保留 Call representative。
- Counterfactual 不能区分 GridLeft 与 Literal 0 这类在所有合法画布上同值的候选，二者并存由 prior 排序。
- 合成 key 与 scalar 语法都是有界枚举；realization 仍限于同画布、数量相等、保留输入几何的 sequence-local 变换。
- 合成任务极小，只能证明机制行为，不能推断大规模泛化。
