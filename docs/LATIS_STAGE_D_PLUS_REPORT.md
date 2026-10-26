# Stage D+ 诊断与 Scaling 实验报告

本报告从逐任务原始 JSON 和 search_diagnostics.json 独立复算。run_id `dplus-20261026-v2`；所有记录 binary SHA256 `da1f18a755cd591276b8e0d0341a97b81e96395a267c659f56b23dc5be76ce94`。D0 回归门禁：True。

## 范围及结果

|配置|范围|任务数|train-exact|Solve@60s|Solve@300s|timeout|
|---|---|---|---|---|---|---|
|D0_Frozen|400_complete|400|20|20|20|0|
|Budget4x|400_complete|400|20|20|20|2|
|Combined3_4x|400_complete|400|20|20|20|2|
|Compose3|pilot_only|60|20|20|20|0|
|Param3|pilot_only|60|20|20|20|0|
|Extended4_8x|targeted_only|8|0|0|0|0|

本次扩大预算和深度没有新增训练精确解，原20解均保留。这个结果说明本次有界配置未取得解数收益，不能证明预算不是瓶颈，也不能证明真实规则在TSL之外。

只有 coverage=400_complete 可使用 /400 分母。pilot_only 的已解正控制使该样本不代表总体解决率。D0 的 pilot 行复用同 binary 同配置已完成的基线原始记录，保留 source_record；其它pilot与正式是独立运行，未混合墙钟作为提速证明。正式深度配置 Combined3_4x 在 pilot 前已登记，未按试验成败挑选。Compose3/Param3 完整400矩阵本轮未运行，Extended始终只针对8道预选未解。

数据沿用官方 training400 的 manifest；solver文件均 test=[]，无 R2。首解时间来源既有 latis-train-exact event，独立60s抽查见 window_checks.csv。超时／崩溃最终 counters 为null，已完成事件和 partial_work 保留，不能当0。partial_work是已经完成检查点的计数下界，原子模板／Shape审计内部尚未提交的工作未知，不冒充完整中断时工作量。每进程RTS内存上限2GiB，固定4workers；内存和语义安全边界没有随预算倍增。

## 回归与机制

同一 binary D0诊断 on/off 比较旧20个ARC解及18个历史机制：程序、逐格预测和原 search_work 必须逐项相同；validation/regression_audit.json 保存断言。历史共同完成题的 search_work 也逐题比较。新增Haskell负控制覆盖 finite exhausted、最后候选截断后恢复、deferred及代表延迟、深度3真实参数与Pipeline、深度4执行与枚举层。diagnostic_overhead记录构造消息及emit的区间，包含惰性字段强制可能移入的搜索求值，是仪表区间上界而非纯诊断CPU成本；父进程独立Witness核验耗时另列，均不计入旧work。两批 on/off wall 差受CPU负载影响，不当作精确overhead。

首轮预检目录 `results/stage_d_plus/dplus-20261026-main` 已保留，但不纳入正式矩阵：故障注入发现纯State monad的惰性pair使部分事件延后到整体结束。最终版本将monadic事件序列显式强制到检查点并重跑基线；单一正式binary只使用当前run。没有用预检ARC新增情况修改语法或prior。

## 逐层诊断

基线未解主标签：{'budget_truncated': 274, 'composition_no_fit': 106}。主标签优先级 `['train_exact', 'timeout', 'budget_truncated', 'blocked_before_unified_search', 'param_no_fit', 'composition_no_fit', 'render_mismatch', 'unknown']`，完整多标签与 reached/blocked/exhausted/truncated/timeout 在 diagnostic_per_task.csv。首拒绝点和运行最终阻塞分开，所有branch事件保留于无损压缩的search_events.jsonl.gz（JSON Lines，gzip；未丢弃分支）。Task-terminal 的 NoFitYet 只表示没有最终解，不覆盖某一branch的参数fit或render失败。

真实ARC未产生任何 ProvenExhausted 证书。旧C的候选max裁剪、alignment early stop、参数模板前缀、deferred、representatives等缺乏全局完成ledger。即使所有已记录分支都no-fit，整体仍Unknown。有限小语法测试中的证书只适用于显式枚举的那个有限集合及深度，不是无限TSL不可表达性证明。

## 实际访问范围与瓶颈

|配置|样本数|尝试≥3槽候选|完整执行且产出网格≥3槽|D参数模板访问深度3|联合forward回退题数|
|---|---|---|---|---|---|
|D0_Frozen|400|0|0|0|363|
|Extended4_8x|8|7|7|2|7|
|Budget4x|400|0|0|0|365|
|Combined3_4x|400|366|312|5|365|
|Compose3|60|35|29|0|35|
|Param3|60|0|0|4|35|

槽数与非恒等步骤数不同；表中“完整执行且产出网格”来自相同branch_id的Render成功/像素不匹配记录，排除执行中途拒绝及越界render失败。非恒等步骤只对保存完整witness的选中程序另列，不能给失败候选虚构这一数量。Extended在7题尝试4槽，但本次8题中完整渲染的最大值仍为3；人工四步非恒等机制已独立通过，这说明实际前缀/合法性阻挡了该定向样本的四步覆盖。

正式Combined中366题尝试三槽、312题完整产出网格，但没有新增解。D专属逆约束参数模板在400题中只有5题记录到非空访问，Combined的这5题达到深度3；不能把其余395题称为“深度3参数已经失败”。大量任务走联合forward回退（D0为363题、扩展为365题），该入口保持原参数深度1。更深TypedGoal没有自动推广到无独立参数标签的联合求解。这是本实验最明确的覆盖边界之一，不是ARC真实规则归类。

前置层仍重要：SizeRule阻塞记录由D0的17题降到扩展配置的13题；LegacyRelation检查点到达由376增至379，Composition由366增至369。仅移除更多预算截断并未使这些有限路径找到新解。所有计数以diagnostic_summary.json为准；TypedParameter还包含旧scalar A检查点，不能把该scope总触发数与D专属模板深度计数混为一谈。

## 预算、深度与因果边界

预算倍率扩展搜索阈值，Size/A/legacy/C 与D各阈值见原始config和设计表。参数深度只作用D参数hole，旧size与scalar参数深度冻结，避免误把其它层语言变化算成D参数收益。参数AST深度leaf=0，App=1+max子深度；深度3保留旧2模板前缀，再追加现有registry的合法spine层。组合深度为操作槽数，选择前置不计；实际非恒等步骤逐案例另测。3/4层只追加已有MapColor/shape/MapPosition/Copies类别组合，不是通用任意程序宇宙；更深不保证在更小预算前缀中被访问。

新增程序和逐题基线budget hits见new_solutions.json；per_task.csv将D首次整格fit事件的first_fit_pipeline_slots/first_fit_param_ast_depth与最后选中程序的深度分开。旧非Pipeline路径和诊断关闭的对照不冒填该D专属指标。不以配置名或某组独有新增断言因果。证明“深度2不可枚举此AST”只针对该AST的结构深度，不能排除另一个语义等价浅程序。若没有定向重放，就明确标为待验证，不把Budget4x的归属自动叫预算因果证据。

配对成本（只比较共同完成题）：[{'config': 'Budget4x', 'common_completed': 398, 'baseline_work': 92266472, 'config_work': 200980796}, {'config': 'Combined3_4x', 'common_completed': 398, 'baseline_work': 92266472, 'config_work': 204307113}]。B参数DAG的reference/dag实际次数保存于逐题d_*；本地复用不等于端到端提速。固定候选宇宙开关B的已有StageDFull差分重新执行；不要求Confirmed增加。

|配置|共同完成题数|D0 Work|该配置Work|倍率|
|---|---|---|---|---|
|Budget4x|398|92266472|200980796|2.178×|
|Combined3_4x|398|92266472|204307113|2.214×|

|配置|完成题Work之和|有最终Work的题数|完成搜索秒数之和|最大已知live heap GiB|缺失峰值题数|
|---|---|---|---|---|---|
|D0_Frozen|96893211|400|1158.833|0.384|0|
|Budget4x|200980796|398|1780.528|1.16|2|
|Combined3_4x|204307113|398|2598.97|1.188|2|

Budget4x和Combined均在ed36ccf7、f25fbde4达到300秒上限；它们不是原有已解题。上表的完成Work/秒数没有把这两题按0冒充完整成本；中断检查点的工作量下界单列于per_task.csv，最终计数和峰值保留null。Combined的case单位Work增长与墙钟增长不成比例，因为旧Work每次完整case只计一单位，不按Pipeline槽数加权，诊断和结果物化也有成本；不将它解释为稳定提速/减速定律。

额外深度3固定宇宙测试使用43个唯一参数AST，SharedParamVSA与flat匹配集相同，实际求值49对271、fit数1，无预算截断。它证明局部DAG共享生效；未运行真实ARC同预算的整批NoParamVSA消融，因此不宣称端到端B效率收益。

## 未观测量与解释边界

模板内部首次匹配时间、按类型过滤掉的语法形状数量没有单独采样，相关字段为null并保留原因；本轮精确首解work/time指完整网格首解。现有Size统计可能合并两轮且A/C旧循环采用原子模板/candidate阈值，详见审计。Render检查点未覆盖旧C内部的每个候选，旧路径另用c_relation_executions及最终像素witness；NotEntered表示没有该独立检查点，不能反推从未渲染。原始ParameterVSA的FoundFit标记不能替代非空候选/param_fit_count证据。嵌入Bool说明文本的旧depth1标签不作为深度3的约束证明，真实深度由结构化AST独立计算。

## 重现与限制

运行 `./scripts/run_stage_d_plus.ps1 -Out results/stage_d_plus/dplus-20261026-v2`，或分阶段运行Python prepare/baseline/regression/pilot/formal/window与本报告脚本。已有原始record不会覆盖；中断后沿同binary恢复。汇总文件允许重生成，历史Stage D/C目录不写入。源码快照、git状态/diff、binary、manifest与测试日志在本run目录。正式尚未运行的配置明确not_run，实验未证实的泛化或效率优势不作声称。
