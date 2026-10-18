"""Round-4 matrix: B1Q (working baseline) vs B1QS (single soft branch-order
strategy, unsolved-children-first then cached-first). Same budgets, separate
output root and binary. Generated sets: round-1 dev/audit, round-2 audit and
round-3 audit are run via successive --generated-manifest invocations."""
import pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import run_place_demand_experiment as M
M.VARIANTS = {
    'B1Q': ['--witness', 'bidirectional', '--demand', 'off', '--schedule', 'defer-nonlocal', '--deferred-budget', '62500'],
    'B1QS': ['--witness', 'bidirectional', '--demand', 'off', '--schedule', 'defer-nonlocal', '--deferred-budget', '62500', '--branch-order', 'unsolved-first'],
}
if __name__ == '__main__':
    argv = sys.argv[1:]
    if '--out' not in argv: argv += ['--out', str(M.ROOT / 'results/place-demand-round4')]
    if '--binary' not in argv: argv += ['--binary', str(M.EXPERIMENT / 'latis-place-demand-r4')]
    if '--variants' not in argv: argv += ['--variants'] + list(M.VARIANTS)
    sys.argv = [sys.argv[0]] + argv
    M.main()
