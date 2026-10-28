"""Recompute acceptance from frozen raw evidence; never invokes synthesis."""
import argparse
import csv
import hashlib
import json
import sys
import zipfile
from collections import Counter
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
from run_stage_d_plus import ROOT,read,write,sha
from arc_stage_d import verify_witness as check_pixels
from verify_stage_d_witness import check as check_transform

def audit(out):
    code=read(out/'code_version.json');manifest=read(out/'data_manifest.json');metrics=read(out/'metrics.json')
    assert sha(out/'solver.exe')==code['binary_sha256']
    assert len(manifest['tasks'])==400
    assert manifest['combined_sha256_of_task_hashes']==read(ROOT/'results/stage_d/full_p0/arc/data_manifest.json')['combined_sha256_of_task_hashes']
    train={}
    for t in manifest['tasks']:
        path=out/t['train_only_file'];assert sha(path)==t['train_only_sha256']
        d=read(path);assert d['test']==[];train[t['task_id']]=d['train']
    production=[]
    with zipfile.ZipFile(out/'source_snapshot.zip') as z:
        for folder in ['src','app']:
            for p in (ROOT/folder).rglob('*.hs'):
                rel=p.relative_to(ROOT).as_posix()
                assert hashlib.sha256(z.read(rel)).hexdigest()==sha(p),rel
                production.append(rel)
    phases=['baseline','regression','mechanism','pilot','extended','formal','window60','fault_controls']
    raw={};verified=0;status=Counter();rows=[];expected_events=0
    for phase in phases:
        for path in (out/phase/'tasks').glob('*/*/stage-d-*.json'):
            r=read(path);tid=path.parent.parent.name;cfg=path.parent.name
            assert r['binary_sha256']==code['binary_sha256'] and r['run_id']==code['run_id']
            assert r['timeout_seconds']==(60 if phase=='window60' else .001 if tid=='timeout-control' else 300)
            if r['status'] in ['timeout','runtime_error']:
                assert r['search_work'] is None and r['counters'] is None
            if r['train_exact']:
                pairs=(read(out/'mechanism_train'/f'{tid}.json')['train'] if phase=='mechanism' else train[tid])
                assert len(r['execution_witnesses'])==len(pairs)
                for pair,w in zip(pairs,r['execution_witnesses']):
                    assert w['grid']==pair['output'] and w['train_exact']
                    check_pixels(w);check_transform(w,pair['input']);verified+=1
            diagcost=r.get('diagnostic_overhead')
            if diagcost is not None: expected_events+=diagcost['events']+9
            else: expected_events+=len(read(path.parent/'search_diagnostics.json')['events'])
            raw[(phase,tid,cfg)]=r;status[(phase,r['status'])]+=1
    baseline={t:r for (p,t,c),r in raw.items() if p=='baseline'}
    baseids={t for t,r in baseline.items() if r['train_exact']}
    assert len(baseids)==20 and read(out/'validation/regression_audit.json')['passed']
    formal=[]
    for cfg in ['D0_Frozen','Budget4x','Combined3_4x']:
        group=baseline if cfg=='D0_Frozen' else {t:r for (p,t,c),r in raw.items() if p=='formal' and c==cfg}
        assert len(group)==400
        ids={t for t,r in group.items() if r['train_exact']}
        m=next(x for x in metrics['configs'] if x['config']==cfg)
        assert m['train_exact']==len(ids) and m['timeouts']==sum(r['status']=='timeout' for r in group.values())
        assert m['total_completed_work']==sum(r['search_work'] for r in group.values() if r['search_work'] is not None)
        assert not (baseids-ids)
        formal.append({'config':cfg,'tasks':len(group),'exact_ids':sorted(ids),'new_ids':sorted(ids-baseids),'lost_ids':sorted(baseids-ids),'timeouts':[t for t,r in group.items() if r['status']=='timeout']})
    with (out/'per_task.csv').open(encoding='utf-8-sig',newline='') as f: csvrows=list(csv.DictReader(f))
    assert len(csvrows)==len(raw)==metrics['raw_records']
    assert len({(r['phase'],r['task_id'],r['config']) for r in csvrows})==len(raw)
    assert all(r['agreement'] for r in metrics['window_checks']) and len(metrics['window_checks'])==18
    assert read(out/'validation/leak_guard_test.json')['exit_code']==3
    assert read(out/'validation/resume_recovery_test.json')['passed']
    negative_path=out/'validation/extra-checks/dplus_negative_controls.json'
    if not negative_path.exists(): negative_path=out/'validation/sandbox/dplus_negative_controls.json'
    negative=read(negative_path)
    finite=negative['finite_grammar'];assert set(finite['candidate_ids'])==set(finite['visited_ids']) and not finite['fit_ids'] and not finite['deferred_ids']
    depth=negative['depth3_parameter'];assert depth['depth']==3 and not depth['depth2_truncated'] and depth['depth2_templates']==depth['depth2_templates_visited'] and depth['depth2_fits']==0 and depth['depth3_fits']>0
    b=negative['depth3_vsa'];assert b['fits_equal'] and b['shared_evaluations']<b['flat_evaluations']
    if not (out/'event_stream_manifest.json').exists():
        from compress_stage_d_plus_events import compress
        compress(out)
    events=read(out/'event_stream_manifest.json')
    assert sha(out/events['gzip_file'])==events['gzip_sha256'] and events['jsonl_records']==expected_events and events['forbidden_exhaustiveness_events']==0
    result={'passed':True,'run_id':code['run_id'],'single_binary_sha256':code['binary_sha256'],'production_source_files_match_archive':len(production),'raw_records':len(raw),'independent_train_case_witnesses_verified':verified,'formal':formal,'window_checks':18,'all_window_checks_agree':True,'depth_negative_control':depth,'depth3_shared_vsa':b,'not_run_400':metrics['not_run_400'],'task_specification_sha256':sha(ROOT/'prompts'/'LATIS_STAGE_D_PLUS_BUDGET_DEPTH_DIAGNOSTICS_PROMPT.md'),
        'event_export':events,'tool_versions':{name:sha(ROOT/'scripts'/name) for name in ['run_stage_d_plus.py','report_stage_d_plus.py','audit_stage_d_plus.py','run_stage_d_plus.ps1','check_stage_d_plus_protocol.py','compress_stage_d_plus_events.py']},
        'limitations':['ARC whole-grammar exhaustion remains Unknown','Inner-template first-fit/type-filter counts not separately measured; nullable fields retain reasons','Diagnostic interval clock includes lazy payload forcing; do not subtract as pure overhead','Joint unlabelled fallback remains depth1; param_depth adjusts inverse-hole plans','Hard-crash retained work is a flushed-checkpoint lower bound']}
    write(out/'audit.json',result)
    print(json.dumps({k:result[k] for k in ['passed','raw_records','independent_train_case_witnesses_verified','depth3_shared_vsa']},ensure_ascii=False))
    return result
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',required=True);args=p.parse_args();audit(Path(args.out))
