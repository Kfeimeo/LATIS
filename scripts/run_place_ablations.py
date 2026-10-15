"""Run the six original R2 ablations in separate output roots (three workers)."""
import concurrent.futures, pathlib, subprocess, sys
ROOT=pathlib.Path(__file__).resolve().parents[1]
MODES=['NoDiversityPreservation','FixedAliasCap','NoLetSharing','NoGroundedLiteralPrior','BeamSearchLegacy','NoCounterfactualDiagnosis']
def run(mode):
    dest=ROOT/'results/place-only-ablations'/mode
    dest.mkdir(parents=True,exist_ok=True)
    cmd=[sys.executable,str(ROOT/'scripts/run_place_experiment.py'),'--out',str(dest),'--modes',mode,'--groups','core','regression','stress','--timeout','300']
    with (dest/'runner.log').open('w',encoding='utf-8') as log:
        result=subprocess.run(cmd,cwd=ROOT,stdout=log,stderr=subprocess.STDOUT)
    print(mode,result.returncode,flush=True)
    return result.returncode
if __name__=='__main__':
    with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:
        codes=list(pool.map(run,MODES))
    sys.exit(max(codes))
