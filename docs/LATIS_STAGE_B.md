# LATIS 阶段 B：Case-Relative Abstract Referents + Witnessed VSA + 分层 TSL 搜索

本轮对应 `../prompts/LATIS_STAGE_B_ABSTRACT_REFERENTS_PROMPT.md`，在阶段 A 代码上实现增量。所有 B 能力挂在前端 `Config` 的新字段 `stageB :: StageB` 上，默认 `stageBOff`（全部关闭）；`defaultConfig`/`v61Config`/阶段 A 的七个配置（`ARC.StageAEvaluate`）行为不变（回归见测试 `test/StageBMain.hs` 与 `results/stage_b/mechanism/regression_stage_a.csv`、`results/stage_b/arc/metrics.json.per_config.BaselineA.same_as_stage_a_fulla`）。结果与结论见 `../reports/stage_b/LATIS_STAGE_B_REPORT.md`。

## 1. 开工前审计（接口定位，文档与源码一致性）

| 构件 | 源码事实 | 阶段 B 的处理 |
|---|---|---|
| `Language.ML` | 已有 `Less`、`EqualInt`、`Not`、`If`、`IsOdd`、`Mod`；**无** `And`/`Or`/`Greater` | 新增 `And`、`Or`（严格求值：任一参数失败则连接词失败，无短路）；`Gt` 不新增，用 `Less` 交换参数实现 |
| `Language.Schema.registry` | 字符串级注册表，有 `less`/`equalInt`/`not`/`bbox`/`width`/`height`，无 `and`/`or` | 新增 `and`、`or` |
| `Synthesis.Collection.Typed` | `TOp = Add|Sub|Mul|Mod|IsOdd|If`，`TTy = TyInt|TyBool`，无 Bool 叶子/常数，`If` 条件只能来自 `IsOdd` | 新增 `OpLt|OpGt|OpEq|OpAnd|OpOr|OpNot`；`holeConfigB sa bool` 在阶段 A 算子之后追加 `enumeratedBoolOps=[Lt,Eq,And,Or,Not]`（`Gt(a,b)≡Lt(b,a)`，枚举器已保留 `Lt` 两种参数顺序，故不重复枚举 `Gt`；`<=,>=,/=` 由 `Not` 组合） |
| 对象几何 | `Latent.Encode.build` 把每个对象的局部几何归一到原点 `(min x, min y)`，`O.position` = bbox 最小坐标，`O.width/height` = bbox 宽高；`Indexed.obsAnchor BR a p = obsPos a p + obsExtent a p - 1` 已存在 | `MinX ≡ Pos Current AX`、`MinY ≡ Pos Current AY`（不重复定义）；新增 `Max Which AxisE`（= Pos+Ext−1，含端点，x 向右 y 向下）与集合级 `SetMax AxisE`；`objectBounds :: Placed -> Either String Bounds` 对空对象/失效几何返回 `Left` |
| `Counterfactual.atoms`/`scalarTerms` | v0.6.1 grammar 由 `atoms` 列表生成 | **不**改 `atoms`；新增 `boundsAtoms`，仅通过 `slotLeavesB True axis` 进入 typed 枚举（`slotLeaves = slotLeavesB False`） |
| VSA / 语义类 | `Counterfactual.buildClass`（按训练 denotation 分类，counterfactual 签名只分裂不合并）、`Front.Deferred`、`Online.antiUnify`；**无** e-graph、无 hash-consing | 新增 `Synthesis.Collection.Referent`：hash-consed typed DAG + 精确 Union 分解；类记录仍由 `buildClass` 生成（复用，不平行造一套选择机制） |
| 触发约束 | typed 搜索只在轴的 grammar 路径整体失败后打开（`Front.axisFit`） | 层级搜索挂在同一 ScalarFailure 触发点，顺序 `Grammar → Hierarchy → TypedHoles`；快照在首次触发时才构建 |

## 2. B0：Bounds 与比较/布尔原语

- `Max w a`、`SetMax a`：`evalScalar` 新增求值；`Max Previous` 在 rank 0 显式失败（与 `Pos Previous` 一致）；`SetMax` 在空集失败。`atomAxis`、`instantiate`、`parametrize`、`scalarLeaves`（`Max Current` 为 ObjectObserverLeaf，`Max Previous` 为 AlignmentRefLeaf，`SetMax` 为 CollectionLeaf）、`crossAxis`、`Online.scalarNodes` 同步扩展。
- 比较与连接词进入 typed 枚举的规则（`enumerateTemplates`）：它们只产生 Bool，而目标类型为 Int 时 Bool 只在 `If` 条件位被需求，因此 **Bool 需求触发**是结构性的：`If(Lt(a,b),x,y)`、`If(Eq(a,?c),x,y)` 等；`And/Or` 两个参数都是 Bool 且无 depth-0 Bool 项，故对这两个算子允许两个参数同为 depth−1 子模板（其它算子保持阶段 A 的 spine 形），在默认深度 2 下它们只出现在 Bool 目标枚举或深度 3 的 `If` 条件中。退化模板丢弃：`Lt(x,x)`、`Eq(x,x)`、无 feature 叶子的条件（`Lt(?c0,?c1)`）、两常数比较。算子代价先验把比较/布尔算子与 parity 算子同组（排在基础算术之后）。
- 兼容性：`holeConfig sa = holeConfigB sa False`；测试断言 B0 模板列表中去掉含 Bool 算子的模板后与阶段 A 列表**逐项相同且顺序相同**。
- 开关：`sbBounds`、`sbBoolOps`，默认关闭。

## 3. B1：规范 Lambda Term（`Synthesis.Collection.Referent`）

```haskell
data LTerm l = LLeaf l | LConst TVal | LApp TOp [LTerm l] | LOpaque String
sigmaVersion :: String      -- Σ 与规范化策略版本，写入每个快照与每条 witness
normalize :: Ord l => (l -> Bool) -> LTerm l -> LTerm l
specialValues :: LTerm l -> [(Path,TVal)]
lambdaFromScalar :: Int -> Library -> Scalar -> LTerm SlotLeaf   -- 有界内联 Call(I_k)
```

- 绑定向量固定且隐式 `x⃗ = (object, scene, set)`：每个叶子是作用于一个绑定者的原子观察子，无嵌套 binder，因此 alpha-renaming 在该表示上是恒等，把闭合子树替换为同绑定向量上的项不会发生捕获（测试：替换后自由依赖 = 替换项的叶子 ∪ 原项其余叶子）。
- `normalize`：自底向上常数折叠（闭合子树经 `applyOp`/ML 求值；求值失败的闭合子树保留原状，**不是**值）、交换律参数排序（`Add/Mul/Eq/And/Or`）、全域恒等式（`x+0, x-0, x-x, x·1, x·0, x mod ±1, ¬¬b, And/Or 幂等与单位元, If(c,a,a), If(True/False,…), If(¬c,a,b)→If(c,b,a), Gt→Lt 交换, x<x→False, x==x→True`）迭代至不动点（≤8 轮）。**丢弃子项的恒等式只在被丢弃子项全函数时触发**（`totalTerm`：无 Opaque、无非常数除数的 `Mod`、无偏函数叶子如 `Previous`/`SetMin`/`SetMax`），所以重写不会削弱前提（`Sub(P,P)` 不折叠）。
- `LOpaque`：未知抽象、超出内联深度、未填 hole、未绑定抽象常数；永不折叠、不匹配恒等式、不是特殊值（测试）。
- 特殊值子树 `E_s`：NF 中的 `LConst` 节点（闭合值子树经折叠后原子化，因此互不重叠，替换顺序无关）。
- 类型检查 `typeOfTerm`（拒绝 `Add(x, Lt(..))`）。

## 4. B2：Case-Relative Structural Generalization

```haskell
relate :: LeafInfo l -> [Context l] -> [Context l] -> LTerm l -> LTerm l -> LTerm l -> [Path] -> Edge l
data Edge l = Edge { eFrom, eTo, eStructural :: StructuralWitness l, eCase :: CaseWitness, eDependency :: DependencyWitness l, eType :: TypeWitness, eStatus :: EdgeStatus }
data EdgeStatus = Confirmed | PendingDependency | NotSupported | Rejected String
```

`O_A ->_C O_B` 的四个条件分别对应四个 witness，全部计算、全部保存：

1. **StructuralWitness**：路径集合（NF(t_A) 中至少一个特殊值节点，同一值）、被替换值、替换项 `F`、替换前后 NF、`sigmaVersion`；要求 `NF(t_A[E_s := F]) = NF(t_B)`，否则 `Rejected "structural witness failed"`。
2. **TypeWitness**：`F` 的类型 = 被替换值的类型；路径必须确实是特殊值（训练中恒为 2 的 `Width` 叶子不是特殊值：`X+W → X+H` 被拒绝）。`twDomain` 记录：若 `F` 的叶子全部由对象 size index 决定（`Ext Current`）且所有 grounded 上下文同一 sort（如 `Object[2x1]`），则记 `proven on Object[2x1]; case-relative on exists sigma`，否则只记 case-relative。
3. **CaseWitness**：`CaseAgree ids` / `CaseDisagree agree disagree` / `CaseUnknown "NotApplicable: precondition not met on …"`（任一上下文求值失败即 Unknown，不伪称全案例成立；无上下文也是 Unknown）。
4. **DependencyWitness**：`DependencyObserved`（F 在 grounded ∪ 类型安全 counterfactual 上下文上取 ≥2 个不同值）/ `DependencySyntactic`（NF 后仍有自由叶子但未观察到变化：候选保留，边为 `PendingDependency`，不进入已确认偏序）/ `DependencyNone`（NF 闭合，如 `W−W`：`Rejected`）。

类型安全的依赖 counterfactual（`Counterfactual.dependencyContexts`）：`TranslateCurrent ±1`、`ResizeCurrent (+1,0)/(0,+1)/(+1,+1)`（当前对象换成同色实心矩形）、`PadCanvas +2`、`InsertIrrelevant 1x1`，每个都经合法性检查（画布内、与其它对象 Chebyshev 距离 ≥2）；它们**只**作为依赖证据，从不参与案例一致性，也无训练目标。

状态：`Confirmed`（Agree + Observed）、`PendingDependency`（Agree + Syntactic）、`NotSupported`（Disagree 或 Unknown）。`Rejected` 只由 `relate` 对显式查询返回；`buildGraph` 中只生成通过结构/类型检查的边。

`TypeGeneralization` 单独记录（`rgTypeEdges`）：当某条确认边的替换叶子由 size index 决定且 grounded 域是单一 sort 时，记录 `λo:Object[σ]. t_B → λo:∃σ.Object[σ]. t_B`（证明：`Ext` 由 σ 决定，该恒等式在 `Object[σ]` 上成立；在 `∃σ` 上只有案例支持）。它不与常数函数化边合并计数，也不参与调度。更丰富的类型泛化证明属 P2，未实现。

## 5. B3：Witnessed VSA（hash-consed typed DAG + 精确 Union）

```haskell
data VNode l = VLeaf l | VConst TVal | VApp TOp [Int] | VUnion [Int] | VOpaque String
intern :: LTerm l -> VSA l -> (Int,VSA l)       -- 结构 hash-consing（只有 NF 相等即全域恒等式证明相等的项共享一个节点）
factorClass :: [LTerm l] -> VSA l -> (Int,VSA l) -- 一致类的精确 Union 分解（参数 trie：{Add(PosX,2),Add(PosX,Width)} ↦ Add(PosX,Union(2,Width))）
expand :: VSA l -> Int -> [LTerm l]             -- 展开 Union；buildGraph 对每个类核对 sort(expand) == sort(members)
evaluateDAG :: VSA l -> (l -> Either String TVal) -> (Map Int (Either String TVal),Int)
```

- **VSA Union** 只表示“同一训练签名类中的多个候选”，每个候选的身份、类型、依赖、cost、provenance 由 `rgNodes` 按节点 id 保留；**SemanticClass**（`rgClasses`，按 grounded 上下文签名分组）不消除内涵不同的代表；**e-class 合并**只通过 NF 恒等式（`x+0` 与 `x` 是同一个 DAG 节点；`X+2` 与 `X+W` 是不同节点、同一类）；**Witness** 挂在边上。
- 共享不会共享任务相关的输入环境：DAG 节点只含结构，求值时按上下文逐个传入叶子求值器。
- 报告口径分开：`gsVSANodes`/`gsExpanded`、每类 `sharing = Σ成员大小 / 可达 DAG 节点数`（均值/最大，×100）是**表示压缩**；`gsDAGEvaluations`（节点数×上下文数）与 `gsReferenceEvaluations`（Σ项大小×上下文数）是**求值工作量**，`gsBuildWork` 为实际执行的那一个（`sbSharedVSA=False` 时按项逐个求值）。

## 6. B4：预构建分层抽象指称集合并搜索

每道任务、每个轴（AX/AY）一个冻结快照（`snapshotFor`），在**首次** ScalarFailure 触发时构建（trigger 前不展开），仅用 train 数据：

1. **A_base / 宇宙**：阶段 A 模板枚举器（叶子 = `slotLeavesB` 去掉 `Previous` 叶子，深度 `sbGraphDepth=2`，常数 ≤ `sbGraphConstants=1`）的 hole 在 `saConstantDomain=[-4..4]` 上落地 → NF → 去重 → 节点（上限 `sbGraphBudget=40000`，超出记 `gsTruncated`）；NF 为闭合值的项（`x−x`）计 `gsConstantOnlyDropped`，不是候选。`Previous` 依赖、常数 ∉ D、两常数项等**具体指称留在阶段 A 的 typed-hole 层**，层级无解时回退到它（`b_hierarchy_fallbacks`），旧候选不删除。
2. **Grounding 上下文**：每个案例的每个输入对象 `(case, Placed)`（按 `Placed` 的规范序编号，与枚举顺序无关），`Ctx` 的画布 = 该案例的 realization 画布（size rule 之后）、输入画布 = 输入尺寸，`Previous = Nothing`。槽行（aligned rows）是这些上下文的子集，因此类一致 ⇒ 行一致。
3. **边**：对每个含特殊值的节点、每个同值路径子集、每个 generalizer（`sbReplacementDepth=0`：无常数叶子项）做替换 → NF → 在索引中查找；找到则建边（状态按 §4），未找到计 `gsOutsideUniverse`；替换项必须在 NF 后仍是子项（`isSubterm`），否则该替换没有把常数函数化（如 `W−W` 折叠回常数），不建边；替换次数上限 `sbEdgeBudget=400000`。`Confirmed`/`PendingDependency` 边全部保存；`NotSupported` 结果只保留前 `sbUnsupportedSamples=200` 条完整 witness，其余只计数（`gsEdgesNotSupported`），因为它们不进入偏序也不被搜索引用。
4. **偏序**：确认边的邻接 → Kosaraju SCC（商图；常数函数化严格减少常数个数，实测 SCC 数 = 节点数）→ 在凝聚图上求最长路径得到 `generality`（**仅用于预算记账与调度排序，不是语义 level**）→ 传递闭包边数 `gsClosureEdges`（索引用，不作为独立证明）。
5. **调度**（`scheduleOrder`）：`SpecificFirst` 按 (generality↑, cost↑, 规范序)，`GeneralFirst` 按 (generality↓, cost↑, 规范序)，`CostFirst` 按 (cost↑, 规范序)，`Interleaved` 按 generality 层公平轮转（每层一个，层内 cost/规范序）。不可比较节点保持稳定并列顺序。
6. **槽搜索**（`Front.fitSlot Hierarchy`）：按调度遍历节点，每个一致类只检查一次（签名在行上下文处 == 目标），类命中则其所有成员为 fit（`b_candidates_covered` 计免评估的成员）；每层 `sbLayerBudget=20000` 次类检查、每槽 `sbSlotBudget=60000`、展开 fit 上限 `sbMaxFits=4000`；记录每层曝光/检查/截断数。fit 以 `Typed` 进入 v0.6.1 的 `buildClass`（同一 prior、counterfactual 分裂、canonicalization），**选择仍由 prior 决定**（训练一致 ≠ 必须选更一般候选），调度决定枚举顺序、预算截断与同 cost 并列的次序；Feature provenance 写入节点 id/类/generality/调度与相邻确认边的 witness 文本。
7. `NoHierarchy`（`sbHierarchy=False`）：同一宇宙按规范序逐候选在行上求值（`searchFlat`，行求值预算 `sbSlotBudget`）。`sbOnlinePromotion` 保留为关闭（本轮只用冻结快照）。
8. **运行级预算**：层级搜索在同一任务中会被每次对齐尝试重复调用，因此与阶段 A 的 `saTotalHoleBudget` 对应地设 `sbTotalBudget=1 200 000`（整轮的类检查行查找 + flat 行求值之和）；耗尽后不再打开层级（`b_global_truncations`），直接回退到 typed-hole 层。没有这个预算时 `NoHierarchy` 在难任务上不终止（实测 >10 min、1.4 GB）。

工作量记账：快照构建工作（`gsBuildWork`）、类检查的行查找、flat 的行求值都计入 `operator_applications`，因此 `search_work` 包含它们。

## 7. 配置矩阵（`ARC.StageBEvaluate`）

| 配置 | B0 | 图 | 结构泛化边 | 共享 VSA | 分层调度 |
|---|---|---|---|---|---|
| BaselineA（= 阶段 A FullA） | – | – | – | – | – |
| B0Only | ✓ | – | – | – | – |
| NoStructuralGeneralization | ✓ | ✓ | – | ✓ | ✓（无边 ⇒ 单层） |
| NoSharedVSA | ✓ | ✓ | ✓ | –（逐项求值） | ✓ |
| NoHierarchy | ✓ | ✓ | ✓ | ✓ | –（flat） |
| FullB | ✓ | ✓ | ✓ | ✓ | GeneralFirst |
| FullB-SpecificFirst / -CostFirst / -Interleaved | ✓ | ✓ | ✓ | ✓ | 对应调度 |

所有配置共享阶段 A FullA 的预算（`saHoleBudget=60000`、`saTotalHoleBudget=1 200 000` 等）与上述 B 预算。

## 8. 机制任务（`mechanismInstancesB`）与测试

| 族 | 规则 | 目的 |
|---|---|---|
| MoveToOwnRightEdge | `x' = MaxX` | Bounds 叶子；v0.6.1 语法也可用 `Pos+Ext−1` 达到（健全性族，所有配置都应 train-exact） |
| ThresholdIf | `y' = if Height>2 then PosY else SceneLow`（4 个宽 1 的对象，高度 1..4 每案例洗牌，5 个训练案例） | `Lt` 进入 `If` 条件。**不是**负控制：阶段 A 的 typed holes 可通过合成（如 `isOdd(Height div 3)`）达到同一真值表，BaselineA 也 train-exact；测试只报告 |
| CaseSupportedWidth | `x' = PosX+2·Width`，训练：2 个宽 2 的对象（x0=2，间距 5..7 随机），heldout：3 个宽 3 的对象 | `PosX+4 → PosX+2·Width` 案例支持边。位置与对象数固定为使 v0.6.1 语法的任何项（`base+lit`、`base+base(±1)`）都不与 `x+4` 巧合（如 `Pos+Count+1`、`Ext+Ext+1`、`Pos+SetMin+1`），否则 grammar 层先解掉、层级不打开 |
| ConstantTruthWidth | `x' = PosX+4`，训练网格与上一族相同 | 配对反例：同一训练网格、同一程序，至多一个 heldout 正确（报告哪一个） |
| IncomparableBranches | `x' = PosX+4`，Width≡2 且 Count≡2 | 两个不可比较的泛化分支（`Ext`、`Count`）都保留在同一类中 |

`test/StageBMain.hs`：ML/registry/typed registry（含 `Gt≡Lt` 交换、类型错误拒绝）、枚举（阶段 A 列表为子序列、Bool 只在 If 条件下、And/Or/Not 可达、阈值与 min 的合成）、Bounds（单像素/矩形/空洞/平移/30×30/空对象/Max=Pos+Ext−1/SetMax/不入 `atoms`）、NF（折叠、恒等式、Gt→Lt、排序、偏子项不折叠、Opaque、幂等/确定性、特殊值、类型检查、有界内联）、关系（正例 `X+2→X+W` 与 Bool 阈值；反例：类型不匹配、假常数、`x−x`、仅训练等价、训练不一致、前提不满足、无 counterfactual 时为 pending）、图（类/边/不可比较分支/generality/SCC/闭包/witness 覆盖/VSA 展开一致/共享工作量 < 参考/NoSharedVSA 等价/proven-vs-train-equal 不混合/确定性/四种调度/refresh 撤销支持且不删候选/类搜索与 flat 搜索一致/预算截断）、前端机制任务（正控制、不变量、置换不敏感、确定性、反例对；ThresholdIf 的 BaselineA 结果与反例对的 heldout 结果以 INFO 行报告而不断言）、BaselineA == FullA 回归（阶段 A 机制实例 + v0.6.1 任务）。

## 9. 入口与复现

```powershell
./scripts/run_stage_b.ps1                      # build → 8 组测试 → 机制矩阵 → ARC smoke(8) → ARC 400×9 → 报告
./scripts/run_stage_b.ps1 -SkipBuild -SkipTests -SkipMechanism -SkipSmoke
python -I scripts/arc_stage_b.py report --out results/stage_b/arc
./build/latis-stage-b.exe stage-b-solve --task data/arc1-training/05f2a901.json --out results/stage_b/single --config FullB
./build/latis-stage-b.exe arc-train-only-stage --stage stage-b-FullB --task results/stage_b/arc/train_only/05f2a901.json --out DIR
```

输出：`results/stage_b/validation/`、`results/stage_b/mechanism/`（每实例每配置 JSON（含 `stage_b` 指标与 `referents` 快照摘要）+ derivation graph，`mechanism_metrics.csv`，`regression_stage_a.csv`）、`results/stage_b/arc/`（`data_manifest.json`、`code_version.json`、`run_meta.json`、`tasks/<id>/stage-b-<Config>.json`、`metrics.json`、`audit.json`、`witness_samples.json`、`summary.md`）、`results/stage_b/metrics.csv`、`results/stage_b/per_task.csv`。

## 10. 本轮未实现 / 延后

Shape 代数、对象增删/一对多对齐、全局 8-neighborhood、神经模块、R2 重构、Branch-and-Bound、全 DSL 完备性；size rule 的层级化（size rule 仍走阶段 A 的 typed 搜索）；高阶 Lambda 规范化（无嵌套 binder）；更丰富的类型泛化证明；在线抽象图更新（`sbOnlinePromotion` 保留关闭）；e-graph 饱和；`Previous` 叶子的图 grounding（需对齐后上下文，留在 typed-hole 层）；常数域外的闭合项（留在 typed-hole 层由方程求解）。
