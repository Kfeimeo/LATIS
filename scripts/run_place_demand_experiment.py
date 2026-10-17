"""Independent, fingerprinted place-demand runs (B0/B1/B2) with a FIXED worker
pool. Every job is one solver process; no heldout label enters the solver.
Variants differ only in the witness/demand switches; budgets and inputs are
identical for all variants."""
import argparse, concurrent.futures, datetime, hashlib, json, os, pathlib, subprocess, sys, time
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from run_v03r import ROOT, validate_inputs, digest

VARIANTS = {
    'B0': ['--witness', 'unidirectional', '--demand', 'off'],
    'B1': ['--witness', 'bidirectional', '--demand', 'off'],
    'B2': ['--witness', 'bidirectional', '--demand', 'on'],
}
EXPERIMENT = ROOT / 'experiments/place-demand'

def source_fingerprint(binary):
    sources = list((EXPERIMENT / 'src').rglob('*.hs')) + list((EXPERIMENT / 'test').rglob('*.hs')) + [EXPERIMENT / 'app/Main.hs', EXPERIMENT / 'latis.cabal', pathlib.Path(__file__)]
    return {'binary_sha256': digest(binary), 'source_sha256': {x.relative_to(ROOT).as_posix(): digest(x) for x in sorted(sources)}}

def generated_tasks(manifest_path):
    manifest = json.loads(manifest_path.read_text(encoding='utf-8'))
    rows = []
    for entry in manifest['tasks']:
        path = ROOT / entry['path']
        assert digest(path) == entry['sha256'], f'generated task changed: {entry["path"]}'
        rows.append((entry['name'], path))
    return rows

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--out', type=pathlib.Path, default=ROOT / 'results/place-demand')
    p.add_argument('--binary', type=pathlib.Path, default=EXPERIMENT / 'latis-place-demand')
    p.add_argument('--groups', nargs='+', choices=['core', 'regression', 'stress', 'diagnostic', 'generated-dev', 'generated-audit'], default=['core', 'regression', 'stress', 'diagnostic'])
    p.add_argument('--variants', nargs='+', choices=list(VARIANTS), default=list(VARIANTS))
    p.add_argument('--tasks', nargs='+')
    p.add_argument('--budget', type=int, default=250000)
    p.add_argument('--diagnostic-budget', type=int, default=25000)
    p.add_argument('--cost', type=int, default=96)
    p.add_argument('--saturation-budget', type=int, default=25000)
    p.add_argument('--demand-budget', type=int, default=25000)
    p.add_argument('--demand-operands', type=int, default=24)
    p.add_argument('--demand-rounds', type=int, default=3)
    p.add_argument('--timeout', type=int, default=300)
    p.add_argument('--workers', type=int, default=3)
    p.add_argument('--generated-manifest', type=pathlib.Path, default=ROOT / 'data/place-demand-generated/manifest.json')
    p.add_argument('--force', action='store_true')
    a = p.parse_args()
    manifest, reg, stress = validate_inputs()
    assert min(a.budget, a.diagnostic_budget, a.cost, a.timeout, a.saturation_budget, a.demand_budget, a.demand_operands, a.demand_rounds, a.workers) > 0
    out = a.out.resolve(); binary = a.binary.resolve()
    for name in ['v03', 'v03r', 'v03r1', 'v03r2', 'place-only', 'place-only-ablations']:
        old = (ROOT / 'results' / name).resolve(); assert out != old and old not in out.parents
    out.mkdir(parents=True, exist_ok=True)
    fp = source_fingerprint(binary)
    groups = {'core': [('03560426', ROOT / 'data/03560426.json')], 'regression': [(x.parent.name, x) for x in reg],
              'stress': [(x.parent.name, x) for x in stress], 'diagnostic': [(x, ROOT / 'data/arc1-frozen' / f'{x}.json') for x in manifest['task_ids']]}
    if any(g.startswith('generated') for g in a.groups):
        for name, path in generated_tasks(a.generated_manifest):
            split = 'generated-dev' if name.startswith('dev-') else 'generated-audit'
            groups.setdefault(split, []).append((name, path))
    config = {k: str(v) if isinstance(v, pathlib.Path) else v for k, v in vars(a).items()}
    lock = {'version': 'LATIS-place-demand-experiment', 'fingerprint': fp, 'frozen_manifest_hash': manifest['hash'], 'configuration': config,
            'variants': VARIANTS, 'concurrency': {'workers': a.workers, 'policy': 'fixed thread pool; one independent solver process per job; jobs ordered group,task,variant'},
            'host': {'cpu_count': os.cpu_count(), 'platform': sys.platform},
            'task_sha256': {str(x.relative_to(ROOT)): digest(x) for g in a.groups for _, x in groups.get(g, [])}, 'diagnostic_label': 'PreviouslyOpenedDiagnosticSet'}
    (out / 'protocol.json').write_text(json.dumps(lock, indent=2) + '\n', encoding='utf-8')
    jobs = []
    for group in a.groups:
        for name, path in groups.get(group, []):
            if a.tasks and name not in a.tasks: continue
            for variant in a.variants:
                dest = out / group / name / variant; dest.mkdir(parents=True, exist_ok=True)
                budget = a.diagnostic_budget if group == 'diagnostic' else a.budget
                command = [str(binary), 'solve-v03r2', '--task', str(path), '--out', str(dest), '--mode', 'Full', '--budget', str(budget), '--cost', str(a.cost),
                           '--saturation-budget', str(a.saturation_budget)] + VARIANTS[variant] + ['--demand-budget', str(a.demand_budget), '--demand-operands', str(a.demand_operands), '--demand-rounds', str(a.demand_rounds)]
                protocol = {'fingerprint': fp, 'command': command, 'input_sha256': digest(path), 'timeout_seconds': a.timeout, 'variant': variant, 'workers': a.workers}
                jobs.append((group, name, variant, path, dest, command, protocol))
    def run(job):
        group, name, variant, path, dest, command, protocol = job
        result = dest / 'solution.json'; execution = dest / 'execution.json'
        cached = not a.force and result.exists() and execution.exists() and json.loads(execution.read_text())['protocol'] == protocol
        if not cached:
            for file in ['solution.json', 'portfolio_diagnostics.json', 'equivalence_classes.json', 'version_space.json', 'contexts.json', 'induced_tsl.json', 'induced_tsl_trace.md', 'demands.json']:
                (dest / file).unlink(missing_ok=True)
            start = time.monotonic()
            with (dest / 'execution.log').open('w', encoding='utf-8') as log:
                try:
                    subprocess.run(command, cwd=ROOT, timeout=a.timeout, stdout=log, stderr=subprocess.STDOUT, check=True)
                except (subprocess.TimeoutExpired, subprocess.CalledProcessError) as exc:
                    timeout = isinstance(exc, subprocess.TimeoutExpired)
                    result.write_text(json.dumps({'train_exact': False, 'heldout_exact': False, 'failure': 'SearchFailure' if timeout else 'ImplementationBug',
                                                  'failure_evidence': f'external {a.timeout}s process deadline' if timeout else str(exc), 'external_timeout': timeout, 'statistics': {}, 'variant': variant}), encoding='utf-8')
            execution.write_text(json.dumps({'protocol': protocol, 'elapsed_seconds': time.monotonic() - start, 'finished_at': datetime.datetime.now(datetime.timezone.utc).isoformat()}, indent=2), encoding='utf-8')
        row = json.loads(result.read_text()); row.update(task=name, variant=variant, group=group, execution_elapsed_seconds=json.loads(execution.read_text())['elapsed_seconds'])
        if group == 'diagnostic': row['evaluation_set'] = 'PreviouslyOpenedDiagnosticSet'
        print(f"{group}/{name}/{variant}: train={row['train_exact']} held={row['heldout_exact']} failure={row['failure']} elapsed={row['execution_elapsed_seconds']:.2f}s", flush=True)
        return row
    with concurrent.futures.ThreadPoolExecutor(max_workers=a.workers) as pool:
        rows = list(pool.map(run, jobs))
    by_group = {}
    for r in rows: by_group.setdefault(r['group'], []).append(r)
    for group, rs in by_group.items():
        (out / group / 'comparison.json').write_text(json.dumps(rs, indent=2) + '\n', encoding='utf-8')
    validate_inputs()
if __name__ == '__main__': main()
