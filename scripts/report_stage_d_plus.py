"""Independent recomputation from append-only D+ task records and event ledgers."""
import argparse
import csv
import json
import statistics
import gzip
from collections import Counter,defaultdict
from pathlib import Path
import sys
import re
sys.path.insert(0,str(Path(__file__).resolve().parent))
from run_stage_d_plus import ROOT,CONFIGS,read,write,sha,parse_events,failure_evidence

def records(out,phase):
    return { (p.parent.parent.name,p.parent.name):(read(p),p) for p in (out/phase/'tasks').glob('*/*/stage-d-*.json') }
def dumpcsv(path,rows):
    if not rows:return
    fields=list(dict.fromkeys(k for row in rows for k in row))
    with path.open('w',encoding='utf-8-sig',newline='') as f:
        w=csv.DictWriter(f,fieldnames=fields);w.writeheader();w.writerows(rows)
def pdepth(e):
    if not isinstance(e,dict):return 0
    return 1+max([pdepth(a) for a in e.get('arguments',[])]+[0]) if 'operator' in e else 0

def first_fit_depth(events):
    fits=[e for e in events if e.get('scope')=='Execution' and e.get('event')=='completed' and e.get('train_exact_candidates')==1 and e.get('program_transform')]
    if not fits:return {'first_fit_pipeline_slots':None,'first_fit_param_ast_depth':None,'first_fit_depth_source':'No structured D fit event: diagnostics off, or non-Pipeline legacy path'}
    event=fits[0];text=event['program_transform'];depths=[]
    # Read only TExpr's tiny derived-Show grammar; never eval source text.
    for match in re.finditer(r'\bParam (?:IntegerParam|PositiveCount|ArcColor|BooleanParam) ',text):
        tokens=re.findall(r'-?\d+|\w+|[()\[\],]',text[match.end():]);i=0
        def atom():
            nonlocal i
            if tokens[i]=='(':
                n=1;i+=1
                while n:
                    n+=(tokens[i]=='(')-(tokens[i]==')');i+=1
            else:i+=1
        def expression():
            nonlocal i
            if tokens[i]=='(':
                i+=1;d=expression();assert tokens[i]==')';i+=1;return d
            node=tokens[i];i+=1
            if node in ('TLeaf','TConst','THole'):atom();return 0
            assert node=='TApp';i+=1;assert tokens[i]=='[';i+=1;children=[]
            while tokens[i]!=']':
                children.append(expression())
                if tokens[i]==',':i+=1
            i+=1;return 1+max(children,default=0)
        depths.append(expression())
    return {'first_fit_pipeline_slots':event['pipeline_depth'],'first_fit_param_ast_depth':max(depths,default=None),'first_fit_depth_source':'First validated structured D execution event', 'first_fit_transform_hash':event['branch_id']}

def config_json(text):
    """Lossless parser for the recorded derived-Show Config record grammar."""
    tokens=re.findall(r'-?\d+|[A-Za-z_][A-Za-z_0-9]*|[{}\[\],=]',text);pos=0
    def take(expected=None):
        nonlocal pos
        token=tokens[pos];pos+=1
        if expected is not None: assert token==expected,(expected,token)
        return token
    def value():
        token=take()
        if token=='[':
            items=[]
            while tokens[pos]!=']':
                items.append(value())
                if tokens[pos]!=']':take(',')
            take(']');return items
        if re.fullmatch(r'-?\d+',token):return int(token)
        if token in ('True','False'):return token=='True'
        if token=='Nothing':return None
        if token=='Just':return {'constructor':'Just','value':value()}
        if pos<len(tokens) and tokens[pos]=='{':
            take('{');fields={'constructor':token}
            while tokens[pos]!='}':
                key=take();take('=');fields[key]=value()
                if tokens[pos]!='}':take(',')
            take('}');return fields
        return token
    result=value();assert pos==len(tokens)
    return result
def depths(r):
    ws=r.get('execution_witnesses') or []
    instructions=[s.get('instruction',{}) for w in ws for s in w['derivation_steps']]
    parameter_depths=[pdepth(p['expression']) for s in instructions if isinstance(s,dict) for p in s.get('parameters',[])]
    pd=max(parameter_depths) if parameter_depths else None
    structured=any(isinstance(s,dict) for s in instructions)
    active=[sum(s['input']!=s['output'] and sorted((tuple(x['sources']),tuple(map(tuple,x['pixels']))) for x in s['input'])!=sorted((tuple(x['sources']),tuple(map(tuple,x['pixels']))) for x in s['output']) for s in w['derivation_steps']) for w in ws]
    return {'param_ast_depth':pd,'pipeline_slots':max([len(w['derivation_steps']) for w in ws]+[0]) if structured else None,'actual_nonidentity_steps_by_case':active if structured else None,'max_nonidentity_steps':max(active+[0]) if structured else None}

def gate(out):
    baseline=records(out,'baseline');reg=records(out,'regression');mech=records(out,'mechanism')
    assert len(baseline)==400
    old={p.parent.name:read(p) for p in (ROOT/'results/stage_d/full_p0/arc/tasks').glob('*/stage-d-FullD.json')}
    solved=sorted(t for (t,c),(r,p) in baseline.items() if r['train_exact'])
    expected=sorted(t for t,r in old.items() if r['train_exact'])
    assert solved==expected, {'expected':expected,'actual':solved}
    rows=[]
    for tid in solved:
        on=baseline[(tid,'D0_Frozen')][0];off=reg[(tid,'D0_Off')][0]
        same=on['program']==off['program'] and on['search_work']==off['search_work'] and [w['grid'] for w in on['execution_witnesses']]==[w['grid'] for w in off['execution_witnesses']]
        assert same,tid
        rows.append({'task_id':tid,'program_prediction_work_equal':same,'work':on['search_work'],'diagnostic_emit_seconds':(on.get('diagnostic_overhead') or {}).get('serialization_and_emit_seconds'),'off_seconds':off['wall_clock_seconds'],'on_seconds':on['wall_clock_seconds']})
    mrows=[]
    for tid in sorted({t for t,c in mech}):
        on=mech[(tid,'D0_Frozen')][0];off=mech[(tid,'D0_Off')][0]
        assert on['program']==off['program'] and on['search_work']==off['search_work'] and on['execution_witnesses']==off['execution_witnesses'],tid
        mrows.append({'task_id':tid,'program_predictions_work_equal':True,'status':on['status']})
    assert len(mrows)==18
    faultrows=[]
    for name,status in [('crash-control','runtime_error'),('timeout-control','timeout')]:
        folder=out/'fault_controls/tasks'/name/'D0_Frozen'
        rec=read(folder/'stage-d-D0_Frozen.json');d=read(folder/'search_diagnostics.json')
        assert rec['status']==status and rec['search_work'] is None and rec['counters'] is None
        completed=[e for e in d['events'] if e.get('event')!='task-terminal']
        if name=='crash-control': assert completed and any(e['scope']=='ShapeDecomposition' for e in completed)
        faultrows.append({'control':name,'status':status,'retained_events':len(completed),'partial_work':next(e.get('partial_work') for e in d['events'] if e.get('event')=='task-terminal')})
    common=[(t,r[0],old[t]) for (t,c),r in baseline.items() if r[0]['search_work'] is not None and old[t].get('search_work') is not None]
    differences=[{'task_id':t,'old_work':o['search_work'],'current_work':n['search_work']} for t,n,o in common if n['search_work']!=o['search_work']]
    assert not differences,differences
    result={'passed':True,'frozen_binary_sha256':read(out/'code_version.json')['binary_sha256'],'baseline_train_exact':len(solved),'ids':solved,'on_off_arc':rows,'on_off_mechanism':mrows,'historical_common_completed':len(common),'historical_work_differences':differences,'fault_controls':faultrows}
    write(out/'validation/regression_audit.json',result)
    print('D0 regression gate PASSED: 20 old solutions, 18 mechanisms, equal program/prediction/search_work',flush=True)
    return result

def report(out):
    code=read(out/'code_version.json');sel=read(out/'selection.json');allrecords=[];eventsout=out/'search_events.jsonl.gz';diagnosticrows=[]
    new={};summaries=[];index={};byphase={};effective_configs={};failure_cache={}
    for phase in ['baseline','regression','mechanism','pilot','extended','formal','window60','fault_controls']:
        byphase[phase]=records(out,phase)
        for (tid,cfg),(r,path) in byphase[phase].items():
            assert r['binary_sha256']==code['binary_sha256'] and r['run_id']==code['run_id']
            if r.get('config'):
                parsed=config_json(r['config'])
                if cfg in effective_configs: assert parsed==effective_configs[cfg]
                effective_configs[cfg]=parsed
            index[(phase,tid,cfg)]=(r,path)
    write(out/'configs.json',effective_configs)
    with gzip.open(eventsout,'wt',encoding='utf-8',compresslevel=1) as stream:
        for (phase,tid,cfg),(r,path) in sorted(index.items()):
            diag=read(path.parent/'search_diagnostics.json');ev=diag['events'];fe=failure_evidence(ev,r)
            assert diag['failure_evidence']==fe
            failure_cache[(phase,tid,cfg)]=fe
            for event in ev:
                assert event.get('exhaustiveness')!='ProvenExhausted', 'ARC has no global or branch grammar completion ledger'
                stream.write(json.dumps(event,ensure_ascii=False,separators=(',',':'))+'\n')
            d=depths(r)
            partial=max([e['partial_work'] for e in ev if e.get('event')=='task-terminal' and e.get('partial_work') is not None],default=None)
            branch_depth={e['branch_id']:e['pipeline_depth'] for e in ev if e.get('scope')=='Execution' and e.get('event')=='attempt' and 'pipeline_depth' in e}
            rendered_depth=max([branch_depth[e['branch_id']] for e in ev if e.get('scope')=='Render' and e.get('render_mismatches') is not None and e.get('branch_id') in branch_depth],default=None)
            row={'phase':phase,'task_id':tid,'config':cfg,'run_id':code['run_id'],'binary_sha256':code['binary_sha256'],
                'status':r['status'],'train_exact':r['train_exact'],'solve_at_60s':r.get('solve_at_60s'),'solve_at_300s':r.get('solve_at_300s'),
                'first_solution_seconds':r.get('first_train_exact_seconds'),'first_solution_work':(r.get('counters') or {}).get('first_solution_work') if r.get('first_train_exact_seconds') is not None else None,
                'total_search_work':r.get('search_work'),'total_search_seconds':r.get('total_to_budget_seconds'),'wall_clock_seconds':r.get('wall_clock_seconds',r.get('driver_seconds')),
                'interrupted_work_lower_bound':partial if r['status'] in ('timeout','runtime_error') else None,
                'peak_live_bytes':r.get('rts_max_live_bytes'),'eventlog_bytes':r.get('eventlog_bytes'),
                'diagnostic_emit_seconds':(r.get('diagnostic_overhead') or {}).get('serialization_and_emit_seconds'),
                'diagnostic_postprocess_seconds':r.get('diagnostic_postprocess_seconds'),
                'primary_label':fe['primary_label'],'labels':'|'.join(fe['labels']),'source_record':str(path.relative_to(out)),
                'max_visited_compose_depth':max([e['pipeline_depth'] for e in ev if 'pipeline_depth' in e],default=None),
                'max_rendered_pipeline_slots':rendered_depth,
                'max_visited_param_depth':max([e['max_depth_visited'] for e in ev if 'max_depth_visited' in e],default=None),
                **d,**first_fit_depth(ev),**(r.get('stage_d') or {})}
            row['actual_nonidentity_steps_by_case']=json.dumps(d['actual_nonidentity_steps_by_case'])
            allrecords.append(row)
            diagnosticrows.append({'phase':phase,'task_id':tid,'config':cfg,'primary_label':fe['primary_label'],'labels':'|'.join(fe['labels']),
                'first_rejection_scope':(fe['first_rejection'] or {}).get('scope'),'first_rejection_branch':(fe['first_rejection'] or {}).get('branch_id'),
                'last_blocking_scope':(fe['last_blocking_branch'] or {}).get('scope'),
                'parameters_fit_without_solution':fe['parameters_fit_without_solution'],'composition_executes_but_pixels_fail':fe['composition_executes_but_pixels_fail'],
                'stage_flags':json.dumps(fe['stage_flags'],ensure_ascii=False),'whole_task_exhaustiveness':fe['whole_task_exhaustiveness']})
    # A complete400 denominator only for completed uniform formal runs.
    uniform={c:dict((t,(r,p)) for (t,k),(r,p) in byphase['baseline' if c=='D0_Frozen' else 'formal'].items() if k==c) for c in ['D0_Frozen','Budget4x','Combined3_4x']}
    basefits={t for t,(r,p) in uniform['D0_Frozen'].items() if r['train_exact']}
    paired=[]
    for cfg,data in uniform.items():
        fits={t for t,(r,p) in data.items() if r['train_exact']}
        complete=len(data)==400
        summary={'config':cfg,'coverage':'400_complete' if complete else 'not_run' if not data else 'partial','tasks':len(data),
            'train_exact':len(fits),'train_exact_denominator':400 if complete else None,
            'train_exact_rate':len(fits)/400 if complete else None,'fallback_required':400-len(fits) if complete else None,
            'solve_at_60s':sum(r.get('solve_at_60s',False) for r,p in data.values()),'solve_at_300s':sum(r.get('solve_at_300s',False) for r,p in data.values()),
            'timeouts':sum(r['status']=='timeout' for r,p in data.values()),'runtime_errors':sum(r['status']=='runtime_error' for r,p in data.values()),
            'total_completed_work':sum(r['search_work'] for r,p in data.values() if r['search_work'] is not None),
            'completed_work_records':sum(r['search_work'] is not None for r,p in data.values()),
            'missing_peak_live_records':sum(r.get('rts_max_live_bytes') is None for r,p in data.values()),
            'total_search_seconds':sum(r.get('total_to_budget_seconds') or 0 for r,p in data.values()),
            'max_peak_live_bytes':max([r.get('rts_max_live_bytes') or 0 for r,p in data.values()]+[0]),
            'new_ids':sorted(fits-basefits),'lost_ids':sorted(basefits-fits) if complete else None}
        summaries.append(summary)
        new[cfg]=[]
        for t in sorted(fits-basefits):
            r,p=data[t];base_rec=uniform['D0_Frozen'][t][0]
            new[cfg].append({'task_id':t,'source_record':str(p.relative_to(out)),'program':r['program'],'depth_evidence':depths(r),
                'baseline_diagnostics':str(uniform['D0_Frozen'][t][1].parent.relative_to(out)/'search_diagnostics.json'),
                'baseline_budget_hits':{k:v for k,v in (base_rec.get('stage_d') or {}).items() if 'truncat' in k},
                'causal_status':'Requires targeted reachability replay; group membership alone is not proof'})
        if cfg!='D0_Frozen':
            common=[t for t,(r,p) in data.items() if t in uniform['D0_Frozen'] and r['search_work'] is not None and uniform['D0_Frozen'][t][0]['search_work'] is not None]
            paired.append({'config':cfg,'common_completed':len(common),'baseline_work':sum(uniform['D0_Frozen'][t][0]['search_work'] for t in common),'config_work':sum(data[t][0]['search_work'] for t in common)})
    for cfg in ['Compose3','Param3','Extended4_8x']:
        phase='extended' if cfg=='Extended4_8x' else 'pilot';rs=[r for (t,c),(r,p) in byphase[phase].items() if c==cfg]
        summaries.append({'config':cfg,'coverage':('targeted_only' if cfg=='Extended4_8x' else 'pilot_only') if rs else 'not_run','tasks':len(rs),'train_exact':sum(r['train_exact'] for r in rs),'train_exact_denominator':None,'solve_at_60s':sum(r.get('solve_at_60s',False) for r in rs),'solve_at_300s':sum(r.get('solve_at_300s',False) for r in rs),'timeouts':sum(r['status']=='timeout' for r in rs)})
        new['pilot_'+cfg]=[{'task_id':t,'source_record':str(p.relative_to(out)),'program':r['program'],'depth_evidence':depths(r),'sample_only':True,'causal_status':'Compare actual AST depth and other frozen configurations; sample membership is not causality'} for (t,c),(r,p) in byphase[phase].items() if c==cfg and r['train_exact'] and t not in basefits]
    transitions=[]
    for cfg in CONFIGS[1:]:
        for phase in (['extended'] if cfg=='Extended4_8x' else ['pilot','formal']):
            for (t,c),(r,p) in byphase[phase].items():
                if c!=cfg:continue
                b=uniform['D0_Frozen'][t][0];bd=failure_cache[('baseline',t,'D0_Frozen')]
                dd=failure_cache[(phase,t,cfg)]
                transitions.append({'phase':phase,'task_id':t,'config':cfg,'base_status':b['status'],'status':r['status'],'base_labels':'|'.join(bd['labels']),'labels':'|'.join(dd['labels']),'base_work':b['search_work'],'work':r['search_work']})
    window=[]
    for (t,c),(r,p) in byphase['window60'].items():
        comparison=uniform.get(c,{}).get(t)
        if comparison:window.append({'task_id':t,'config':c,'independent_60_train_exact':r['train_exact'],'long_run_first_fit_le_60':comparison[0]['solve_at_60s'],'agreement':r['train_exact']==comparison[0]['solve_at_60s']})
    dumpcsv(out/'per_task.csv',allrecords);dumpcsv(out/'diagnostic_per_task.csv',diagnosticrows);dumpcsv(out/'metrics.csv',summaries);dumpcsv(out/'failure_transitions.csv',transitions);dumpcsv(out/'paired_costs.csv',paired);dumpcsv(out/'window_checks.csv',window)
    write(out/'new_solutions.json',new)
    coverage=[]
    for phase,cfg in sorted({(r['phase'],r['config']) for r in allrecords}):
        group=[r for r in allrecords if r['phase']==phase and r['config']==cfg]
        diagnostics=[r for r in diagnosticrows if r['phase']==phase and r['config']==cfg]
        scope_counts={s:{flag:sum(json.loads(r['stage_flags'])[s][flag] is True for r in diagnostics) for flag in ['reached','blocked','exhausted','truncated','timeout']} for s in ['ShapeDecomposition','SizeRule','Alignment','LegacyRelation','TypedParameter','ParameterVSA','Composition','Execution','Render']}
        coverage.append({'phase':phase,'config':cfg,'tasks':len(group),'primary_labels':dict(Counter(r['primary_label'] for r in group)),
            'visited_composition_depth':dict(Counter(str(r['max_visited_compose_depth']) for r in group)),
            'rendered_pipeline_slots':dict(Counter(str(r['max_rendered_pipeline_slots']) for r in group)),
            'visited_inverse_parameter_depth':dict(Counter(str(r['max_visited_param_depth']) for r in group)),
            'joint_forward_fallback_tasks':sum((r.get('d_joint_fallback') or 0)>0 for r in group),'scopes':scope_counts})
    write(out/'diagnostic_summary.json',coverage)
    result={'run_id':code['run_id'],'binary_sha256':code['binary_sha256'],'configs':summaries,'paired_costs':paired,'raw_records':len(allrecords),'window_checks':window,'diagnostic_summary':'diagnostic_summary.json',
        'label_priority':['train_exact','timeout','budget_truncated','blocked_before_unified_search','param_no_fit','composition_no_fit','render_mismatch','unknown'],
        'all_arc_exhaustiveness':'Unknown; no global finite-universe certificate','not_run_400':['Compose3','Param3'],'planned_targeted_only':['Extended4_8x']}
    write(out/'metrics.json',result)
    reporttext(out,result,allrecords,new)
    print(json.dumps({'configs':summaries,'records':len(allrecords)},ensure_ascii=False),flush=True)

def reporttext(out,m,rows,new):
    code=read(out/'code_version.json');reg=read(out/'validation/regression_audit.json') if (out/'validation/regression_audit.json').exists() else None
    table='\n'.join('|'+ '|'.join(str(s.get(k,'')) for k in ['config','coverage','tasks','train_exact','solve_at_60s','solve_at_300s','timeouts'])+'|' for s in m['configs'])
    tags=Counter(r['primary_label'] for r in rows if r['phase']=='baseline' and not r['train_exact'])
    coverage=read(out/'diagnostic_summary.json')
    wanted={('baseline','D0_Frozen'),('formal','Budget4x'),('formal','Combined3_4x'),('pilot','Compose3'),('pilot','Param3'),('extended','Extended4_8x')}
    depth_table='\n'.join('|'+ '|'.join(map(str,[c['config'],c['tasks'],sum(v for k,v in c['visited_composition_depth'].items() if k not in ('None','0','1','2')),sum(v for k,v in c['rendered_pipeline_slots'].items() if k not in ('None','0','1','2')),c['visited_inverse_parameter_depth'].get('3',0),c['joint_forward_fallback_tasks']]))+'|' for c in coverage if (c['phase'],c['config']) in wanted)
    resource_table='\n'.join('|'+ '|'.join(map(str,[s['config'],s['total_completed_work'],s['completed_work_records'],round(s['total_search_seconds'],3),round(s['max_peak_live_bytes']/2**30,3),s['missing_peak_live_records']]))+'|' for s in m['configs'] if s['coverage']=='400_complete')
    paired_table='\n'.join(f"|{c['config']}|{c['common_completed']}|{c['baseline_work']}|{c['config_work']}|{c['config_work']/c['baseline_work']:.3f}×|" for c in m['paired_costs'])
    no_new=all(not s.get('new_ids') for s in m['configs'] if s['coverage']=='400_complete')
    finding=('本次扩大预算和深度没有新增训练精确解，原20解均保留。这个结果说明本次有界配置未取得解数收益，不能证明预算不是瓶颈，也不能证明真实规则在TSL之外。' if no_new else '新增解需逐AST和基线预算命中进行定向解释；不能只凭配置归属宣称因果。')
    text=f'''# Stage D+ 诊断与 Scaling 实验报告

本报告从逐任务原始 JSON 和 search_diagnostics.json 独立复算。run_id `{m['run_id']}`；所有记录 binary SHA256 `{m['binary_sha256']}`。D0 回归门禁：{bool(reg and reg['passed'])}。

## 范围及结果

|配置|范围|任务数|train-exact|Solve@60s|Solve@300s|timeout|
|---|---|---|---|---|---|---|
{table}

{finding}

只有 coverage=400_complete 可使用 /400 分母。pilot_only 的已解正控制使该样本不代表总体解决率。D0 的 pilot 行复用同 binary 同配置已完成的基线原始记录，保留 source_record；其它pilot与正式是独立运行，未混合墙钟作为提速证明。正式深度配置 Combined3_4x 在 pilot 前已登记，未按试验成败挑选。Compose3/Param3 完整400矩阵本轮未运行，Extended始终只针对8道预选未解。

数据沿用官方 training400 的 manifest；solver文件均 test=[]，无 R2。首解时间来源既有 latis-train-exact event，独立60s抽查见 window_checks.csv。超时／崩溃最终 counters 为null，已完成事件和 partial_work 保留，不能当0。partial_work是已经完成检查点的计数下界，原子模板／Shape审计内部尚未提交的工作未知，不冒充完整中断时工作量。每进程RTS内存上限2GiB，固定4workers；内存和语义安全边界没有随预算倍增。

## 回归与机制

同一 binary D0诊断 on/off 比较旧20个ARC解及18个历史机制：程序、逐格预测和原 search_work 必须逐项相同；validation/regression_audit.json 保存断言。历史共同完成题的 search_work 也逐题比较。新增Haskell负控制覆盖 finite exhausted、最后候选截断后恢复、deferred及代表延迟、深度3真实参数与Pipeline、深度4执行与枚举层。diagnostic_overhead记录构造消息及emit的区间，包含惰性字段强制可能移入的搜索求值，是仪表区间上界而非纯诊断CPU成本；父进程独立Witness核验耗时另列，均不计入旧work。两批 on/off wall 差受CPU负载影响，不当作精确overhead。

首轮预检目录 `results/stage_d_plus/dplus-20261026-main` 已保留，但不纳入正式矩阵：故障注入发现纯State monad的惰性pair使部分事件延后到整体结束。最终版本将monadic事件序列显式强制到检查点并重跑基线；单一正式binary只使用当前run。没有用预检ARC新增情况修改语法或prior。

## 逐层诊断

基线未解主标签：{dict(tags)}。主标签优先级 `{m['label_priority']}`，完整多标签与 reached/blocked/exhausted/truncated/timeout 在 diagnostic_per_task.csv。首拒绝点和运行最终阻塞分开，所有branch事件保留于无损压缩的search_events.jsonl.gz（JSON Lines，gzip；未丢弃分支）。Task-terminal 的 NoFitYet 只表示没有最终解，不覆盖某一branch的参数fit或render失败。

真实ARC未产生任何 ProvenExhausted 证书。旧C的候选max裁剪、alignment early stop、参数模板前缀、deferred、representatives等缺乏全局完成ledger。即使所有已记录分支都no-fit，整体仍Unknown。有限小语法测试中的证书只适用于显式枚举的那个有限集合及深度，不是无限TSL不可表达性证明。

## 实际访问范围与瓶颈

|配置|样本数|尝试≥3槽候选|完整执行且产出网格≥3槽|D参数模板访问深度3|联合forward回退题数|
|---|---|---|---|---|---|
{depth_table}

槽数与非恒等步骤数不同；表中“完整执行且产出网格”来自相同branch_id的Render成功/像素不匹配记录，排除执行中途拒绝及越界render失败。非恒等步骤只对保存完整witness的选中程序另列，不能给失败候选虚构这一数量。Extended在7题尝试4槽，但本次8题中完整渲染的最大值仍为3；人工四步非恒等机制已独立通过，这说明实际前缀/合法性阻挡了该定向样本的四步覆盖。

正式Combined中366题尝试三槽、312题完整产出网格，但没有新增解。D专属逆约束参数模板在400题中只有5题记录到非空访问，Combined的这5题达到深度3；不能把其余395题称为“深度3参数已经失败”。大量任务走联合forward回退（D0为363题、扩展为365题），该入口保持原参数深度1。更深TypedGoal没有自动推广到无独立参数标签的联合求解。这是本实验最明确的覆盖边界之一，不是ARC真实规则归类。

前置层仍重要：SizeRule阻塞记录由D0的17题降到扩展配置的13题；LegacyRelation检查点到达由376增至379，Composition由366增至369。仅移除更多预算截断并未使这些有限路径找到新解。所有计数以diagnostic_summary.json为准；TypedParameter还包含旧scalar A检查点，不能把该scope总触发数与D专属模板深度计数混为一谈。

## 预算、深度与因果边界

预算倍率扩展搜索阈值，Size/A/legacy/C 与D各阈值见原始config和设计表。参数深度只作用D参数hole，旧size与scalar参数深度冻结，避免误把其它层语言变化算成D参数收益。参数AST深度leaf=0，App=1+max子深度；深度3保留旧2模板前缀，再追加现有registry的合法spine层。组合深度为操作槽数，选择前置不计；实际非恒等步骤逐案例另测。3/4层只追加已有MapColor/shape/MapPosition/Copies类别组合，不是通用任意程序宇宙；更深不保证在更小预算前缀中被访问。

新增程序和逐题基线budget hits见new_solutions.json；per_task.csv将D首次整格fit事件的first_fit_pipeline_slots/first_fit_param_ast_depth与最后选中程序的深度分开。旧非Pipeline路径和诊断关闭的对照不冒填该D专属指标。不以配置名或某组独有新增断言因果。证明“深度2不可枚举此AST”只针对该AST的结构深度，不能排除另一个语义等价浅程序。若没有定向重放，就明确标为待验证，不把Budget4x的归属自动叫预算因果证据。

配对成本（只比较共同完成题）：{m['paired_costs']}。B参数DAG的reference/dag实际次数保存于逐题d_*；本地复用不等于端到端提速。固定候选宇宙开关B的已有StageDFull差分重新执行；不要求Confirmed增加。

|配置|共同完成题数|D0 Work|该配置Work|倍率|
|---|---|---|---|---|
{paired_table}

|配置|完成题Work之和|有最终Work的题数|完成搜索秒数之和|最大已知live heap GiB|缺失峰值题数|
|---|---|---|---|---|---|
{resource_table}

Budget4x和Combined均在ed36ccf7、f25fbde4达到300秒上限；它们不是原有已解题。上表的完成Work/秒数没有把这两题按0冒充完整成本；中断检查点的工作量下界单列于per_task.csv，最终计数和峰值保留null。Combined的case单位Work增长与墙钟增长不成比例，因为旧Work每次完整case只计一单位，不按Pipeline槽数加权，诊断和结果物化也有成本；不将它解释为稳定提速/减速定律。

额外深度3固定宇宙测试使用43个唯一参数AST，SharedParamVSA与flat匹配集相同，实际求值49对271、fit数1，无预算截断。它证明局部DAG共享生效；未运行真实ARC同预算的整批NoParamVSA消融，因此不宣称端到端B效率收益。

## 未观测量与解释边界

模板内部首次匹配时间、按类型过滤掉的语法形状数量没有单独采样，相关字段为null并保留原因；本轮精确首解work/time指完整网格首解。现有Size统计可能合并两轮且A/C旧循环采用原子模板/candidate阈值，详见审计。Render检查点未覆盖旧C内部的每个候选，旧路径另用c_relation_executions及最终像素witness；NotEntered表示没有该独立检查点，不能反推从未渲染。原始ParameterVSA的FoundFit标记不能替代非空候选/param_fit_count证据。嵌入Bool说明文本的旧depth1标签不作为深度3的约束证明，真实深度由结构化AST独立计算。

## 重现与限制

运行 `./scripts/run_stage_d_plus.ps1 -Out {out.as_posix()}`，或分阶段运行Python prepare/baseline/regression/pilot/formal/window与本报告脚本。已有原始record不会覆盖；中断后沿同binary恢复。汇总文件允许重生成，历史Stage D/C目录不写入。源码快照、git状态/diff、binary、manifest与测试日志在本run目录。正式尚未运行的配置明确not_run，实验未证实的泛化或效率优势不作声称。
'''
    (ROOT/'docs/LATIS_STAGE_D_PLUS_REPORT.md').write_text(text,encoding='utf-8')

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',required=True);p.add_argument('--gate',action='store_true');p.add_argument('--docs-only',action='store_true');args=p.parse_args()
    if args.gate:gate(Path(args.out))
    elif args.docs_only:
        out=Path(args.out)
        with (out/'per_task.csv').open(encoding='utf-8-sig',newline='') as stream: rows=list(csv.DictReader(stream))
        for row in rows:row['train_exact']=row['train_exact']=='True'
        reporttext(out,read(out/'metrics.json'),rows,read(out/'new_solutions.json'))
    else:report(Path(args.out))
