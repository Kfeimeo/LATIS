"""Generate the R2 report only from fingerprint-validated complete executions."""
import argparse,collections,csv,json,pathlib,re
from run_v03r import ROOT,digest,validate_inputs
from run_v03r2 import MODES

def load(p): return json.loads(p.read_text(encoding='utf-8'))
def table(headers,rows):
    return '\n'.join(['| '+' | '.join(headers)+' |','| '+' | '.join(['---']*len(headers))+' |']+['| '+' | '.join(map(str,r))+' |' for r in rows])
def literal_counts(ast):
    if not ast:return {'selected_small_numeric_components':None,'selected_unexplained_numeric_components':None}
    pending=[ast];small=unexplained=0
    while pending:
        node=pending.pop();pending.extend(node['children'])
        if not node['children'] and node['expression'].startswith(('IntV ','VecV ','CoordV ','SizeV ')):
            for value in re.findall(r'-?\d+',node['expression']):
                if int(value) in [-1,0,1]:small+=1
                else:unexplained+=1
    return {'selected_small_numeric_components':small,'selected_unexplained_numeric_components':unexplained}
def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--out',type=pathlib.Path,default=ROOT/'results/v03r2')
    parser.add_argument('--report',type=pathlib.Path,default=ROOT/'LATIS_V03R2_REPORT.md')
    parser.add_argument('--cover-out',type=pathlib.Path,default=ROOT/'results/v03r2-cover-ablation')
    parser.add_argument('--deadline-out',type=pathlib.Path,default=ROOT/'results/v03r2-deadline-ablation')
    parser.add_argument('--stress-out',type=pathlib.Path)
    parser.add_argument('--diagnostic-out',type=pathlib.Path)
    a=parser.parse_args();out=a.out.resolve()
    manifest,reg,stress=validate_inputs()
    protocol=load(out/'protocol.json');fp=protocol['fingerprint']
    for name,sha in fp['source_sha256'].items(): assert digest(ROOT/name)==sha, f'source drift: {name}'
    for name,sha in protocol['task_sha256'].items(): assert digest(ROOT/name)==sha
    assert protocol['frozen_manifest_hash']==manifest['hash']
    assert digest(ROOT/'src/Language/Induced/Base.hs')=='97da19a29cd2b1c2ecbcf8e03644151ecb4a02ba2b3af0e79f75e3bd9fe085f0'
    tests=load(out/'tests_protocol.json')
    assert tests['all_passed']
    assert set(tests['suites'])=={'latis-tests','joint-tests','latent-tests','induced-tests','induced-r1-tests','induced-r2-tests'}
    for name,sha in tests['source_sha256'].items(): assert digest(ROOT/name)==sha
    testlog=(out/'tests.log').read_text(encoding='utf-8',errors='replace')
    for suite in tests['suites']: assert f'Test suite {suite}: PASS' in testlog
    unit=load(out/'unit_evidence.json');assert unit['all_checks_passed']
    for filename,key in [('unit_evidence.json','unit_evidence_sha256'),('r1-compatibility-evidence.json','compatibility_evidence_sha256')]:
        if key in tests: assert digest(out/filename)==tests[key]
    assert all(not i['originating_ast']['free_variables'] and i['mdl_saving']>0 for i in unit['inventions'])
    orchestration=load(out/'orchestration.json') if (out/'orchestration.json').exists() else None
    group_roots={g:out for g in ['core','regression','stress','diagnostic']}
    if orchestration:
        assert orchestration['fingerprint']==fp
        for group,location in orchestration['group_outputs'].items():group_roots[group]=pathlib.Path(location)
    if a.stress_out:group_roots['stress']=a.stress_out.resolve()
    if a.diagnostic_out:group_roots['diagnostic']=a.diagnostic_out.resolve()
    for group,location in group_roots.items():
        gp=load(location/'protocol.json');assert gp['fingerprint']==fp
        for key in ['budget','diagnostic_budget','cost','saturation_budget','timeout']:
            assert gp['configuration'][key]==protocol['configuration'][key]
    groups={g:load(group_roots[g]/g/'comparison.json') for g in group_roots}
    expected={'core':7,'regression':119,'stress':70,'diagnostic':30}
    audit={};csvrows=[]
    forbidden={'ScanP','MapPose','ProgressionTask','Attach','WitnessAttach','Progression','GridBR','Start','OrderedPoseSequence'}
    for group,rows in groups.items():
        assert len(rows)==expected[group],(group,len(rows))
        assert len({(r['task'],r['ablation']) for r in rows})==len(rows)
        for r in rows:
            path=group_roots[group]/group/r['task']/r['ablation'];execution=load(path/'execution.json');ep=execution['protocol']
            assert ep['fingerprint']==fp
            assert digest(pathlib.Path(ep['command'][0]))==fp['binary_sha256']
            assert digest(pathlib.Path(ep['command'][ep['command'].index('--task')+1]))==ep['input_sha256']
            if group=='diagnostic': assert r['evaluation_set']=='PreviouslyOpenedDiagnosticSet'
            if r.get('external_timeout'):
                assert r['failure']=='SearchFailure';candidates=[]
            else:
                assert r['statistics']['structural_prior_count']==0
                assert r['failure']!='ProvenBaseMissing'
                tsl=load(path/'induced_tsl.json')
                assert not ({x['symbol'] for x in tsl['base_symbols']} & forbidden)
                assert all(not i['originating_ast']['free_variables'] and i['mdl_saving']>0 for i in tsl['task_inventions'])
                candidates=load(path/'portfolio_diagnostics.json')['candidates']
                assert len(candidates)==r['portfolio_count']
                assert all(x['dag_mdl_cost']>0 for x in candidates)
                assert r['statistics']['exact_verifier_calls']>=len(candidates)
                if r['ablation']=='NoLetSharing': assert all(x['let_sharing']==0 for x in candidates)
                ambiguity=r['ambiguity']
                assert ambiguity['selection_feedback'] is False
                if ambiguity['status']=='ObservationallyUnderdetermined':
                    assert ambiguity['hypothetical_prediction_a']!=ambiguity['hypothetical_prediction_b']
                    assert ambiguity['hypothesis_a'] in {x['expression'] for x in candidates}
                    assert ambiguity['hypothesis_b'] in {x['expression'] for x in candidates}
                if r['ablation']=='NoCounterfactualDiagnosis': assert r['statistics']['counterfactual_calls']==0
            good=sum(x['heldout_exact'] for x in candidates)
            audit[group,r['task'],r['ablation']]={'correct_candidates':good,'portfolio':len(candidates)}
            csvrows.append({'group':group,'task':r['task'],'mode':r['ablation'],'train_exact':r['train_exact'],'heldout_exact':r['heldout_exact'],'heldout_correct_candidates':good,'portfolio_count':len(candidates),'failure':r['failure'],'execution_seconds':r['execution_elapsed_seconds'],**r['statistics'],**literal_counts(r.get('typed_ast'))})
    # This is the label/diagnosis firewall's executable ablation check.
    for group in ['core','regression','stress']:
        full={r['task']:r for r in groups[group] if r['ablation']=='Full'}
        disabled={r['task']:r for r in groups[group] if r['ablation']=='NoCounterfactualDiagnosis'}
        for task,r in full.items():
            other=disabled[task]
            if not r.get('external_timeout') and not other.get('external_timeout'):
                assert r.get('program')==other.get('program'),(group,task,'diagnosis changed selection')
                assert r.get('portfolio_count')==other.get('portfolio_count')
                assert load(group_roots[group]/group/task/'Full'/'portfolio_diagnostics.json')['candidates']==load(group_roots[group]/group/task/'NoCounterfactualDiagnosis'/'portfolio_diagnostics.json')['candidates'],(group,task,'diagnosis changed portfolio')
                discrete=lambda row:{k:v for k,v in row['statistics'].items() if not k.endswith('milliseconds') and k not in ['wall_clock_seconds','counterfactual_calls']}
                assert discrete(r)==discrete(other),(group,task,'diagnosis changed synthesis work')
    columns=sorted({key for r in csvrows for key in r})
    with (out/'metrics.csv').open('w',newline='',encoding='utf-8') as f:
        writer=csv.DictWriter(f,fieldnames=columns);writer.writeheader();writer.writerows(csvrows)
    (out/'portfolio_audit.json').write_text(json.dumps([{'group':g,'task':t,'mode':m,**v} for (g,t,m),v in audit.items()],indent=2)+'\n',encoding='utf-8')
    def selected(g,m='Full'): return [r for r in groups[g] if r['ablation']==m]
    def totals(rows): return f"{sum(r['train_exact'] for r in rows)}/{len(rows)} ; {sum(r['heldout_exact'] for r in rows)}/{len(rows)}" if rows else 'n/a'
    core=selected('core')[0];rf=selected('regression');held=sum(r['heldout_exact'] for r in rf);train=sum(r['train_exact'] for r in rf)
    assert core['train_exact'] and core['heldout_exact'],'mandatory core target regressed'
    coverage=table(['Mode','03560426 train ; heldout','17 regression','A–J','30 diagnostics'],[[m]+[totals(selected(g,m)) for g in ['core','regression','stress','diagnostic']] for m in MODES])
    baseline=table(['Frozen v0.3R.1 Full set','train ; heldout','R2 Full train ; heldout'],[[g,totals([r for r in load(ROOT/'results/v03r1'/g/'comparison.json') if r['ablation']=='Full']),totals(selected(g))] for g in ['regression','stress','diagnostic']])
    tasks={r['task']:r for r in rf}
    detail=[]
    for task in sorted(tasks):
        r=tasks[task];ca=audit['regression',task,'Full']
        detail.append([task,r['train_exact'],r['heldout_exact'],ca['correct_candidates'],ca['portfolio'],r['failure'],r.get('ambiguity',{}).get('status','external timeout')])
    focused=[]
    for group,task in [('core','03560426'),('regression','grid-without-prev'),('regression','scan-reverse')]:
        for r in [x for x in groups[group] if x['task']==task]:
            s=r['statistics'];ca=audit[group,task,r['ablation']]
            focused.append([task,r['ablation'],f"{int(r['train_exact'])}/{int(r['heldout_exact'])}",ca['correct_candidates'],s.get('equivalence_classes','n/a'),s.get('structural_representatives','n/a'),s.get('max_representatives_per_class','n/a'),s.get('pruned_representatives','n/a'),s.get('cost_bound_reached','n/a'),s.get('selected_let_bindings','n/a'),s.get('selected_ungrounded_literal_cost','n/a'),s.get('first_solution_states','n/a'),s.get('total_expanded_work','n/a'),s.get('exact_verifier_calls','n/a'),round(r['execution_elapsed_seconds'],3)])
    focused_table=table(['Task','Mode','train/held','held-correct portfolio','classes','reps','max/class','observer pruned','C reached','selected lets','selected literal penalty','first exact work','total work','exact calls','process seconds'],focused)
    def mode_row(task,mode): return next(r for r in groups['regression'] if r['task']==task and r['ablation']==mode)
    grid_full=mode_row('grid-without-prev','Full'); grid_small=mode_row('grid-without-prev','NoDiversityPreservation')
    grid_noprior=mode_row('grid-without-prev','NoGroundedLiteralPrior'); scan_full=mode_row('scan-reverse','Full')
    scan_nolet=mode_row('scan-reverse','NoLetSharing');scan_nodiversity=mode_row('scan-reverse','NoDiversityPreservation')
    focused_interpretation=f"""grid-without-prev Full heldout={grid_full['heldout_exact']}，NoDiversityPreservation heldout={grid_small['heldout_exact']}。其 Full 選擇為 `{grid_full.get('program')}`。這組消融不能把恢復單獨歸因於 diversity。

NoGroundedLiteralPrior heldout={grid_noprior['heldout_exact']}，portfolio 中仍有 {audit['regression','grid-without-prev','NoGroundedLiteralPrior']['correct_candidates']} 個 heldout-correct candidates；選中 `{grid_noprior.get('program')}`。如果正確候選已存在而選錯，這是 ranking/inductive bias 的直接證據，不是候選丟失。

scan-reverse Full heldout={scan_full['heldout_exact']}，NoLetSharing heldout={scan_nolet['heldout_exact']}（heldout-correct candidates={audit['regression','scan-reverse','NoLetSharing']['correct_candidates']}），NoDiversityPreservation heldout={scan_nodiversity['heldout_exact']}。Full 的選擇為 `{scan_full.get('program')}`。所有排序、scan、head/tail 和 let 均為固定 Base；完整表格區分候選 coverage 與最終選擇。"""
    unit_table=table(['Mode','actual Learn portfolios','parameterized inventions','actual hits','later work','total work','seconds'],[[r['mode'],str(r['portfolio_sizes']),r['parameterized_inventions'],r['statistics']['invention_hits'],r['statistics']['synthesis_work_after_discovery'],r['statistics']['total_expanded_work'],round(r['seconds'],4)] for r in unit['mode_evidence']])
    certificate_file=out/'base_certificates.json'
    if certificate_file.exists():
        cert=load(certificate_file);cp=load(out/'base_certificates_protocol.json')
        assert cp['solver_fingerprint']==fp
        assert digest(ROOT/'scripts/v03r2_base_certificates.hs')==cp['reference_source_sha256']
        assert digest(certificate_file)==cp['evidence_sha256']
        assert cert['selection_feedback'] is False
        assert all(r['type_checked'] and r['train_exact'] and r['heldout_exact'] for r in cert['certificates'])
        certificate_table=table(['Task','kernel typechecked','reference train','reference heldout','Base code length'],[[r['task'],r['type_checked'],r['train_exact'],r['heldout_exact'],r['base_code_length']] for r in cert['certificates']])
    else:certificate_table='未執行額外 independent Base certificate audit。'
    f_global=next(r for r in selected('stress') if r['task']=='F-global-better')
    f_global_note=f"F-global-better 的自動 Full 選擇 train/heldout={int(f_global['train_exact'])}/{int(f_global['heldout_exact'])}，採用 x-relative displacement 與 source-color arithmetic；它與人工 reference 的 y/bbox reflection 結構不同。有限 heldout exact 不足以證明已恢復 fixture 在所有新輸入上的 intended reflection law；counterfactual ambiguity 仍需單獨審計。"
    failures=table(['Set','Full diagnosis'],[[g,str(dict(collections.Counter(r['failure'] for r in selected(g))))] for g in groups])
    ambiguities=table(['Set','Full concrete underdetermination witnesses','no witness within bounds','timeouts'],[[g,sum(r.get('ambiguity',{}).get('status')=='ObservationallyUnderdetermined' for r in selected(g)),sum(r.get('ambiguity',{}).get('status')=='NoDistinguishingInputFoundWithinBounds' for r in selected(g)),sum(bool(r.get('external_timeout')) for r in selected(g))] for g in groups])
    profiles=[]
    for group,task in [('core','03560426'),('regression','grid-without-prev'),('regression','scan-reverse')]:
        r=next(x for x in selected(group) if x['task']==task);s=r['statistics']
        profiles.append([task,s.get('portfolio_cover_work',0),s.get('shared_alias_work',0),s.get('extraction_work',0),s.get('abstraction_discovery_work',0),s.get('invention_hits',0),s.get('deduction_milliseconds',0),s.get('extraction_milliseconds',0),s.get('discovery_milliseconds',0),s.get('verification_milliseconds',0),round(s.get('wall_clock_seconds',0),3),round(r['execution_elapsed_seconds'],3)])
    profiling=table(['Task','cover work','shared alias work','all extraction work','discovery work','invention hits','deduction ms','extraction ms','discovery ms','exact ms','solver seconds','process seconds'],profiles)
    cover_rows=[]
    cover_out=a.cover_out.resolve()
    if (cover_out/'protocol.json').exists():
        assert load(cover_out/'protocol.json')['fingerprint']==fp
        for group,task in [('core','03560426'),('regression','grid-without-prev'),('regression','scan-reverse')]:
            path=cover_out/group/task/'NoPortfolioCover'
            ep=load(path/'execution.json')['protocol'];assert ep['fingerprint']==fp
            expected_command=list(load(group_roots[group]/group/task/'Full'/'execution.json')['protocol']['command'])
            expected_command[expected_command.index('--mode')+1]='NoPortfolioCover'
            expected_command[expected_command.index('--out')+1]=ep['command'][ep['command'].index('--out')+1]
            assert expected_command==ep['command'],'cover ablation changed other search controls'
            r=load(path/'solution.json');s=r['statistics']
            vsa=load(path/'version_space.json') if not r.get('external_timeout') else None
            cover_rows.append([task,int(r['train_exact']),int(r['heldout_exact']),r['failure'],vsa['root'] if vsa else 'n/a',r.get('portfolio_count','n/a'),s.get('first_solution_states','n/a'),s.get('total_expanded_work','n/a'),round(load(path/'execution.json')['elapsed_seconds'],3)])
        cover_table=table(['Task','train','heldout','failure','symbolic root','portfolio','first exact work','total work','process seconds'],cover_rows)
    else:
        cover_table='額外 NoPortfolioCover 尚未執行；不據此宣稱 cover 的因果增益。'
    deadline_rows=[];resolved_full={}
    deadline_out=a.deadline_out.resolve()
    if (deadline_out/'protocol.json').exists():
        deadline_protocol=load(deadline_out/'protocol.json');assert deadline_protocol['fingerprint']==fp
        for group in groups:
            comparison=deadline_out/group/'comparison.json'
            if not comparison.exists():continue
            for r in load(comparison):
                path=deadline_out/group/r['task']/r['ablation'];ep=load(path/'execution.json')['protocol']
                assert ep['fingerprint']==fp
                primary=next(x for x in groups[group] if x['task']==r['task'] and x['ablation']==r['ablation'])
                primary_command=load(group_roots[group]/group/r['task']/r['ablation']/'execution.json')['protocol']['command']
                def without_out(cmd):
                    cmd=list(cmd); cmd[cmd.index('--out')+1]='<output-directory>';return cmd
                assert without_out(ep['command'])==without_out(primary_command),'deadline run changed search controls'
                if not r.get('external_timeout'): assert r['statistics']['structural_prior_count']==0
                if r['ablation']=='Full': resolved_full[group,r['task']]=r
                deadline_rows.append([group,r['task'],r['ablation'],ep['timeout_seconds'],f"{int(primary['train_exact'])}/{int(primary['heldout_exact'])}",f"{int(r['train_exact'])}/{int(r['heldout_exact'])}",r['failure'],r['statistics'].get('total_expanded_work','n/a'),round(r['execution_elapsed_seconds'],3)])
    deadline_table=table(['Set','Task','Mode','deadline seconds','primary train/held','extended train/held','failure','total work','process seconds'],deadline_rows) if deadline_rows else '未執行額外 deadline 復測。'
    resolved_held=sum(resolved_full.get(('regression',r['task']),r)['heldout_exact'] for r in rf)
    deadline_section=(f"""### 相同搜索 bounds 的額外 deadline 復測

主表使用統一 {protocol['configuration']['timeout']} 秒 deadline。下表僅延長 deadline；executable、input、mode 和 work/cost/saturation bounds 與主協議相同。

{deadline_table}

若以這些復測替換相應 timeout，Full regression heldout coverage 為 {resolved_held}/17；此為額外證據，不是主協議的 {held}/17。
""" if deadline_rows else '')
    timing_outliers=[(g,r['task'],r['ablation'],round(r['execution_elapsed_seconds'],3),round(r['statistics'].get('wall_clock_seconds',0),3)) for g,rows in groups.items() for r in rows if not r.get('external_timeout') and r['execution_elapsed_seconds']-r['statistics'].get('wall_clock_seconds',0)>300]
    timing_note=f"外部計時異常記錄（set/task/mode/process seconds/solver seconds）：`{timing_outliers}`。這些外部等待可能受系統暫停/調度影響，不能當作 synthesis CPU 性能比較；原始記錄保留。" if timing_outliers else '沒有觀察到 process/solver 相差超過 300 秒的外部計時異常。'
    explanations=[];counterexamples=[]
    for group in groups:
        for r in selected(group):
            ca=audit[group,r['task'],'Full']
            if not r['heldout_exact']:
                kind=('external budget/search timeout' if r.get('external_timeout') else
                      'selection / inductive bias: heldout-correct candidate already exists' if ca['correct_candidates'] else
                      'no training-exact candidate in bounded portfolio; expressibility unresolved' if not r['train_exact'] else
                      'bounded portfolio coverage: no heldout-correct candidate; absence is not BaseMissing')
                explanations.append([group,r['task'],r['failure'],kind,r.get('ambiguity',{}).get('status','n/a')])
            ambiguity=r.get('ambiguity',{})
            if ambiguity.get('status')=='ObservationallyUnderdetermined':
                artifact=group_roots[group]/group/r['task']/'Full'/'solution.json'
                counterexamples.append({'group':group,'task':r['task'],**ambiguity,'artifact':artifact.as_posix()})
    (out/'counterfactual_witnesses.json').write_text(json.dumps(counterexamples,indent=2)+'\n',encoding='utf-8')
    failure_explanations=table(['Set','Task','solver taxonomy','post-selection diagnosis','counterfactual audit'],explanations)
    concrete=[]
    for group,task in [('core','03560426'),('regression','grid-without-prev'),('regression','scan-reverse')]:
        evidence=next((x for x in counterexamples if x['group']==group and x['task']==task),None)
        if evidence:
            grid=evidence['distinguishing_input'];nonzero=[(x,y,c) for y,row in enumerate(grid) for x,c in enumerate(row) if c]
            concrete.append(f"### {task}\n\nP1: `{evidence['hypothesis_a']}`\n\nP2: `{evidence['hypothesis_b']}`\n\nDistinguishing input: {len(grid[0])}×{len(grid)}，其全部非零 cells（x,y,color）為 `{nonzero}`；其餘 cells=0。兩個完整 hypothetical predictions 見 [solution.json]({evidence['artifact']})。此 input 未提供真實 output，不參與選擇。")
    concrete_text='\n\n'.join(concrete) or '三個焦點任務未在有限 audit domain 中找到 distinguishing input；這不是唯一性證明。'
    text=f'''# LATIS v0.3R.2

固定 Base、獨立 `solve-v03r2` 已實作。StructuralPriorCount=0；03560426 train/heldout exact。17 個 regression：train={train}/17、heldout={held}/17。這是實測結果，沒有將未達成的 17/17 改寫為完成。

## 可重現協議與資料邊界

`python scripts/check_v03r2_tests.py`，`python scripts/run_v03r2.py --timeout {protocol['configuration']['timeout']}`，再 `python scripts/make_v03r2_report.py`。本報告校驗 {sum(map(len,groups.values()))} 個獨立執行的 source/binary/input fingerprints，並校驗六套 tests PASS。Base SHA256：`{tests['base_sha256']}`，與 R/R.1 完全相同。舊 R/R.1 source 與 frozen data 由 runner 校驗；兼容測試的新輸出保存於 R2 目錄。

本輪 execution orchestration：{'groups 並行、group 內逐題/逐模式順序執行；16 logical cores' if orchestration else '單一 runner 順序執行'}。每題為獨立 solver process，沒有共享 task dictionary。{'實際 group outputs 與 protocol 在 orchestration.json 中記錄；report 直接校验各輸出目錄，不改寫原 command。' if orchestration else ''} 同一 host 的其他負載與 group 競爭可能影響 wall-clock；本輪不宣稱隔離 CPU benchmark 或普遍 wall-clock 加速。離散 search-work/candidate 選擇不依賴調度時間。

最終矩陣前的 hardening 修正了兩個反例：相同 literal multiset 在不同 coefficient/bias slots 不再合併；同名 let 的 strict use 不再讓外部 partial expression 被提到未選中的 lazy branch 之外。兩項均有測試。先前 120 秒的局部矩陣及其 84 個 source snapshots 保留於 `results/v03r2-before-hardening`，不混入本報告統計。最終 deadline 採 {protocol['configuration']['timeout']} 秒，work/cost/depth/frontier bounds 沒有提高。

設定：總工作 budget={protocol['configuration']['budget']}；diagnostic budget={protocol['configuration']['diagnostic_budget']}；effective MDL/prior cost bound={protocol['configuration']['cost']}；每次 saturation refinement 工作上限={protocol['configuration']['saturation_budget']}；deductive recursion safety guard=7，與 R.1 相同；Full 不使用 frontier=32 或 alias≤2。frame/functional observations 自固定 Base 組合生成。沒有增加 Base primitive、neural、cross-task library、sequence/scan/Attach/Progression family，也沒有提高 depth/frontier。

`results/v03r2/protocol.json`、各題 `execution.json` 保存具體 command、hash 與 deadline。`metrics.csv` 保存所有已完成執行的指標；timeout 的缺失計數是 n/a，不能當零。30 ARC 只稱 **PreviouslyOpenedDiagnosticSet**。training labels 用於 specification 與 exact verification；heldout labels 只在固定選擇之後審計 portfolio。hypothetical predictions 也只作後置診斷。

```mermaid
flowchart LR
    T[Training specification] --> L[Generic Learn]
    L --> V[Typed VSA and structural classes]
    V --> C[Shared cover and cost saturation]
    C --> E[Original Grid exact verification]
    E --> P[Training-exact portfolio]
    P --> A[Task-local AU and MDL acceptance]
    A --> X[Checked Base definition expansion]
    X --> L
    P --> R[Fixed MDL and literal-prior selection]
    R --> H[Heldout audit]
    R --> D[Input-only counterfactual audit]
```

H 與 D 均無回流到 Learn 或選擇的邊；acceptance 只使用 training-exact frontier。

## 等價類與結構代表

等價類的 key 是 exact input/environment context + typed denotation vector。上下文透過共享編號儲存，完整資料在 `contexts.json`；不是用可能碰撞的 hash 判定等價。Leaf 記錄 type、FV/dependency、literal/observer provenance、effects、typed structural form 和 MDL。Union/Join 保存約束與子節點；其多個結構代表由 alternatives 表示，不捏造一個單一 FV/signature。exact-verified 根程序以 certificate leaves 保存，原 symbolic DAG 同時保留。

子問題的 denotation 是實際 Base value（已匹配的 Point/FunctionPoint 以 required values 重用），relational ordering keys 則求值。最終 root-certificate 的 denotation 是 exact-rendered Grid 對應的 canonical encoded target Scene：它表示 Render/Encode observation equality，而不宣稱內部 object IDs、list order 等未觀測表示完全相同。這些最後加入的根 certificates 不參與 initializer feedback。需保留此觀測層區別才能正確解讀 JSON。

Full 每個 denotation/signature 保存最佳代表。literal `10` 與 `width(scene)-1`、width/height dependency、不同數值係數、不同 order/key/functional structure 可同時存活。alpha-renaming 和白名單 Base identities（例如 index-0/head、整數 identity、相同 anchor projection）只合併全輸入成立的 syntax identities；不是用 training equality 合併泛化假設。簽名使用線性大小編碼，避免巢狀轉義膨脹。

`pruned_representatives` 計 observer-domain 去重/消融刪除；Full 的正常去重是相同 canonical signature，不能把此欄解讀為所有 saturation-product prune 次數。`structural_representatives` 包括子問題與根 class；root portfolio 大小和 held-correct candidate 數另列。完整類別在 `equivalence_classes.json`，不是只輸出最短兩個 aliases。

## 通用共享與搜索調度

`Sharing` 用既有 Base let 生成 scope-safe CSE。initializer 只編碼一次，每個 reference 仍有成本；可將 sorted list 同時用於 head、seed 內的 anchor 和 tail。它不把可能失敗的 head 移出未選中的 lazy branch，也不跨越被遮蔽的 binder。compiler-generated local lets 在更大 scope 中重算，避免局部 CSE 妨礙全局共享。

單獨替換 seed 的 source 或 displacement observer，可能產生互相不一致的同值 aliases。`AliasSharing` 根據 VSA 的 observational class 替換共享 initializer，同時改變所有 references，再做普通 Base CSE。這能讓 reverse-order 的 seed、anchor 和 tail 使用同一 sorted expression。每個 proposal 都重新 kernel-typecheck、驗證原 training Grid；不根據 heldout 或 hypothetical output 接受它。這是 generic let congruence，沒有 reverse/Attach 專用 witness。

原始 Cartesian product 可能在任何完整根 AST 出現前耗盡 budget。新增 `PortfolioCover` 先遍歷既有 deductive DAG 的完整 witnesses 與 single-hole alternatives，以實際共享成本作局部調度，保留原 DAG 的全部其餘選擇。然後 cost saturation 按 C=1,2,… activation，記住已處理的 correlated products，較昂貴項留在 pending/DAG。cover 是有限的可行候選覆蓋，**不是完整 Cartesian enumeration，也不是全局最優 MDL 證明**。

`cost_bound_reached` 只指 saturation refinement 到達的 stratum，budget 可能在 stratum 內截止。cover 已有的完整候選受 configured cost bound 約束，不能把 C reached 解讀為所有 root representatives 的最大 cost。有限 witness domains、原 7 層 deductive safety guard、forward-terminal policy、工作與 cost bounds 都仍限制 Reachable；沒有宣稱完整 cost-optimal synthesis。

## Grounded-literal prior 與消融定義

ranking = shared code length + 8 × unexplained numeric-literal coding cost + 1 × effect cost。0/1/−1 低成本；其他 Int 及 Coord/Vec/Size components 按數值 bit length 加罰；有限 color/anchor/D4 enums 不加該罰。input-grounded arithmetic 不另加 task-specific literal penalty。這是明示 prior，會影響 effective cost scheduling 和選擇；NoGroundedLiteralPrior 將它設為零，不能將實測勝利推成此 prior 永遠正確。

`grounded_expressions` 是 compatibility metric：計 zero-unexplained-numeric-penalty expressions，包含 universal constants，不能等同於全部表達式因果上依賴 input。input dependence 看 FV/dependency/observer provenance；literal provenance 保存實際值。CSV 另從 selected typed AST 計 universal-small 和 unexplained numeric components（含 Coord/Vec/Size components），與 selected penalty 分開，避免將 coding cost 當作 literal 次數。

NoDiversityPreservation 的有限 observer/domain 與每次 extraction node 保留一個代表；FixedAliasCap 在這些位置保留兩個。relational key constraints 的不同 key denotations 不被當成同值 aliases；online rounds 的舊 portfolio 與新 alternatives 仍合併，故最終 root portfolio 可以多於該局部 cap。這不是對最終 union 再做硬性 post-hoc cap。NoLetSharing 關閉 CSE、shared-initializer feedback 和 generic let deduction。BeamSearchLegacy 使用原 depth/frontier ranked materialization。NoCounterfactualDiagnosis 關閉後置 input audit；它與 Full 的 selected program/portfolio 一致性已由 generator 校驗。

## 完整消融

每格為 train exact ; heldout exact。

{coverage}

{failures}

### 與凍結 R.1 的覆蓋比較

{baseline}

此表比較同一固定資料的 coverage；兩版 observer、ranking、materialization protocol 不同，不作 wall-clock 或單一機制的受控比較。上面的本輪消融才使用相同 binary、總 budget、cost 與 input hashes。

## 17 個 regression 的 portfolio 審計

held-correct portfolio 數量只在選擇後計算，不回饋 search 或 ranking。

{table(['Task','train','heldout','held-correct candidates','portfolio','failure','ambiguity diagnosis'],detail)}

## 三個重點目標與成本

{focused_table}

{focused_interpretation}

`first_solution_states` 在首次 original Grid exact verification 成功時記錄，發生於 online discovery 之前；它不是 hypothetical probe work。total work 包括 deduction、row comparisons、definition expansion、cover、alias substitution、saturation 和 discovery 的離散操作。exact calls 計 cache misses 的原 training verifier calls；最終 heldout portfolio audit 不混入它。cost/observer 列、let sharing、grounded/ungrounded coding cost 和 exact calls 的完整值在 CSV/JSON。

{profiling}

extraction 包含 cover、shared aliases 和 saturation。solver seconds 與 process seconds 分開：後者還包含 ambiguity diagnosis、heldout portfolio audit 和 JSON export。離散工作不是 CPU instruction 或完整 eval steps，不能用它推論普遍 wall-clock 加速。階段毫秒採 integer resolution；exact verification 對每次 cache miss 的 duration 先取整再累加，故很多少於 1ms 的 calls 可顯示為 0ms，不能解讀成沒有驗證或零 CPU cost。

### 額外 portfolio-cover 消融

NoPortfolioCover 同時關閉 complete-witness cover 與 correlated shared-initializer extraction；cost strata、25k refinement budget、總 budget 和 Base 不變。它測試這組通用 materialization 改動，不能將差異全部歸因於單一子機制。

{cover_table}

{deadline_section}

{timing_note}

## Counterfactual ambiguity

{ambiguities}

診斷檢查最多 12 個按該 mode ranking 的 structural hypotheses，以 training inputs 的尺寸、位置、角落像素與背景擾動構造最多 128 個 hypothetical inputs。按 object count、canvas area、文字順序尋找第一個兩個有效 predictions 不同的 input。這是有限 domain 中的簡單性次序，**不是全輸入空間的 argmin 證明**。輸出 `ObservationallyUnderdetermined`、distinguishing input 與兩個 predictions；selection_feedback=false。沒有找到 witness 只表示此 domain/pair bound 內未找到，不能表示規則唯一。

{concrete_text}

完整 Full witnesses 亦集中保存於 `results/v03r2/counterfactual_witnesses.json`。

### 剩餘錯誤的搜索 / 選擇診斷

{failure_explanations}

這是固定選擇後的診斷，不把 heldout-correct candidate 或 hypothetical predictions 送回合成。solver 的兼容 taxonomy 在 train exact / heldout incorrect 時仍使用 `AbstractionMissing`；上表進一步區分 selection bias、有限候選覆蓋和 concrete training underdetermination。它們可以同時發生，不應互相替代。

### 額外 constructive Base certificates

{certificate_table}

這些人工 reference 僅按原 `ARC.LatentStress` fixture 方程寫成 ordinary Base AST，使用 map、argmin/argmax、let、arithmetic、scan 或 if。它們獨立 kernel-typecheck 並在固定 train/heldout data 上驗證，從不導入 Learn、TSL、frontier 或答案選擇，也不計為 solver success。完整 AST 在 `base_certificates.json`，reference source/evidence hashes 在旁邊的 protocol。它們證明該有限資料存在 Base program；若 learner 的 portfolio 仍沒有這種候選，問題在 operational reachability/coverage，不是缺少 Base primitive。這不是所有新輸入的正確性證明。fold-bbox 沒有此 certificate，仍保持 unknown。

{f_global_note}

## 額外：全自動 parameterized abstraction 與兼容性

scalar session 的 prefix frontier 來自 actual Learn：環境 coefficient=9，輸入 −3/2/8，輸出 9x+7；後續同一 session 使用 coefficient=11、offset=2 與新的函數 graph 11x−2。沒有手工注入 AST frontier。typed AU/lifting 發現 closed definitions，後續 Learn 以 Base expansion 真正命中，並在聲明的外部環境上驗證未供 Learn 的 scalar x=13。這些是單 task 的相關 demands，沒有跨題字典。

{unit_table}

相關原始資料為 `unit_evidence.json`。此 harness 的 root-only metadata/verification counters 不用作 ARC 成本估計；有意只比較其 demand work、discovery 和 actual hits。R.1 六模式 feedback stress 在兼容測試中再次通過，輸出 `r1-compatibility-evidence.json`；該結果屬於 unchanged R.1 路徑，不冒充 R2 的新增性能勝利。

本輪 scalar Full 的 invention 擴大後續 portfolio，實際命中 definition expansion；但表中的 later/total work 與 seconds 高於 NoOnlineAbstraction。這證明 feedback 可達，而不是本輪新增的搜索加速證據。下一階段需要以候選覆蓋相同的 workload 測量 invention 是否節省工作，避免用變大的 portfolio 冒充速度改善。

## 最終兩個問題

**保留 structural diversity 是否能在不暴力擴大搜索的情況下恢復泛化候選？** 以本輪正式表格為準：固定 Base、相同 deductive safety guard 與總 budget 下，grid-without-prev 和 scan-reverse 的候選/選擇結果及消融對照已逐項列出。成功需要 structural representatives、通用共享/initializer congruence 和完整 witness 覆蓋的配合；不能把全部改善單獨歸因於取消 alias cap。候選數與實際工作量可增加，沒有宣稱所有任務更快或全部 Base 程序可達。

**哪些 remaining ambiguity 是搜索問題，哪些是 training data 不可辨識？** 正確 heldout AST 若已在 portfolio 而未被選中，是 ranking/inductive bias 問題；若有限 pipeline 未構造該候選，是 reachability/representation/search coverage 問題，不能由失敗推出 BaseMissing。兩個 training-exact 程序在 concrete hypothetical input 上輸出不同，是這兩個假設對 training data 的不可辨識證據；提高搜索預算不能替這個 input 提供真實標籤。fold-bbox 保持 expressibility unknown（除非未來取得 constructive/impossibility certificate），沒有添加 bbox/clone/union 專用 primitive 來達成數字目標。

本階段未加入 cross-task DreamCoder library。下一步優先處理上述仍缺候選的 operational bottlenecks，擴充可靠的 ambiguity/portfolio coverage 證據，再評估跨題 library 是否有獨立增益。
'''
    a.report.resolve().write_text(text,encoding='utf-8')
    print(f'report={a.report.resolve()} regression={train}/17 train, {held}/17 heldout; verified {len(csvrows)} runs')
if __name__=='__main__':main()
