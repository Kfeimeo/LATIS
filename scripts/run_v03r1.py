"""Bounded v0.3R.1 ablations; separate outputs and immutable old datasets."""
import argparse
import datetime
import hashlib
import json
import os
import pathlib
import subprocess
import time
from run_v03r import validate_inputs, digest, ROOT, CABAL

MODES=['Full','NoOnlineAbstraction','PostHocOnly','NoAntiUnification','NoLambdaLifting','NoNewWitnessCoverage','LegacyFamilies']

def main():
    p=argparse.ArgumentParser()
    p.add_argument('--out',type=pathlib.Path,default=ROOT/'results/v03r1')
    p.add_argument('--groups',nargs='+',choices=['core','regression','stress','diagnostic'],default=['core','regression','stress','diagnostic'])
    p.add_argument('--modes',nargs='+',choices=MODES,default=MODES)
    for key,value in [('budget',250000),('diagnostic-budget',25000),('depth',7),('frontier',32),('branches',32),('timeout',90),('rounds',2),('inventions',6),('ast-size',96),('parameters',4)]:
        p.add_argument('--'+key,type=int,default=value)
    p.add_argument('--skip-build',action='store_true')
    p.add_argument('--tests',action='store_true')
    p.add_argument('--force',action='store_true')
    a=p.parse_args()
    assert all(getattr(a,key)>0 for key in ['budget','diagnostic_budget','depth','frontier','branches','timeout','rounds','inventions','ast_size','parameters'])
    out=a.out.resolve()
    for old in ['results/v03r','results/v03']:
        old=(ROOT/old).resolve()
        assert old!=out and old not in out.parents, 'preserve old experiments'
    manifest,reg,stress=validate_inputs()
    out.mkdir(parents=True,exist_ok=True)
    if not a.skip_build:
        subprocess.run(CABAL+['build','all','--offline'],cwd=ROOT,check=True)
    binary=pathlib.Path(subprocess.check_output(CABAL+['list-bin','exe:latis'],cwd=ROOT,text=True).strip())
    sources=list((ROOT/'src').rglob('*.hs'))+list((ROOT/'test').rglob('*.hs'))+[ROOT/'latis.cabal',ROOT/'app/Main.hs',ROOT/'scripts/run_v03r.py',pathlib.Path(__file__)]
    fp={'binary_sha256':digest(binary),'source_sha256':{x.relative_to(ROOT).as_posix():digest(x) for x in sorted(sources)}}
    previous=json.loads((ROOT/'results/v03r/protocol.json').read_text())
    base='src/Language/Induced/Base.hs'
    assert fp['source_sha256'][base]==previous['fingerprint']['source_sha256'][base], 'fixed Base changed'
    groups={'core':[('03560426',ROOT/'data/03560426.json')], 'regression':[(x.parent.name,x) for x in reg],
            'stress':[(x.parent.name,x) for x in stress], 'diagnostic':[(x,ROOT/'data/arc1-frozen'/f'{x}.json') for x in manifest['task_ids']]}
    lock={'version':'LATIS-v0.3R.1','fingerprint':fp,'fixed_base_sha256':fp['source_sha256'][base],
          'frozen_manifest_hash':manifest['hash'],'diagnostic_label':'PreviouslyOpenedDiagnosticSet',
          'configuration':{k:v for k,v in vars(a).items() if k!='out'},
          'task_sha256':{str(path.relative_to(ROOT)):digest(path) for rows in groups.values() for _,path in rows}}
    (out/'protocol.json').write_text(json.dumps(lock,indent=2)+'\n',encoding='utf-8')
    if a.tests:
        env=dict(os.environ,LATIS_R1_STRESS_OUT=str(out/'abstraction_stress.json'))
        with (out/'tests.log').open('w',encoding='utf-8') as log:
            subprocess.run(CABAL+['test','all','--offline','--test-show-details=direct'],cwd=ROOT,env=env,stdout=log,stderr=subprocess.STDOUT,check=True)
    for group in a.groups:
        rows=[]
        modes=[m for m in a.modes if group!='diagnostic' or m in ['Full','LegacyFamilies']]
        for task,path in groups[group]:
            for mode in modes:
                dest=out/group/task/mode
                dest.mkdir(parents=True,exist_ok=True)
                budget=a.diagnostic_budget if group=='diagnostic' else a.budget
                command=[str(binary),'solve-v03' if mode=='LegacyFamilies' else 'solve-v03r1','--task',str(path),'--out',str(dest),'--budget',str(budget),'--branches',str(a.branches)]
                if mode=='LegacyFamilies': command+=['--solutions','128']
                else:
                    command+=['--mode',mode]
                    for key in ['depth','frontier','rounds','inventions','ast_size','parameters']:
                        command+=['--'+key.replace('_','-'),str(getattr(a,key))]
                protocol={'fingerprint':fp,'command':command,'input_sha256':digest(path),'timeout_seconds':a.timeout,'group':group,'task':task,'ablation':mode}
                execution=dest/'execution.json'
                result=dest/'solution.json'
                cache=not a.force and execution.exists() and result.exists() and json.loads(execution.read_text())['protocol']==protocol
                if not cache:
                    for name in ['solution.json','induced_tsl.json','induced_tsl_trace.md','version_space.json','base_registry.json','portfolio_diagnostics.json']:
                        (dest/name).unlink(missing_ok=True)
                    start=time.monotonic()
                    with (dest/'execution.log').open('w',encoding='utf-8') as log:
                        try:
                            subprocess.run(command,cwd=ROOT,stdout=log,stderr=subprocess.STDOUT,timeout=a.timeout,check=True)
                        except (subprocess.TimeoutExpired,subprocess.CalledProcessError) as exc:
                            timeout=isinstance(exc,subprocess.TimeoutExpired)
                            result.write_text(json.dumps({'train_exact':False,'heldout_exact':False,'failure':'SearchFailure' if timeout else 'ImplementationBug','failure_evidence':str(exc),'external_timeout':timeout,'statistics':{'wall_clock_seconds':time.monotonic()-start}}),encoding='utf-8')
                    execution.write_text(json.dumps({'protocol':protocol,'elapsed_seconds':time.monotonic()-start,'finished_at':datetime.datetime.now(datetime.timezone.utc).isoformat()},indent=2),encoding='utf-8')
                r=json.loads(result.read_text())
                r.update(task=task,ablation=mode,input_sha256=digest(path))
                if group=='diagnostic': r['evaluation_set']='PreviouslyOpenedDiagnosticSet'
                rows.append(r)
                (out/group/'comparison.json').write_text(json.dumps(rows,indent=2)+'\n',encoding='utf-8')
                print(f"{group}/{task}/{mode}: train={r['train_exact']} held={r['heldout_exact']} failure={r['failure']}",flush=True)
    validate_inputs()

if __name__=='__main__': main()
