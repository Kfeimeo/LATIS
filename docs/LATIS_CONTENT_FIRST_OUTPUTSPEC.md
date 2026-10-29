# LATIS Content-first OutputSpec：解除 Size-first 前置约束的设计与实现

本文记录在 Stage D / D+ 源码上新增 Content-first / Goal-coupled OutputSpec 路径的真实调用链、类型语义、依赖方向、触发顺序、预算与限制。实测结果见 [LATIS_CONTENT_FIRST_REPORT.md](../reports/content_first/LATIS_CONTENT_FIRST_REPORT.md)。所有函数名以当前源码为准。

## 1. 开工审计：旧调用链与阻塞点

### 1.1 最短调用链（审计时的源码）

`ARC.ArcTrainOnly.runConfigured` → `Synthesis.Collection.Front.frontSearch SafeOnline conf pairs` → `main`：

1. `sizeStep`：`saGridSize` 开启时调用 `Synthesis.Collection.Size.synthesizeSize`（Stage A grid leaves；C3.1 对象叶子 `GLargestW/H`、`GSmallestW/H`、`GSetW/H`、`GColors`、`GPixels` 仅在 grid leaves 无拟合时作为第二轮打开）。结果写入 `size_rule_*` 计数与 Size2 Feature。
2. **硬性 Guard**（原 `Front.hs` 第 407–408 行）：`case sized of Left err->pure (Left err)`。尺寸合成失败即结束整个任务，`relationPath`（Stage C `Set[Object]` 变换）、`unifiedPath`（Stage D typed 参数/组合）、`explained`（v0.6.1 对齐）均不可达。`ARC.ArcTrainOnly` 把 `size:` 前缀归类为搜索失败 `size_rule`。
3. 尺寸成功后：`dims = outputSize` 在每个 case 上的实现画布，被 `groundedOf`（Stage B 上下文）、`relationPath` 的 `SearchCase.scOutDims`、`unifiedPath` 的 `DCase.dOutputDims` 预先固定。`Relation.emitObjects` 的 `KFitAcross/KFitDown`、`Parameter.evalLeaf` 的 `OutputWidth/OutputHeight/LegacyFit*` 直接读取这一预先固定的 output canvas。
4. 旧 `CropSelected`（Relation）只把选中对象平移到 bbox 原点，画布仍来自 Size Rule；它不从输入 grid 裁剪像素，也不决定尺寸。Stage C 的 `CropLargest` 机制族正是通过对象级 size leaf `Width(UniqueLargest(Objects(Input)))` 先拟合尺寸才能成立。

### 1.2 接口表

| 能力 | 现有位置 | 本轮处理 |
|---|---|---|
| 输入侧选择谓词 `Pred`（ColorIs/IsMaxArea/IsMinArea/Shape 谓词/颜色频率/NotP）与唯一性显式失败 | `Relation.evalPred`、`selectObjects` | 复用（唯一性、tie 失败不变） |
| 对象 bbox / 像素 | `Latent.Object.absolutePixels`、`width/height` | 复用；新增 inclusive `Bounds` |
| 渲染与越界拒绝 | `Latent.Grid.gridFromCells`、`Latent.Render.render` | 复用 |
| Render witness 与独立重放 | `Relation.renderWitness/verifyRenderWitness`、`Front.runProgramEvidence` | 复用（content-first 程序走同一入口） |
| 尺寸合成 | `Size.synthesizeSize` | 不变 |
| 控制流 guard | `Front.main` | **解除**：失败不再结束任务，改为触发 |
| 预先固定 output canvas 的计算 | `relationPath`/`unifiedPath`/`KFit*`/`OutputWidth` | 不变；content-first 不消费 `dims`，自行派生 |
| D+ 事件总线 / 单 IO trace | `Diagnostics.diagnostic/traceAt/traceCand` | 新增 `ContentFirst` scope 事件 |

**结论**：导致对象搜索不可达的是 `Front.main` 中 `sized` 的 `Left` 分支；所有依赖预先固定 output canvas 的计算（`KFitAcross/KFitDown`、`OutputWidth/OutputHeight`、D 的 `dOutputDims`）都位于 Size-first 分支内部，content-first 分支不调用它们。

## 2. 类型与语义（`Synthesis.Collection.ContentFirst`）

```haskell
data SelectionMode        = SelectUnique | SelectNonEmpty
data SelectionPlan        = SelectionPlan { spMode :: SelectionMode, spSelector :: Selector }   -- Selector 来自 Relation
data ContentConstruction  = CropInputWindow | EmitSelectedWithOwnCanvas
data ContentFirstPlan     = ContentFirstPlan { cfpSelection :: SelectionPlan, cfpConstruction :: ContentConstruction }

data Bounds   = Bounds { bMinX, bMinY, bMaxX, bMaxY :: Int }      -- inclusive；boundsDims = (+1, +1)
data OutputContent = ContentEmit [EmittedObject] | ContentCrop Grid [EmittedObject]
data OutputSpec = OutputSpec { osDims :: Dimensions, osContent :: OutputContent, osWitness :: OutputSpecWitness }
```

- 对应提示词的 `OutputPlan`：`Program` 新增字段 `progContentFirst :: Maybe ContentFirstPlan`。`Nothing` 为 Size-first（`progSize`/`progTransform` 语义不变），`Just plan` 为 Content-first，此时 `progSize`、`progTransform` 不被读取（`Front.runProgramObjects` 先分派 `cfp`，再进入未改动的 `sizeFirstObjects`）。旧 Program 文本不变；`Config` 新增 `contentFirst :: ContentFirst`（默认 `contentFirstOff`）。
- `selectWith :: SelectionPlan -> [Object] -> Either String SelectionWitness`：只读输入对象。零匹配、`SelectUnique` 多匹配、谓词内部 tie（`IsMaxArea`、颜色模式）都是带 cardinality 文本的显式 `Left`；成功时记录 selector、examined/matched ids、唯一性或聚合理由、bounds。**没有隐式 `head`**。
- `deriveOutputSpec :: ContentFirstPlan -> Int -> Grid -> Scene -> Either String OutputSpec`：顺序 selection → bounds → dims（ARC 1..30 检查，零宽高/越界显式失败）→ content。参数中没有训练目标。
  - `CropInputWindow`：`cropWindow` 从原始输入 Grid 读取 inclusive 窗口的全部像素（含其它颜色与背景格）；同时把窗口内每个输入对象裁剪出的像素作为 `EmittedObject` 记录来源（选中/非选中），并用 `gridFromCells` 重放核对与原始窗口逐格一致，不一致是显式失败（不会无声丢色）。Witness 中 `other_object_pixels` 记录非选中对象贡献的像素，说明"选中对象只决定窗口，内容来自输入 grid"。
  - `EmitSelectedWithOwnCanvas`：只把选中成员平移到局部原点，画布为 bounds 尺寸，其余为背景。
  - 两者在窗口含其它颜色时不等价；机制族 `SelectByPredicateThenEmit`（Crop 不得通过）与 `CropContainsOtherColors`（Emit 不得通过）作为反例测试。
- `renderOutputSpec`：`gridFromCells` 渲染，越界像素拒绝；Crop 还要求与裁剪窗口一致。
- 背景：沿用 encoder 背景 0；非 0 背景与多色 Region 识别列为 P1，本轮不做、不猜。

### 2.1 单向依赖

`Input Grid → encode（含 diagonal view / permutation）→ Selection → Bounds → Dimensions → Content → Render`。选择不依赖尚未确定的输出尺寸；旧 `KFitAcross/KFitDown`、`OutputWidth` 这类依赖输出尺寸的表达式不在 content-first 分支内求值，因此不存在依赖环；若将来要在 content-first 画布上执行位置变换，必须先建立尺寸再求值，且反向依赖应标记为不适用（本轮未实现）。

### 2.2 候选宇宙与代价

`enumeratePlans colors shape diagonal`：谓词集 = Relation 文法的 base 谓词及其 `NotP`，**颜色常数只取训练输入场景的颜色**；selectors = `AllObjects` ∪ `FilterBy pred`；两种 mode × 两种 construction。按 `(planCost, 结构序)` 确定性排序。`planCost` = selector 节点数 + 4×颜色常数（与 Relation 的 literal 惩罚一致）+ mode（Unique 0 / NonEmpty 1）+ 2。Crop 与 Emit 同代价，派生 `Ord` 使 Crop 先于 Emit；两者都 train-exact 时都作为代表保留（`crFits`），选择按 (代价, 枚举序)。宇宙有限（典型 100–160 个 plan），因此该层可以给出 `ProvenExhausted`，但事件中明确 `exhaustiveness_scope = 该任务的有限 plan 宇宙`，不是整个 DSL。

### 2.3 搜索（`searchContentFirst`）

每个 plan：先在**所有** case 上求 selection（只读输入，记入 `cf_selection_evaluations`；任一 case 不合法 → `selection_failed`，逐 case 原因保留在 `ccSelections`），再逐 case derive+render，首个不匹配即早停（每个 case 一次 `cf_case_executions`）。预算：`cfPlanBudget`（plan 前缀）、`cfExecutionBudget`（case 执行）、`cfMaxFits`（代表上限）；截断记录原因与未访问 plan 数。候选级 trace 事件 `scope=ContentFirst, kind=evaluated` 携带 plan AST、逐 case 结果与 OutputSpec witness（bounds、dims、dims_source、matched ids、像素来源）。

## 3. 控制流（`Front.main`）

```text
sizeStep ──► emit SizeRule completed (+ size_first_status: fit | no_fit | truncated | not_entered)
   │
   ├─ Right () ──► sizeFirstPaths（原 relationPath / explained / unifiedPath，未改动）
   └─ Left err ──► legacy = Left err（不再 return）
contentFirstGate sized legacy:
   Right p, cfExploreAlternatives ──► contentFirstPath TriggerExploreAlternatives（只记录 alternatives；返回 p）
   Right p, cfEnabled             ──► deferContentFirst（Deferred "content-first" (0,|universe|)，候选数 0）；返回 p
   Right p, 关闭                   ──► 返回 p（与 Stage D 完全一致）
   Left err, size 失败 && cfOnSizeFailure       ──► contentFirstPath TriggerSizeFailed err
   Left err, size 成功 && cfOnDownstreamFailure ──► contentFirstPath TriggerDownstreamFailed err
   Left err, 关闭                   ──► Left err（与 Stage D 完全一致）
```

- `contentFirstPath` 发出 D+ 事件 `scope=ContentFirst`（entered/completed，含 `content_first_trigger`、`size_first_status`、`prior_failure`、budgets、classification、exhaustiveness 及其 scope）和 trace 事件 `kind=grammar`；计数写入 `cf_*` 指标；完整 `CFRun`（trigger、size status、原失败、`CFResult` 全部候选、分类、选中 plan、role）追加到 `Graph.contentFirstRuns`。
- 失败字符串组合：`<原 size-first 失败>; content-first: <classification> (<summary>)`，`ARC.StageAEvaluate.failureStage` 的前缀分类保持原值，更深的证据在 `content_first` JSON 块中（`final_classification`、runs、candidates、witnesses）。
- 首解成本：content-first 解的 `first_solution_work` = 进入时的 work + selection 评估数 + 首个 fit 时的 case 执行数。
- 旧路径首解默认早停；`ContentFirstExploreAlternatives` 打开后才枚举同训练签名的 content-first 代表（`cf_alternative_fits`），程序不变、`first_solution_work` 不变。

### 3.1 分类标签

`classifyResult`：`size_first_failed_but_content_first_succeeded`、`size_first_fit_downstream_failed_but_content_first_succeeded`、`content_first_alternative_representatives_found`、`content_first_unavailable_due_to_representation`（无任一 plan 在所有 case 合法，且未截断）、`..._within_visited_prefix`（截断时）、`content_first_no_train_exact[_budget_truncated]`；`ARC.ContentFirstEvaluate.finalClassification` 另给 `content_first_deferred_legacy_first_solution`、`content_first_not_entered`。

## 4. 配置与入口

| 名称（`ARC.StageDEvaluate.namedConfigsD`） | 内容 |
|---|---|
| `FrozenD` | = `D0_Frozen`（FullD + D+ 诊断），content-first 关闭 |
| `ContentFirstOnly` | FrozenD + `contentFirstOn`（plan 400 / case 执行 4000 / 代表 16；size 失败与下游失败均触发） |
| `ContentFirstExploreAlternatives` | 同上 + `cfExploreAlternatives=True` |

- `latis arc-train-only-stage --stage stage-d-ContentFirstOnly …` 的 JSON 新增 `content_first` 块（`ARC.ContentFirstEvaluate.contentFirstJSON`：final_classification、selected_plan、metrics、deferred、runs[candidates[selections, cases[output_spec]]]、witnesses[spec, exact]）。
- `latis content-first-mechanism --out DIR [--config …] [--regression-ids FILE --arc-dir DIR]`：机制矩阵、泄漏对照、旧解回归（只用训练对）。
- `latis trace-io … --config ContentFirstOnly`：事件含 `ContentFirst` scope；`trace_io.py` 漏斗新增 `ContentFirst` 阶段；查看器新增分支时间线、选中 bbox/裁剪窗口覆盖层、Size 依赖来源、像素来源表、表示不足诊断横幅。
- `scripts/run_content_first.ps1 / run_content_first.py`：构建 → 测试 → 机制 → 400 题（FrozenD、ContentFirstOnly）→ 定向 Explore → 报告 → 两题 trace；结果写入 `results/content_first/<run_id>/`，不覆盖旧目录。

## 5. 预算、确定性与回归

- 触发前不展开：`cf_plans_tried=0`，只有 `cf_deferred_plans` 记录宇宙大小。
- 预算可审计：`cf_plan_universe / cf_plans_tried / cf_case_executions / cf_truncated / cf_first_fit_executions`，事件带 limit/used/hit；超时时 counters 为 null。
- 确定性：plan 排序与 selection 不依赖对象 id；测试验证输入对象置换下 spec、程序与预测不变。
- 回归：content-first 关闭时 `Config`/`Program` 仅多出默认字段，`frontSearch` 的结果（程序、失败文本、`search_work`）与 Stage D 相同（测试：Stage C/D 机制任务、03560426、Stage D 20 道旧解三配置比较）。

## 6. 限制（本轮不做）

- selector 语言仍是 Stage C 的单谓词（无 And/Or 组合、无"bbox 包含某对象"、无"窗口内某颜色计数"），对象仍是 4 连通单色 Object；因此 `2dc579da`（需"最频繁颜色且非矩形"或"包含唯一最小对象的分区"）与 `e50d258f`（需多色矩形 Region 与颜色计数比较）在本轮被诚实标为 `content_first_no_train_exact`（有合法 selection 但无整格匹配）——是表示不足而非尺寸入口阻塞。详见报告。
- 非 0 背景、多色 Region 视图、Content-first 画布上的后置位置变换、B VSA 对 `Region/Set[Object]` 的泛化偏序均为 P1。
