# LATIS 阶段 D：P0 验收与实验报告

本报告替代第一轮部分实现报告。完整有界实现、测试及要求的八配置实验已运行并审计；不宣称全 DSL 完备性或真实 ARC 泛化准确率。原始结果在 `results/stage_d/full_p0/arc/tasks`，机制逐项 JSON/trace 在 `full_p0/mechanism`，推导图在 `full_p0/mechanism_graphs`。第一轮原始数据保留。

## 1. P0 A–F 完成情况

| 项 | 验收证据 |
|---|---|
| A | A 表达式/Typed Hole/Binding 实际嵌入 C；旧候选迁移 75460 次输出/错误类别比较与成本比较通过 |
| B | 同一程序实际执行 Select→MapPosition→Copies、MapColor/Shape→MapPosition；身份、作用域、SizeSig 与重放回归通过 |
| C | 参数级 Int/Bool DAG 存储、筛选、witness 边调度实际接入；NoParamVSA 不建图；固定宇宙候选/fit/ordering 差分通过 |
| D | Transform 重放、独立像素重放、同色连接/覆盖与伪造证据控制；ARC 独立核验 406 份案例证据 |
| E | 默认关闭、旧路径优先、分层预算、deferred、精确/无 fit/不适用/截断/超时；首解与总搜索 work/time 分开记录 |
| F | 六族×三种子×八配置共 144 项盲搜索，11 项显式负控制、历史回归与 ARC 400×8 完成 |

P1/P2 未做：完整 refinement GADT、shape thickness hole、通用对象 VSA、任意 SplitBy/任意深度、全类型 e-graph、Branch-and-Bound、神经模块。

## 2. 机制矩阵

每格为三个种子中 train-exact / heldout-exact 的数量。每种子 4 个训练对，heldout 仅评分；求解器接收的只有 train，没有目标 AST、任务 ID 或 heldout 标签。歧义族故意包含 literal/feature 真值相反的 heldout，不能要求 prior 总是正确。

| 家族 | BaselineA | BaselineB | BaselineC | TypedParamsOnly | ComposeOnly | TypedCompose | FullD | NoParamVSA |
|---|---|---|---|---|---|---|---|---|
| AmbiguousParamReferents | 0/0 | 0/0 | 0/0 | 0/0 | 3/1 | 3/1 | 3/1 | 3/1 |
| ColorThenMove | 0/0 | 0/0 | 0/0 | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 |
| FeatureDependentOffset | 0/0 | 0/0 | 0/0 | 3/3 | 0/0 | 3/3 | 3/3 | 3/3 |
| SelectThenMoveThenReplicate | 0/0 | 0/0 | 0/0 | 0/0 | 0/0 | 3/3 | 3/3 | 3/3 |
| ShapeThenMove | 0/0 | 0/0 | 0/0 | 0/0 | 3/3 | 3/3 | 3/3 | 3/3 |
| TypedCountReplication | 0/0 | 0/0 | 0/0 | 3/3 | 0/0 | 3/3 | 3/3 | 3/3 |

五个正向族的 BaselineA/B/C 均无训练精确解；这只是相同预算与冻结语法的实测，不把超时或截断解释成全 DSL 不可表达。Color/ShapeThenMove 的旧程序只能做单种操作；Count 家族的训练计数非单一 K*；SelectMoveCopy 则需要两个非恒等步骤。TypedParamsOnly 与 ComposeOnly 的具体结果见表，不按配置名称推断成功。

歧义族三个实例都保留 X+2 与 X+Width 的不同代表；heldout 结果是 [{'seed': 1, 'two_representatives_present': True, 'heldout_exact': False}, {'seed': 2, 'two_representatives_present': True, 'heldout_exact': True}, {'seed': 3, 'two_representatives_present': True, 'heldout_exact': False}]。CaseAgree 不等于全域相等。

## 3. ARC train-only

run_id `stage-d-20261025T034524Z`，二进制 SHA256 `c728649a76480599bdea732a0d8c263a565675cc761b21b4932dda2bf2748a95`，数据 SHA256 `92d2c4df7cecf742ec8f697d5e73d597c6a39cf36a8f4a2b1ea8398536ad6b89`。源码含未提交 Stage C/D 修改，完整 snapshot zip 与哈希在 code_version.json；没有只引用 Git HEAD 冒充源码版本。

每配置相同 60 秒墙钟、既有 A/B/C 工作预算；新增 D 子预算在设计文档和每题 config 中单列，不把额外预算冒充收益。求解并行度 4，批次墙钟 1823.66 秒。test=[] 逐文件校验，并有二进制非空 test 拒绝守卫；R2 没有执行，fallback 指仍需回退。

严格 ComposeOnly 使用追加批次 `stage-d-20261025T042152Z`，二进制 `63996e62ea463bf45256d078fabd5ba44137aa206bd2602c01d8a37212d8d107`；其它七配置使用原批次。原 ComposeOnly 的宽常数域/联合 typed 回退已从最终对照剔除，原始结果仍完整保留。更正后计数和成对 offset 严格来自旧 C，位置由旧闭合位移/标量模板适配。FullD 的 18 个实例程序、确定性工作量和 heldout 分数逐项相同；更正未调 FullD 规则或预算。 每行 run_id 和 binary_sha256 都保存于 per_task.csv；不得将两批墙钟混为同批提速比较。

| 配置 | train-exact | timeout | 新增 vs C | 未覆盖 C 解 | 完成题 SearchWork 总和 | 批次 |
|---|---|---|---|---|---|---|
| BaselineA | 7/400 | 0 | 0 | 10 | 64391739 | stage-d-20261025T034524Z |
| BaselineB | 7/400 | 0 | 0 | 10 | 117004025 | stage-d-20261025T034524Z |
| BaselineC | 17/400 | 2 | 0 | 0 | 94481589 | stage-d-20261025T034524Z |
| ComposeOnly | 18/400 | 2 | 1 | 0 | 94547538 | stage-d-20261025T042152Z |
| FullD | 20/400 | 2 | 3 | 0 | 95269212 | stage-d-20261025T034524Z |
| NoParamVSA | 20/400 | 2 | 3 | 0 | 95270314 | stage-d-20261025T034524Z |
| TypedCompose | 20/400 | 2 | 3 | 0 | 95270314 | stage-d-20261025T034524Z |
| TypedParamsOnly | 19/400 | 2 | 2 | 0 | 94754281 | stage-d-20261025T034524Z |

BaselineA/B 未覆盖 C 新增的十题属于能力基线差异；FullD 的旧解回归单独以 C 的 17 题为准。追加更正批次的时间单独记录在 metrics.corrected_control_run，原八配置批次成本未隐藏。

| 配置 | 首次训练精确秒数中位（仅有首解） | 完成搜索阶段秒数之和（不含未完成超时） | RTS peak live bytes |
|---|---|---|---|
| BaselineA | 0.52301 | 241.940949 | 367133552 |
| BaselineB | 8.6731187 | 845.1032048 | 1822703080 |
| BaselineC | 0.9242033 | 835.8202208 | 358252096 |
| ComposeOnly | 0.85166735 | 859.9630807 | 365208520 |
| FullD | 0.92137035 | 847.2863018 | 357952656 |
| NoParamVSA | 0.9243747 | 849.80601 | 357179000 |
| TypedCompose | 0.8923774 | 844.882855 | 357179048 |
| TypedParamsOnly | 0.8490769 | 847.7370229 | 357420504 |

FullD/NoParamVSA 共同完成 398 题，其中参数候选宇宙相同 398 题，train-exact 状态相同 398 题。两者本批解数相同，FullD 的完成题总 Work 差为 -1102；参数 DAG 的局部重用不能被扩大为显著整体提速结论，单批几秒的墙钟差不构成稳定效率优势证据。

真实 ARC 的 B 参数图累计 1238 节点、81 条保留边，其中 Confirmed 0、Pending 81；实际 relate 查询 4390 次。DAG 求值 4139 次，对应直接参数 AST 求值 9631 次。Pending 没有被宣传为全域等价或确认证明。

FullD 新增 ID：['5168d44c', 'a79310a0', 'aabf363d']；丢失旧 17 解：[]。实际选中程序是否含两个非恒等步骤，由每个训练 witness 的输入/输出比较得出，详见 `new_solutions.json` 和逐题 selected_composed；不拿“曾枚举过组合”代替选中程序的组合证据。TypedParamsOnly/ComposeOnly 的逐题状态一起保存，用于区分参数收益、组合收益与预算限制。

102 道 addition-like 与 36 道位置/形状失败诊断组的逐题迁移在 `arc/diagnostic_transitions.json`；它们保持 Stage C 的 encoder/失败阶段定义，不称为真实规则标签。跨批次工作量只比较共同完成任务；超时指标缺失，不按 0 汇总。

## 4. 五个源码验收问题

1. **参数实际执行 A 合成结果**：`frontSearch → relationPath(旧 C 无 fit) → unifiedPath → searchUnified → inverseRows/联合枚举 → goal → Typed.enumerateTemplates/synthesizeTyped → Candidate.cExpr → checkedParam → B fitPool → construct → Pipeline → runProgram → executePipeline → evalParam → evalT → Language.ML.eval`。TypedCountReplication 的 `If(IsOdd(InputWidth),WholeCount,WholeColors)` 在四个训练例得到 4、3、5、3；三个种子相同输入参数序列，heldout 计数 6，逐步 binding/像素证据可查。位置和颜色也由同一 A hole 接口合成，不翻回专用 K*。
2. **两步与来源**：MoveCopy 的位置在移动前求值，copy 参数绑定移动后的 CurrentObject；源集合保持固定，copy index 显式。Color/ShapeMove 也顺序执行两步。无合法适配的 sequence body 显式拒绝，Previous 不从副本列表顺序推导。新 geometry 产生新 extent；已有 Placed 的来源恢复已做多对象回归。
3. **B 参与及对照**：`fitPool SharedParamVSA` 的结果实际成为参数搜索 survivors，边只改变有界程序宇宙内的调度；无 B 使用相同参数的直接求值且节点数 0。固定宇宙差分为 {'candidate_sets_equal': True, 'fit_sets_equal': True, 'ordering_fit_sets_equal': True, 'shared_dag_evaluations': 432, 'flat_evaluations': 932, 'shared_nodes': 120, 'flat_nodes': 0, 'fit_count': 128}，完整宇宙存档见 validation/differential.json。这是有界候选一致性，不是完整 DSL 证明；真实 ARC 若 representative/case budget 截断，不能要求搜索到的前缀相同。
4. **双层 witness**：程序与输入独立重放 Transform；Render 按真实覆盖顺序折叠像素，Python 再核验。Object-Count/Emitted-Object/Render/Train/Witness 五类指标分别输出。同色发射物体在渲染后合并不会使像素证据失效；旧 emitted exact 定义未改，也没有强迫双射。
5. **真实解题与成本**：以本报告实测矩阵为准。FullD train-exact 20/400，fallback-required 380/400。首解 work/time 与 total-to-budget work/time 在 per_task.csv，未找到首解为 null；只有共同完成题才比较确定性 work。仅在新增 ID 的 selected_composed 与消融证据支持时归因于组合，训练精确不等于真实规律或 test 泛化。

## 5. 验证、资源与限制

12 个套件退出码均为 0。Stage D 基础单元断言 137 条，完整差分/负控制断言 34 条，严格对照与兼容边界断言 10 条；InducedR2 只打印套件成功，断言数为 null。迁移宇宙 15092 个候选、5 组输入，共 75460 次比较，另有 960 个重叠发射对象的合法旧程序边界比较。非法除零、颜色、计数、SizeSig、越界、非唯一选择、Previous、矛盾训练和对角交叉明确拒绝。

固定 260 个唯一候选的独立进程内存实验：共享池 295 个节点，GC 后 retained delta 中位 69024 bytes；不建图 0 节点、600 bytes。该实验隔离的是整个参数池增量，不把序列化估计冒充每道 ARC 的 DAG heap。ARC 另报实际进程 peak live heap。

逆向约束当前主要覆盖唯一选中源对象和可解释的复制角色；更一般的情况走有限联合 fallback，可能截断或无 fit。程序深度≤2，参数/模板/代表上限会保留 deferred frontier，未声称最优。B 的确认只保留现有案例相对含义，没有宣称全域证明；只有参数 VSA，没有 Shape/Set 的通用图。

复现：`./scripts/run_stage_d.ps1`（构建→12 套件→内存→机制矩阵→ARC→逐题审计），随后 `python -I scripts/report_stage_d.py` 生成本报告与顶层汇总。已有 raw batch 时脚本拒绝覆盖；恢复用 `arc_stage_d.py run`，重汇总用 `report`。完整报告生成器执行的审计断言也属于验收。

评测之后还完成一个迁移接口边界修复：旧 C 的合法重叠发射可多于 900，MigratedBody 不应继承新 typed-program 的 900 发射预算。960 个发射对象的独立渲染比较及 Merge 后 Width 从 1 重建为 3、再供 A 位置表达式使用的测试通过。此修复不改 legacy emitObjects 求解路径或任何新 Pipeline 的预算；冻结评测二进制、最终兼容性实现二进制与源码快照分别保留并记录哈希，不将最后一版哈希冒充早期测评版本。
