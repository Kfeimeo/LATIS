"""Final provenance and language audit for all 226 independent executions."""
import hashlib,json,pathlib
ROOT=pathlib.Path(__file__).resolve().parents[1]
def digest(p): return hashlib.sha256(p.read_bytes()).hexdigest()
rows=json.loads((ROOT/'results/place-only/comparison_all.json').read_text())
assert len(rows)==226 and len({(r['group'],r['task'],r['mode']) for r in rows})==226
cache={}
def checked_hash(p):
    if p not in cache: cache[p]=digest(p)
    return cache[p]
timeouts=[]
for r in rows:
    result=ROOT/r['path']; execution=json.loads((result.parent/'execution.json').read_text())
    protocol=execution['protocol']; fp=protocol['fingerprint']
    assert checked_hash(pathlib.Path(protocol['command'][0]))==fp['binary_sha256']
    for name,sha in fp['source_sha256'].items(): assert checked_hash(ROOT/name)==sha,name
    command=protocol['command']; task=pathlib.Path(command[command.index('--task')+1])
    assert checked_hash(task)==protocol['input_sha256']
    if r['timeout']: timeouts.append((r['group'],r['task'],r['mode'])); continue
    tsl=json.loads((result.parent/'induced_tsl.json').read_text())
    assert all(x['symbol'] not in ['Translate','poseOf'] for x in tsl['base_symbols'])
    assert 'Translate(' not in json.dumps(tsl['task_inventions'])
for baseline in ['v03r2','v03r2-stress-matrix','v03r2-diagnostic-matrix']:
    fp=json.loads((ROOT/'results'/baseline/'protocol.json').read_text())['fingerprint']
    for name,sha in fp['source_sha256'].items(): assert checked_hash(ROOT/name)==sha,name
assert 'PASS:' in (ROOT/'experiments/place-only/semantic-checks.log').read_text()
cert=json.loads((ROOT/'results/place-only/base_certificates.json').read_text())
assert len(cert['certificates'])==8
assert all(c['type_checked'] and c['train_exact'] and c['heldout_exact'] and 'Translate(' not in c['program'] for c in cert['certificates'])
out={'executions':len(rows),'unique_executions':226,'source_binary_input_hashes_verified':True,
     'original_baseline_sources_unchanged':True,'no_base_translate_or_poseOf':True,
     'semantic_checks_passed':True,'post_search_expressibility_certificates':8,'external_timeouts':timeouts}
(ROOT/'results/place-only/audit.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
