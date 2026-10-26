# Stage D+：实施前审计

依据 2026-10-26 当前已验收 Stage D 源码、`docs/LATIS_STAGE_D_REPORT.md`、Stage C 审计及 `results/stage_d/full_p0`。提示词中的报告文件实际位于 docs。历史 FullD 20/400、C 17/400；严格 ComposeOnly 与最后兼容性补丁有独立哈希，本轮不复用其数字作同 binary 消融。

## 限额及语义

|层／位置|单位及默认值|可调与候选影响|穷尽依据|
|---|---|---|---|
|Front.sizeStep → Size.synthesizeSize|A spine AST 深度 2，最多 2 holes，单目标 60000 row/probe；基础 size 无 fit 后对象叶子再试|本轮冻结深度；工作预算可倍增；第二轮也是独立单目标预算|仅 TypedResult 对传入模板前缀的完成，不能证明整个前端穷尽|
|Front.explained / alignment loop|alignmentBudget 400；scalarBudget 2000，scalar 深度 2／cost 5|性能预算；提升改变访问前缀，语义及 prior 不变|成功早停；deferred 按 alignment 恢复，不是全局有限宇宙证书|
|Front scalar A holes|单目标 60000，全局 1200000，常数 [-4..4]|预算可倍增；spine 深度固定|TypedResult.trTruncated；无截断不等于所有 alignment 均完成|
|Relation.StageC / enumerateTransforms / searchTransforms|case 200000，fit 50，candidate 20000；gap [0,1,2]，count [2,3,4]|前三项性能预算可倍增；grammar 及 gap/count 固定|enumerator 本身 take 上限；srTruncated=False 不证明未裁剪 grammar|
|Shape.decompose|已有深度／面积／候选／配对上限|本轮全部冻结，避免改变 Shape 选择与 canonicalization|局部 mask 证据，不能外推任务失败|
|Unified.goal A|AST 深度 2、1 hole、goal row/probe 40000，全局180000；template 20000，param reps32|前五项预算可倍增，深度单独调整；常数 [-4..4] 不放大；反解 root hole 可在此域外|当前 allTemplates eager sort；直接改深度3会先耗尽内存，需有界分层入口|
|Unified.goal B|kept 参数 hash-cons DAG；relate queries4096、retained edges128|容量及 reps 按预算倍增；CaseAgree 不合并代表|Pending/Confirmed 不构成全域语义证明；没有单独固定节点截断|
|Unified plans/construct/tryProgram|skeleton96、组合2000、case4000、fits16；联合 fallback templates16/counts12/candidates180|均为性能预算，按倍率调整；legacy→D 触发顺序固定|多重 take、代表延迟及 case early rejection；完整任务通常只能 Unknown/ProvenNotExhausted|
|Relation.executeSteps|Pipeline 长度1..2；发射／copy900；canvas1..30；合法颜色0..9、SizeSig、connectivity、越界拒绝|仅 pipeline最大步数随独立深度配置至4；其它安全边界固定；MigratedBody旧兼容例外保持|执行拒绝是语义／安全域限制，不等于搜索穷尽|
|父进程／RTS|历史60s、-M4g，4 workers|本轮300s，独立60s抽查；内存不按工作倍率放大|硬超时／崩溃保留已刷新的 eventlog，缺失为null|

## 现有诊断与缺口

预算终止粒度也属于定义：A synthesizeTyped 在整个模板开始前检查预算，模板内所有共享常数赋值及案例检查是原子批，Size/Scalar的最终row/probe数可能越过阈值；D的单hole目标预留`9×case_count+2`避免总预算越界，因此row预算命中可在已分配上限以下发生。C searchTransforms在candidate前检查case预算，单candidate完整训练验证也可越过阈值；D的forward执行逐case检查，不采用这一近似。Size统计合并基础/对象叶子两轮，事件budget_limit是单轮阈值、budget_used是实际合并工作；它们不可直接当作同一严格计量单位相减。

无inverse labels的联合fallback是另一个有限语法：原深度固定1、16 templates、12 count representatives、180 programs。倍率扩展三个性能前缀；本轮Param3调的是有逆约束的D TypedGoal深度，联合fallback的深度1仍冻结。它不是“没有参数搜索”：其到达证据来自d_joint_fallback和Execution，不能把TypedParameter（独立hole）NotEntered误读成完全没枚举参数。真实记录分别报告这两个入口，这也是后续表示／约束瓶颈分析的边界。

Front.finish 的 search_work = operator_applications + refinement 节点数；D work = typed row/probes + case executions + actual param eval + relate checks + witness replay。新增诊断不得并入这些量。旧 first_solution_work 及 latis-train-exact event 已存在；全局纯搜索在超时前未返回 Graph 时 counters 丢失。现有 failure 字符串常拼接 prior 和最后 relation/composition，不能表示每个 branch 的终止。

已有 TypedResult、GoalAudit、d_*、c_*、deferred 和 eventlog，本轮复用。新增事件在原路径检查点输出 JSON user event，父进程补齐 task/run/binary/config metadata，并保留每个 branch。诊断默认关闭；只有 enabled 才构造额外计数、哈希和 trace。没有廉价精确的 frontier 数量时写 null；性能前缀、代表延迟、超时均不得标 ProvenExhausted。分支级、已完整给定的有限列表可以给数量证书，但绝不据此宣称整个 ARC 任务穷尽。

## 深度入口决定

组合深度定义为 Pipeline 操作数（选择前置不计，identity 仍占槽；另报告逐案例实际非恒等步数），保守上限4。2保持原骨架与顺序；3/4在其后追加现有原语的有限组合，重用 forward executor/witness，不新增原语。参数深度为 tDepth：leaf/constant=0，App=1+max子树；2保留既有模板顺序，3在旧宇宙后追加合法深层 spine（固定 registry、canonical restrictions、hole/leaf域）；有限前缀截断明确记录。深层语法包含浅层，但访问预算前缀不保证找到同一个首解。

规模选择在 pilot 前冻结：40道旧未解按已存在的 d_* 截断/deferred/失败层及 ID 的确定性轮转规则分层，另含旧20道解；Extended只取前8道未解。正式完整400固定 D0、Budget4x、Combined3_4x；后者事先选择用于检验交互，不按 pilot 成败挑选。其余两种深度配置只跑 pilot并明确不报400 solve rate。
