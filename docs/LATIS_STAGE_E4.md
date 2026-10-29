# LATIS Stage E4：Cross-Output Abstract Referents（跨全部训练输出的共享构造骨架）

本轮对应 `../prompts/LATIS_STAGE_E4_CROSS_OUTPUT_REFERENTS_PROMPT.md`。实施前审计见 [LATIS_STAGE_E4_AUDIT.md](LATIS_STAGE_E4_AUDIT.md)，实测见 [LATIS_STAGE_E4_REPORT.md](../reports/stage_e4/LATIS_STAGE_E4_REPORT.md)。E4 是一个**可关闭的输出侧结构归纳 sidecar**：它只读训练输出 `O_1..O_n`，联合归纳一个共享的、带类型 Hole 的构造骨架 `Q`，并用独立 Witness 证明 `Render(Q[θ_i]) = O_i` 对每个训练输出成立；它**不**产生 `I→O` 程序，`θ_i` 全部 `OutputObserved`、`InputBindingStatus=NotAttempted`、`prediction_ready=false`，任何结果都不进入 `train_exact`。

## 1. 类型与语法（`Synthesis.Collection.Output.Template`）

```
IntExpr     ::= ILit n | IHole h | IOff h d          d ≠ 0：Hole h 的值加冻结常数 d
ColourExpr  ::= CLit c | CHole h
ShapeT      ::= TRect x0 y0 x1 y1 | TUnion ShapeT ShapeT | TDiff ShapeT ShapeT     （对象局部帧；语义同 ShapeMDL）
ObjectT     ::= TPlace ShapeT ColourExpr px py                                    （px,py = 局部原点在画布上的位置）
CollectionT ::= TSingle ObjectT | TRepeat ObjectT count (dx,dy)                   （第 k 个实例在 (px+k·dx, py+k·dy)）
SceneT      ::= TCanvas w h BackgroundT [CollectionT]
BackgroundT ::= BgLit c | BgHole h | BgNone                                        （BgNone：每个像素必须是对象像素）
```

- Shell 表示为 `TDiff (TRect …) (TRect …)`，没有专用 `Shell` 构造子；无交并要求子集不交、差集要求 `B ⊆ A`、`B ≠ ∅`、`A \ B ≠ ∅`（复用 `ShapeMDL.evalShape`），违反即 `Left`，不会悄悄退化为普通并或裁剪差。
- `renderScene :: SceneT -> Bindings -> Either String Rendered`：对象两两不交、不出画布；`BgNone` 下有未覆盖像素即拒绝（不推断任何背景色）；记录每个像素的来源（`c<i>`、`c<i>#<k>`、`residual`），构成 `OutputConstructionWitness`。
- 多色对象：现有 Object 提取是单色 4 连通，E4 第一版用多个单色 Object 组合表达多色结构（审计 §8），不新增多色原语。
- 成本（整数，实验前冻结，不按任务调整）：算子 Canvas 1、Place 1、Repeat 2、Rect 1、Union 1、Diff 2，背景字面 1 / Hole 1 / 无 0；参数字面 1；Hole 出现 1 + 声明 2（λ_h）；偏移关系 2；绑定 λ_b = 1 /（Hole, case）；视图切换 λ_v = 2；同成本角色分配多一个 λ_m = 1。
- `C_independent`：每个输出在**同一视图分配**下单独编码（全部参数字面）的成本之和（`independentSceneCost`）；另报告各输出在任意视图下最便宜解释的成本和（`independent_cheapest_any_view`，仅当它低于前者时出现，例如"背景色即整幅"的解释）。
- 退化参考成本 `degenerateCosts`：每像素一个 Hole、整幅输出一个 Hole（= 独立编码 + 1）、按 case id 分支（= 独立编码 + n）。
- **非平凡判定** `nontrivialStructure`：`C_shared < C_independent`（同视图）；不是每个参数槽都是 Hole；对象/Shape 模板内至少一个**有信息量的**字面或偏移关系（画布常量和每个形状第一个矩形的归一化锚点 (0,0) 不算，后者由局部帧构造恒为 0）；至少一个对象构造子。不满足 → `OnlyTrivialSkeleton`。成本只声明"有界语法内枚举到的最优"，不是全域 MDL 最优。

## 2. 输出侧 Scene 候选（`Synthesis.Collection.Output.Scene`）

每个输出 `O_i`、每个视图 `v ∈ {Legacy, UniformBorderColor, UniqueMostFrequentColor, NoBackground}`：`viewRegions v O_i >>= sceneFromRegions NoShapes v O_i`（E3 的 Scene 构造：支持集两两不交、余像素单色或空、`verifyScene` 逐像素重构）。每个合法视图一个 `OutputSceneCandidate`（视图、对象列表、`UniformResidual c | NoResidual`、独立编码成本、证据）；被拒视图保留原因。对象携带**跨层**的 Shape AST 备选 `ShapeMDL.shapeAlternatives`（新函数：枚举 1..3 矩形的每一层不在首个命中层停止，按 (成本, 文本) 排序，去重，取前 8，再附 row-run 分区），全任务按精确归一化 mask 的惰性表共享（`icSharing`）。对象数超过 `obMaxObjects=8` 的视图记 `ObjectRepresentationUnavailable`。

## 3. 联合归纳（`Synthesis.Collection.Output.Induce`）

### 3.1 视图分配
先尝试"所有 case 同一视图"（每个在全部 case 都合法的视图一个分配，按独立成本和排序）；只有当没有任何同视图分配给出非平凡骨架时，再按成本和尝试最多 `obViewCombos=16` 个混合分配（每 case 取前 3 个候选的笛卡儿积），混合分配带 λ_v 视图切换成本。`FirstSceneOnly` 模式只用每 case 最便宜的 Scene 且每对象只保留最便宜 AST（局部贪婪对照）。

### 3.2 角色对齐（身份 = 构造角色，不是下标）
- **同数对象**：以 case 0 的对象列表给角色贴标签（仅标签），对每个其它 case 枚举与角色**结构兼容**（备选 AST 的操作子签名有交集）的双射，回溯枚举、总量上限 `obMatching=400`；取笛卡儿积得到全局分配；每个分配做列式反统一并计成本；达到最低成本的分配数 = `ambiguity`（λ_m 计入成本），规范形不同的最优骨架全部保留为备选。`NonUniqueRoleAssignment` 家族证明对称角色不会被 id 任意打破。
- **不同数对象**：按 (颜色, 最便宜 AST 签名) 分类；某类在某 case 缺失 → `NoJointRoleAlignment`；各 case 等数的类按类内光栅序逐列反统一（结构检查）；数量变化的类必须每个 case 内成员 mask 完全相同且位置为等差序列，否则 `UnsupportedVariableMultiplicity`（`RepresentationUnavailable`）；满足时成为 `TRepeat`（count 为 Hole 或字面，步长反统一）。不同大小的集合**从不**逐位置对齐。
- 任何剪枝只凭结构/类型证明（签名不相容、背景类型不一致），不凭训练频率。

### 3.3 类型化反统一（anti-unification）
一个 Hole 表贯穿画布、对象位置、Shape 参数、颜色：整数列全相等 → `ILit`；与已有整数 Hole 逐 case 差为常数 d → `IOff h d`（d=0 即共用 Hole）；否则新 Hole。颜色列全相等 → `CLit`，与已有颜色 Hole 逐 case 相等 → 共用，否则新 Hole。`TRect ↔ TRect` 按 4 个坐标反统一；`TDiff ↔ TDiff` 递归（Shell 的内框因此成为外框的偏移）；`TUnion` 对每个 case 尝试两种子节点顺序（签名匹配），取新增 Hole 最少者，交换记入 Witness；同签名的多个备选按总 AST 成本（`icMDLScore`）或备选顺序选择。规范形：Hole 按首次出现重编号；并集/集合顺序由匹配 Witness 固定，不在规范化时重排。`n=1` 时只报 `SingleOutputStructuralCompression`。

### 3.4 全局一致性与 pairwise 消融
所有 case 的列同时反统一，角色映射与 Hole 实例来自同一张表，因此 `Match_{i,j}` 天然相容；`PairwiseOnly` 消融对每对输出单独归纳并只报告每对的状态（`PairwiseInconsistentAlignment` 家族：每对都"成功"，联合为 `NoNontrivialSharedStructure`）。

### 3.5 状态
`StructureVerifiedAllOutputs | StructureVerifiedSubset | NoNontrivialSharedStructure | RepresentationUnavailable | ExhaustedInBoundedGrammar | BudgetTruncated | NotAttempted | SingleOutputStructuralCompression`，失败原因具体到 `NoLegalOutputView / ObjectRepresentationUnavailable / ShapeASTMissing / UnsupportedVariableMultiplicity / NoJointRoleAlignment / BackgroundKindMismatch / HoleConstraintConflict / OnlyTrivialSkeleton / BudgetTruncated`。预算分项：`obShapeAlts 8（条目）/ obMaxObjects 8（对象）/ obMatching 400（分配）/ obStructures 6（签名）/ obSkeletons 6（条目）/ obViewCombos 16（分配）/ MDL 3 矩形、面积 64、200000 表达式`；截断只记 `BudgetTruncated`，不写成 `Exhausted`。

### 3.6 Heldout 的结构诊断
`instantiateOnOutput` 对**冻结后**的骨架与一个新输出：取同视图族候选 → 结构兼容双射（有界）→ 从模板与对象 AST 收集 Hole 等式（`IOff` 反解）→ 一致则渲染比对。结果写 `oracle_parameter_structural_reconstruction ∈ {true,false,not_attempted}`（`Repeat` 骨架本版 not_attempted），**不是** heldout 预测；heldout 输出从不进入归纳、排序或成本。

## 4. Witness 与 E5 接口
每个骨架记录：`OutputSceneWitness`（每 case 的视图、对象、备选 AST、重构标志）、`AntiUnificationWitness`（角色签名、并集交换、Hole 表的角色路径与约束）、`CrossOutputReferentWitness`（角色成员 = 各 case 的对象 id、歧义数、备选骨架）、`OutputConstructionWitness`（逐 case 渲染相等、像素来源计数）、`InputBindingWitness`（`NotAttempted`）。`artifactJSON` 输出版本化 `OutputSkeletonArtifact`（骨架、类型化 Hole 与逐 case 观察值、约束、Witness；无测试标签、无 case id 分支）。独立核验 `scripts/verify_stage_e4.py` 用 Python 解释器重渲染每个骨架并做篡改测试（绑定 +1、删 Hole、改背景）。

## 5. 接入（`Front.main` 末尾的 sidecar）
`Config.outputSkeleton :: InduceConfig`（默认 `induceOff`）；`Graph.outputSkeletonRun`；`regionGate` 之后 `outputSkeletonSidecar final`：解出时（`icAuditSolved`）也运行但只记录，结果通过 `pure final` 原样返回；`e4_*` 计数进入 `counters`（不进 `search_work` 的 `operator_applications`）；记录字段 `output_skeleton`；trace 查看器新标签"输出骨架"。配置：`E4_Off`（= `E31_Full` 的 `regionSearch`，别名 `E4_FrozenE31`）、`E4_OutputSkeletonOnly`、`E4_NoCrossOutput`（`IndependentOnly`）、`E4_PairwiseOnly`、`E4_NoMDLScore`、`E4_SingleExplanation`（`FirstSceneOnly`）、`E4_NoStructuralSharing`；全部共用同一编译产物与旧求解器语义。

## 6. 机制家族（`ARC.OutputMechanism`，14 族 × 3 seeds，训练 3 对 + heldout 1 对，输入为空白/噪声网格）
| 家族 | 期望 |
|---|---|
| VariableShellGeometry | Verified：`TDiff`，内框为外框偏移，≤4 Hole |
| DisjointUnionPermutation | Verified：角色成员的光栅 id 跨 case 不同；颜色字面 |
| DifferentObjectCounts | Verified：`TRepeat`，count Hole，步长字面 (3,0) |
| SameShapeDifferentColorAndPlacement | Verified：并集结构保留，1 个颜色 Hole |
| DifferentBackgroundViews | Verified：非 Legacy 视图，背景 8 观察得出，颜色 0 是对象 |
| AlternateShapeASTs | Verified 且共享结构是 C 形的非最廉价 AST；`E4_SingleExplanation` 不能对齐 |
| SharedRelativeConstraints | Verified：1 个整数 Hole + 2 个偏移关系 |
| PairwiseInconsistentAlignment | 三个不同方块 X/Y/Z，输出 {X,Z}、{X,Y}、{Y,Z}：每对共享一个完整对象，三者无任何共同字面或偏移（枚举全部双射核对）；联合 `NoNontrivialSharedStructure`，pairwise-only 每对"成功" |
| SingleCaseCoincidence | `SingleOutputStructuralCompression` |
| DegenerateMemorizationNegative | `RepresentationUnavailable`；退化参考成本高于独立编码 |
| NonUniqueRoleAssignment | Verified，`ambiguity ≥ 2` |
| OutputOnlyNotInputExecutable | Verified，`prediction_ready=false`，`train_exact=false` |
| NonLinearCounts | `RepresentationUnavailable`（`UnsupportedVariableMultiplicity`） |
| RegionAsWholeOutput | Verified：`BgNone`，`Rect(0,0,?w-1,?h-1)` 的偏移关系 |

## 7. 测试制度
`scripts/run_stage_e4.{ps1,sh,py}` 默认：Output + Region 单元套件 → 机制矩阵 → prepare → **Quick40**（`manifests/e4_quick40.json`，hash `a9f7e765…`，由 `make_e4_quick40.py` 从 E3.1 冻结结果按固定规则与种子生成，`--check` 校验；60 s 预算，3 配置）→ regression26（E3.1 的 26 道旧解，300 s，`E4_Off` vs sidecar）→ report / verify → trace。`full400` 只在 `-Full400 / --full400` 下运行；否则报告写 `full400=not_run`，不把历史 26/400 当本阶段新数据。结果按 `/40`、`/26` 报告，不外推到 `/400`。
