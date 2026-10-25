# LATIS 阶段 C：对象数量可变的合成、Shape 代数与目标驱动的抽象搜索（设计与实现）

本文记录阶段 C 的形式定义、与既有模块的集成方式和复现步骤。实验数字见 `docs/LATIS_STAGE_C_REPORT.md`。接口名以仓库源码为准（`Synthesis.Collection.Shape`、`Synthesis.Collection.Relation`、`Synthesis.Collection.Front`、`Synthesis.Collection.Size`、`ARC.StageCEvaluate`、`ARC.ArcTrainOnly`）。

## 1. C0：开工审计结论

| 项 | 源码位置 | 结论 |
|---|---|---|
| 连通性 / 单色分组 | `Latent.Encode.encode` | 背景 0；同色 4 连通泛洪；对象 ID = 发现顺序（只做 provenance）；局部坐标归零到 bbox 左上角；`Canvas` = 网格尺寸 |
| Render | `Latent.Render.render` / `Latent.Grid.gridFromCells` | 稀疏绘制、后绘者覆盖、任一越界像素整体 `Left`（不裁剪） |
| 对象数不等的拒绝点 | `Front.main` | `sizeStep` 之后、对齐之前：`any (count a /= count b)` → `Left "RankAlign: unequal input/output cardinality"`；在此之前只有 layout 守卫与 Size Rule 可能失败。因此 289 题是 **encoder(4 连通) + RankAlign 的失败分类**，不是任务语义标签 |
| 旧对象路径 | `Front.realize / fitBody / runProgram` | 只能移动对象（sequence-local body 给每个对齐对象新的 Pos），不能改形状、颜色、数量；形状不同时 `NeedConstruct` 推迟到整格校验后失败 |
| Size Rule | `Synthesis.Collection.Size` | 输入侧叶子仅 `GridWidth/GridHeight/CountObjects/CountShapes` |
| Stage B 图构建 | `Front.ensureSnapshot` / `snapshotFor` | 每轴一次、首个 ScalarFailure 时惰性构建，按轴缓存（`stSnapshots`）；宇宙 = 轴可见叶子全集、深度 2、40 000 节点上限；真实任务基本都触顶 |
| 基线冻结 | `ARC.StageCEvaluate.baselineAC/baselineBC` | `BaselineA = ARC.StageAEvaluate.fullA`，`BaselineB = ARC.StageBEvaluate.fullB`（逐字节相同配置）；阶段 B 报告与 `results/stage_b/per_task.csv` 来自同一批次（run 2026-10-23T17:20Z） |
| 只读 cardinality 诊断 | `scripts/arc_cardinality_diagnosis.py` → `results/stage_c/validation/cardinality_diagnosis.{json,csv}` | 400 题训练对的输入/输出对象数（4 连通与 8 连通）、像素数、颜色集、画布、输出像素 ⊆/⊇ 输入像素、唯一输出对象、常数差/比等粗分类（见报告 §1） |

## 2. C1：Shape 代数（`Synthesis.Collection.Shape`）

### 2.1 类型

```haskell
newtype ShapeMask = ShapeMask (Set (Int,Int))     -- 单个单色对象的相对像素集合；归一化：min x = min y = 0；允许空集与不连通
data ShapePrim = Square Int | Rectangle Int Int | Shell Int Int Int | DiagonalBar Int Direction | EquilateralTriangle Int Orientation
data ShapeExpr = Prim ShapePrim | At (Int,Int) ShapeExpr | Union ShapeExpr ShapeExpr | Intersection ShapeExpr ShapeExpr
primCells :: ShapePrim -> Either String (Set (Int,Int))
evalShape :: ShapeExpr -> Either String (Set (Int,Int))   -- 同一局部坐标系；At 平移操作数
shapeMask :: ShapeExpr -> Either String ShapeMask         -- 归一化
maskConnected :: ShapeMask -> Bool                        -- 4 连通；非连通的 mask 不自动成为 Object
```

`ShapeMask`、`Object`（`Latent.Object`，带颜色与位置）和 `Set[Object]`（`Indexed.ObjectSet`）是三个类型；mask 只通过 `maskConnected`/显式构造（`Relation.emitObjects` 中的 `fromCells`）进入对象系统。

### 2.2 原语语义（x 向右、y 向下、原点 = bbox 左上）

| 原语 | 像素集合 | 合法参数 / 边界 |
|---|---|---|
| `Rectangle w h` | `{(x,y) | 0≤x<w, 0≤y<h}` | `w,h ≥ 1`，否则 `Left` |
| `Square s` | `= Rectangle s s` | `s ≥ 1` |
| `Shell w h t` | `Rectangle w h` 去掉 `(t,t)` 处的 `Rectangle (w-2t) (h-2t)` | `t ≥ 1` 且 `2t < min w h`；厚度留不出空洞时**显式报错**（“该形状是实心 Rectangle”），不退化 |
| `DiagonalBar n d` | `DownRight: (i,i)`；`DownLeft: (n-1-i,i)`，`i<n`；厚度 1 | `n ≥ 1`；特征 `IsDiagonalBar` 要求 `n ≥ 2` |
| `EquilateralTriangle n o` | **离散模板**：第 r 行（从顶点起）有 `2r+1` 个像素居中，底边 `2n-1`，bbox `(2n-1)×n`；`Up/Down/LeftO/RightO` 为顶点方向 | `n ≥ 1`；特征 `IsTriangle` 要求 `n ≥ 2`。这是本仓库的像素化规则，不声称几何等边（格点上不存在）；视觉相似不算匹配，必须逐像素相等 |
| `Union / Intersection` | 像素集合并/交，第二操作数可 `At` 偏移 | 结果可为空或不连通；仍是 `ShapeMask` |

### 2.3 识别与特征

`recognizePrim :: ShapeMask -> [ShapePrim]` 返回**所有**与 mask 逐像素相等的原语，按规范偏好排序 `Square < Rectangle < Shell < DiagonalBar < EquilateralTriangle`（1×1 像素是 Square 而不是 DiagonalBar/Triangle）。导出特征：`isRectangle/isSquare/isShell/shellThickness/isTriangle/isDiagonal/diagonalLength`、`maskWidth/maskHeight/maskSize`。这些特征以类型化谓词进入 C2 的变换语法（`Pred = IsRect | IsSquare | IsShell | IsDiagonal | IsTriangle`），只在 `scShape` 打开时可见。

### 2.4 规范最简分解（`decompose`）

- 深度 1：`recognizePrim`；深度 2：`Union` 两个**含于** mask 的放置原语（所有子矩形、子 Shell、最长对角线段、锚定在 bbox 内的三角形），或 `Intersection` 两个**包含** mask 且与其 bbox 相同的原语。
- 最小化 AST 大小（原语/集合操作各 1 个节点，`At` 不计），同大小按 `ShapeExpr` 派生 `Ord` 取最小（确定性）；并列数记为 `dcTies`，**只对外暴露一个**。
- 预算 `DecompBudget { dbMaxArea=900, dbMaxCandidates=400, dbMaxPairs=60000 }`；超预算记 `dcTruncated=True`，与“深度 2 内不可表示”（`dcExpr=Nothing, dcTruncated=False`）**分别**报告。不可表示时原始 `ShapeMask` 保留（对象不丢弃）。
- 测试：`Shell(4,3,1)` 自身；L 形 = 两个矩形的 Union（size 3，重复分解结果相同）；X 形 = 两条对角线；6 格三块形在深度 2 内不可表示且不是截断；面积预算截断只报 truncated；每个分解结果的 mask 与输入逐像素相等。
- 不用训练等价判定两个 ShapeMask 全域相等：分解只依赖像素集合。

### 2.5 局部 8 邻域对角视图（`detectDiagonalChains / applyDiagonalView`）

全局编码保持 4 连通。候选链 = 同色 **1×1 对象**的极大严格序列 `p, p+(1,1), …`（或 `p+(1,-1)`），长度 ≥ 2。**接受条件**：链上每个像素的 8 邻域内，除链前驱/后继外**没有任何**同色像素（来自任一对象）。因此交叉（X）、弯折（V）、分叉、与同色对象斜接触、相邻同色噪声全部拒绝（`DiagonalRejection` 记录原因），像素保持独立对象；异色相邻不影响。接受的链替换为一个对象（`DiagonalBar` mask，id = 最小来源 id，`dcSources` 记录来源对象 id）。视图在训练对两侧应用（`Front.viewed`），推理时由 `runProgram` 以 `progView` 对输入应用同一视图。只有 `scDiagonalView` 打开时存在，默认关闭。

## 3. C2：对象集合变换（`Synthesis.Collection.Relation`）

### 3.1 语法与语义

```haskell
data ObjectTransform = ObjectTransform { otSelector :: Selector, otOthers :: Others, otBody :: TBody }
data Selector = AllObjects | FilterBy Pred
data Pred     = ColorIs Int | IsMaxArea | IsMinArea | IsRect | IsSquare | IsShell | IsDiagonal | IsTriangle | ColorMostFrequent | ColorLeastFrequent | NotP Pred
data Others   = DropOthers | KeepOthers
data TBody    = MapEach PerObject | MergeSelected MergeMode | CropSelected
data PerObject= Keep | RecolorTo Int | Hollow Int | FillBBox | Replicate CountExpr OffsetExpr
data CountExpr= KConst Int | KCountObjects | KCountColors | KFitAcross Int | KFitDown Int   -- KFitAcross g = (W_out - PosX) div (Width+g)
data OffsetExpr= StepRight g | StepDown g | StepLeft g | StepUp g | StepDiagonal g          -- 步长 = 对象自身 Width/Height + g
data MergeMode= MergeUnion | MergeFillBBox
emitObjects :: ObjectTransform -> Dimensions -> [Object] -> Either String [EmittedObject]
```

- 谓词对**整个输入对象集**求值：`IsMaxArea/IsMinArea` 要求最大/最小**唯一**，`ColorMostFrequent/LeastFrequent` 要求众数唯一，否则 `Left`（不隐式取首项）。`Set` 从不按索引取元素。
- `Hollow t` 要求对象是实心矩形且 `2t < min w h`，构造 `Shell`；`FillBBox` 构造 `Rectangle(Width,Height)`；`MergeUnion` 要求选集同色且并集 4 连通；`MergeFillBBox` 要求同色，构造选集 bbox 的矩形；`Replicate` 要求 `k ≥ 1`，第 i 个副本平移 `i·step`；`CropSelected` 把选集平移到其 bbox 原点（画布由 Size Rule 给出）。所有失败都是显式 `Left`，没有裁剪或静默跳过。
- 尺寸索引：构造出的对象通过 `placedFromObject` 获得新的 `SizeSig`，没有跨 sort 的强制转换。
- 关系见证 `relationWitness :: [Object] -> [EmittedObject] -> [Object] -> RelationWitness`：按绝对像素+颜色把发射对象匹配到真实输出对象，记录 `(来源 id 列表, 输出 id)` 对、被删除的输入 id、未解释的输出 id、未匹配的发射对象数，以及关系种类（`one-to-one / many-to-one / one-to-many / deletion`）。它是训练期证据，不是程序。

### 3.2 枚举、代价与搜索

- `enumerateTransforms (RelationGrammar colors shape diagonal gaps counts cap)`：颜色 = 训练场景中出现的颜色（所有案例共享的常数）；形状谓词/构造器仅 `rgShape`；`IsDiagonal` 仅 `rgShape && rgDiagonal`；排除恒等（`Select(all); keep each`、`keep others; keep each`）与 `keep others; crop`。按 `(transformCost, 规范序)` 排序；`transformCost` = 操作节点数 + 4 × 共享常数（与标量 prior 的字面量惩罚一致）。
- `searchTransforms budget maxFits`：每个候选在每个训练案例上执行（发射 → 用 Size Rule 画布渲染 → 与训练输出整格比较，首个不等即停止）；预算 = 案例执行次数（`scRelationBudget=200000`），`scRelationMaxFits=50` 个训练精确候选全部保留为 representatives；超预算记 `c_relation_truncated`。**选择** = 代价最低、枚举序最前者；所有 fit 写入 `Graph.relations`（`RelationRecord`，含选中者的 witness 文本）。

## 4. C3：接入 Feature 前端（`Synthesis.Collection.Front`）

1. **配置**：`Config.stageC :: StageC`（`Relation.StageC`，默认 `stageCOff` 全关），字段 `scShape, scDiagonalView, scRelations, scObjectSizeFeatures, scFallbackTrigger, scGoalDirected` 与预算。
2. **Program**：新增 `progTransform :: Maybe ObjectTransform`、`progView :: Bool`。`runProgram` 顺序：encode → （视图）→ Size Rule 画布 → 若有变换则 `emitObjects` → `render`（越界 → `render:` 失败）；否则走原 sequence-local 路径。推理只用输入侧观察量。
3. **Trigger**（`main`）：Size Rule 之后，`count a /= count b` 时：`scRelations` 开 → `relationPath "cardinality mismatch"`，否则维持 v0.6.1 的 `RankAlign` 拒绝；计数相等时先走旧路径（prePath/explained），旧路径失败且 `scFallbackTrigger` 时 → `relationPath "equal-count path failed"`（失败字符串保留旧原因并追加 `; relation search: …`，首次拒绝原因不变）。旧路径成功时**不**打开关系搜索（trigger before expansion；回归测试断言 FullA 的解在 `RelationsOnly` 下逐字节不变）。
4. **C3.1 Size Rule 对象特征**（`Size.gridLeavesC True`）：`Width/Height(UniqueLargest)`、`Width/Height(UniqueSmallest)`（不唯一 → `Left`）、`Width/Height(BBox(Objects))`、`CountColors`、`CountCells`。`scObjectSizeFeatures` 打开时，每个轴先用 Stage A 叶子枚举（与 FullA 逐字节相同），**仅当没有训练精确表达式时**再用追加了对象叶子的叶子集枚举（trigger before expansion；两次枚举的模板/评估数相加计入 `size_rule_*`）。直接把对象叶子并入首轮枚举会让 60 000 次评估预算在到达旧规则前截断（ParityIf 回归测试捕获了这一点）。`gridValue` 改为 `Either`。
5. **Shape 审计**（`shapeAudit`，`scShape`）：训练两侧每个不同 mask 做一次规范分解，记 `c_shape_*` 与 `Graph.shapes`，分解工作计入 `operator_applications`。
6. **指标**（`c_*`，全部进入 `metricNames`）：`c_relation_triggered/_trigger_cardinality/_trigger_fallback/_candidates/_tried/_executions/_fits/_truncated/_selected_cost/_shape_used`、`c_object_count_exact`（选中变换在每个案例发射的对象数 = 输出对象数）、`c_object_transform_exact`（发射对象集 = 输出对象集，无未解释输出）、`c_shape_masks/_decomposed/_unrepresentable/_truncated/_ast_total/_ties/_work`、`c_diagonal_chains_accepted/_rejected`、`c_view_pixels_merged`、`c_size_object_features`。`SizeRule-exact`、`Object-Count-exact`、`Object-Transform-exact`、`Full-Grid-exact`（= train_exact）分别计量。
7. **失败阶段**（`StageAEvaluate.failureStage`）：新增 `relation:` → `relation_search`、`shape:` → `shape_decomposition`、`render:` → `render`。进入关系搜索但无解的任务首次拒绝为 `relation_search`（区别于未尝试的 `cardinality`）。
8. **不变量**：新 Feature 都带 `NeedConstruct` trigger（`UntriggeredExpansionCount=0`），无跨对象具体边（`ConcreteCrossItemEdgeCount_high_level=0`）；候选不折叠（所有 fit 保留）；旧候选不删除；`SafeOnline` 不变。

## 5. C4：目标驱动的抽象指称（独立开关 `scGoalDirected`）

- **Typed Goal**：失败槽的目标类型 `Int`、槽轴、可见输入来源 = 该轴叶子中**在 grounded 上下文 ∪ 其类型安全依赖 counterfactual 上**取值变化的叶子（`Front.goalLeaves`）；在所有这些上下文上恒定的叶子不是任务的输入来源，被常数洞覆盖，丢弃它不移除任何目标可达候选（`b_goal_leaves_dropped`）。
- **按需深度**：先构建/查询深度 1 宇宙；仅当其中没有拟合类时才构建完整深度（`sbGraphDepth=2`）宇宙（`b_goal_level1_hits` / `b_goal_level2_builds`）。快照按 `(轴, 深度)` 缓存，相同查询共享（`b_goal_cache_hits`、`b_goal_queries`）。旧 `snapshotFor` 路径（全部叶子、一次性完整深度）作为消融对照（`BaselineB`）。
- **完整性测试**（`test/StageCMain.hs` §10）：同一 Typed Goal、同一有限宇宙（叶子集合 + 深度 1，均未截断）下，目标驱动图的节点集合 == 参考图中叶子 ⊆ goal 叶子的节点集合；深度 1 节点 ⊆ 深度 2 节点。超预算记 `truncated`，不对外声称完整。
- B2 结构泛化定义、Witnessed VSA、prior 均未改动；候选身份与训练签名不变。

## 6. 配置矩阵（`ARC.StageCEvaluate.namedConfigsC`）

| 配置 | 基座 | Shape(C1) | 对角视图 | 关系搜索(C2) | 对象尺寸叶子(C3.1) | 回退触发 | 目标驱动(C4) |
|---|---|---|---|---|---|---|---|
| BaselineA | Stage A FullA | – | – | – | – | – | – |
| BaselineB | Stage B FullB | – | – | – | – | – | – |
| ShapeOnly | FullA | ✓ | ✓ | – | ✓ | – | – |
| RelationsOnly | FullA | – | – | ✓ | – | ✓ | – |
| ObjectShapeFull | FullA | ✓ | ✓ | ✓ | ✓ | ✓ | – |
| ObjectShapeGoalDirected | FullB | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |

`NoShapeWitness / NoRelationWitness` 不是 solver 配置：非法操作的拒绝由单元测试验证（颜色冲突合并、非唯一选择、非矩形 Hollow、不连通并集、k<1 复制、交叉对角链）。

## 7. 机制任务（`mechanismInstancesC`，每族 3 种子，3 训练对 + 1 heldout）

| 族 | 规则 | 正控制 | 负控制 |
|---|---|---|---|
| TranslateSingle | 单对象右移 2 | 全部 | – |
| KeepColor | 保留颜色 2（每案例 1 或 2 个），删除其余（n_in > n_out） | RelationsOnly, Full, GoalDirected | BaselineA/B, ShapeOnly（cardinality 拒绝） |
| ReplicateFit | 位于 x=0 的条按 `(W_out-PosX) div (Width+1)` 复制到边缘，k = 3,4,5 随画布宽度变化 | 同上 | 同上 |
| MergeBBox | 2–3 个同色对齐矩形 → 一个 bbox 矩形 | Full, GoalDirected | + RelationsOnly（无 Shape 构造器） |
| MergeColorConflict | **负控制**：两个异色矩形，输出为一色 bbox 矩形 | – | 全部（不得强行匹配） |
| ShellConstruct | 实心矩形 → 厚度 1 Shell（计数相等，形状变化） | Full, GoalDirected | – |
| DiagonalRecolor | 对角像素链（4 连通下为分离像素）重着色，孤立同色像素不变 | Full, GoalDirected（需视图） | – |
| DiagonalCrossing | **负控制**：两条交叉链 | – | 全部；视图须报告拒绝 |
| CropLargest | 画布 = 唯一最大对象 bbox，内容为该对象 | Full, GoalDirected | RelationsOnly（无对象尺寸叶子 → size 失败） |
| CounterexampleConstantCount / FeatureCount | 同一训练网格：复制 3 次 vs 复制 CountObjects 次；heldout 4 个对象 | RelationsOnly, Full, GoalDirected | – |

生成器避免训练巧合：复制数、最大对象尺寸、保留对象数均随案例索引变化；颜色冲突族的 bbox 宽度不能由宽 2 对象的复制平铺得到。

## 8. 测试（`test/StageCMain.hs`）

C1 像素精确语义与参数校验、识别特征、规范分解（并列/不可表示/截断区分）、对角视图正负例；C2 唯一性失败、构造失败、合并冲突、witness 种类、语法门控与排序；C3.1 对象尺寸叶子；机制矩阵（2 种子 × 6 配置：不变量、正负控制、witness 与 exactness 指标、heldout 评分、触发来源、置换不敏感、确定性、反例对的同程序与恰一 heldout、两个候选都保留）；回归（BaselineA == FullA、BaselineB == FullB 的程序/失败/search_work；FullA 的解在 RelationsOnly 下不变、在 ObjectShapeFull 下仍 train-exact）；C4 完整性、按需深度、FullB 回归；Stage A 的 `CardinalityMismatchStillBlocked` 族在 BaselineA 下仍拒绝、在 Full 下进入关系搜索并如实报告。其余 8 个旧套件全部重跑。

## 9. 复现

```powershell
./scripts/run_stage_c.ps1                                   # build -> 9 套测试 -> 诊断 -> 机制矩阵 -> smoke(12) -> ARC 400×6 -> 报告
./scripts/run_stage_c.ps1 -SkipBuild -SkipTests -SkipMechanism -SkipSmoke
python -I scripts/arc_cardinality_diagnosis.py             # 只读 C0 诊断
python -I scripts/arc_stage_c.py report --out results/stage_c/arc
./build/latis-stage-c.exe stage-c-solve --task results/stage_c/arc/train_only/<id>.json --out DIR --config ObjectShapeFull
./build/latis-stage-c.exe arc-train-only-stage --stage stage-c-ObjectShapeFull --task results/stage_c/arc/train_only/<id>.json --out DIR
./build/latis-debug-stage-c.exe all 1                       # 机制族逐配置调试输出
```

输出：`results/stage_c/validation/`（测试日志、构建日志、`cardinality_diagnosis.*`）、`results/stage_c/mechanism/`（每实例每配置 JSON + derivation graph、`mechanism_metrics.csv`、`regression_baselines.csv`）、`results/stage_c/arc/`（`data_manifest.json`、`code_version.json`（含 `run_id`）、`run_meta.json`、`tasks/<id>/stage-c-<Config>.json`、`metrics.json`、`audit.json`、`new_solutions.json`、`summary.md`）、`results/stage_c/metrics.csv`、`results/stage_c/per_task.csv`；空闲复测写入 `results/stage_c/arc_idle/`（`python -I scripts/arc_stage_c.py all --out results/stage_c/arc_idle ...`）；`results/stage_c/new_solutions/<id>/` 为新解的逐题 `stage-c-solve` 轨迹。

## 10. 未实现 / 延后（P1、P2）

`SplitBy`（一个对象拆为两个由输入规则决定的 Shape）未实现；`EquilateralTriangle` 只有一种离散模板（每行 +2 像素），其余像素化方案未覆盖；Shape 分解深度 ≤ 2、Union/Intersection 各一层；变换只能复合一个 Selector + 一个 Body（无多步管线、无逐对象不同参数、无按输出位置的放置规则）；关系搜索不与 sequence-local 位置体合用（变换路径的位置来自对象自身或复制步长）；C4 只做叶子裁剪与按需深度，无按目标种类（Size2/ShapeMask/Set[Object]）选择子语法；R2 未重跑；神经模块未改。
