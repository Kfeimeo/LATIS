# LATIS Stage E0–E1 报告：机制矩阵、ARC 消融、三题 Oracle 可达性

run_id `e01-20261027-main`，目录 `results/stage_e01/e01-20261027-main/`（solver.exe 与源码快照哈希见 `code_version.json`；数据 manifest 与 `results/content_first/cf-20261026-main` 相同：官方 ARC-AGI-1 training 400 题 train-only 副本，test 对从不进入求解器）。设计见 [LATIS_STAGE_E0_E1.md](LATIS_STAGE_E0_E1.md)，审计见 [LATIS_STAGE_E0_E1_AUDIT.md](LATIS_STAGE_E0_E1_AUDIT.md)。表中数字由 `scripts/report_stage_e01.py` 从原始记录重算（`report_digest.md/json`）。

## 1. 验证套件（`validation/`，退出码均为 0）

| 套件 | 内容 |
|---|---|
| Geometry（新，337 条断言）| 12 个形状族 + 40 个随机 PixelSet 的覆盖合法性（每矩形 ⊆ S、union = S）、小掩码（≤ 9 像素）与**独立暴力参考解**的最小矩形数一致、下/上界、空集 `EmptyCover/EmptyBounds`、孔洞不被覆盖、平移/像素顺序稳定、楼梯形两种最优覆盖与 canonical、plus 形唯一最优、节点预算与面积预算截断只返回 `Bounded`；Abs/Rel/Norm 坐标帧与推导角点；四种背景视图（非零背景 8、颜色 0 前景、NoBackground、平局/非均匀边框显式拒绝、棋盘格）、LegacyView 逐像素逐 ID 等于旧编码器、Residual 含 marker；0↔8 颜色置换下 NoBackground 几何不变而 UniformBorderColor 的背景决定按定义改变并被报告；`GeoRectCount` 只接受已证明最小；GeometryWitness 独立重放与 8 种伪造（增/删像素、bounds、矩形、状态、帧、哈希）全部拒绝；关系原型可核验；plan 宇宙在双开关关闭时与上一轮逐项相同；5 族 × 3 seed × 4 配置的正/负控制、确定性与置换不变、CrossCaseWitness；FrozenCF == ContentFirstOnly |
| ContentFirst（340 条）、StageD、StageDFull、StageDControl、StageDPlus、StageC、StageA | 全部通过（`Program/ContentFirstPlan` 新字段后的回归）|

## 2. 机制矩阵（每格 = 3 seed 中 train-exact / heldout-exact；heldout 只评分）

| 家族 | FrozenCF | BackgroundViewsOnly | GeometryFeaturesOnly | FullE01 |
|---|---|---|---|---|
| NonZeroBackgroundCrop | 0/0 | 3/3 | 0/0 | 3/3 |
| ZeroIsForeground | 0/0 | 3/3 | 0/0 | 3/3 |
| MultiRectCoverAmbiguity | 0/0 | 0/0 | 3/3 | 3/3 |
| GeometryDeterminedSize | 0/0 | 0/0 | 3/3 | 3/3 |
| ResidualMarkerNegative | 0/0 | 3/3 | 0/0 | 3/3 |

- 所有负控制都是**实测**：FrozenCF 在 15 个实例全部无解，且 `geo_views_created = geo_feature_evaluations = 0`；设计上背景族用整高分隔条把旧编码器的"背景对象"切成面积相等的两半（IsMaxArea 平局）、每种颜色恰好两个对象（颜色频率平局）、形状不贴边框（无背景口袋），因此旧 selector 没有一个能唯一选中前景集合。
- **E0 被真实执行**：三个背景族的 FullE01 解都选中 `BackgroundView(UniqueMostFrequentColor)`（背景色逐 case 不同，均非 0），`NonEmptySet(Objects(Input))+CropInputWindow`；ZeroIsForeground 的选中窗口内含颜色 0 的前景对象；ResidualMarkerNegative 中所有视图下的 `NonEmptySet(Objects)` 计划在每个 case 失败（marker 在残差里，不是背景），解为 `NonEmptySet(Not(Area == unique min))`，provenance 记录了残差。
- **E1 被真实执行**：MultiRectCoverAmbiguity 与 GeometryDeterminedSize 的解都通过 `Unique(Select(MinimalRectangleCount(Shape) == k (proven)))` 选中（k=3 的楼梯形、k=3 的 U 形），`geo_feature_evaluations = 384`、`geo_cover_proven = 4`；楼梯形的 witness 记录 canonical 与 1 个备选最优覆盖（`alternatives_complete = true`）；GeometryDeterminedSize 的输出尺寸 3×3 来自选中对象的 bounds，Crop 与 Emit 在空窗口上都 train-exact 并作为代表保留。
- 区分四种状态：Oracle 直接执行（测试中的手写 plan）、候选可枚举（FullE01 宇宙包含该 plan）、盲搜索 train-exact（上表）、heldout-exact（上表第二个数）。

## 3. ARC 400 train-only 消融（同一 solver.exe、manifest、A/B/C/D 预算，4 workers，300 s）

| 配置 | 覆盖 | train-exact | timeout | 新增 vs FrozenCF | 丢失 | 配对 SearchWork（共同完成 400 题）| 配对搜索秒 | 视图实例化（case×view / 不适用）| 几何谓词评估 | 选中成员覆盖 proven/bounded | RTS 峰值 live |
|---|---|---|---|---|---|---|---|---|---|---|---|
| FrozenCF | 400 | **22** | 0 | — | — | 97,041,468 | 1725.5 | 0 / 0 | 0 | 0 / 0 | 387 MB |
| BackgroundViewsOnly | 400 | 22 | 0 | 0 | 0 | 97,476,263（+0.45%）| 1802.5 | 2741 / 976 | 0 | 0 / 0 | 402 MB |
| GeometryFeaturesOnly | 400 | 22 | 0 | 0 | 0 | 97,074,008（+0.03%）| 1791.6 | 0 / 0 | 29,736 | 17 / 0 | 427 MB |
| FullE01 | 400 | 22 | 0 | 0 | 0 | 97,604,320（+0.58%）| 2321.8 | 2741 / 976 | 118,944 | 17 / 0 | 400 MB |

- **回归门禁**：FrozenCF 对比上一轮 `ContentFirstOnly` 记录：400/400 状态相同、400/400 `search_work` 逐题相同、400/400 程序文本相同（仅多出 `cfpView = LegacyView` 字段）。四个配置都保留 22 道旧解（20 道 Size-first + `0b148d64`、`c909285e`），无丢失、无新增、无超时。
- 两道 content-first 解在四个配置下选中的 plan 相同（LegacyView）；Python 独立核验（窗口/尺寸/像素来源 + 几何 witness 的矩形包含、并集、bounds、状态一致）2/2 通过；`c909285e` 的选中 shell 覆盖为 **proven_minimal 4 矩形**（下界=上界=4，独立重放通过），`0b148d64` 的 4–5 个选中成员均 proven。
- **成本单独记账**：E0 视图使 content-first plan 宇宙放大约 4 倍（例如 2dc579da 116→560），E1 增加约 6 个谓词；SearchWork 增加 0.03%–0.58%，墙钟增加 4%–35%（FullE01 对每个派生 spec 计算几何 witness：trace 中 `cover-proven` 事件 9167 次/题级别），全部在声明的新配置预算内，无一题截断（`cf_truncated = 0`）。`UniformBorderColor` 在 313 题的至少一个 case 不适用（边框非单色），`UniqueMostFrequentColor`/`NoBackground` 几乎总可用。
- 墙钟只在本批内配对比较；本批 FrozenCF 的 1726 s 高于上一轮同配置的 1063 s（机器同时承担其它负载），不作跨批提速/减速结论。
- **异常记录**：批次运行中 5 个进程（`c909285e` 四配置、`ed36ccf7` FullE01）在 5–11 s 内以退出码 1 退出、stderr 为空、无结果文件（非超时、非堆耗尽报文）。用同一冻结 solver.exe 在前台重跑，`c909285e` 四配置均 train-exact（work 256,100，与上一轮一致），`ed36ccf7` 无解；重跑记录替换为正式记录，原崩溃记录保留为 `*.crashed.json`（`run_meta.json` 的 `rerun_transient_exit1` 阶段）。原因未定位（当时机器有其它任务），如实标注。

## 4. 三道真实失败案例（`traces/<task>/{FrozenCF,FullE01}/index.html`，trace-level full）

| 任务 | Oracle（临时解释器）| 当前型别 | FrozenCF | FullE01 | 首个有证据的阻塞层 |
|---|---|---|---|---|---|
| `e50d258f` | 多色矩形面板中颜色 2 计数唯一最大者裁剪：3/3 逐格精确 | 缺 `MulticolorRegion`（视图下 Region 仍是同色分量：MostFrequent 视图 10 个 region，NoBackground 13 个）与 `CountColor/ArgMax` | Size truncated → content-first 100 plan、36 合法、0 匹配 | 496 plan、138 合法（Legacy 44 / NoBackground 52 / MostFrequent 42）、112 spec 渲染、0 匹配；UniformBorderColor 不适用（边框色 [0,1,8]）| `RepresentationUnavailable`（selector/Region 表示），不是 SizeFailed 也不是预算：无截断 |
| `2dc579da` | 整行/整列分隔线分区 + 唯一计数颜色 marker 所在格：3/3 精确 | 缺 `PartitionByLines` 与"包含 marker 的分区"选择；谓词无合取 | Size truncated → 116 plan、36 合法、0 匹配 | 560 plan、160 合法（Legacy 46 / MostFrequent 68 / NoBackground 46）、137 渲染、0 匹配；MostFrequent 视图以象限主色为背景，只剩分隔线十字与 marker 两个 region，象限本身不是 region| `RepresentationUnavailable`；oracle 重放 `Unique(IsMinArea)+Crop @ MostFrequent`（marker 可选中）执行成功但给出 1×1（3/3 render_mismatch）|
| `543a7ed5` | 边框色 8 为背景，每个 6 形外圈画 3、孔填 4：2/2 精确 | 同尺寸构造（外圈构造 + 孔洞填充）不在 Content-first/Relation 原语内；背景解释本身可表达（UniformBorderColor → 8，3 个 region）| Size fit（15×15 常数）→ Relation 9464 候选无 fit → D 无 fit → content-first 92 plan、40 合法、0 匹配 | 464 plan、192 合法（四个视图各 48）、168 渲染、0 匹配 | `RepresentationUnavailable`（输出构造），oracle 重放 `NonEmptySet(Not(RectCount==1))+Crop @ UniformBorderColor` 执行成功但尺寸不符（4×5 / 12×11 vs 15×15）|

- 三题的 content-first 分支都真正进入并执行（`content-first-branch-executed` 事件 ≥ 100），新视图在 e50d258f/2dc579da 各实例化 6 个 (case,view) 并记录 3 个不适用，在 543a7ed5 实例化 6 个；几何谓词评估 288/288/192 次；没有候选被 Witness/Renderer 以外的理由拒绝，没有预算截断，因此不是 `SearchNotReached`、`BudgetTruncated` 或 `Unknown`。
- 三题都**没有**新增 train-exact；所有 oracle 均为诊断用途，不进入候选集，不构成任何 task-ID 特判。

## 5. 可视化与日志

- `traces/c909285e/FullE01/index.html`（已解题的几何示例）：网格页在 Input 上以不同描边显示选中 shell 的 4 个矩形（渲染出 24 个 rect 格）、残差格斜线标记、视图并排表；推导页 CrossCaseWitness 表（视图/背景/选中基数/dims/矩形数均 `ObservedCaseAgreement`，target 只用于 exact 标记）；搜索流程页列出几何事件计数（view-created 6、view-not-applicable 3、cover-proven 9167、feature-evaluated 96、branch-executed 146）。headless Chrome 自检：全部标签页无错误、无死链。
- 事件与记录结构见 [LATIS_SINGLE_IO_DEBUGGER.md](LATIS_SINGLE_IO_DEBUGGER.md) 附录。

## 6. 限制与下一步

- 本轮 Region 仍是同色 4 连通分量；`MulticolorRegion`、`ArgMax(CountColor)`、`PartitionByLines`、Region 间多对多变换、同尺寸构造（外圈/填孔）均未做，三道审计题因此仍不可解；E1 的备选最优覆盖只在极大矩形正规化下枚举；大 mask 只给 Bounded。
- ARC 400 上 E0/E1 没有带来新解（22/400 不变）；收益是表示与证据层（视图可解释、几何可证明、witness 可伪造检测），不是求解率。
- 建议 E2 先实现最小一组：非 0 像素的多色连通 Region 视图 + `CountColor(c)` 典型特征 + `ArgMax/Unique` 选择（覆盖 e50d258f 型），其次 `PartitionByLines`；同尺寸构造类（543a7ed5）需要新的输出构造原语，优先级最低。

## 7. 复现

`./scripts/run_stage_e01.ps1 -Out results/stage_e01/<run_id> [-Workers N]`（构建 → 8 套件 → `geometry-mechanism` → `run_stage_e01.py` run/report → 三题 trace；已有目录用 `-Resume`，历史目录不写入）；`python -I scripts/report_stage_e01.py --out <run>` 重算本报告的表；单题 oracle 重放：`python -I scripts/trace_io.py oracle-replay --record <trace.json> --ast <plan.json> --out <out.json> --binary <solver.exe>`（`traces/oracles/` 内有三题的示例 AST）。
