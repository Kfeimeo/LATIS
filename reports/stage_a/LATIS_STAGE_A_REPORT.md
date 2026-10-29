# LATIS 阶段 A 实验报告：Grid Size Feature + Typed N-ary Feature Synthesis + ML Parity

设计与复现见 `docs/LATIS_STAGE_A.md`。本报告只陈述已运行的实验；所有数字来自 `results/stage_a/`（`validation/`、`mechanism/`、`arc/`、`metrics.csv`、`per_task.csv`）。

## 1. 环境与版本

| 项 | 值 |
|---|---|
| 编译器 | GHC 9.10.3（`-O2 -fno-omit-yields` 应用；`-O1` 测试） |
| git HEAD | `d7fb0bb513255a0dbbb58a6730c6abdaf14cf6d6`；工作区 diff 哈希 `dcc6ae7cc0cc3d3c846e2bfa5a318598187c52a03fc1e532fa1fa56485c0de5f`（`results/stage_a/arc/code_version.json`，含 `git status --porcelain`） |
| 二进制 | `build/latis-stage-a.exe`，SHA256 `97d8a733a6cfb11239fa4a1d1291f2f3cde6c16992510d8f84d81821b81203ad` |
| 数据 | 官方 ARC-AGI-1 `training` 400 题（`data/arc1-training/`），组合 SHA256 `fda04e2284cf637ebf1d8dd931813ebd4dd3adeba5bf79e5d68e3fa2ee25695b`，与 v0.6.1 实验逐字节相同（`data_check.identical_data = true`） |
| 隔离 | 与 v0.6.1 相同：求解器只接收 `train_only/<id>.json`（`test: []`），含 test 对的文件被二进制拒绝（exit 3）；一任务一配置一进程；进程内墙钟 60 s + 30 s 硬杀；RTS `-M4g -T` |
| 预算（事先固定） | v0.6.1 默认：`alignmentBudget=400`、`scalarBudget=2000`、`synthesisDepth=2`、`synthesisCostBound=5`；阶段 A：`saHoleDepth=2`、`saMaxHoles=2`、`saHoleBudget=60000`（每目标）、`saTotalHoleBudget=1 200 000`（每次运行的 object-slot typed 搜索总量）、`saConstantDomain=[-4..4]`。smoke（8 题）后固定，全量前不再调整 |
| 并行 | 6 个任务进程并行；全量 400×7 墙钟 301 s |

## 2. 测试与回归（`results/stage_a/validation/`）

| 套件 | 结果 |
|---|---|
| `test/StageAMain.hs`（阶段 A：ML 语义、typed 枚举性质、Size/realization、机制任务正/负控制、不变量、v0.6.1 任务回归） | 304 个断言全部通过（12 s） |
| `CollectionV61`、`CollectionV6`、`Collection`、`Triggered`、`InducedR2`、`FeaturePipeline`（既有套件，对最终源码重编重跑） | 全部通过（exit 0） |
| v0.6.1 任务（A–H、P-gridleft/P-currentx、03560426）× 7 配置（`mechanism/regression_v061.csv`） | 77 行中程序体与预测均与 BaselineV061 相同；train/heldout exact 不变（P-currentx 的 heldout 在所有配置下均为 False，与 v0.6.1 一致：不可识别对） |
| BaselineV061 配置 vs v0.6.1 原始运行（`metrics.json.per_config.BaselineV061.same_as_v061`） | 400/400 status 相同，400/400 程序相同（仅多出 `progSize = Nothing` 字段） |

阶段 A 单元/性质测试覆盖：`mod` 的 Haskell 符号语义（`(-3) mod 2 = 1`、`3 mod (-2) = -1`）、除零显式失败；`isOdd` 负奇数为 True，与 `mod 2 == 1` 在 [-20,20] 一致；typed registry 拒绝错类型应用；`Sub(A,B)` 与 `Sub(B,A)` 分别实例化；拟合常数由方程解出并跨案例共享、逐案例不同的偏移被拒绝；两 hole 联合拟合 `2A+1`；Feature-first（恒等目标的第一个 fit 是叶子，`Add(A,0)` 不出现）；`FeatureOnly`/`ConstantOnly` 策略；预算截断被报告；枚举确定性；常数与 coincident feature 同时保留；`If(IsOdd(A),B,A)`、`Mod(A,3)` 可达；画布不变时恒等 size rule、`outputSize` 只读输入、非正/超 30 尺寸拒绝；缩小画布导致越界是显式失败而非裁剪；不同尺寸规则确实改变构造出的画布；置换不敏感；确定性；无 concrete 高层边、无 untriggered 展开。

## 3. 机制任务（`results/stage_a/mechanism/mechanism_metrics.csv`，每族 3 个种子实例，heldout 只用于打分）

| 族 | Baseline | GridSizeOnly | TypedNaryOnly | FullA | NoFeatureArg | NoConstantArg | FullA−Parity |
|---|---|---|---|---|---|---|---|
| SizeScale `(2W,2H)` | 0/3 (layout) | 3/3, held 3 | 0/3 (layout) | 3/3, held 3 | 3/3, held 3 | 3/3, held 3 | 3/3, held 3 |
| SizeOffset `(W+3,H+1)` | 0/3 | 0/3 (size_rule) | 0/3 | 3/3, held 3 | 3/3, held 3 | 0/3 (size_rule) | 3/3, held 3 |
| SizeFromFeature `(W+Count,H)` | 0/3 | 3/3, held 3 | 0/3 | 3/3, held 3 | 1/3, held 0 | 3/3, held 3 | 3/3, held 3 |
| TwoHoles `(2W+1, H−Count)` | 0/3 | 0/3 (size_rule) | 0/3 | 3/3, held 3 | 1/3, held 0 | 0/3 (size_rule) | 3/3, held 3 |
| ParityMod `(W+(W mod 3),H)` | 0/3 | 0/3 | 0/3 | 3/3, held 3 | 0/3 | 0/3 | 0/3 (size_rule) |
| ParityIf `(W, isOdd W ? H : W)` | 0/3 | 0/3 | 0/3 | 3/3, held 3 | 0/3 | 3/3, held 3 | 0/3 (size_rule) |
| CardinalityMismatchStillBlocked | 0/3 (layout) | 0/3 (size_rule：固定模板不表达 W+2) | 0/3 (layout) | 0/3 (cardinality) | 0/3 (cardinality) | 0/3 (size_rule) | 0/3 (cardinality) |
| CounterexampleConstantTruth | 0/3 | 3/3, held 0 | 0/3 | 3/3, held 0 | 3/3, held 3 | 3/3, held 0 | 3/3, held 0 |
| CounterexampleFeatureTruth | 0/3 | 3/3, held 3 | 0/3 | 3/3, held 3 | 3/3, held 0 | 3/3, held 3 | 3/3, held 3 |

结论：
- Size2 规则真正控制网格构造：缩放、不同轴偏移、尺寸依赖 ObjectCount、两 hole 联合拟合、`mod`/`isOdd` 全部在 FullA 下 train-exact 且 heldout-exact；TypedNaryOnly 保持固定画布守卫（`layout:`），Baseline 与 v0.6.1 相同。
- 消融按设计分离：GridSizeOnly（固定模板）解 SizeScale（`W+W`）与 SizeFromFeature（`W+Count`）而解不了 W+3、2W+1、parity；NoConstantArg 解不了需要非 ±1 常数的 SizeOffset；NoFeatureArg 对 SizeFromFeature/TwoHoles 在 1/3 实例上找到了只含一个 feature 的巧合表达式（例如 `Sub(13, Mod(Count,3))`）——这是有界 typed 搜索的真实行为，报告为观察值而非断言；FullAMinusParity 解不了 ParityMod/ParityIf（无 Mod/If）。
- CardinalityMismatchStillBlocked：size rule 拟合（`size_rule_exact=1`）但对齐路径仍以 `RankAlign: unequal input/output cardinality` 拒绝；canvas 支持未被误报为解决对象增删。
- Counterexample 对：训练网格完全相同（Count≡2，`W+2 ≡ W+Count`）。两个候选 `Add(GridWidth,2)` 与 `Add(GridWidth,CountObjects)` 都在 width class 中保留并可审计；prior 选择无字面量的 feature 版本（cost 3 < 7），因此 FeatureTruth 的 heldout 正确、ConstantTruth 的 heldout 错误（NoFeatureArg 相反）。prior 没有、也不能从训练识别唯一真解；两个任务给出相同的程序。

## 4. 真实 ARC-AGI-1 training 400 题 train-only 消融（`results/stage_a/arc/summary.md`、`metrics.json`、`audit.json`）

### 4.1 端到端（分母 = 400）

| 配置 | Feature train-exact | fallback | no_solution / unsupported / timeout / runtime_error | canvas 变化进入搜索 | SizeRule-exact（138 个 canvas 变化任务中） | Grid realization ok（任务数） | typed-hole 触发任务 / 评估总数 | 新增 train-exact（相对 v0.6.1 Feature） | 丢失 | search_work 总 / 中位 / 最大 | 墙钟 总 / 中位 / 最大 | 峰值 `max_live_bytes` |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| BaselineV061 | 3/400 = 0.75% | 397 | 259 / 138 / 0 / 0 | 0/138 | 0 | 10 | 0 / 0 | — | — | 4 599 091 / 0 / 794 039 | 42.3 s / 0.001 s / 7.1 s | 121 MB |
| GridSizeOnly | 3/400 = 0.75% | 397 | 397 / 0 / 0 / 0 | 138/138 | 70 | 11 | 0 / 0 | — | — | 6 191 296 / 70 / 1 243 024 | 63.4 s / 0.002 s / 18.2 s | 388 MB |
| TypedNaryOnly | 5/400 = 1.25% | 395 | 257 / 138 / 0 / 0 | 0/138 | 0 | 13 | 23 / 20 970 652 | 05f2a901, 5521c0d9 | — | 25 233 692 / 0 / 2 059 263 | 106.1 s / 0.001 s / 11.4 s | 201 MB |
| **FullA** | **7/400 = 1.75%** | 393 | 393 / 0 / 0 / 0 | 138/138 | **107** | 20 | 33 / 32 762 481 | 05f2a901, 1cf80156, 5521c0d9, 681b3aeb | — | 64 391 739 / 61 520 / 2 126 739 | 453.9 s / 0.417 s / 28.2 s | 383 MB |
| NoFeatureArg | 6/400 = 1.50% | 394 | 394 / 0 / 0 / 0 | 138/138 | 102 | 15 | 30 / 27 505 752 | 1cf80156, 5521c0d9, 681b3aeb | — | 45 454 248 / 27 612 / 2 083 289 | 218.1 s / 0.131 s / 15.9 s | 383 MB |
| NoConstantArg | 5/400 = 1.25% | 395 | 395 / 0 / 0 / 0 | 138/138 | 61 | 18 | 28 / 25 756 991 | 05f2a901, 5521c0d9 | — | 34 006 428 / 5 254 / 2 031 365 | 169.9 s / 0.061 s / 9.9 s | 391 MB |
| FullAMinusParity | 6/400 = 1.50% | 394 | 394 / 0 / 0 / 0 | 138/138 | 99 | 17 | 30 / 28 969 450 | 05f2a901, 5521c0d9, 681b3aeb | — | 43 901 376 / 20 844 / 2 082 779 | 238.9 s / 0.152 s / 11.3 s | 377 MB |

口径：`train_exact` = 返回的程序由 `ARC.ArcTrainOnly` 在每个 train 输入上重新执行并逐格一致；`unsupported` = 接口前提拒绝（`layout:`/`grounding:`），开启 grid size 后不再出现；`size:` 失败计 `no_solution`；`Grid realization ok` = 至少一次 realization 尝试在所有训练输入上渲染成功（与整格 exact 分开统计）；峰值内存 = RTS `max_live_bytes` 进程级最大值（`+RTS -T`），不是逐搜索峰值；timeout 与 hard-kill 均为 0。

**三类事实分开报告（FullA）**：SizeFeature 能拟合目标 107/138（canvas 变化任务）+ 262/262（canvas 不变任务，恒等）；Grid Realization 成功 20 任务；整体 Grid train-exact 7 任务。能预测大小不等于解题。

**SizeRule-exact 任务数**：FullA 369/400（107 canvas 变化 + 262 恒等）；GridSizeOnly 332/400；**完整 Program-exact**：7/400。

**从 `canvas mismatch` 类别转成“进入搜索”的任务数**：138/138（所有开启 grid size 的配置）。FullA 下这 138 题的去向：91 → `RankAlign: unequal input/output cardinality`，31 → `size:`（无统一尺寸表达式），8 → `feature transformation`，3 → `alignment validation`，2 → `grid_realization`（`Object lies outside canvas`），1 → `grid_exact_check`，2 → train-exact（1cf80156、681b3aeb）。

**候选/typed-hole 展开数**：FullA 全量 `typed_hole_evaluations` 32 762 481，`typed_hole_templates` 见 `per_task.csv`；20 个任务触及全局 typed 预算（1 200 000），546 次每目标截断（60 000）；size rule 在 138 个 canvas 变化任务上各枚举 4321 个模板（`size:` 失败字符串记录了模板数与评估数）。

**R2**：本轮未重跑。FullA 的 393 个回退任务按 v0.6.1 的 R2 记录：2 个 R2 train-exact（aabf363d、d23f8c26）、63 个 R2 timeout、328 个 no_solution。若沿用这些记录，pipeline train-exact 为 7 + 2 = 9/400（v0.6.1：8/400）；不声称新的端到端恢复率。

### 4.2 新增的 4 个 Feature train-exact 任务

| 任务 | v0.6.1 Feature | v0.6.1 R2 | FullA 程序要点 | 工作量 / 墙钟 |
|---|---|---|---|---|
| 05f2a901（画布不变，2 对象） | `no uniform following-AX scalar expression` | train-exact | typed slots：`first-AX = If(IsOdd(ExtX),ExtX,PosX)`、`first-AY = PosY·PosY·PosY`、`following-AY = If(IsOdd(ExtY),ExtY,PosY)`（TypedNaryOnly 给出另一组：`following-AX = PosX+PrevX−3`） | 1 147 525 / 4.4 s |
| 1cf80156（12×h → 裁剪到对象包围盒） | `layout:` | train-exact | `Size2(width=Sub(5,Mod(GridHeight,3)), height=Add(3,Mod(GridHeight,3)))`，对象放到 `(SceneLow,SceneLow)`；宽/高 class 各 2/4 个 representatives | 58 967 / 0.27 s |
| 5521c0d9（15×15，3 对象） | `no uniform first-AY scalar expression` | **timeout** | `shared-AY = Sub(PosY, ExtY)`（对象上移自身高度）；class 20 个 representatives | 125 468 / 1.3 s |
| 681b3aeb（10×10 → 3×3，2 对象拼合） | `layout:` | train-exact | `Size2(width=3,height=3)`（常数尺寸），`first-AY = Sub(3,ExtY)`、`following-AX = Mod(SetMinX,PosX)` | 425 019 / 2.5 s |

这些是 **train-exact**，不是正确性判定：05f2a901 的 `If(IsOdd(ExtX),…)`、681b3aeb 的 `Mod(SetMinX,PosX)` 和 1cf80156 的 `Mod(GridHeight,3)` 都是在 3 个训练对上成立的有界搜索巧合表达式，本轮不评估 test 泛化。5521c0d9 是 v0.6.1 pipeline（Feature + R2）未解出的唯一新任务。

另一个变化：beb8660c（v0.6.1 已解）在 FullA 下得到不同的程序体——`first-AY = Sub(GridHeight(Input), CountObjects)` 替代了 v0.6.1 的 grammar 解（typed 搜索在更早的一个 alignment 候选上打开并成功，使该候选先于 v0.6.1 的候选完成）。两者都 train-exact；对合成 v0.6.1 任务（A–H/P/03560426）程序体全部相同，但在真实任务上 FullA 与 Baseline 的程序不保证逐字相同。

### 4.3 为什么 size 规则可匹配却生成不了完整解（具体样例）

| 环节 | 数量（FullA，138 canvas 变化任务） | 样例 |
|---|---|---|
| 对象数不等（`RankAlign`） | 91 | 007bbfb7（3×3→9×9，size rule `W·W, H·H` 正确，但输出对象数是输入的若干倍）；017c7c7b（3×6→3×9，size rule 拟合为 `W+H`——与真相 `H+3` 在训练上巧合）；1fad071e（`W−4, 1`，输出是统计条） |
| 无统一尺寸表达式（`size:`） | 31 | 0b148d64（21×21/19×18/17×19 → 10×10/9×7/6×9：输出是某个对象的包围盒，不是 grid 级特征的函数）；469497ad（5×5 → 10/15/20：倍数 = 颜色数，不在叶子中）；91413438（3×3 → 12/15/9/18：倍数 = 像素数）；1190e5a7、23b5c85d、8731374e 同类——需要对象/像素级特征（下阶段） |
| 对齐验证 | 3 | 4522001f（`W·W`）、995c5fa3（`Count, Count`）、ff28f65a：颜色观察不一致 |
| 变换 | 8 | 49d1d64f、7468f01a（`Add(5,Mod(W,4))` 巧合拟合）、ac0a08a4（`W·Count, H·Count` 正确的平铺尺寸，但对象位置需要按画布比例缩放，sequence-local body 不可表达） |
| Grid realization（越界） | 2 | d0f5fe59（size rule `Count, Count` 正确——对角线长度 = 对象数——但对象保持原位置落在 Count×Count 画布外）；eb5a1d5d |
| 整格 exact 失败 | 1 | c59eb873（2× 放大：`W+W, H+H` 正确，对象放置后像素不匹配——需要对象放大） |

总结：在 138 个 canvas 变化任务中，size 规则在 107 个上可拟合（其中相当一部分是巧合表达式，如 `W+H`、`Sub(CountShapes, Mod(Count,Shapes))`），但完整解只有 2 个。主要瓶颈仍是 (a) 对象数变化（91/138，与 v0.6.1 同一瓶颈，本轮不处理），(b) 输出尺寸由对象/像素级特征决定（31/138），(c) 对象变换表达力（位置缩放、对象放大/平铺）。Size feature 把 138 个 `layout` 拒绝转化为可定位的失败环节，这是本阶段的实际贡献。

### 4.4 Typed N-ary 搜索在 canvas 不变任务上的效果

TypedNaryOnly（固定画布路径）：3 → 5 train-exact；typed 搜索在 23 个任务上触发（v0.6.1 因 `feature transformation` 失败的 19 题中触发者，以及部分 alignment 候选上的 grammar 失败）。失败环节分布与 Baseline 相比只在 `transformation` 一栏变化（19 → 17，即 05f2a901、5521c0d9 被解出）；`grid_exact_check` 7、`grid_realization` 2（74dd1130、85c4e7cd，与 Baseline 相同：v0.6.1 把它们计在 `realization: final grid exact check failed` 的 9 题里，本轮把越界渲染单独计数）。其余触发 typed 搜索的任务要么在该 alignment 候选上仍无 fit，要么 typed fit 在整格 exact 检查失败后继续到下一候选，最终失败环节不变。FullA 下 typed 搜索在 20 个任务上触及全局预算；失败字符串明确标注 `typed hole search skipped: global typed budget exhausted`。

### 4.5 消融结论

- GridSizeOnly 没有新增 train-exact：固定模板拟合 70/138 的尺寸，但 cardinality/表达力瓶颈不变。
- TypedNaryOnly 新增 2（05f2a901、5521c0d9），均为 canvas 不变任务上的 slot 表达式。
- FullA = GridSize + Typed + parity：新增 4；两个 canvas 变化任务（1cf80156、681b3aeb）需要 size rule 与 typed/常数拟合同时存在：1cf80156 的 size rule 用到 `Mod`（FullAMinusParity 解不出它），681b3aeb 的常数尺寸需要 fitted constant（NoConstantArg 解不出它）。
- NoFeatureArg（额外参数只允许常数）丢掉 05f2a901（其 typed 表达式需要两个 feature 参数）；NoConstantArg 丢掉 1cf80156、681b3aeb（需要常数）且 size-rule-exact 降到 61/138。
- 代价：FullA 的 search_work 总量是 Baseline 的 14 倍，墙钟 454 s vs 42 s（400 题），中位数 0.42 s；峰值 live heap 383 MB（最大的是 d0f5fe59，size rule representatives 类非常大）。

## 5. 验收标准对照

1. Width/Height/Size 在输入侧与训练目标侧 grounding（`GridWidth/GridHeight/GridSize(Input)` Feature + `GridSize(Output)` 目标 Feature），合成尺寸控制网格构造：机制任务 SizeScale/SizeOffset/SizeFromFeature/TwoHoles/ParityMod/ParityIf 全部 train-exact；真实任务 1cf80156、681b3aeb 由非恒等 size rule 构造输出。**达成**。
2. 通用 Typed Hole 搜索支持 ≥2 个额外参数（`If` 三元、两 hole 联合）、Feature-first 与 fitted-constant 两种绑定，生成并执行完整 TSL 表达式（`Typed` 进入 Body，`Size2` 进入 Program），provenance/witness 可追踪（`cBindings`、`srWitness`、Feature provenance、`hole_bindings` JSON）。**达成**。
3. `mod`/`isOdd` 在 evaluator（`Language.ML`）、registry（`Language.Schema`、`TOp`）与测试中可用，除零与负数语义明确并有测试。**达成**。
4. 合成任务与旧回归不破坏既有 legality/invariants（7 套测试通过；v0.6.1 程序体在 A–H/P/03560426 上相同；BaselineV061 与 v0.6.1 的 400 题结果逐任务相同）；真实 ARC 400 题 train-only 评估完成并如实报告。**达成**。
5. train-exact 由 3/400 升到 7/400；size 规则可匹配但不能生成完整解的原因与具体样例见 §4.3。**达成（不承诺泛化正确性）**。

## 6. 限制与未实现

- 不评估 test 泛化；train-exact 的 typed 表达式（`If(IsOdd(ExtX),…)`、`Mod(SetMinX,PosX)` 等）多为有界搜索下的巧合解，classes 很大（size rule 上千 representatives）。prior（长度 + 4×常数 + 枚举序 + parity 算子后置）只是确定性选择，不是正确性判断。
- 常数域 `[-4..4]`、深度 2、每模板 ≤2 hole、spine 形复合、交换律与恒等/`x−x` 规范化、Mod 除数 ≥2 是本轮的可配置上界，不是完备性声明；全局 typed 预算在 20 个任务上截断。
- 未实现：object count-changing transformations（91/138 canvas 变化任务 + 198 canvas 不变任务的 cardinality 瓶颈）、shape 代数、对象/像素级尺寸特征（31/138 `size:` 失败）、位置随画布缩放的变换、typed 表达式的 online abstraction、E-graph/VSA 重构、并行化、Branch-and-Bound。
- R2 未重跑；pipeline 数字沿用 v0.6.1 的 R2 记录并如此标注。
- 峰值内存为 RTS 进程级 `max_live_bytes`，非逐搜索峰值。

## 7. 交付物清单

- 模块：`src/Synthesis/Collection/Typed.hs`、`src/Synthesis/Collection/Size.hs`、`src/ARC/StageAEvaluate.hs`；修改：`src/Language/ML.hs`、`src/Language/Schema.hs`、`src/Synthesis/Collection/{Counterfactual,Online,Indexed,Front}.hs`、`src/ARC/ArcTrainOnly.hs`、`app/Main.hs`、`latis.cabal`、`test/CollectionV6Main.hs`。
- 测试：`test/StageAMain.hs`（套件 `stage-a-tests`）、`test/DebugStageA.hs`（调试工具）。
- 脚本：`scripts/arc_stage_a.py`、`scripts/run_stage_a.ps1`。
- 结果：`results/stage_a/metrics.csv`、`results/stage_a/per_task.csv`（400×7 行）、`results/stage_a/arc/{metrics.json,audit.json,summary.md,data_manifest.json,code_version.json,run_meta.json,tasks/<id>/stage-a-<Config>.json}`、`results/stage_a/mechanism/`（每实例每配置 JSON + derivation graph、`mechanism_metrics.csv`、`regression_v061.csv`）、`results/stage_a/arc_smoke/`、`results/stage_a/validation/`（编译与测试日志）。
- 文档：`docs/LATIS_STAGE_A.md`（架构、类型签名、算子语义、触发规则、复现）、本报告。
