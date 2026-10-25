# LATIS 阶段 C 审计报告：统计一致性与集成边界

范围：只审计，不扩展 TSL、不改搜索策略。依据：当前源码、`docs/LATIS_STAGE_C.md`、`docs/LATIS_STAGE_C_REPORT.md`、`results/stage_c/arc/`（主运行 `stage-c-20261024T080811Z`）与 `results/stage_c/arc_idle/`（空闲复测 `stage-c-20261024T083854Z`）的逐题原始 JSON。原始结果未被覆盖；复算与明细写入 `results/stage_c/audit/`，复算脚本为 `scripts/audit_stage_c.py`（只读原始结果）。

## 0. 结论先行

| 问题 | 答案 |
|---|---|
| 21 项差异的原因 | 不是重复计数的 bug，而是**两个非互斥类别被并列相加**："已分解"（3297）包含 21 个在**被预算截断的候选集合内**仍找到表达式的 mask，这 21 个同时带 `truncated=True`，于是也被计入"预算截断"（287）。按互斥分区重算：已分解 3297 + 不可表示 693 + 截断且无表达式 266 = 4256，与 mask 数精确相等；400 题逐任务计数器与逐 mask 记录无一不一致 |
| 修正后的 Shape 分解覆盖率 | 以**逐任务去重 mask、跨任务求和**为单位：3297/4256 = **77.5%**；其中最小性有保证的 3276/4256 = **77.0%**（21 个在截断候选集内找到的表达式最小性无保证）。以**全数据集去重 mask** 为单位：584/1470 = **39.7%**（小 mask 跨任务重复、大 mask 多为单任务独有且不可表示）。原报告的 77.5% 数字本身正确，但其三类之和不构成分区，且未说明统计单位 |
| 17/400 是否仍成立 | **成立**。主运行与空闲复测均为 BaselineA 7、RelationsOnly 13、ObjectShapeFull 17、ObjectShapeGoalDirected 17，新增的 10 个任务 ID 两轮相同，无旧解丢失；两轮都完成的任务 `search_work` 逐题相同，差异只有超时 |
| A/B/C 的集成边界 | ShapeOnly / RelationsOnly / ObjectShapeFull 继承 **Stage A FullA**，ObjectShapeGoalDirected 继承 **Stage B FullB**；C 的 Size Rule **复用** A 的 Typed Hole 枚举器（追加对象叶子、失败后第二轮）；C 的 `ObjectTransform` 参数是**封闭的小枚举**（颜色常数、5 种计数、5 种步长），**不能**使用任意 A 类型化表达式；B 的 Witnessed VSA 只处理 `Int` 叶子的 `LTerm`，**不支持** `ShapeMask`/`Set[Object]`；对象集合变换与 sequence-local 位置体在 `runProgram` 中是**互斥分支**，不能组合。即：模块已集成为同一前端的触发链与同一 `Program` 载体，但**不存在统一的组合式 TSL 搜索空间** |

## 1. 任务 1：Shape 分解统计

### 1.1 统计定义（源码证据）

| 量 | 定义 | 源码 |
|---|---|---|
| 统计单位 | 每个任务：训练对**两侧**（输入与输出）所有案例的所有对象的 mask，经 `M.fromListWith (+)` **按 mask 去重**，`occurrences` 记实例数；各任务的计数器相加得到报告总数（跨任务不去重） | `Front.shapeAudit`：`masks=M.toList (M.fromListWith (+) [(objMask o,1) | (a,b)<-scenes, o<-O.objects a++O.objects b])` |
| `c_shape_masks` | 任务内去重 mask 数 | `inc "c_shape_masks" (length recs)` |
| `c_shape_decomposed` | `dcExpr /= Nothing` 的 mask 数（**无论是否截断**） | `length [() | Just _<-[dcExpr d]]` |
| `c_shape_unrepresentable` | `dcExpr == Nothing && not dcTruncated` | 同上 |
| `c_shape_truncated` | `dcTruncated` 的 mask 数（**无论是否找到表达式**） | 同上 |
| 同时为真的来源 | `decompose` 第 173 行（面积超限）→ `Nothing, truncated`；第 186 行（无配对命中）→ `Nothing, truncC||truncP`；**第 187 行**（命中）→ `Just e, truncC||truncP`：候选或配对数被 `dbMaxCandidates/dbMaxPairs` 截断后仍在保留的前缀里找到并集/交集 | `Shape.decompose` |
| `c_shape_ast_total` | Σ `dcSize`，无表达式的 mask 记 0 → **分母是已分解 mask 数**（5623/3297 = 1.71） | `inc "c_shape_ast_total" (sum [dcSize d])` |
| `c_shape_ties` | Σ max(0, `dcTies`−1)；`dcTies` = 同最小 AST 大小的表达式数，**包含原语别名**（`recognizePrim` 对 1×1 像素返回 Square、Rectangle、2 个 DiagonalBar、4 个 Triangle → ties=8） | `Shape.recognizePrim`、`decompose` 第 174 行 `(length prims)` |

### 1.2 核查结果（`results/stage_c/audit/shape_audit_ObjectShapeFull.csv`、`shape_summary_ObjectShapeFull.json`）

| 量 | 主运行 ObjectShapeFull |
|---|---|
| 有对象的任务 / 对象实例 / 任务内去重 mask | 397 / 24 931 / 4256 |
| 已分解 | 3297，其中 **21** 个 `decomposition≠null ∧ truncated=True` |
| 不可表示（深度 2，未截断） | 693 |
| 截断且无表达式 | 266（= 287 − 21） |
| 分区恒等式 | 3297 + 693 + 266 = 4256 ✓；原报告之和 3297 + 693 + 287 = 4277 = 4256 + 21 |
| 逐任务一致性 | 400 题中逐 mask 记录重算的六个计数器与 `stage_c` 计数器**全部相同**（`per_task_counter_inconsistencies = []`） |
| 全数据集去重 | 1470 个不同 mask：已分解 584、不可表示 620、截断无表达式 266 |
| 21 个重叠 mask 所在任务 | `23b5c85d(1) 3631a71a(2) 41e4d17e(1) 469497ad(2) 539a4f51(2) 543a7ed5(1) 5c2c9af4(2) 6aa20dc0(2) 6b9890af(1) 6ecd11f4(1) 8a004b2b(1) 9172f3a0(1) c444b776(1) c9f8e694(1) ce22a75a(1) f25fbde4(1)` |

同样的核查对 ShapeOnly（4299 = 3340 + 693 + 266，重叠 21）与 ObjectShapeGoalDirected（4233 = 3283 + 684 + 266，重叠 21）成立；三者 mask 数不同是因为对角视图/超时改变了各任务参与审计的对象集合。

### 1.3 最小修复与回归测试

- 代码：`Front.shapeAudit` 新增计数器 `c_shape_decomposed_truncated`（同时 `Just` 且 `truncated`），注释写明分区恒等式；`StageCEvaluate.stageCMetricNames`、`scripts/arc_stage_c.py` 的 `C_METRICS` 与 CSV 列同步。报告脚本改为**从逐 mask 记录派生**四个互斥类别（对新旧 JSON 都成立），`summary.md` 的 Shape 表增加"对象实例""其中在截断候选集内找到""截断且无表达式""分区检查"列并打印 ✓/✗。
- 测试（`test/StageCMain.hs`）：(a) 单元：`decompose` 在 `dbMaxCandidates=5` 下对 L 形返回 `Just` 且 `truncated=True`，且表达式的 mask 与输入相等；(b) 前端：每个机制实例、每个有 mask 的配置断言 `masks = decomposed + unrepresentable + (truncated − decomposed_truncated)`，并与 `Graph.shapes` 记录逐项相等。套件从 426 增至 **493** 条断言，全部通过（`results/stage_c/validation/StageC-tests-audit.txt`）。
- 定向重放（不覆盖原结果）：用同源码 + 新计数器构建 `build/latis-stage-c-audit.exe`（SHA256 前缀 `aaf0ef62`），重放上述 16 题（`results/stage_c/audit/replay/`）：新计数器与由主运行记录派生的重叠数 **16/16 相等**，状态与 `search_work` 与主运行逐题相同（`results/stage_c/audit/replay_check.json`）。
- 文档：`docs/LATIS_STAGE_C_REPORT.md` §5.5 改为按分区报告并注明统计单位、AST 与 ties 的分母。原始 `results/stage_c/arc/tasks/**` 未改动；`metrics.json/summary.md/per_task.csv` 是派生文件，已用修正后的脚本重新生成。

## 2. 任务 2：主要实验指标复算（`results/stage_c/audit/audit_recheck.json`、`cardinality_flow.csv`）

从逐题 JSON 的 `status/failure_stage/stage_c` 直接重算，主运行（争用）与空闲复测分别列出：

| 量 | 主运行 | 空闲复测 | 一致 |
|---|---|---|---|
| train-exact：BaselineA / BaselineB / ShapeOnly / RelationsOnly / Full / GoalDirected | 7 / 7 / 7 / 13 / 17 / 17 | 7 / 7 / 7 / 13 / 17 / 17 | ✓ |
| Full 相对 BaselineA 新增 | `1f85a75f 23b5c85d 4347f46a 810b9b61 9565186b a740d043 b1948b0a be94b721 c8f0f002 d037b0a7`（10） | 相同 10 个 | ✓ |
| 旧解丢失（任一配置） | 0 | 0 | ✓ |
| BaselineA cardinality 集合 | 289 | 289 | ✓ |
| 289 题在 Full 下的流向 | 进入关系搜索 286（3 题进入前超时）、找到可执行关系 3、train-exact 3（`1f85a75f 9565186b a740d043`）；首次拒绝：relation_search 280、timeout 3、none 3、grid_exact_check 2、alignment_validation 1 | 进入 287、找到 3、exact 3；relation_search 281、timeout 2、none 3、grid_exact_check 2、alignment_validation 1 | 差异 = `0dfd9992` 在空闲下不再超时 |
| 289 题在 RelationsOnly 下 | 进入 287、找到 3、exact 3（同 3 题）；relation_search 284、timeout 2 | 相同 | ✓ |
| 关系搜索（Full，400 题）：进入 / 找到 fit / 预算截断 | 373 / 10 / **0** | 374 / 10 / 0 | ✓（截断为 0） |
| "找到 fit 但非 train-exact" | 0 题（搜索只接受整格精确变换） | 0 | ✓ |
| 超时 | BaselineB `2dd70a9a 3906de3d 85c4e7cd ed36ccf7`；ShapeOnly `264363fd`；RelationsOnly `0dfd9992 484b58aa`；Full `0dfd9992 264363fd 484b58aa`；GoalDirected 以上 + `2dd70a9a` | BaselineB 少 `3906de3d 85c4e7cd`；Full/GoalDirected 少 `0dfd9992` | 批次差异仅超时 |
| 对角链 接受/拒绝（Full） | 1528 / 1436，124 题有接受链 | 1752 / 2158，125 题 | 见下 |
| `search_work` 逐题相同（两轮都完成的任务） | BaselineA 400/400、BaselineB 396/396、ShapeOnly 399/399、RelationsOnly 398/398、Full 397/397、GoalDirected 396/396 | — | ✓ 确定性 |

说明：
- 两轮之间 train-exact 集合、新增 ID、预算截断数完全一致；状态差异只有 4 个超时任务，是执行时间差异，不是统计错误。
- 对角链计数在两轮间不同（1528/1436 vs 1752/2158）**只因**超时任务不同：`c_diagonal_*` 在 `main` 开头计数，但超时任务的 JSON 没有 `stage_c` 块（0 计入），空闲轮多完成了 `0dfd9992`（一个含大量斜向像素的任务）。对两轮都完成的任务，这些计数器逐题相同（由 `search_work` 相同间接保证，且 ShapeOnly 两轮 1855/2730 完全相同）。
- BaselineA/B 与阶段 A/B 参考的"程序文本相同 393/400"差异是 `Program` 记录新增字段（`progTransform/progView`）的 `show` 文本，状态逐题相同（400/400；BaselineB 397/400，3 题为争用超时）。

## 3. 任务 3：A/B/C 的实际集成边界（源码调用链）

| 问题 | 结论 | 证据 |
|---|---|---|
| 1. 两个主要配置继承 A 还是 B？ | `ShapeOnly`、`RelationsOnly`、`ObjectShapeFull` = `fullA {stageC=…}`（Stage A FullA：SafeOnline、typed holes、parity，Stage B 全关）；`ObjectShapeGoalDirected` = `fullB {stageC=…, scGoalDirected=True}`（Stage B FullB + C）。因此 Full 与 GoalDirected 的 train-exact 差异为 0 说明 B 的层级对 C 的 10 个新解无贡献，而 GoalDirected 的额外代价（`search_work` 135 M vs 94 M、峰值 921 MB）来自 B | `ARC/StageCEvaluate.hs` 30–36 行 |
| 2. C 的 Size Rule 是否复用 A 的 Typed Hole？ | **是**。`Size.synthesizeSize` 仍调用 A 的 `enumerateTemplates`/`synthesizeTyped`（同 `HoleConfig`、同算子集、同预算），对象叶子只是 `GFeat` 的新构造子；C3.1 在 Stage A 叶子**无 fit 时**才用追加了对象叶子的叶子集做第二轮（`withObjects`），两轮的模板/评估数相加 | `Size.hs` 99–112 行；`Front.hs` 318 行 `synthesizeSize sa (scObjectSizeFeatures sc) dep scenes` |
| 3. `ObjectTransform` 参数能否使用任意 A 类型化表达式？ | **不能**。`Pred` 的颜色是训练场景出现的常数；`CountExpr` 只有 `KConst n | KCountObjects | KCountColors | KFitAcross g | KFitDown g`；`OffsetExpr` 只有 5 个按自身尺寸的步长；没有 `TExpr` 孔、没有 `Typed` 叶子、没有 Lt/If/Mod 组合。变换候选由 `enumerateTransforms` 的笛卡尔积穷举（7011–13 067 个），不经过 A 的模板枚举器或 B 的类搜索 | `Relation.hs` 66–78 行、`enumerateTransforms` |
| 4. B 的 Witnessed VSA 是否支持 `ShapeMask`/`Set[Object]`？ | **否**。`Referent.LTerm l` 的叶子类型由 `LeafInfo.liType :: l -> TTy` 给出，`TTy = TyInt | TyBool`；`buildGraph` 的目标类型是 `TTy`，`Context.cxEval :: l -> Either String TVal`，`TVal = VI Int | VB Bool`。前端只对 `SlotLeaf`（Int 标量观察者）构建快照（`snapshotFor/snapshotForLeaves`）。C4 的目标驱动只做叶子裁剪与按需深度，仍在 `Int` 槽上 | `Referent.hs` 53、218、223、444 行；`Typed.hs` 34 行 |
| 5. 对象集合变换能否与 sequence-local 位置体在同一程序中组合？ | **不能**。`runProgram` 对 `progTransform` 做 `case`：`Just t` → `emitObjects` 后直接 `render`，**忽略** `progExec/progDefs`；`Nothing` → 原 sequence-local 路径。关系路径构造的 `Program` 带一个占位 `Definition scanKey (Body (Lit 0,Lit 0) …) True`，从不执行。变换路径的位置只能来自对象自身位置、复制步长或 Crop 的 bbox 原点 | `Front.hs` 197–202 行、442 行 |

**区分**："模块已经集成"为真：同一 `Config`/`Program`/`Front` 载体，同一触发链（Size Rule → 计数检查 → 旧对齐路径 → 回退关系搜索），同一 witness/指标/JSON 管道，Stage A/B 行为由开关逐字节复现。"拥有统一的组合式 TSL 搜索空间"为**假**：A 的 typed 表达式只服务 Size2 与标量槽，B 的 referent/VSA 只服务 Int 槽，C 的变换语法是独立的封闭枚举，三者之间没有共享的项语言、没有互相嵌套（如 `Replicate (A 表达式) …`、`If(Shape 谓词) 位置体`），也没有统一的候选类/prior；`ObjectShapeGoalDirected` 把 B 与 C 放进同一运行，但两者在不同的失败分支上各自工作。这也是 102 道"加法样"任务 0 解、36 道位置+形状组合任务无解的结构性原因（见阶段 C 报告 §6）。

## 4. 仍未解决 / 不在本次审计修复范围

- 21 个在截断候选集内找到的分解其**最小性无保证**；要得到保证需提高 `dbMaxCandidates/dbMaxPairs`（会增加分解工作），本次只分别计数，不改预算。
- `dcTies` 混合了原语别名与真正不同的分解；若需要"不同分解数"应剔除同 mask 的原语别名（未改，仅注明）。
- 超时任务没有 `stage_c` 块，所有 `c_*` 汇总对超时任务计 0；跨批次比较这些汇总时必须限定在两轮都完成的任务上（审计脚本的 `runs_compared` 已这样做）。
- `results/stage_c/arc/metrics.json`、`summary.md`、`per_task.csv` 已用修正后的脚本重新生成（派生文件）；记录在 `code_version.json` 中的主运行二进制哈希对应修复前的二进制，新计数器只在 `build/latis-stage-c-audit.exe` 的重放与之后的运行中出现。

## 5. 产物

| 路径 | 内容 |
|---|---|
| `scripts/audit_stage_c.py` | 复算脚本（只读 `results/stage_c/arc*`，输出到 `results/stage_c/audit/`） |
| `results/stage_c/audit/shape_audit_<Config>.csv` | 逐任务：对象实例、去重 mask、已分解、重叠、不可表示、截断无表达式、分区检查、计数器一致性 |
| `results/stage_c/audit/shape_summary_<Config>.json` | 统计单位、分区、覆盖率（两种分母）、AST/ties 分母、全数据集去重 |
| `results/stage_c/audit/audit_recheck.json` | 主运行与空闲复测的 train-exact、新增/丢失、289 流向、关系搜索与对角视图计数、两轮逐题比较 |
| `results/stage_c/audit/cardinality_flow.csv` | 289 题逐题在 6 个配置下的状态与首次拒绝、Full 的关系搜索计数 |
| `results/stage_c/audit/replay/<id>/`、`replay_check.json` | 16 题定向重放与新计数器核对 |
| `results/stage_c/validation/StageC-tests-audit.txt` | 修复后的测试套件日志（493 PASS） |
