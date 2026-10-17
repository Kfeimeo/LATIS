"""Extra exploratory ablation runner (B1L/B2L: local-operand left residual).
Thin wrapper over run_place_demand_experiment with its own variants, output
root and binary; the main matrix protocol is untouched. Formulated AFTER the
B0/B1/B2 traces of stress A/C/F were inspected: development evidence."""
import pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import run_place_demand_experiment as M
M.VARIANTS = {
    'B1L': ['--witness', 'bidirectional-local', '--demand', 'off'],
    'B2L': ['--witness', 'bidirectional-local', '--demand', 'on'],
}
if __name__ == '__main__':
    argv = sys.argv[1:]
    if '--out' not in argv: argv += ['--out', str(M.ROOT / 'results/place-demand-ablations')]
    if '--binary' not in argv: argv += ['--binary', str(M.EXPERIMENT / 'latis-place-demand-local')]
    if '--variants' not in argv: argv += ['--variants', 'B1L', 'B2L']
    sys.argv = [sys.argv[0]] + argv
    M.main()
