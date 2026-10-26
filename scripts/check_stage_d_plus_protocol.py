"""Frozen-binary leak-guard and crash-safe result-finalization checks."""
import argparse
import subprocess
import sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
from run_stage_d_plus import read,write,run_one,sha

def check(out):
    binary=(out/'solver.exe').resolve();version=read(out/'code_version.json')
    assert sha(binary)==version['binary_sha256']
    guard=out/'validation/leak_guard_test.json'
    if not guard.exists():
        fixture=out/'validation/leak_guard.json';dest=out/'validation/leak_guard_outputs'
        write(fixture,{'train':[{'input':[[1]],'output':[[1]]}],'test':[{'input':[[1]]}]})
        proc=subprocess.run([str(binary),'arc-train-only-stage','--stage','stage-d-D0_Frozen','--task',str(fixture.resolve()),'--out',str(dest.resolve()),'--timeout-ms','1000'],capture_output=True)
        result=read(dest/'stage-d-D0_Frozen.json')
        assert proc.returncode==3 and result['status']=='refused_test_pairs'
        write(guard,{'passed':True,'exit_code':3,'status':result['status'],'binary_sha256':version['binary_sha256']})
    resume=out/'validation/resume_recovery_test.json'
    if not resume.exists():
        tid=read(out/'selection.json')['positive_controls'][0];dest=out/'resume_controls/tasks'/tid/'D0_Off';dest.mkdir(parents=True,exist_ok=True)
        record=dest/'stage-d-D0_Off.json';event=(dest/'search.eventlog').resolve()
        if not record.exists():
            subprocess.run([str(binary),'arc-train-only-stage','--stage','stage-d-D0_Off','--task',str((out/'train_only'/f'{tid}.json').resolve()),'--out',str(dest.resolve()),'--timeout-ms','60000','+RTS','-T','-M2g','-l-au','-ol'+str(event),'-RTS'],check=True,capture_output=True)
        original=sha(record);result=run_one(out,'resume_controls',tid,'D0_Off',60)
        assert result['recovered_binary_record'] and sha(dest/'solver_record.json')==original
        write(resume,{'passed':True,'task_id':tid,'original_binary_record_sha256':original,'recovered_without_solver_rerun':True,'train_exact':result['train_exact']})
    assert read(guard)['passed'] and read(resume)['passed']
    print('PASS frozen binary leak guard (exit 3), orphan result recovery and original evidence preservation')
if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--out',required=True);args=parser.parse_args();check(Path(args.out))
