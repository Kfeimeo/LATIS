"""Independent, fingerprinted R2 runs. No heldout label enters solver search."""
import argparse,datetime,json,os,pathlib,subprocess,time
from run_v03r import ROOT,validate_inputs,digest
MODES=['Full','NoDiversityPreservation','FixedAliasCap','NoLetSharing','NoGroundedLiteralPrior','BeamSearchLegacy','NoCounterfactualDiagnosis']
def main():
    p=argparse.ArgumentParser()
    p.add_argument('--out',type=pathlib.Path,default=ROOT/'results/v03r2')
    p.add_argument('--binary',type=pathlib.Path,default=ROOT/'build/latis-r2-final.exe')
    p.add_argument('--groups',nargs='+',choices=['core','regression','stress','diagnostic'],default=['core','regression','stress','diagnostic'])
    p.add_argument('--modes',nargs='+',choices=MODES+['NoPortfolioCover'],default=MODES)
    p.add_argument('--tasks',nargs='+')
    p.add_argument('--budget',type=int,default=250000)
    p.add_argument('--diagnostic-budget',type=int,default=25000)
    p.add_argument('--cost',type=int,default=96)
    p.add_argument('--saturation-budget',type=int,default=25000)
    p.add_argument('--timeout',type=int,default=120)
    p.add_argument('--force',action='store_true')
    a=p.parse_args(); manifest,reg,stress=validate_inputs()
    assert min(a.budget,a.diagnostic_budget,a.cost,a.timeout,a.saturation_budget)>0
    out=a.out.resolve(); binary=a.binary.resolve()
    for name in ['v03','v03r','v03r1']:
        old=(ROOT/'results'/name).resolve(); assert out!=old and old not in out.parents
    out.mkdir(parents=True,exist_ok=True)
    sources=list((ROOT/'src').rglob('*.hs'))+list((ROOT/'test').rglob('*.hs'))+[ROOT/'app/Main.hs',ROOT/'latis.cabal',pathlib.Path(__file__)]
    fp={'binary_sha256':digest(binary),'source_sha256':{x.relative_to(ROOT).as_posix():digest(x) for x in sorted(sources)}}
    old=json.loads((ROOT/'results/v03r1/protocol.json').read_text())
    for name,sha in old['fingerprint']['source_sha256'].items():
        if name.startswith(('src/Language/Induced/','src/Synthesis/Induced/','src/Synthesis/InducedR1/','src/ARC/InducedR1')): assert digest(ROOT/name)==sha,name
    groups={'core':[('03560426',ROOT/'data/03560426.json')], 'regression':[(x.parent.name,x) for x in reg],
            'stress':[(x.parent.name,x) for x in stress], 'diagnostic':[(x,ROOT/'data/arc1-frozen'/f'{x}.json') for x in manifest['task_ids']]}
    lock={'version':'LATIS-v0.3R.2','fingerprint':fp,'frozen_manifest_hash':manifest['hash'],'configuration':{k:str(v) if isinstance(v,pathlib.Path) else v for k,v in vars(a).items()},
          'task_sha256':{str(x.relative_to(ROOT)):digest(x) for rows in groups.values() for _,x in rows},'diagnostic_label':'PreviouslyOpenedDiagnosticSet'}
    (out/'protocol.json').write_text(json.dumps(lock,indent=2)+'\n',encoding='utf-8')
    for group in a.groups:
        rows=[]
        for name,path in groups[group]:
            if a.tasks and name not in a.tasks: continue
            for mode in a.modes if group!='diagnostic' else ['Full']:
                dest=out/group/name/mode;dest.mkdir(parents=True,exist_ok=True)
                command=[str(binary),'solve-v03r2','--task',str(path),'--out',str(dest),'--mode',mode,'--budget',str(a.diagnostic_budget if group=='diagnostic' else a.budget),'--cost',str(a.cost),'--saturation-budget',str(a.saturation_budget)]
                protocol={'fingerprint':fp,'command':command,'input_sha256':digest(path),'timeout_seconds':a.timeout}
                result=dest/'solution.json';execution=dest/'execution.json'
                cached=not a.force and result.exists() and execution.exists() and json.loads(execution.read_text())['protocol']==protocol
                if not cached:
                    for file in ['solution.json','portfolio_diagnostics.json','equivalence_classes.json','version_space.json','contexts.json','induced_tsl.json','induced_tsl_trace.md']:(dest/file).unlink(missing_ok=True)
                    start=time.monotonic()
                    with (dest/'execution.log').open('w',encoding='utf-8') as log:
                        try:subprocess.run(command,cwd=ROOT,timeout=a.timeout,stdout=log,stderr=subprocess.STDOUT,check=True)
                        except (subprocess.TimeoutExpired,subprocess.CalledProcessError) as exc:
                            timeout=isinstance(exc,subprocess.TimeoutExpired)
                            result.write_text(json.dumps({'train_exact':False,'heldout_exact':False,'failure':'SearchFailure' if timeout else 'ImplementationBug','failure_evidence':str(exc),'external_timeout':timeout,'statistics':{}}),encoding='utf-8')
                    execution.write_text(json.dumps({'protocol':protocol,'elapsed_seconds':time.monotonic()-start,'finished_at':datetime.datetime.now(datetime.timezone.utc).isoformat()},indent=2),encoding='utf-8')
                row=json.loads(result.read_text());row.update(task=name,ablation=mode,execution_elapsed_seconds=json.loads(execution.read_text())['elapsed_seconds'])
                if group=='diagnostic':row['evaluation_set']='PreviouslyOpenedDiagnosticSet'
                rows.append(row);(out/group/'comparison.json').write_text(json.dumps(rows,indent=2)+'\n',encoding='utf-8')
                print(f"{group}/{name}/{mode}: train={row['train_exact']} held={row['heldout_exact']} failure={row['failure']} elapsed={row['execution_elapsed_seconds']:.2f}s",flush=True)
    validate_inputs()
if __name__=='__main__':main()
