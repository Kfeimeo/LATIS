# LATIS Stage E2–E3：Shape-MDL、Scene 重构、Object 诱导的层次化 Region，以及 Region-first 广度搜索

> **给编码模型的执行提示词（简体中文）**  
> 请在现有 LATIS 代码仓库中完成下面的审计、设计、实现、机制验证和实验，并提交完整代码、测试、数据与报告。**这是一个需要落实到解释器、枚举器、搜索调度、Witness 和真实 ARC 评测的任务，不接受只新增数据结构或可视化。**

## 0. 背景、已知事实和本阶段目的

以当前已完成的 Stage E0–E1 为冻结基线：ARC-AGI-1 官方 training 400 题 train-only，`FullE01` 为 **22/400 train-exact**，且旧 `ContentFirstOnly` 的 22 道解全部保留。E0 已提供显式 Background Views 和 Residual；E1 已提供精确 PixelSet / 最少矩形覆盖的有界证明、坐标帧、Geometry Witness、部分几何谓词；Content-first 已提供 `OutputSpec` 和窗口裁剪。Stage D/D+ 已有 Typed Hole/VSA、Deferred Frontier、逐任务搜索诊断和可视化追踪。真实问题 `2dc579da` 的人工 Oracle 是分隔线区域选择与 Crop（3/3 训练精确），`e50d258f` 的人工 Oracle 是多色面板颜色统计/唯一极值选择（3/3），`543a7ed5` 是外框构造/孔洞填充（2/2）；这些 **Oracle 不是自动搜索成功，也不是唯一 ground-truth 程序**。

之前 E0–E1 的四配置 ARC 解数均为 22，`FullE01` 的 SearchWork 只多 0.58%，但搜索秒数显著上涨；存在几次重跑恢复的异常退出、原因未定位。要在本阶段检查重复 Geometry/Witness 计算与运行可靠性，不能只看旧 SearchWork。

**本阶段的核心研究假设**：正确的 Scene 解释和 Region 分区往往使复杂的像素级问题变成对大 Region 的简单选择/保留/局部变换；与其在单个 Feature Goal 上深搜，不如跨 Scene/View/Region 候选公平、广度优先探索低成本程序。必须用消融、搜索曝光和可重放 Witness 验证，**不预设该假设在全部 ARC 任务上成立**。

本阶段分为两个可分别验收的里程碑：
- **E2：语义基础**——Shape 代数/MDL、无硬编码背景的 Scene 重构、严格分区的递归 Region Tree、归属/邻接/Witness、可执行 Region 级程序。
- **E3：搜索算法**——Region 优先、由大到小、跨 View 广度优先、单 Goal 限额+公平恢复，以及确有证据的局部剪枝。

在修改前审计实际源码与 API，形成 `docs/LATIS_STAGE_E2_E3_AUDIT.md`，列出已有组件、复用点、旧搜索优先级、尺寸前置约束、作用域/类型边界、预算，以及预计改动的真实文件。不要假定下方概念型接口与现有 Haskell 类型同名。**符号执行/合成继续用 Haskell，已有 PyTorch 神经系统不重写，本阶段不训练 Recognition Model。**

## 1. 严格区分 Shape、Object、Region 和 Scene

这四者不是同义词。

1. **Shape 属于 Object**：Object 的局部几何是准确的有限像素集合 `ShapeMask`，可由 Shape 代数 AST 描述；Shape 不应与 Region 分区树节点混同。
2. **Placed Object**：至少有 `(object identity, shape, coloring, absolute position)`，其身份/来源可跨不同 View 比较；不能仅凭集合遍历下标做对应。
3. **Region**：某个 Scene/父 Region 内的**空间作用域和结构指称**，可包含多个 Object 及余像素；区域本身不要求同色、也不强制是一个 Object。Region 的子节点来自显式的 Object-induced partition，而非任意 PixelSet 子集。
4. **Scene**：完整 Raw Grid 的一种可验证解释；根 Region 的像素集就是整个画布。保留多种合法 Scene/View/Partition hypotheses，不把第一种解释硬编码为唯一真相。

同一棵 Region Tree 中所有兄弟 Region 必须**两两不相交，且完整覆盖父 Region**。祖先包含后代属于层级关系，不叫“兄弟重叠”。不同候选树可以给同一像素不同解释，但不在同一树中强行混合。Region Tree 的不交分区与 E1 的**允许重叠的最小矩形覆盖**是两套不同运算，不得混用。

## 2. E2-A：Shape 的可执行代数与解释成本（MDL）

新增或扩展有类型 Shape AST，最少包含：

```text
ShapeExpr := Rect(bounds)
           | DisjointUnion(ShapeExpr, ShapeExpr)   -- ⊎
           | Difference(ShapeExpr, ShapeExpr)      -- \
```

- `Rect` 的界为闭区间坐标；宽高、四角、`MinX/MaxX/MinY/MaxY`、绝对/相对坐标由 typed 特征导出。所有 Mask 在本地坐标系/画布坐标系间有显式 Frame/SizeSig 映射。
- `DisjointUnion(A,B)` 必须有 `A∩B=∅` 的独立检查；否则是**无效程序**，不可暗中回退为普通并集。
- `Difference(A,B)` 使用精确集合差。对空集、`B` 超出 `A`、非连通结果给出明确语义及诊断；如限定 `B⊆A`，须将其作为**显式的受限语法条件**并说明何时不完备。支持 `Shell = RectOuter \\ RectInner` 作为两个矩形加一次差的常见短解释；不要把它做成针对某道题的专用原语。
- 每个 AST 必须能独立执行为 Mask，记录节点类型、输入 Mask、输出 Mask、Frame、像素等价 Witness；无交并、差集与非法 AST 有测试及伪造证据拒绝。

同时保留 **两个不同指标**：

```text
C_rect(S) = 最小矩形覆盖数量         -- 沿用 E1；普通覆盖允许矩形相交
C_ast(S)  = min_{eval(e)=S} MDLCost(e) -- 允许 Rect、⊎、\\ 的 Shape AST
```

- 不要声称 E1 的 `proven_minimal_rectangle_cover` 自动等价于 Shape AST 最小描述成本。
- 给出固定、可复现、非负的 MDL 成本模型：节点成本、矩形坐标参数成本（常数/相对引用）、无交并/差运算成本、形状正规化/重复结构的共享成本。可给默认权重，但必须在实验前冻结，不根据 ARC 任务 ID 或 test 结果调整。
- `ProvenOptimal / BoundedBest / NotAttempted` 等状态明确区分；小 Mask 使用独立穷举器验证 AST 最优性或有限宇宙最优性，大 Mask 必须按预算返回合法的 bounded 解释，不谎称最优。
- 保留有不同结构解释的等价/同成本 AST（至少有界保留），仅以精确 Mask 等价做缓存；不得把外延相等当成内涵相同并抹掉关系特征。
- 严格防止退化为大量单像素 Object 或“所有像素一个任意巨大 Object”：**Scene 成本不仅含 Shape AST，还必须计 Object 数、Placement、Region/Split、背景/视图解释成本**。报告解释编码规则及潜在退化例子，做 `MDLOn/Off` 消融。若 MDL 只用于排序，不可冒充正确性证明。

## 3. E2-B：基于 Object 列表与余像素的 Scene 定义

对输入 Grid `G: U→Color`，某个候选 Scene 解释为放置对象集合/列表 `L=[(o_i,pos_i)]`。令 `P_i` 为对象精确的已放置**带颜色像素**；`M_i` 为坐标支持集。第一版的新 Scene 分支优先要求 `M_i` 两两不交（若复用旧重叠语义，必须分支显式标记绘制次序，不允许无说明覆盖）。定义：

```text
ResidualCoords B = U \\ ⋃ M_i
```

**Scene 的背景合法性**：

1. 若 `B≠∅` 且 `G` 在 `B` 上恒为某色 `c`，则背景为 `UniformResidual(c)`；颜色 `c` 可为 0、8 或任何合法颜色。
2. 若 `B=∅`，则 `NoResidual`；不得从空集臆测一种背景颜色。
3. 若 `B≠∅` 且颜色不统一，则此 `(L, background)` **不能构成单色余像素 Scene 解释**；可以在其他 View/合法对象解释中继续探索，不得修改 Raw Grid 以强制通过。

必须验证 `(object placements + residual)` 逐像素（包括颜色）精确重构原始 Grid，保留 `SceneWitness`：输入颜色、对象像素归属、余像素及其色、冲突/非法、Object 来源与成本。背景不是默认颜色 0，也不能把 Residual 中的 Marker 自动等同“无关背景”。

允许同一输入有多个合法 Scene 假设，用可解释的提取规则、Typed Cost、MDL 和跨案例一致性选择优先级。与 E0 的 `LegacyView/NoBackground/UniformBorderColor/UniqueMostFrequentColor` 兼容，**显式记录它们的假设条件及重构状态**；不偷偷用输出目标来生成新的对象解释。

## 4. E2-C：由真实 Object 诱导的严格 Region 分区树

用户确定的划分定义是“**划分者 Object + 1 个以上余空间 Region**”，**不是必须一刀切成两个**，也不允许任意矩形框按愿望切割。

对父 Region 的精确坐标集 `R`，选择在当前 Scene 解释中可追溯、完整位于 `R` 的一个 `PlacedObject d`，其像素支持为 `D`。按冻结的 4 邻接（若提供 8 邻接需显式作为不同规则/视图，不要混淆）计算：

```text
components = ConnectedComponents4(R \\ D)
Split(R, d) = { SeparatorRegion(D), ContentRegion(C1), ..., ContentRegion(Ck) }
```

要求：

```text
k >= 1
D⊆R;  D≠∅
R = D ⊎ C1 ⊎ ... ⊎ Ck
forall i≠j: Ci∩Cj=∅; Ci∩D=∅
每个 Ci 必须恰为 R\\D 的一个最大 4-连通分支
```

- `k` 由划分者形状与父 Region 决定，**不是固定 2**。如十字 Object 可能分为 4 个内容区域，闭合框有内外两个；`k=1` 在数学上合法，但不产生多个内容区域，默认低优先级或视为 non-separating，不得错误宣传为搜索剪枝。
- Separator 的所有像素由 `SeparatorRegion` 明确承接，不能丢失或同时放到其他 Region。`SeparatorRegion` 可以因 Shape 而不是单连通，但作为一个带角色的子节点；内容区域由最大连通分支构成。
- **不切穿其他普通内容 Object**：对于当前 Tree/Scene 中每个需保持完整、且不等于 `d` 的 PlacedObject，若其像素位于 `R`，必须被某个 `Ci` 整体包含；不能让同一 Object 横跨两个兄弟 ContentRegion，也不能切走 Object 的一部分。如受背景假设影响存在巨大伪 Object，允许改选 Scene/View，不能静默破坏该约束。
- 划分依据必须是实际存在且有 provenance 的 Object，不能根据目标输出画一条匿名边界，不能凭空创建 Separator。共享一个 `d` 的不同 split 解释也必须保留 Witness。
- Scene Root 精确覆盖画布。每个节点记录 `region_id`（候选树内）、`parent_id`、`depth`、`role`（Root/Separator/Content/Leaf）、`pixel_membership`、`bounds`、相对 Frame、所属 Scene/View、生成该节点的 `split_object_id`、`children`、对象所属和关系。
- 每个 Object 的 `OwningRegion` **相对于某一候选 Tree**，取最深完整包含该 Object 的合法节点（需处理其作为 Separator 的情况），不能写死为对象全局不变身份。禁止用偶然的 List 下标进行跨案例对应。
- 记录结构化 `Adjacency`（以像素接触为准，清楚指定邻接定义）与 `SeparatedBy(Ri,Rj,d)`；不能用两个包围盒相邻冒充像素邻接。
- 递归可继续选择 ContentRegion 内的另一个合法 Object 为划分者。停止条件至少包括 `ObjectLeaf`（区域 Mask 恰好等于已放置 Object）、`UniformLeaf`、`NoLegalSeparator/UnsplitLeaf`、`DeferredLeaf`。**不强制所有叶子一定等于 Object，也不允许无限自循环。** 保留每次 split 后像素/候选规模严格下降的终止论证。
- 同一 Scene 允许多种合法 Region Tree；不要因为外延覆盖一致就混为同一解释。

### 惰性展开与“完整递归”两种模式

用户希望 Region 不断递归，最终构成层级、邻接与归属；但为避免爆炸，**正常求解器使用惰性递归**：先索引合法 Separator 与可能的分区，优先 Root/大 Region，未访问的 child 保存 Deferred Frontier，必要时递归细化。提供独立的**有限小场景 eager closure 测试/可视化模式**，可展开所有合法的递归分区，用于证明惰性/完全枚举在固定小宇宙中结果一致。任何预算截断必须有状态而不是假称“无合法划分”。

`PartitionWitness` 必须可由独立检查器使用原始输入、Object 支持集与 4-连通重新计算；反例至少覆盖伪 Separator、不完整覆盖、兄弟重叠、对象被切穿、假连通分支、对象归属错误、邻接伪造、循环以及空 Residual 伪背景。

## 5. E2-D：Region 是整体值、且可作为优先级 0 的 Feature

实现类型化 Region 指称和程序操作，而不只是 UI 展示树：

```text
RegionContent(R)      -- 裁剪/读取此区域在原 Grid 上的精确像素内容与 Frame
RegionBounds(R)
RegionObjects(R)      -- 位于此 Region 的有来源 Set[Object]
RegionDepth(R), Parent(R), Children(R)
RegionAdjacency(R, R'), SeparatedBy(R, R', d)
PreserveRegion(R)     -- 明确的语义/写入范围
CropRegion(R)         -- 复用 Content-first OutputSpec（包括背景/其他颜色）
TranslateRegion(R,dx,dy) / EmitRegion(R) -- 仅在合法坐标/覆盖域有解释器支持时
```

最少让 `PreserveRegion`、`CropRegion` 和一种 Region 整体变换**在正常盲搜索中被实际枚举和执行**，连接旧 `OutputSpec`、Typed 参数/feature 及 Render/Transform Witness，不能只在 oracle-replay 下工作。大 Region/小 Region 的对齐必须有实际像素或结构解释证据，不能用相同下标配对。Input vs Output 比较仅在**训练拟合和 Witness**期间使用输出；推理时所有 Region/动作选择必须只读输入。

**“优先级 0”表示首轮搜索优先尝试大 Region 的简单 Whole-Region 规则，不表示其数值成本是 0，也不表示硬性删掉小 Region 分支。** 跨训练案例共享的 `Preserve`、平移不变、`Crop` 等关系应首先曝光；只有需要时深入 Object/Shape/Pixel。不能把“某训练对输出中该 Region 未变”误当成未知任务上保证保持不变。

## 6. E3-A：跨 View / Region / Feature Goal 的广度优先分层调度

把搜索拆成有唯一标识与可恢复游标的 Goal：`SceneViewGoal`、`PartitionGoal`、`RegionRuleGoal`、`ObjectRuleGoal`、`TypedFeatureGoal`、`CompositionGoal`。优先跨**不同场景解释与区域**尝试简单程序，避免旧型 `一个 Feature Goal 深搜到截断后才换另一个 View`。

建议分层调度（可结合现有 Front / ContentFirst / D 的成本层，但要提供真实的实现与报告）：

| 层 | 候选 | 目标 |
|---|---|---|
| L0 | 所有候选 Scene/View 的 Root 与较大 Region：Preserve/Crop/等值/简单选择 | 最早覆盖正确解释 |
| L1 | 所有 View 下较小 Region 的整体操作、浅 Object Set 规则 | 广度曝光 |
| L2 | Bounds、矩形宽高/位置、颜色/数量等一阶 Typed Feature | 低成本参数 |
| L3 | 差、加减、比较、奇偶、`mod 2` 等简单组合 | 保留常见结构 |
| L4+ | 多步组合、较深 AST、更细 Region 与跨区域关系 | 延迟但不永远饿死 |

要求：

1. **跨 View 公平性**：相同层级的每个有效 View/Partition/Goal 获得有界曝光（round-robin / deficit round-robin / cost-bucket 均可），不能由单 Feature 吞掉全部本轮预算；定义并测试“最低服务份额/无饥饿”约束及例外（全局超时等）。
2. **按 Region 从大到小**：优先面积较大的 Region，但同层成本更低的小 Region 有机会被访问；不能机械把面积最大作为唯一排序。Region 层级深度与 Shape AST 深度要分别记账。
3. **Feature Goal 独立初始预算**：某个 Feature 搜索未得到 Fit 或已耗局部配额时挂起 `Deferred`，其它 View 的低成本 Goal 继续；重新轮到该 Goal 时恢复旧游标，**不能从头重复枚举**、不能称其语法耗尽。
4. **浅表达式优先**：在所有 View 中先覆盖深度 0/1 与简单差、`mod 2` 等；依赖更深程序的正控制也必须最终可到达，不允许硬封死深度。
5. **与冻结基线兼容**：旧 `FrozenE01` 路径保持原样，新的调度器通过显式 config 开关引入。对比新旧时列清楚额外预算、候选宇宙、触发次序。只扩大候选宇宙而不改变调度，不能称为广度调度收益。
6. **搜索终止语义**：`Solved`、`ProvenExhausted(finite universe)`、`BudgetTruncated`、`Deferred`、`Timeout`、`NotApplicable`、`Unknown` 等沿用 D+ 诊断；单一层或单 Goal 的无 fit 不等于 TSL 不可表达。

必须独立记录 `first_view_exposure_work`、每个 Goal 的 allocated/used budget、首次 low-cost program 访问、AST depth、Region depth/area、deferred/resumed 次数、首解及 total work/time、实际 CPU/内存与 Geometry/Witness 计算次数（避免旧 Work 忽略重复几何计算）。**不给出具体的定量改进保证，先用机制实验验证调度确实改变搜索顺序。**

## 7. E3-B：Region 真正提供安全剪枝，但不把空间分区当计算独立

必须实现**至少一种可执行、带证明的剪枝**，并与“只改变排序”分开消融。程序/候选的 region read-set 和 write-set 应在 typed/effect/AST 层明确：

```text
Local         -- 只读/写同一 Region
SharedRule    -- 多 Region 共享同一程序/参数
Selection     -- 先选 Region，再只对选中 Region 构造输出
Aggregation   -- 各 Region 局部计算，后用 ArgMax/Count 等全局汇合
CrossRegion   -- 一个 Region 提供模板/颜色/统计，另一个 Region 被修改
UnknownEffect -- 依赖不明，不安全剪枝
```

示例安全策略（至少实现其中一种并验证有效）：
- 在**明确固定的局部写入型程序骨架**和独立区域读写证明下，将未变 Region 转换为 `Preserve` 约束，只在变化的 Region 展开对应写操作；**仍允许其他 Region 被读取**。
- 在**明确要求多个 Region 共享同一规则**的骨架中，局部候选集求交，避免笛卡尔积；不能将单个训练例的“看起来相同”假定成跨案例语义相等。
- 在可独立证明 `Select` 唯一结果且输出仅依赖被选 Region 的程序分支中，后续仅展开该 Region；有 Aggregation/CrossRegion 时必须保留所需全局读。

**禁止的不安全做法**：看到两个 Region 不相交就判定程序独立；看到某 Region 在训练对中不变就永远不考虑其作源；仅依赖观测上的同值就合并结构不同的程序；因为某选择器当前不唯一就静默取第一个；以任务 ID、test 输出或人工 Oracle 作为正常搜索候选的特权排序信号。

`DependencyWitness` 要记录 read/write scope、局部/全局约束的来源、跳过了哪些候选分支、为何证明对当前固定程序骨架安全；无法证明写 `UnknownEffect`，只做启发式排序不做删除。做可穷举小宇宙差分：`SafePruneOn` 与 `Off` 在**相同已限定语法**下找到的接受程序集合及训练网格行为相同（允许顺序不同），只有有证明的非法/冗余扩展可删；截断时显式区别前缀。

## 8. P0 必须具备的机制任务与负控制

机制任务由生成脚本冻结，至少**每族 3 seeds、每 seed ≥3 train pairs + 另有 heldout**，训练器只看到 train。须有输入变化可区分简单常数/偶合程序，不能让结果靠硬编码任务 ID：

1. `ShellVsPixelPatchwork`：`RectOuter \\ RectInner` 比单像素拼凑具有更低 MDL；与普通矩形覆盖数明显不同；Shape AST 可执行、成本符合排序且合法差/⊎ 可独立检验。
2. `BackgroundByResidual`：背景色非 0（如 8）、颜色 0 真正前景、空 Residual 和多色 Residual 负例；对象精确重建并防退化解释。
3. `CrossSeparatorPartition`：一个十字 separator object 把剩余空间分成 4 个 Content Regions；`k` 不固定为 2，覆盖不交、归属/邻接正确，递归完成。
4. `RingSeparatorPartition`：闭合框 separator，内外两个连通分支；含非矩形/有孔内容，所有像素与原对象不被切穿。
5. `InvalidObjectStraddle`：看似可划分但使另一个内容 Object 横跨两个 child，必须拒绝；还包括不存在 separator、匿名 cut、边界虚构。
6. `RegionPreserveWithLocalEdit`：大 Region 整体保留、一个较小 Region 改变；新调度比对照更早访问简单正确程序，且记录真实可证明的剪枝。
7. `SharedRuleAcrossRegions`：各区共享相同浅规则，局部约束交集比笛卡尔积有效；对不同区实际需不同规则的负例不误剪。
8. `CrossRegionCopyCounterexample`：左 Region 提供 Pattern，右 Region 的 Markers 决定位置；即使不相交，也必须允许从左读、往右写，不能因 Region 局部独立剪掉正确候选。
9. `BreadthBeatsDeepWrongView`：错误 View 可消耗大量 Feature 深搜，正确 View 的深度 1/2 简单程序存在；测试广度调度确实先曝光后者。另做必须深搜的正控制验证无饥饿/Deferred 恢复。
10. `LazyVsEagerFinitePartition`：小 Scene 固定候选宇宙的惰性递归与 eager closure 一致；限制预算时准确记录未展开树，而不是假称耗尽。

每一族至少保存：生成规则、oracle 执行（**仅诊断**）、AST 可枚举性、正常盲搜索 train-exact、heldout-exact、失败原因、关键 Witness、候选排序/曝光和成本。适度增加 Property-based 与反例伪造检查。

## 9. 真实 ARC 定向审计与 400 题实验

### 9.1 先做定向 Oracle Reachability Audit（不允许任务特判）

- `2dc579da`：检查是否存在某个合法 Scene View，使十字分隔线作为真实 Object 形成 `separator + 4 CC`，Region Selection/Crop 是否可执行、可枚举、可访问。人工已知 Oracle 3/3，但正常 Region 搜索能否恢复取决于选择谓词；未实现的选择器要明确 `RepresentationUnavailable`，不能把“有分区树”说成“自动解题”。
- `e50d258f`：检查多色面板能否由合法 separator 分区形成 Region，再评估是否具备 `CountColor` + `ArgMaxUnique`。若没有真实 separator，**不得为了通过案例任意画分界**，标记 `NoLegalSeparator / RegionRuleUnavailable`，保留下一阶段的可选方案。
- `543a7ed5`：主要是构造外框/填孔的 Shape 输出原语缺失，不要把本阶段 MDL Shape 描述误称为已支持对应输出合成。继续作为负控制或限定范围。
- `c909285e`、`0b148d64`：两个已有 Content-first 解做精确回归与 Shape/Region Witness 审计；再抽样旧 20 道解。

分别列出 `OracleExecution`、`Enumerable`、`Reached`、`Accepted`、`BlindSolved` 和具体第一阻塞，不使用人工 Oracle 给搜索器注入优先路径。Region/Shape/Scene 生成规则只依赖输入；训练输出仅用于拟合与验证，test 目标完全禁止使用。

### 9.2 实验消融矩阵（冻结 manifest 和同一二进制）

至少包含以下有效且彼此有实质差异的配置（先机制/定向，再正式 400）：

| 配置 | E2 Scene/Shape/Region | Region-first | 跨 View 广度 | 安全剪枝 |
|---|---|---|---|---|
| `FrozenE01` | 关闭（旧版 E01） | 关闭 | 关闭 | 关闭 |
| `E2Only` | 开启 | 关闭或旧式候选顺序 | 关闭 | 关闭 |
| `RegionPriority` | 开启 | 开启 | 关闭 | 关闭 |
| `BreadthScheduler` | 开启 | 关闭 | 开启 | 关闭 |
| `RegionBreadth` | 开启 | 开启 | 开启 | 关闭 |
| `FullE3` | 开启 | 开启 | 开启 | 开启 |
| `FullE3_NoMDL` | 开启但改为基准固定 cost | 开启 | 开启 | 开启 |
| `FullE3_NoSafePrune` | 开启 | 开启 | 开启 | 关闭 |

若这些配置在实际代码中导致同一候选顺序，请修正对照或如实报告该消融无辨识度，不能只换名字。另做同一有限宇宙的 `LazyVsEager` 和 `PruneOn/Off` 差分，不要求把昂贵 eager closure 跑在全部 400 题上。

正式 400 题：同一 `solver.exe`、版本哈希/源码快照、冻结 400 training manifest、只读 train、等额实际搜索预算与固定 wall/memory 限额；先对 22 道旧解逐题状态、预测 Grid、Program/Cost、SearchWork 做回归。完整 ARC 八配置若资源受限，先完成冻结基线、`E2Only`、`RegionBreadth`、`FullE3` 四组全量，其余做冻结 pilot 并**明确标记不曾跑过 400，不能用 /400 汇报**。不要悄悄增加预算或替换 baseline 后沿用旧解数。

必须报告：train-exact、Solve@60s 与 Solve@300s（或实际固定窗口）、timeout、崩溃重跑与原始记录、旧解丢失、新解 ID 与选中 AST、每题 first-solution/total SearchWork、实际搜索秒数、RTS 内存；新指标至少包括 Scene hypotheses、MDL costs 与实际使用、split 候选数/合法数/k 分布、树深/叶类型、已展开/Deferred 树数、Region program exposures、每 Goal 消耗、首次简单正确 View 的曝光、Region/Breadth/Prune 对候选数量的影响、pruning proofs、Geometry/Scene/Partition/Dependency Witness 验证成本。跨配置只对**共同完成题**比较成对成本，超时/崩溃缺失值保持 null。

注意：`FullE3` 不强制获得 >22/400；即使无新增解，也要以可核验的机制与搜索路径证据回答“为什么”。**Stage E0–E1 旧报告中异常退出未定位的事实要保留**；运行器应捕获最后检查点、退出码、stderr、操作系统信息，并支持冻结二进制原样恢复。不要凭机器负载猜测退出原因。

## 10. 实现/验收边界和禁止事项

### 必须保证

- 旧 E0–E1/Content-first 路径功能和配置保持完整，FrozenE01 的 22 解不丢。新功能以显式开关启用；如果共享数据类型发生变更，做语义等价迁移测试。
- Shape DSL（`Rect`/无交并/差）**实际执行和影响 MDL**；Scene 的单色余像素**可独立重放**；Region Tree **严格覆盖、不交、有一个实际 Separator Object**；Region-first Program **实际进入正常搜索**；Breadth Scheduler **真实跨 View/Goal 分配预算**；安全剪枝**带 Effect/Dependency 证明**。
- B 的 `CaseAgree`、Typed 参数的观察一致性、Shape 的 Mask 相等，不自动升级为全域语义等价；VSA 可做共享，但不抹除异构候选/尚未证实的指称。
- 严格区分 Shape 最少矩形覆盖、Shape AST MDL、Region 树结构成本与 Program 搜索成本；不能将任一未证明的局部最优冒充全局最优。
- Set→List 只能用于具有明确且记录在 Witness 中的排序/匹配依据的操作，不允许把集合遍历顺序冒充 Object role 或 Region correspondence。
- 反事实/Property 测试覆盖输入平移、颜色置换、Object 顺序置换、同成本多 AST、变背景色、Separator 形状变化、Marker 移动、双来源跨 Region 复制。
- 新日志接入已有 `trace_io.py`/HTML，可看 Shape AST、Scene 余像素、分区树/邻接、Region 大小与深度、依赖图、逐层候选搜索/恢复/剪枝的证明，离线可重放且可独立核验。

### 本轮不做

- 不训练或重新接入 Recognition Model；可输出以后 Wake–Sleep 学习 View/Region prior 的结构化训练记录。
- 不实现任意像素集合匿名分区、全类型 e-graph、任意 Region 之间无限组合、无界深度、目标输出泄漏或按 ARC task ID 硬编码特殊规则。
- 不把 `e50d258f` 的多色面板和 `543a7ed5` 的填孔构造要求强制纳入本阶段；可以实现通用原语作为有证据的 P1，但必须单独消融和文档化。
- 不以增加预算、随机 seed、过拟合单对输入输出或手工 Oracle 注入来伪装正式训练求解进展。

## 11. 推荐实施顺序（每一阶段先测试再向后）

1. **源码/性能审计**：现有 E1 Shape cover/Geometry Witness 缓存、Scene View 与 Content-first AST、D+ Search Goal/Deferred/trace、版本与运行器；冻结 E01 对照。
2. **Shape MDL**：可执行 AST、精确 Witness、bounded 最优状态、成本与退化解释负例，复用 E1 cover 的精确 Mask 缓存但不混淆两种“最小”。
3. **Scene Reconstruction**：已放置对象+单色余像素的重建，含 NoResidual、非零背景、0 前景与多色余像素拒绝；旧 View 兼容。
4. **Region Partition Tree**：由对象诱导的 split/k CC、不交完整覆盖、归属/邻接、带预算的惰性递归与有限 eager closure 差分。
5. **Region AST/Content-first Integration**：整体 Region 操作实际执行；训练 IO 的显式对应/变换 Witness。
6. **Breadth Scheduler**：分层公平调度、局部预算与恢复、跨 View 机制对照。
7. **Safe Pruning**：Effect/DependencyWitness 与负控制，完成 fixed-universe 差分。
8. **机制测试与两个真实失败任务 Oracle Audit**；补齐长时 B 套件、运行器异常诊断。
9. **400 ARC train-only 消融**：冻结同一二进制/数据，报告可重算的逐题指标和失败分类。

## 12. 最终交付物

- `docs/LATIS_STAGE_E2_E3_AUDIT.md`：源码事实审计与真实改动点。
- `docs/LATIS_STAGE_E2_E3.md`：形式语义、类型、成本函数、Region 分区证明、依赖作用域、调度伪代码与限制。
- `docs/LATIS_STAGE_E2_E3_REPORT.md`：机制实验、Oracle 差距、400 题消融、成本/内存、已解决/未解决和下一步建议。
- `scripts/run_stage_e2_e3.ps1`、`scripts/report_stage_e2_e3.py`，版本锁定、raw per-task JSON、搜索事件、统计 CSV/JSON、机制与独立验证日志、选中 AST、反事实/negative control，以及 HTML trace。原始记录不可静默覆盖，失败/重跑的历史保留。
- 通过的 Haskell 单元/性质/差分测试，独立 Python Witness/Grid 重放；对所有未完成项给出明确 P0/P1/未做状态，不能仅凭文件存在宣布验收。

### 最终回答必须逐项说明的七个问题

1. Shape 的 `Rect / ⊎ / \\` 能否精确执行？最小矩形数与最小 Shape AST 成本是否区分，并能证明哪些是最优、哪些只是 bounded？
2. Scene 的 `(Object,Position)` 与单色余像素解释是否逐像素重建正确？背景 0 的硬编码是否仍在新分支中偷偷出现？
3. 是否由**实际 Object**产生 `Separator + k CC`，并证明父子覆盖、兄弟不交、不切穿其他 Object、对象所属、邻接与递归终止？
4. Region 的 `Preserve/Crop/Translate` 是否作为**整体程序**被盲搜索真实访问，而不只是构造出来展示？
5. 大 Region、简单程序、跨 View 的**广度搜索**是否比单 Goal 深搜更早曝光有用候选？Deferred 是否能够恢复且不重复消耗预算？
6. 剪枝是否真的减少执行的候选数，并有 DependencyWitness 证明不删除正确的跨区域程序？
7. 相比冻结 **22/400**，train-exact、首解成本、总 Work/耗时、内存有何变化？失败主要是表示缺失、触发不到、预算还是调度？所有数字能否从原始数据复算？

**不要先给计划后停止：完成本轮 P0 的实际代码、测试、机制实验与正式对照；如时间/算力受限，优先保证语义/Witness 的严格性、Region 程序真实进入搜索及调度/剪枝差分，明确尚未运行的 ARC 组合，不伪造结论。**
