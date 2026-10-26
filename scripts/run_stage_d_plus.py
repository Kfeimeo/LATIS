"""Append-only D+ train-only experiments, one frozen binary, resumable phases."""
import argparse
import csv
import hashlib
import json
import shutil
import struct
import subprocess
import sys
import time
import zipfile
from collections import defaultdict
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parent))
import arc_train_only as base
import verify_stage_d_witness as checker
from arc_stage_d import verify_witness as check_pixels

ROOT=base.ROOT
CONFIGS=['D0_Frozen','Budget4x','Compose3','Param3','Combined3_4x','Extended4_8x']
SCOPES=['ShapeDecomposition','SizeRule','Alignment','LegacyRelation','TypedParameter','ParameterVSA','Composition','Execution','Render']
def read(p): return json.loads(Path(p).read_text(encoding='utf-8'))
def write(p,v):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    p.write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()

def parse_events(path):
    """Self-describing eventlog; tolerate incomplete trailing event after kill."""
    data=Path(path).read_bytes(); pos=0; types={}; events=[]; markers=[]
    def take(fmt):
        nonlocal pos
        size=struct.calcsize(fmt); out=struct.unpack_from(fmt,data,pos); pos+=size
        return out[0] if len(out)==1 else out
    try:
        assert take('>I')==0x68647262
        assert take('>I')==0x68657462
        while True:
            tag=take('>I')
            if tag==0x68657465: break
            assert tag==0x65746200
            n,size=take('>H'),take('>h'); length=take('>I');pos+=length
            extra=take('>I');pos+=extra;assert take('>I')==0x65746500;types[n]=size
        assert take('>I')==0x68647265 and take('>I')==0x64617462
        while pos+2<=len(data):
            tag=take('>H')
            if tag==65535: break
            stamp=take('>Q')/1e9; size=types[tag]; n=take('>H') if size<0 else size
            if pos+n>len(data): break
            payload=data[pos:pos+n];pos+=n
            if tag in (19,58):
                msg=payload.decode('utf-8','replace')
                if msg.startswith('latis-diag:'):
                    event=json.loads(msg[len('latis-diag:'):]);event['monotonic_seconds']=stamp;events.append(event)
                else: markers.append((stamp,msg))
    except (struct.error,KeyError,AssertionError,ValueError): pass
    starts=[t for t,m in markers if m=='latis-search-start']
    origin=min(starts) if starts else None
    for event in events: event['elapsed_seconds']=event['monotonic_seconds']-origin if origin is not None else None
    exact=[t-origin for t,m in markers if m=='latis-train-exact' and origin is not None]
    ends=[t-origin for t,m in markers if m=='latis-search-end' and origin is not None]
    return events,{'first_train_exact_seconds':min(exact) if exact else None,'total_to_budget_seconds':max(ends) if ends else None,'eventlog_partial':pos<len(data)-2}

def enrich_events(events,meta,record):
    common=dict(meta,case_count=record.get('diagnostics',{}).get('train_pairs'))
    result=[]
    for i,event in enumerate(events):
        event=dict(event)
        # The legacy D combination counter also counts the representative cap.
        # Retain that raw flag, but never attribute a hit to a limit not reached.
        if event.get('scope')=='Composition' and 'budgets' in event:
            budgets={k:dict(v) for k,v in event['budgets'].items()}
            for key in ['fit_representatives','parameter_combinations']:
                b=budgets.get(key)
                if b and b.get('hit') and b.get('used',0)<b.get('limit',0):
                    b['raw_grouped_hit']=b['hit'];b['hit']=False;b['audit_note']='Grouped combination/fit counter; this particular limit was not reached'
            event['budgets']=budgets
        item={**common,'ordinal':i,'goal_type':None,'trigger':None,'parent_id':None,'program_hash':None,
              'attempted':None,'evaluated':None,'rejected_type':None,'invalid_domain':None,
              'param_fit_count':None,'composed_candidates_evaluated':None,'render_attempts':None,
              'render_mismatches':None,'train_exact_candidates':None,'depth_counts':None,
              'remaining_frontier_count':None,'frontier_nonempty':None,'deferred_count':None,
              'representatives_dropped_or_deferred':None,'exhaustiveness':'Unknown',
              'exhaustiveness_evidence':'No complete finite-universe ledger at this checkpoint',
              'first_fit_work':None,'first_fit_seconds':None,'first_full_solution_work':None,
              'first_full_solution_seconds':None,'first_fit_measurement_note':'Inner-template first fit not separately timed; terminal checkpoint and full-grid first-fit marker retained',
              'total_work':None,'total_seconds':None,**event}
        result.append(item)
    # Terminal ledger for every scope, including interrupted and never entered.
    for scope in SCOPES:
        existing=[e for e in result if e['scope']==scope]
        interrupted=record['status'] in ('timeout','runtime_error')
        completed=any(e.get('event')=='completed' for e in existing)
        result.append(dict(common,ordinal=len(result),scope=scope,branch_id='terminal.'+scope,parent_id=None,
            grammar_version='Dplus-v1',event='task-terminal',stop_reason=(('Timeout' if record['status']=='timeout' else 'InternalError') if interrupted and existing and not completed else 'NotEntered' if not existing else 'FoundFit' if record.get('train_exact') else 'NoFitYet'),
            reason=('No event before interruption; entry state unknown' if interrupted and not existing else 'No scope checkpoint reached' if not existing else 'See all retained branch events'),
            exhaustiveness='Unknown',remaining_frontier_count=None,frontier_nonempty=None,
            first_full_solution_work=(record.get('counters') or {}).get('first_solution_work') if record.get('first_train_exact_seconds') is not None else None,
            first_full_solution_seconds=record.get('first_train_exact_seconds'),total_work=record.get('search_work'),
            total_seconds=record.get('total_to_budget_seconds'),partial_work=(max([e.get('partial_work',0) for e in events]+[0])+max([e.get('partial_d_work',0) for e in events]+[0])) if events else None))
    return result

def failure_evidence(events,record):
    labels=[]; stage={}
    for scope in SCOPES:
        es=[e for e in events if e['scope']==scope and e.get('event')!='task-terminal']
        interrupted=record['status'] in ('timeout','runtime_error')
        stage[scope]={'reached':bool(es) if es or not interrupted else None,'blocked':any(e.get('stop_reason') in ('InvalidPrecondition','NoFitYet') for e in es),
            'exhausted':any(e.get('exhaustiveness')=='ProvenExhausted' for e in es),
            'truncated':any(e.get('stop_reason')=='BudgetCut' for e in es),
            'timeout':record['status']=='timeout' and not any(e.get('event')=='completed' for e in es) if es else None}
    if record['status']=='timeout': labels.append('timeout')
    if any(v['truncated'] for v in stage.values()): labels.append('budget_truncated')
    if stage['Composition']['reached'] is False: labels.append('blocked_before_unified_search')
    if any(e['scope']=='TypedParameter' and e.get('param_fit_count')==0 for e in events): labels.append('param_no_fit')
    if any(e['scope']=='Composition' and e.get('event')=='completed' and not e.get('train_exact_candidates') for e in events): labels.append('composition_no_fit')
    if any(e.get('render_mismatches',0) for e in events): labels.append('render_mismatch')
    if not labels: labels=['unknown']
    if record.get('train_exact'): labels=['train_exact']+labels
    rejects=[e for e in events if e.get('stop_reason') in ('InvalidPrecondition','BudgetCut','NoFitYet') and e.get('event')!='task-terminal']
    return {'stage_flags':stage,'labels':labels,'primary_label':labels[0],
        'first_rejection':rejects[0] if rejects else None,'last_blocking_branch':rejects[-1] if rejects and not record.get('train_exact') else None,
        'alternative_blocking_branches':sorted({(e['scope']+':'+e['stop_reason']) for e in rejects}),
        'parameters_fit_without_solution':not record.get('train_exact') and any((e.get('param_fit_count') or 0)>0 for e in events),
        'composition_executes_but_pixels_fail':any(e.get('render_mismatches',0) for e in events),
        'whole_task_exhaustiveness':'Unknown','whole_task_exhaustiveness_evidence':'No global grammar ledger; per-branch evidence never proves whole task exhaustion'}

def prepare(args):
    out=Path(args.out)
    if (out/'data_manifest.json').exists(): raise RuntimeError('Existing batch: use resume commands; prepare never overwrites')
    settings=SimpleNamespace(out=str(out),source='data/arc1-training',binary=args.binary,limit=0,tasks='',workers=args.workers,feature_timeout_ms=300000,v04_timeout_ms=60000,r2_timeout_ms=60000)
    base.cmd_prepare(settings)
    code=read(out/'code_version.json'); code.update(run_id=out.name,configs=CONFIGS,frozen_binary='solver.exe')
    code['feature_stage']='Stage D+ named configurations over Stage D FullD; diagnostics only observer; see effective_config_scalars and exact config text per record'
    code['r2_stage']='not executed'
    shutil.copyfile(args.binary,out/'solver.exe')
    code['binary_sha256']=sha(out/'solver.exe')
    code['compiler']=subprocess.check_output(['E:/ghcup/ghc/9.10.3/bin/ghc.exe','--version'],text=True).strip()
    code['budgets'].update(wall_seconds=300,rts_max_heap='2g',hard_kill_grace_s=10,max_eventlog_bytes=134217728,formal_configs=['D0_Frozen','Budget4x','Combined3_4x'])
    with zipfile.ZipFile(out/'source_snapshot.zip','w',zipfile.ZIP_DEFLATED) as z:
        for folder in ('src','app','test','scripts','docs'):
            for path in sorted((ROOT/folder).rglob('*')):
                if path.suffix in ('.hs','.py','.ps1','.md'): z.write(path,path.relative_to(ROOT))
        z.write(ROOT/'latis.cabal','latis.cabal')
    code['source_archive_sha256']=sha(out/'source_snapshot.zip')
    write(out/'code_version.json',code)
    (out/'git.diff').write_text(base.git('diff'),encoding='utf-8')
    history={p.parent.name:read(p) for p in (ROOT/'results/stage_d/full_p0/arc/tasks').glob('*/stage-d-FullD.json')}
    solved=sorted(k for k,v in history.items() if v.get('train_exact')); assert len(solved)==20
    buckets=defaultdict(list)
    for tid,r in sorted(history.items()):
        if tid in solved: continue
        d=r.get('stage_d') or {};structural=r.get('diagnostics') or {}
        tags=['unified_unreached'] if not d.get('d_triggered') else ['unified_reached']
        tags+=['param_cut'] if d.get('d_param_truncated') else []
        tags+=['compose_cut'] if d.get('d_combination_truncated') else []
        tags+=['deferred'] if d.get('d_deferred_parameters') else []
        tags+=['canvas_change'] if not structural.get('same_canvas',True) else []
        tags+=['cardinality_change'] if not structural.get('equal_object_counts',True) else []
        tags+=['render_failure'] if r.get('realization_mismatches') or r.get('realization_render_errors') else []
        tags+=['legacy_no_fit'] if (r.get('stage_c') or {}).get('c_relation_triggered') else []
        for tag in tags: buckets[tag].append(tid)
    chosen=[]
    while len(chosen)<40:
        for tag in sorted(buckets):
            remaining=[x for x in buckets[tag] if x not in chosen]
            if remaining and len(chosen)<40: chosen.append(remaining[0])
    write(out/'selection.json',{'rule':'Sorted tag round-robin; first unselected task ID per tag; no pilot outcome consulted',
        'buckets':dict(buckets),'pilot_unsolved':chosen,'positive_controls':solved,'extended_subset':chosen[:8],
        'formal_depth_config':'Combined3_4x','formal_selection_rule':'Preselected interaction configuration before pilot, not selected by ARC fit count'})
    print('prepared',out,flush=True)

def run_one(out,phase,tid,cfg,seconds=300,task_file=None,force_crash=False):
    code=read(out/'code_version.json');binary=(out/'solver.exe').resolve()
    assert sha(binary)==code['binary_sha256']
    dest=out/phase/'tasks'/tid/cfg; dest.mkdir(parents=True,exist_ok=True)
    result=dest/('stage-d-'+cfg+'.json'); diagfile=dest/'search_diagnostics.json'
    if result.exists() and diagfile.exists(): return read(result)
    recovering=result.exists()
    task_file=Path(task_file or out/'train_only'/(tid+'.json')).resolve()
    data=read(task_file); assert data['test']==[]
    eventlog=(dest/'search.eventlog').resolve()
    command=[str(binary),'arc-train-only-stage','--stage','stage-d-'+cfg,'--task',str(task_file),'--out',str(dest.resolve()),'--timeout-ms',str(int(seconds*1000)),'+RTS','-M2g','-T','-l-au','-ol'+str(eventlog),'-RTS']
    start=time.monotonic();killed=False;exit_code=None
    # A bounded parent watchdog also monitors log size; completed events survive.
    if not recovering:
        if eventlog.exists():
            previous=dest/'interrupted_attempts'/datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%S%fZ')
            previous.mkdir(parents=True)
            for name in ['search.eventlog','stdout.txt','stderr.txt']:
                if (dest/name).exists(): shutil.copyfile(dest/name,previous/name)
        with (dest/'stdout.txt').open('w',encoding='utf-8') as stdout,(dest/'stderr.txt').open('w',encoding='utf-8') as stderr:
            proc=subprocess.Popen(command,cwd=ROOT,stdout=stdout,stderr=stderr)
            while proc.poll() is None:
                if time.monotonic()-start>seconds+10 or (eventlog.exists() and eventlog.stat().st_size>134217728) or (force_crash and time.monotonic()-start>.3):
                    proc.kill();proc.wait();killed=True;break
                time.sleep(.1)
        exit_code=proc.returncode
    if result.exists(): rec=read(result)
    else: rec={'status':'runtime_error' if force_crash else 'timeout' if killed else 'runtime_error','train_exact':False,'program':None,'search_work':None,'counters':None,'stage_d':None,'detail':'injected crash' if force_crash else 'parent watchdog' if killed else 'process exit without result','diagnostics':{'train_pairs':len(data['train'])}}
    if result.exists() and not (dest/'solver_record.json').exists(): shutil.copyfile(result,dest/'solver_record.json')
    rec.update(driver_seconds=rec.get('driver_seconds',rec.get('wall_clock_seconds')) if recovering else time.monotonic()-start,
        run_id=code['run_id'],binary_sha256=code['binary_sha256'],task_id=tid,configuration=cfg,phase=phase,timeout_seconds=seconds,
        hard_kill=killed,exit_code=exit_code,recovered_binary_record=recovering,runner_source_sha256=sha(__file__))
    if rec['status'] in ('timeout','runtime_error'): rec.update(search_work=None,counters=None,stage_d=None)
    raw_events,timing=parse_events(eventlog) if eventlog.exists() else ([],{})
    rec.update(timing)
    rec['solve_at_60s']=rec.get('first_train_exact_seconds') is not None and rec['first_train_exact_seconds']<=60
    rec['solve_at_300s']=rec.get('first_train_exact_seconds') is not None and rec['first_train_exact_seconds']<=300
    meta={'task_id':tid,'config':cfg,'run_id':code['run_id'],'binary_sha256':code['binary_sha256'],'phase':phase}
    events=enrich_events(raw_events,meta,rec)
    post_start=time.monotonic()
    valid=0
    if rec.get('train_exact'): assert len(rec.get('execution_witnesses') or [])==len(data['train'])
    for pair,w in zip(data['train'],rec.get('execution_witnesses') or []):
        assert w['train_exact'] and w['grid']==pair['output']
        check_pixels(w);checker.check(w,pair['input']);valid+=1
    rec['independent_train_witnesses_verified']=valid
    rec['diagnostic_postprocess_seconds']=time.monotonic()-post_start
    rec['eventlog_bytes']=eventlog.stat().st_size if eventlog.exists() else None
    if rec.get('config'):
        import re
        rec['effective_config_scalars']={key:(value=='True' if value in ('True','False') else int(value)) for key,value in re.findall(r'\b(\w+) = (True|False|-?\d+)\b',rec['config'])}
    write(diagfile,{'metadata':meta,'events':events,'failure_evidence':failure_evidence(events,rec),'trace_truncated':bool(killed),'overhead':rec.get('diagnostic_overhead')})
    write(result,rec)
    return rec

def run_jobs(out,jobs,workers):
    start=time.monotonic()
    with ThreadPoolExecutor(max_workers=workers) as pool:
        fs=[pool.submit(run_one,out,*j) for j in jobs]
        for i,f in enumerate(as_completed(fs),1):
            r=f.result()
            if i%10==0 or r.get('train_exact') or r['status'] in ('timeout','runtime_error'):
                print(f"[{i}/{len(fs)}] {r['phase']} {r['task_id']} {r['configuration']} {r['status']} t={time.monotonic()-start:.0f}s",flush=True)

def phase(args):
    out=Path(args.out);sel=read(out/'selection.json');manifest=read(out/'data_manifest.json');ids=[t['task_id'] for t in manifest['tasks']]
    assert manifest['combined_sha256_of_task_hashes']==read(ROOT/'results/stage_d/full_p0/arc/data_manifest.json')['combined_sha256_of_task_hashes']
    assert args.workers==read(out/'code_version.json')['budgets']['workers']
    for t in manifest['tasks']:
        path=out/t['train_only_file']
        assert sha(path)==t['train_only_sha256'] and read(path)['test']==[]
    if args.command=='baseline': jobs=[('baseline',t,'D0_Frozen') for t in ids]
    elif args.command=='regression':
        jobs=[('regression',t,'D0_Off') for t in sel['positive_controls']]
        # Re-run historical mechanisms with on/off, train only. Heldout stays outside solver.
        for p in sorted((ROOT/'results/stage_d/full_p0/mechanism').glob('*.data.json')):
            data=read(p);tid=p.name.replace('.data.json','')
            task=out/'mechanism_train'/f'{tid}.json'
            if not task.exists(): write(task,{'train':data['train'],'test':[]})
            jobs += [('mechanism',tid,c,300,task) for c in ['D0_Frozen','D0_Off']]
        slow=out/'train_only/0dfd9992.json'
        jobs += [('fault_controls','timeout-control','D0_Frozen',.001,slow,False),('fault_controls','crash-control','D0_Frozen',300,slow,True)]
    elif args.command=='pilot':
        # D0 results are reused from completed baseline, explicitly indexed in report.
        assert all((out/'baseline/tasks'/t/'D0_Frozen/search_diagnostics.json').exists() for t in ids)
        assert read(out/'validation/regression_audit.json')['passed'], 'D0 regression gate required before scaling'
        controls=sel['positive_controls']+sel['pilot_unsolved']
        jobs=[('pilot',t,c) for t in controls for c in CONFIGS[1:-1]]+[('extended',t,'Extended4_8x') for t in sel['extended_subset']]
    elif args.command=='formal':
        assert read(out/'validation/regression_audit.json')['passed'], 'D0 gate required'
        assert all((out/'pilot/tasks'/t/c/'search_diagnostics.json').exists() for t in sel['pilot_unsolved']+sel['positive_controls'] for c in CONFIGS[1:-1]), 'Complete pilot before formal'
        jobs=[('formal',t,c) for t in ids for c in ['Budget4x','Combined3_4x']]
    elif args.command=='window': jobs=[('window60',t,c,60) for t in sel['positive_controls'][:3]+sel['pilot_unsolved'][:3] for c in ['D0_Frozen','Budget4x','Combined3_4x']]
    else: raise ValueError(args.command)
    run_jobs(out,jobs,args.workers)

def main():
    p=argparse.ArgumentParser();p.add_argument('command',choices=['prepare','baseline','regression','pilot','formal','window'])
    p.add_argument('--out',required=True);p.add_argument('--binary',default='build/latis-stage-d-plus.exe');p.add_argument('--workers',type=int,default=4)
    args=p.parse_args();prepare(args) if args.command=='prepare' else phase(args)
if __name__=='__main__':main()
