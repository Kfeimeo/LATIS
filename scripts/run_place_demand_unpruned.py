"""Ablation of the credit-aware residual pruning (B1U): same bidirectional
decompositions as B1, residual children emitted even at credit 0. Separate
output root and binary; protocol budgets."""
import pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import run_place_demand_experiment as M
M.VARIANTS = {'B1U': ['--witness', 'bidirectional-unpruned', '--demand', 'off']}
if __name__ == '__main__':
    argv = sys.argv[1:]
    if '--out' not in argv: argv += ['--out', str(M.ROOT / 'results/place-demand-ablations-unpruned')]
    if '--binary' not in argv: argv += ['--binary', str(M.EXPERIMENT / 'latis-place-demand-r2')]
    if '--variants' not in argv: argv += ['--variants', 'B1U']
    sys.argv = [sys.argv[0]] + argv
    M.main()
