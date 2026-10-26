# Stage D+ 使用与语义不变量

实施前限额审计见 LATIS_STAGE_D_PLUS_AUDIT.md。新诊断默认关闭（StageD.sdDiagnostics=False），通过同一 `stage-d-*` 接口选择 D0_Frozen / D0_Off / Budget4x / Compose3 / Param3 / Combined3_4x / Extended4_8x。

|配置|Pipeline槽上限|D逆约束TypedHole的AST深度|性能预算倍率|范围|
|---|---:|---:|---:|---|
|D0_Frozen / D0_Off|2|2|1|完整400及诊断开关回归|
|Budget4x|2|2|4|pilot、完整400|
|Compose3|3|2|1|预选pilot60|
|Param3|2|3|1|预选pilot60|
|Combined3_4x|3|3|4|pilot、完整400，pilot前预选|
|Extended4_8x|4|3|8|预选8道未解|

compose_depth 是非空 Pipeline 的操作槽数，选择前置不计，identity仍占槽。实际非恒等操作数按每例 witness 的输入/输出对象像素及来源比较，单独记录，不能拿槽数冒充。param_depth 是 TExpr 的 App结构深度：leaf/constant=0；例如 Add(X,Width)=1，If(IsOdd(InputWidth),Count,Colors)=2。3/4执行器重用同一个 applyStep；不新增对象/Shape原语。

旧2层模板顺序保持。extendedTemplates 在旧前缀之后，按既有typed registry、spine和commutative／degenerate限制追加深层；避免对完整depth3宇宙先sort导致无界内存。只有And/Or允许两个复合Bool参数，仍沿用旧规则。可按配置枚举的集合是有限的，实际搜索只访问模板前缀，未知剩余数量写null。

3/4组合层追加旧MapColor、Hollow/FillBBox、闭合MapPosition、Copies的类别词，邻接相同类别省略，参数域显式有限。4层在3/4之间轮转，避免必须先枚举完巨大的3层全集；更深集合包含浅层，不承诺不同预算前缀包含。基础2层骨架仍优先；若2层已耗尽case/组合预算，记录截断而不虚称访问了深层。追加层目前是固定参数的联合forward语法；新的A typed参数深度作用于原有inverse-hole计划，不宣传为通用任意typed多步搜索。

另一个无inverse labels的单步联合fallback保持原depth1，只按倍率扩大templates/counts/programs前缀。配置里的param_depth是inverse TypedGoal上限，不表示所有fallback分支都访问该深度。独立hole的TypedParameter checkpoint与d_joint_fallback必须联合解读；未分别记录的模板内部首fit时间/类型过滤计数保留null及原因，不能伪装精确计数。整格首解work/time则来自已有精确marker和旧work字段。

预算倍率仅扩大 alignment/scalar候选前缀、A单目标及全局row/probe、C relation case/candidate/fit、D goal/global/case/combination/skeleton/fit/param reps/template，以及B relate4096/retained128和联合fallback16/12/180。常数域、gap/count域、Size/Scalar语言深度、Shape分解配置、画布1..30、颜色0..9、900发射/copy、内存2GiB固定。B参数DAG大小由kept reps自然决定，无独立固定nodecap；查询／边上限变化另计。root-direct常数反解仍是旧A语义，不能误称只枚举[-4..4]常数。

每事件包含scope、branch/parent、grammar版本、结构FNV64哈希（不是无碰撞证明）、访问深度／单位明确的计数／budget和stop。父进程追加task/config/run/binary/case_count。scope未产生checkpoint时 NotEntered；若中断前未记录entry，其真实进入状态未知，不据此证明未进入。对不能廉价知道的量保留null；不把缺失的类型拒绝计数填0。每分支保留，不用最终错误覆盖。diagnostic_overhead记录构造消息及emit的时钟区间；Haskell惰性字段强制可能将原搜索求值移入此区间，因此这是仪表区间耗时上界，不能当成独立纯诊断CPU成本或据此校正Solve窗口；不并入SearchWork。父进程的独立Witness核验耗时另列。父进程读取eventlog重建partial checkpoints，硬超时正常退出也保留null最终计数。

有限穷尽证书只由有明确总数、唯一候选ledger且visited=total、deferred=0、dropped=0、无中断时产生。当前ARC各层缺乏全局ledger，因此没有整体ProvenExhausted声明。参数fit但无完整解、可执行但pixels不符，以及首拒绝／最终阻塞均分开计量。

运行 `./scripts/run_stage_d_plus.ps1 -Out results/stage_d_plus/<新run_id>`。断点恢复用同Out加`-Resume`；保留冻结solver.exe而不重建。历史测试在run内sandbox执行，防止旧测试写入历史StageD目录。每配置每任务独立进程，4workers，300秒内部timeout／额外10秒watchdog，-M2g，eventlog128MiB上限。独立60秒样本只作窗口一致性检查，不混批声称提速。父进程逐个保存原始结果与search_diagnostics.json；报告由原始数据重算。
