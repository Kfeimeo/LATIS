"""Executable negative controls for event retention and machine interpretation."""
import sys
import tempfile
import os
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'scripts'))
from run_stage_d_plus import failure_evidence,enrich_events,parse_events,write

def main():
    metadata={'task_id':'negative','config':'D0_Frozen','run_id':'unit','binary_sha256':'unit'}
    r={'status':'no_solution','train_exact':False,'diagnostics':{'train_pairs':3},'search_work':19}
    events=[{'scope':'TypedParameter','branch_id':'a','event':'completed','stop_reason':'NoFitYet','param_fit_count':0,'partial_work':5},
            {'scope':'TypedParameter','branch_id':'b','event':'completed','stop_reason':'FoundFit','param_fit_count':2,'partial_work':9},
            {'scope':'Render','branch_id':'b','stop_reason':'NoFitYet','render_mismatches':1,'partial_work':19}]
    ledger=enrich_events(events,metadata,r);f=failure_evidence(ledger,r)
    assert len([e for e in ledger if e['branch_id']=='b'])==2
    assert f['parameters_fit_without_solution'] and f['composition_executes_but_pixels_fail']
    assert f['first_rejection']['branch_id']=='a' and f['last_blocking_branch']['branch_id']=='b'
    assert 'param_no_fit' in f['labels'] and 'render_mismatch' in f['labels']
    crash=dict(r,status='runtime_error',search_work=None)
    timeout=dict(r,status='timeout',search_work=None)
    for record in (crash,timeout):
        ledger=enrich_events(events[:2],metadata,record)
        assert len(ledger)==11 and all(e['total_work'] is None for e in ledger if e.get('event')=='task-terminal')
        assert failure_evidence(ledger,record)['stage_flags']['Composition']['reached'] is None
        assert all(e['partial_work']==9 for e in ledger if e.get('event')=='task-terminal')
        assert all(e['stop_reason']!='Timeout' for e in ledger if e.get('event')=='task-terminal' and e['scope']=='TypedParameter')
    p=Path(os.environ.get('LATIS_DPLUS_EVENTLOG','results/stage_d_plus/implementation_validation/tests.eventlog'))
    if p.exists():
        full,_=parse_events(p)
        with tempfile.TemporaryDirectory(dir='build') as temp:
            partial=Path(temp)/'partial.eventlog';partial.write_bytes(p.read_bytes()[:-2])
            kept,_=parse_events(partial)
            assert full and len(kept)==len(full)
    print('PASS branch causes, partial work, null missing data, completed-scope timeout, truncated eventlog')
if __name__=='__main__':main()
