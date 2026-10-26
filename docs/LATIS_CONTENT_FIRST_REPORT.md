# LATIS Content-first OutputSpec：机制测试、真实 ARC 消融与回归报告

run_id `cf-20261026-main`，目录 `results/content_first/cf-20261026-main/`（solver.exe SHA256 `f02078a4a8d881bedf7a9b4b64528d3c2d768b78b562f0167b6c7f022e05ddee`，源码快照 `ef28367f…`，git HEAD `95c2fe8b` + 未提交改动见 `git.diff`）。数据 manifest 与 Stage D+ `dplus-20261026-v2` 相同（官方 ARC-AGI-1 training 400 题，train-only 副本 `test: []`，二进制对含 test 的文件退出码 3）。设计与调用链见 [LATIS_CONTENT_FIRST_OUTPUTSPEC.md](LATIS_CONTENT_FIRST_OUTPUTSPEC.md)。本报告所有数字由 `scripts/report_content_first.py` 从原始记录重算（`report_digest.md/json`）。

## 1. 验证套件

| 套件 | 结果 |
|---|---|
| ContentFirst（新）| 340 条断言通过：执行器语义（inclusive bounds、1×1、贴边、非原点、多色窗口 Crop≠Emit、空洞 bbox 背景格、空/非唯一/tie 显式拒绝、越界窗口拒绝、置换不变）；plan 宇宙确定性；7 族 × 3 seed × 3 配置的正/负控制；泄漏对照；预算截断证据；trace 事件；回归（03560426、Stage C/D 机制任务）；oracle injection |
| StageD / StageDFull / StageDControl / StageDPlus / StageC / StageA | 全部通过（Program/Config 新增字段后的回归）|
| StageB 等其余套件 | 本轮未运行（Stage B 套件约 30 分钟；其源码未改动，只受 Program 新字段影响，由上列套件的构造点覆盖）|

## 2. 机制矩阵（每格 = 3 个 seed 中 train-exact / heldout-exact 数；heldout 只评分）

| 家族 | FrozenD | ContentFirstOnly | ContentFirstExploreAlternatives |
|---|---|---|---|
| SelectColorThenCrop | 0/0 | 3/3 | 3/3 |
| SelectByPredicateThenEmit | 0/0 | 3/3 | 3/3 |
| CropContainsOtherColors | 0/0 | 3/3 | 3/3 |
| EmptyAndTieSelection | 0/0 | 0/0 | 0/0 |
| SizeEquivalentAlternatives | 3/0 | 3/0 | 3/0 |
| NoOutputLeakage | 0/0 | 3/3 | 3/3 |
| DeferredOnDownstreamFail | 0/0 | 3/3 | 3/3 |

- **实测负控制**：前三族与 NoOutputLeakage 的 FrozenD 全部在 `size:` 处失败（`failure_stage=size_rule`，`size_rule_exact=0`，content-first 计数全 0）。构造上每个 grid 级 Size2 叶子跨训练 case 恒定而输出尺寸变化（固定 7×7 锚块为唯一最大、固定 1×1 点为唯一最小、带缺口的填充物补齐像素数），因此任何输入侧 size 规则都不可能训练精确——这是构造证明，测试同时实测了它。
- **盲搜索正例**：ContentFirstOnly 在 `cf_trigger_size_failed=1` 下自动找到 `Unique(Select(Color == 2))+Crop/Emit`（SelectColorThenCrop）、`Unique(Select(IsShell))+Emit`（颜色逐 case 变化，颜色谓词不可能统一；Crop 因窗口内异色点不通过）、`Unique(Select(IsShell))+Crop`（Emit 因丢失异色点不通过；witness 的 `other_object_pixels>0`）。heldout 3/3。
- **DeferredOnDownstreamFail**：FrozenD 的 Size2 规则拟合（常数 3×3），旧 relation/D 路径失败；ContentFirstOnly 以 `cf_trigger_downstream_failed=1` 解出，分类 `size_first_fit_downstream_failed_but_content_first_succeeded`。
- **EmptyAndTieSelection**：三配置均无解；记录中 plan `Unique(Select(Color == 2))+Crop` 的 case 1 原因 "matched no object"，case 3 原因 "not unique: 2 objects match"，无隐式 `head`；分类为 `content_first_no_train_exact`（其它 plan 合法但不匹配），不是"表示不足"。
- **SizeEquivalentAlternatives**：FrozenD 以 `Size2(GridWidth-4, GridHeight-4)` + `Select(Color==2); crop` 解出；ContentFirstOnly 保持同一程序、`cf_plans_tried=0`、`cf_deferred_plans>0`（Deferred 记录）；Explore 记录 ≥1 个 content-first 代表且程序与 `first_solution_work` 不变。heldout（inset 1）上旧程序越界失败，content-first 代表精确——两种 intension 同时保留，prior 无法判定真值。
- **NoOutputLeakage**：同输入、不同目标的两任务，108 个 plan 的 selection/bounds 完全相同，54 组已派生 dims 无一不同；fit 集合随目标不同（颜色 2 vs 颜色 3 / 非矩形）。`leakage.json`。

## 3. 旧解回归（20 道 Stage D 解，只用训练对）

`mechanism/regression.json`：20/20 在三配置下 train-exact；程序（核心字段）与训练输入预测 20/20 相同；FrozenD 与 ContentFirstOnly 的 `search_work` 逐题相同（ContentFirstOnly 只多一条 deferred 记录）；ExploreAlternatives 的 work 多出 264–720（枚举 content-first 代表的代价），`first_solution_work` 不变。

400 题中 FrozenD 对比 D+ 的 `D0_Frozen` 原始记录（`frozen_vs_dplus_baseline.json`）：400/400 状态相同、400/400 `search_work` 相同；程序文本 380/400 字节相同，其余 20 道（即全部已解题）的差异只是 `Program` 新增的 `progContentFirst = Nothing` 字段（已逐题核对）。

## 4. 真实 ARC 400 题 train-only

| 配置 | 覆盖 | train-exact | timeout | 新增 vs FrozenD | 丢失 | 配对 work 比（共同完成 400 题）| 搜索秒数之和 | 独立核验 |
|---|---|---|---|---|---|---|---|---|
| FrozenD | 400 | **20** | 0 | — | — | 1.0 | 1044.0 | — |
| ContentFirstOnly | 400 | **22** | 0 | 2（`0b148d64`、`c909285e`）| 0 | 1.0015（96,893,211 → 97,041,468）| 1063.3 | 2/2 passed |
| ContentFirstExploreAlternatives | 22（定向：两配置的已解题）| 22 | 0 | 2 | 0 | 1.0016 | 51.4 | 2/2 passed |

每配置每题独立进程，300 s 内部超时 + 10 s 看门狗，`-M2g -T -l-au`，4 workers；formal 阶段墙钟 558 s，explore 31 s。所有 FrozenD/ContentFirstOnly 预算（A/B/C/D）相同，只增加 content-first 回退（plan 400 / case 执行 4000 / 代表 16）；没有任务触发 content-first 截断。

### 4.1 漏斗：进入新路径 ≠ 派生 OutputSpec ≠ 渲染 ≠ 解题

| FrozenD 的失败类别 | 任务数 | 进入 selection | 每 case 均有合法 selection 的 plan ≥1 | 派生 OutputSpec | 渲染 | train-exact |
|---|---|---|---|---|---|---|
| Size-first 失败（`size_rule`，全部为 **budget truncated**，非证明无解）| 17 | 17 | 17 | 17 | 17 | **1**（`0b148d64`）|
| Size-first 拟合、下游失败 | 363 | 363 | 361 | 361 | 361 | **1**（`c909285e`）|

- 17 道 size 失败任务的 `size_first_status` 全是 `truncated`（每轴 60000 行探测预算截断），因此只能说"尺寸入口不再阻塞"，不能说"不存在 size 规则"。
- 361/363 的下游失败任务都派生了合法 OutputSpec 但整格不匹配（`content_first_no_train_exact`）；2 道（`28e73c20`、`6f8cd79b`）输入网格没有任何前景对象，所有 selection 都 "matched no object"，分类 `content_first_unavailable_due_to_representation`。
- 20 道已解题：`content_first_deferred_legacy_first_solution`，`cf_plans_tried=0`。
- 新路径的总代价：400 题 selection 评估 + case 执行合计使 work 增加 0.15%，墙钟增加约 19 s；下游失败任务平均 33 次 case 执行（最多 78）。

### 4.2 两道新解（独立 Python 核验：dims = bounds+1，Crop = 原始输入窗口逐格相等，像素来源覆盖整个画布；selector 谓词本身仍只由 Haskell 执行器求值）

| 任务 | FrozenD | ContentFirstOnly 选中 plan | 代表数 | 首解 | 备注 |
|---|---|---|---|---|---|
| `0b148d64` | `size: … budget truncated`，输出 10×10 / 9×7 / 6×9 | `Dimensions <- Bounds(NonEmptySet(Select(Color == unique least frequent colour))); CropInputWindow` | 4（Crop/Emit × LeastFrequent / Not MostFrequent）| 第 17 次 case 执行，`first_solution_work` 543,031（FrozenD 全程 542,666）| 非唯一对象集合的联合 bbox；窗口内无其它颜色，Crop 与 Emit 训练等价，均保留 |
| `c909285e` | Size2 拟合（常数 7×7），旧 relation 11,505 候选、D 150 程序均无 fit | `Dimensions <- Bounds(Unique(Select(IsShell(Shape)))); CropInputWindow` | 4（IsShell / LeastFrequent × Unique / NonEmpty，均 Crop）| 第 5 次 case 执行；总 work 256,100 vs 255,642 | 窗口含 19–24 个非选中对象像素（`other_object_pixels`），Emit 不通过，正是 Crop/Emit 语义差别的真实案例 |

两题的 `ContentFirstExploreAlternatives` 记录与 ContentFirstOnly 相同（content-first 已是首解，无额外替代）。test 对未进入任何求解或评分（train-only 协议）；train-exact 不等于 ARC solved。

### 4.3 ExploreAlternatives（22 道定向任务）

22/22 仍 train-exact 且程序不变；5 道记录了 content-first 的同训练签名替代代表：`1cf80156`（16 个：唯一对象 / 最大 / 最小 / 颇色频率 … 的 Crop/Emit 都与旧程序训练等价）、`1f85a75f`（8）、`23b5c85d`（4）、`a740d043`（3，均为 Emit）、`be94b721`（4）。这些替代只是记录，默认首解不变；它们说明"旧 Size Rule 先拟合成功"并不唯一解释这些任务，与 `SizeEquivalentAlternatives` 机制族一致。

## 5. 定向诊断：`2dc579da` 与 `e50d258f`

trace 页面：`traces/<task>/{FrozenD,ContentFirstOnly}/index.html`（trace-level full，另有 `0b148d64`、`c909285e` 的 ContentFirstOnly 页面）。headless Chrome 自检：全部标签页渲染无错误、无死链；`c909285e` 的网格页在 Input 上高亮 49 个格（7×7 裁剪窗口）。

| 任务 | FrozenD | ContentFirstOnly |
|---|---|---|
| `2dc579da`（5×5→2×2，7×7→3×3，11×11→5×5）| SizeRule `BudgetCut`→`NoFitYet`，候选 0，Alignment/Relation/Unified 全部 not_entered | ContentFirst entered（119 事件）：plan 宇宙 116、全部访问、36 个 plan 在每个 case 合法、36 个 OutputSpec 派生并渲染、0 匹配，未截断，`content_first_no_train_exact`。分类 `ProvenExhausted` 仅对该有限 plan 宇宙 |
| `e50d258f`（10×10→4×5 / 3×3 / 4×6）| 同上（高度轴截断）| plan 宇宙 100、36 合法、36 派生/渲染、0 匹配 |

- **`2dc579da`**：输入背景不是 0（无 0 像素），所以每个象限是一个 4 连通的同色对象，被十字线分开；目标是"含标记像素的象限"。所需 selection 是"最频繁颜色 ∧ 非矩形"或"bbox 包含唯一最小对象的对象"——当前 selector 语言只有单谓词（无 And、无包含关系），因此尺寸入口解除后仍停在 **selector 表示不足**；不是尺寸阻塞。oracle 诊断：手写 AST `Unique(Select(Area == unique min))+Crop` 能被 `trace-replay` 解码并执行，但给出 1×1（3/3 render_mismatch，`traces/2dc579da/oracle_minarea_crop.json`），说明 selection 可执行而概念不可表达。
- **`e50d258f`**：目标是多色矩形面板中"红色格最多"的那个；4 连通单色 Object 不等价于多色 Region，且没有"窗口内某颜色计数"的比较谓词。记录中 36 个合法 plan（如 `NonEmptySet(Objects)`、`IsRectangle` 集合）全部 render_mismatch。该题的人工假设未得到 oracle 确认（无法在当前语言内写出），本轮明确标为 **multicolor region / colour-count selector not expressible**，不以 train-exact 为验收标准，也未从输出框推断 Region。
- 作为对照，`c909285e` 的手写 AST `Unique(Select(IsShell))+Crop` 经 `oracle-replay` 在 3/3 训练对精确（`traces/c909285e/oracle_shell_crop.json`，标 `oracle_diagnostic_only`），与盲搜索结果一致。

## 6. 资源、确定性与日志

- 触发前无展开：20 道已解题 `cf_plans_tried=0`；FrozenD 的 `cf_*` 全为 0。
- 预算记账：每次 content-first 运行记录宇宙大小、已访问、selection 评估数、case 执行数、首个 fit 的执行数、截断原因；400 题无截断。D+ 事件 `ContentFirst entered/completed`（budgets、`stop_reason`、`exhaustiveness` + `exhaustiveness_scope`），SizeRule completed 新增 `size_first_status`，trace 事件 `grammar/evaluated/budget` 带逐 plan AST 与逐 case OutputSpec witness（bounds、dims、dims_source、matched ids、像素来源）。
- 确定性：测试验证对象置换下程序与预测不变；400 题 FrozenD 与 D+ 基线 work 逐题相同。
- 内存峰值（RTS max live）：FrozenD 395 MB，ContentFirstOnly 400 MB（最大值）。

## 7. 四个问题

1. **Size-first 失败能否打开 Content-first？** 能。17 道 size 失败任务全部进入 selection、派生并渲染 OutputSpec（机制族 SelectColorThenCrop 等在可证明的 size 阻断下盲搜索 train-exact；真实 `0b148d64` 新增）。下游失败也触发（363 道，`c909285e` 新增）。旧首解默认早停并记录 deferred，ExploreAlternatives 才展开替代。
2. **输出 Size 是否真由输入选择决定？** 是。`deriveOutputSpec` 的参数没有训练目标；dims = selection bounds + 1；泄漏对照在同输入不同目标下 selection/bounds/dims 完全一致；Python 独立重算两道新解的 dims 与窗口。
3. **哪些任务仍卡在 Region/Selector 表示而非尺寸入口？** 16/17 size 失败任务与 360/363 下游失败任务在新路径里有合法 selection 但无整格匹配——瓶颈是 selector/Region 表示与内容构造（只有 Crop/Emit），尤其 `2dc579da`（需谓词合取或包含关系）、`e50d258f`（需多色 Region 与颜色计数）；2 道空输入任务无任何可选对象。
4. **新增多少真实 train-exact，代价如何？** FrozenD 20/400 → ContentFirstOnly 22/400（+2，丢失 0，超时 0），全部 400 题 work 增加 0.15%、墙钟 +19 s；Explore 定向 22 题程序不变，额外 work 每题数百。

## 8. 限制与未做

- selector 仍是 Stage C 单谓词语言；无 And/Or、无容器/包含、无窗口内颜色计数；对象仍是 4 连通单色；背景固定 0（`2dc579da` 的非 0 背景是其能产生"象限对象"的巧合，不是识别）。多色 Region、非 0 背景、content-first 画布上的后置位置变换、B VSA 的 Region/Set 泛化偏序为 P1，本轮未做；没有为任何 ARC ID 写特例。
- 17 道 size 失败全部是预算截断，不能据此断言 Size 规则不存在；content-first 的 `ProvenExhausted` 只针对该任务的有限 plan 宇宙。
- 机制族 heldout 与真实任务 train-exact 都不等于 ARC test 泛化；test 对未被读取。

## 9. 复现

`./scripts/run_content_first.ps1 -Out results/content_first/<run_id>`（构建 → 7 套件 → `content-first-mechanism`（含泄漏与 20 题回归）→ `run_content_first.py` formal/explore/report → 两题 trace）；`python -I scripts/report_content_first.py --out <run>` 重算本报告的表。已有目录只能 `-Resume`，历史 Stage C/D/D+ 目录不写入。
