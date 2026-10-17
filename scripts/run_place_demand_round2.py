"""Round-2 matrix: B1 (baseline), B1L (hard local reference), B1Q (deferred
non-local scheduling), B1X (lazy complete-composition cover), B1QX (both),
plus B0 for reference. Same budgets as round 1; deferred pass share 62500
inside the 250000 budget. Separate output root and binary; the round-2 audit
manifest (frozen before any run) is passed as --generated-manifest."""
import pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import run_place_demand_experiment as M
M.VARIANTS = {
    'B0': ['--witness', 'unidirectional', '--demand', 'off'],
    'B1': ['--witness', 'bidirectional', '--demand', 'off'],
    'B1L': ['--witness', 'bidirectional-local', '--demand', 'off'],
    'B1Q': ['--witness', 'bidirectional', '--demand', 'off', '--schedule', 'defer-nonlocal', '--deferred-budget', '62500'],
    'B1X': ['--witness', 'bidirectional', '--demand', 'off', '--cover', 'lazy'],
    'B1QX': ['--witness', 'bidirectional', '--demand', 'off', '--schedule', 'defer-nonlocal', '--deferred-budget', '62500', '--cover', 'lazy'],
}
if __name__ == '__main__':
    argv = sys.argv[1:]
    if '--out' not in argv: argv += ['--out', str(M.ROOT / 'results/place-demand-round2')]
    if '--binary' not in argv: argv += ['--binary', str(M.EXPERIMENT / 'latis-place-demand-r2')]
    if '--variants' not in argv: argv += ['--variants'] + list(M.VARIANTS)
    sys.argv = [sys.argv[0]] + argv
    M.main()
