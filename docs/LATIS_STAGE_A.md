# LATIS 阶段 A：Grid Size Feature + Typed N-ary Feature Synthesis + ML Parity

本轮对应 `../prompts/LATIS_STAGE_A_TSL_EXTENSION_PROMPT.md`，在 v0.6.1 代码上实现最小、可审计的增量。v0.6.1 的入口（`solve-collection-v61`、`collection-v61-experiment`、`collection-v61-battery`、`arc-train-only-stage --stage feature|feature-v04|r2`）、v0.6/v0.5/v0.4 求解器与 R2 fallback 的行为不变：所有阶段 A 能力都挂在前端 `Config` 的新字段 `stageA :: StageA` 上，默认 `stageAOff`（全部关闭）；`defaultConfig`/`v61Config` 的搜索语义与 v0.6.1 逐步一致（回归见 `results/stage_a/validation/`）。结果与结论见 `../reports/stage_a/LATIS_STAGE_A_REPORT.md`。

## 1. 开工前审计（接口定位）

| 构件 | 位置 | 阶段 A 的处理 |
|---|---|---|
| ML 类型 / evaluator | `Language.Types`（`Ty`），`Language.ML`（GADT `Expr`、`eval`） | 新增 `Mod`、`IsOdd` 构造子与求值 |
| Operator grammar / Visible Feature registry | `Language.Schema.registry`（字符串级注册表） | 新增 `mod`、`isOdd` 两项 |
| TSL（collection 前端的 scalar 语言） | `Synthesis.Collection.Counterfactual`：`Scalar = Lit | ConstVar | Atom | Plus | Call`，`atoms`，`scalarTerms`（枚举语法），`evalScalar`，`buildClass`（semantic class / representatives） | 新增 `Typed (TExpr SlotLeaf)` 构造子与 `SlotLeaf`；`Ctx` 新增 `ctxInput`（输入画布） |
| Feature IR / 搜索 | `Synthesis.Collection.Front`：`Feature`、`IndexedType`、`Graph`、`frontSearch`、`fitBody/fitSlot`、`realize`、`finalize` | 见 §2–§4 |
| `unchanged canvas` 守卫 | `Front.frontSearch` 第三个 guard：`any (\(a,b)->O.canvas a/=O.canvas b) scenes → "layout: collection frontend requires unchanged canvas"`。依赖：`dims=map (O.canvas . fst) scenes` 供 `Ctx`（`SceneHigh`）与 counterfactual contexts 使用；`runProgram` 用 `render scene{objects=…}` 在**输入画布**上渲染 | 守卫仅在 `saGridSize=False` 时生效；开启后 canvas 变化成为 Size2 合成目标（§2） |
| Output realization | `Front.runProgram` → `Latent.Render.render` → `Latent.Grid.gridFromCells`（越界 cell 直接 `Left "Object lies outside canvas"`，无裁剪） | 先按 Size2 规则建画布，再放置、渲染 |
| Scalar synthesis | `Front.fitSlot`：`evaluateAll lib rows grammar`，`buildClass` | 新增 `Source = Grammar | TypedHoles`；typed 分支由 ScalarFailure 触发 |
| VSA / witness | `Synthesis.Collection.Counterfactual.SemanticClass/Representative`，`Front.Deferred`，`alignmentEvidence` | 复用 `buildClass`；typed 候选以 `Typed` 表示进入同一 class，binding provenance 写入 Feature provenance |
| Fallback 入口 / train-only runner | `ARC.ArcTrainOnly.runStage`（泄漏守卫、超时、分类），`scripts/arc_train_only.py` | 新增 stage `stage-a-<Config>`；新脚本 `scripts/arc_stage_a.py` |
| v0.4 front 的画布标量 | `Synthesis.FeaturePipeline`（`CanvasWidth/CanvasHeight`，`Layout`） | 不改动（v0.4 诊断列照旧） |

Implementation plan（已按此执行）：新增模块 `Synthesis.Collection.Typed`（类型化 N 元 hole 合成，泛型 leaf）、`Synthesis.Collection.Size`（Grid 特征与 Size2 规则）、`ARC.StageAEvaluate`（消融配置、机制任务、审计 JSON）；最小改动 `Language.ML/Schema`、`Counterfactual`（`Typed` 构造子、`ctxInput`）、`Online`（`Typed` 的 refinement node）、`Indexed`（`NeedCanvas` trigger）、`Front`（§2–§4）、`ArcTrainOnly`、`app/Main.hs`、`latis.cabal`。不改 v0.4/R2 的搜索语义。向后兼容风险：`Config`、`Program`、`Ctx` 多了字段（位置构造处已更新：`Front`、`test/CollectionV6Main.hs`），`show Program` 多出 `progSize = Nothing`（`arc_stage_a.py` 的回归比较对此做了等价处理）。

## 2. Grid Size 作为一等 Feature（`Synthesis.Collection.Size`）

```haskell
data GFeat = GWidth | GHeight | GCount | GShapes          -- 输入侧 Grid 特征
GridWidth  : Grid -> NatPos          gridValue _ s GWidth  = VI (gridWidth (canvas s))
GridHeight : Grid -> NatPos          gridValue _ s GHeight = VI (gridHeight (canvas s))
GridSize   : Grid -> Size2 = (NatPos, NatPos)   -- (width, height) 顺序
natPosRange = (1,30)                 -- ARC 有效范围；仓库 Grid 只要求 >0，30 为数据集约束
data SizeRule = SizeRule { srWidth, srHeight :: TExpr GFeat, srWidthReps, srHeightReps :: [Candidate GFeat], srWitness :: [String] }
synthesizeSize :: StageA -> Bool -> [(Scene,Scene)] -> (Either String SizeRule, SizeStats)
outputSize     :: Bool -> SizeRule -> Scene -> Either String Dimensions   -- 推理时只读输入
```

- 训练时输出的 Width/Height 只作为目标值（`rowsFor side = [(leafEval 输入, VI (side (canvas 输出)))]`）；叶子只有输入侧特征 `GWidth/GHeight/GCount(Input)/GShapes(Input)` 与跨案例共享常数。
- 宽、高分别合成，再打包为一个带 witness 的 `Size2`；每个轴保留**全部** training-exact representatives（`srWidthReps/srHeightReps`，含 bindings、cost、enumeration index、dependency signature），选择 = 最小 `(cost, index)`，cost = 长度 + 4×常数个数（与 scalar prior 的 literal penalty 一致）。不按训练 denotation 删候选。
- 画布不变时恒等规则 `Size2(GridWidth, GridHeight)` 是 Feature-first 的第一个 fit：叶子顺序以目标轴自身的维度优先（正方形画布上 `GridWidth` 也拟合高度目标，两者都作为 representatives 保留，cost 相同时选本轴）。回归：所有 v0.6.1 任务的 size rule 为恒等（测试）。
- `GridSizeOnly` 消融（`saTypedHoles=False`）使用固定模板 `fixedTemplates`：feature、feature±1、feature+feature、常数目标——不做 hole 搜索。

### Output realization（`Front.runProgram`）

顺序：encode 输入 → `outputSize` 计算输出 `Dimensions`（无效尺寸：≤0 或 >30 → `Left`，不裁剪）→ 按 ordering key 排序输入对象 → sequence-local body 逐对象给出位置（`Ctx.ctxDims` = 输出画布，`SceneHigh` 指输出画布右/下边；`Ctx.ctxInput` = 输入画布，供 `GridWidth/GridHeight(Input)` 叶子）→ `render scene{canvas=outDims}`：背景 = encoder background（0），局部几何加全局位置，越界 cell 由 `gridFromCells` 拒绝（`Object lies outside canvas`），重叠后者覆盖（`fromList` 后写优先），整格 exact 由调用方比较。

`realize` 把 **Grid realization** 与 **整格 exact** 分开计数：`grid_realizations_attempted`、`grid_realization_ok`（所有训练输入都渲染成功）、`realization_render_errors`（越界/无效尺寸）、`realization_mismatches`（渲染成功但不等于目标）。失败字符串分别为 `realization: output realization failed: …` 与 `realization: final grid exact check failed`。

对象变换路径仍要求输入/输出对象数相等：`sizeStep` 之后紧接原 `RankAlign: unequal input/output cardinality` 检查；canvas 支持不解决 cardinality mismatch（机制任务 `CardinalityMismatchStillBlocked`）。

## 3. Typed Hole Synthesis（`Synthesis.Collection.Typed`）

```haskell
data TTy  = TyInt | TyBool                 -- NatPos 作为 Int 的 refinement 在 outputSize 处检查
data TOp  = OpAdd | OpSub | OpMul | OpMod | OpIsOdd | OpIf
opSignature OpSub = ([TyInt,TyInt],TyInt);  OpIsOdd = ([TyInt],TyBool);  OpIf = ([TyBool,TyInt,TyInt],TyInt)
applyOp   :: TOp -> [TVal] -> Either String TVal      -- 全部委托 Language.ML.eval
invertOp  :: TOp -> Int -> [TVal] -> TVal -> Maybe TVal -- Add/Sub 两个位置、Mul（可整除）可逆；Mod/If 不可逆
data TExpr l = TLeaf l | TConst TVal | THole Int | TApp TOp [TExpr l]
enumerateTemplates :: HoleConfig -> [(l,TTy)] -> TTy -> [Template l]
synthesizeTyped    :: HoleConfig -> (l->String) -> [Template l] -> [(l -> Either String TVal, TVal)] -> TypedResult l
```

- **通用形式** `P(a1..ak)=fo`：模板是带常数 hole 的开放表达式；叶子由调用方给出（类型、visibility、ontology slice 在调用方过滤：size rule 用 `gridLeaves`；object slot 用 `slotLeaves axis` = 该轴的观察原子 + 轴无关聚合 + 该轴的输入 Grid 尺寸）。不强迫“主输入”，所有参数都可由 feature 填充。
- **枚举顺序（Feature-first 是顺序，不是语义优先）**：按 `(hole 数, depth, parity 算子数, 枚举序)` 稳定排序：先 0-hole（纯 feature，再 composed feature），再 1-hole，再 2-hole；同形模板中使用 Mod/IsOdd/If 的排在基础算术之后（算子代价 prior）。深度 d≥2 的模板为“spine”形：恰一个参数是深度 d−1 的子模板，其余为深度 0（叶子/hole）。交换律算子（Add/Mul）只保留一种参数顺序；非交换（Sub/Mod/If）保留全部顺序（`Sub(a,b)`≠`Sub(b,a)`）。全常数子表达式不生成（等价于单个 hole）；`If` 的条件不能是常数。
- **Hole 填充与联合拟合**：hole 一律是跨案例共享的类型化常数。若某 hole 是根算子的直接参数且该位置可逆（Add/Sub/Mul），由第 0 个案例的方程解出并在其余案例验证；其余 hole 在有限域 `saConstantDomain=[-4..4]` 上**联合**枚举（笛卡尔积，默认最多 2 个 hole），再整体验证。不存在逐案例不同的常数；常数只来自训练对的方程或有限域，不接触 test。恒等常数（x+0、x−0、x·1、x·0，模板任意位置）与 Mod 除数 <2 的赋值作为退化项丢弃；`Sub(x,x)`、`Mod(x,x)`（伪装的常数）不生成（不合并 intensionally 不同的表达式）。
- **类型驱动过滤**：参数类型来自 `opSignature`；Bool 只能由 `IsOdd` 组合得到（无 Bool 叶子、无 Bool 常数）；`NoFeatureArg`(=`ConstantOnly`) 每个候选最多一个 feature 叶子；`NoConstantArg`(=`FeatureOnly`) 不生成 hole。
- **预算**：`saHoleBudget`（每个目标的 row evaluation 数，默认 60000）；超出即截断并记录 `trTruncated`、`trTemplatesTried/trTemplates`；`saTotalHoleBudget`（整个前端运行中 object-slot typed 搜索的 row evaluation 总数，默认 1 200 000，超出后 ScalarFailure 不再打开 typed 搜索，计 `typed_hole_global_truncations`）。深度 `saHoleDepth=2`，hole 数 `saMaxHoles=2`。每个轴的模板列表在一次运行内只枚举一次（9 个叶子 + 6 个算子约 2 万模板）。
- **Witness / provenance**：每个 `Candidate` 记录 expression、template、`cBindings`（`BoundFeature`/`BoundComposed op`/`BoundConstant n Solved|DomainEnumerated`）、cost、enumeration index、training denotation、dependency signature。Object slot 的 typed 候选以 `Typed e` 进入 v0.6.1 的 `buildClass`（同一 semantic class 机制：counterfactual 签名、intensionality class、canonicalization 规则不变），selected representative 的 bindings 写入 `Feature.provenance`；grammar fits 与 typed fits 共存于同一 class（常数与输入依赖表达式并存）。

### 在前端的触发（`Front.fitBody/fitSlot`）

```
axisFit axis = axisPass Grammar axis                              -- v0.6.1 原路径（shared → first/following）
             ; 若失败且 saTypedHoles: inc typed_hole_slots_triggered; axisPass TypedHoles axis
```

Typed 搜索只在一个轴的整个 v0.6.1 grammar 路径失败后打开（ScalarFailure 触发 `NeedTransform` 扩展），因此 v0.6.1 能解的任务得到相同程序体（测试 `regression_v061.csv`：`same_program_body_as_baseline`）。typed 分支的 row evaluation 计入 `operator_applications`/`search_work`；不对 `Typed` 表达式做 online abstraction（`parametrize`/`instantiate` 视其为不透明）。

## 4. ML：`mod` 与 `isOdd`（`Language.ML`）

- `Mod :: Expr Int -> Expr Int -> Expr Int`：Haskell `mod` 语义，结果取除数符号：`(-3) mod 2 = 1`，`3 mod (-2) = -1`；除数为 0 → `Left "mod: division by zero"`（不 crash、不返回 0）。
- `IsOdd :: Expr Int -> Expr Bool`：`odd`，负奇数为 True；在全部整数上 `isOdd n == (n mod 2 == 1)`（测试覆盖 [-20,20]）。
- 接入：`Language.Schema.registry`（`mod`、`isOdd`）；typed registry `OpMod/OpIsOdd/OpIf` 的 `applyOp` 调用 `ML.eval`；由 generic N-ary search 使用（无专用匹配分支）。`saParityOps=False` 时它们不可见。Mod 的除数 hole 域限制为 ≥2（见 §3），算术枚举仍受深度/hole/预算上界约束，无无界枚举。

## 5. 配置、消融与入口

| 配置（`ARC.StageAEvaluate`） | `saGridSize` | `saTypedHoles` | `saParityOps` | `saArgPolicy` |
|---|---|---|---|---|
| BaselineV061（= `v61Config`） | off | off | off | – |
| GridSizeOnly | on（固定模板） | off | off | – |
| TypedNaryOnly | off（固定画布守卫） | on | off | FeatureAndConstant |
| FullA | on | on | on | FeatureAndConstant |
| NoFeatureArg | on | on | on | ConstantOnly（每候选 ≤1 feature） |
| NoConstantArg | on | on | on | FeatureOnly（无 hole） |
| FullAMinusParity（附加） | on | on | off | FeatureAndConstant |

入口：`latis stage-a-mechanism --out results/stage_a/mechanism --per-family 3`（机制任务 × 配置 + v0.6.1 任务回归行）、`latis stage-a-solve --task PATH --out DIR --config FullA`、`latis arc-train-only-stage --stage stage-a-<Config> …`（与 v0.6.1 相同的泄漏守卫/超时/train-exact 复核，JSON 多出 `size_rule`、`grid_realization_*`、`typed_holes`、`hole_bindings`、`semantic_classes_detail`、`failure_stage`、RTS 峰值内存）。

## 6. 机制任务（`ARC.StageAEvaluate.mechanismInstances`）

每族 3 个种子实例，训练 3–4 对、heldout 1 对（只用于打分）。对象为颜色互异、列互异的矩形，输出保持位置：

| 族 | 规则 | 设计目的 |
|---|---|---|
| SizeScale | `(2W, 2H)` | 画布缩放，构造输出 |
| SizeOffset | `(W+3, H+1)` | 两轴不同常数偏移；常数跨案例共享 |
| SizeFromFeature | `(W+CountObjects, H)` | 尺寸依赖另一个输入特征（Count 在训练中取 2,3,4） |
| TwoHoles | `(2W+1, H−CountObjects)` | 两个 hole 联合拟合；非交换 `Sub` 的参数顺序 |
| ParityMod | `(W+(W mod 3), H)` | `mod` 的可匹配性 |
| ParityIf | `(W, if isOdd W then H else W)` | `isOdd`/`If` 的类型流 |
| CardinalityMismatchStillBlocked | `(W+2, H)`，输出多一个对象 | size 可拟合但对齐仍被拒绝 |
| CounterexampleConstantTruth / FeatureTruth | 训练完全相同（Count≡2，`W+2 == W+Count`），heldout Count=3 | 常数与 feature 候选同时保留、可审计；prior 不能识别唯一真解 |

测试（`test/StageAMain.hs`）：ML 语义、typed 枚举性质（参数顺序、共享常数、联合拟合、Feature-first、策略、预算截断、确定性、representatives 保留、`If/IsOdd/Mod` 可达）、Size 特征/realization（恒等、无效尺寸拒绝、不裁剪、尺寸驱动构造）、机制任务的正/负控制、不变量（无 concrete 高层边、无 untriggered 展开、置换不敏感、确定性）、v0.6.1 任务回归（train/heldout exact 不变、恒等 size rule）。

## 7. 复现

```powershell
./scripts/run_stage_a.ps1                 # build → 7 组测试 → 机制矩阵 → ARC smoke(8) → ARC 400×7 → 报告
./scripts/run_stage_a.ps1 -SkipBuild -SkipTests -SkipMechanism -SkipSmoke   # 只重跑 ARC 全量
python -I scripts/arc_stage_a.py report --out results/stage_a/arc            # 只重新汇总
./build/latis-stage-a.exe stage-a-solve --task data/arc1-training/007bbfb7.json --out results/stage_a/single --config FullA
```

输出：`results/stage_a/validation/`（编译器、git、各套测试日志）、`results/stage_a/mechanism/`（每实例每配置 `*.json` + `*.graph.json`，`mechanism_metrics.csv`，`regression_v061.csv`）、`results/stage_a/arc/`（`data_manifest.json`、`code_version.json`、`run_meta.json`、`tasks/<id>/stage-a-<Config>.json`、`metrics.json`、`audit.json`、`summary.md`）、`results/stage_a/metrics.csv`、`results/stage_a/per_task.csv`。

## 8. 本轮未实现（后续阶段）

Shape 代数、E-graph/完整 VSA 重构、抽象指称偏序重构、通用关系式对象生成/分裂（object count-changing transformations）、并行化、神经网络、Branch-and-Bound；typed 表达式的 online abstraction；对象位置随画布缩放的变换（当前 body 只能用 `Plus`/typed 表达式表达位置，典型的 tile/scale 任务仍在对齐或 realization 环节失败，见报告）。
