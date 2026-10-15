"""Run all compatibility suites and save R2-only, source-bound test evidence."""
import argparse, datetime, json, os, pathlib, shutil, subprocess, sys
from run_v03r import ROOT, digest

SUITES = ['latis-tests', 'joint-tests', 'latent-tests', 'induced-tests',
          'induced-r1-tests', 'induced-r2-tests']

def main():
    if hasattr(sys.stdout, 'reconfigure'):
        sys.stdout.reconfigure(encoding='utf-8', errors='replace')
    parser = argparse.ArgumentParser()
    parser.add_argument('--out', type=pathlib.Path, default=ROOT/'results/v03r2')
    parser.add_argument('--cabal', default=shutil.which('cabal') or 'E:/ghcup/cabal/3.16.1.0/cabal.exe')
    parser.add_argument('--ghc', default=shutil.which('ghc') or 'E:/ghcup/ghc/9.14.1/bin/ghc.exe')
    parser.add_argument('--ghc-pkg', default=shutil.which('ghc-pkg') or 'E:/ghcup/ghc/9.14.1/bin/ghc-pkg.exe')
    args = parser.parse_args(); out = args.out.resolve()
    for name in ['v03', 'v03r', 'v03r1']:
        old = (ROOT/'results'/name).resolve()
        assert out != old and old not in out.parents
    out.mkdir(parents=True, exist_ok=True)
    sources = sorted(list((ROOT/'src').rglob('*.hs'))+list((ROOT/'test').rglob('*.hs')))
    fingerprint = {p.relative_to(ROOT).as_posix(): digest(p) for p in sources}
    command = [args.cabal, '--config-file=scripts/cabal.config', 'test', 'all', '--offline',
               '--with-compiler='+args.ghc, '--with-hc-pkg='+args.ghc_pkg, '--test-show-details=direct']
    env = dict(os.environ, LATIS_R1_STRESS_OUT=str(out/'r1-compatibility-evidence.json'))
    result = subprocess.run(command, cwd=ROOT, env=env, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT, text=True, encoding='utf-8', errors='replace')
    (out/'tests.log').write_text(result.stdout, encoding='utf-8')
    print(result.stdout, end='')
    assert result.returncode == 0, 'compatibility test command failed'
    assert all(f'Test suite {s}: PASS' in result.stdout for s in SUITES), 'missing suite PASS'
    assert fingerprint == {p.relative_to(ROOT).as_posix(): digest(p) for p in sources}, 'source changed during tests'
    # The R2 executable test writes to its dedicated default evidence directory.
    # Copy the freshly generated evidence for a requested custom experiment out.
    unit_path = ROOT/'results/v03r2/unit_evidence.json'
    assert json.loads(unit_path.read_text(encoding='utf-8'))['all_checks_passed']
    if out/'unit_evidence.json' != unit_path:
        shutil.copyfile(unit_path, out/'unit_evidence.json')
    (out/'tests_protocol.json').write_text(json.dumps({
        'suites': SUITES, 'all_passed': True, 'command': command,
        'finished_at': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'base_sha256': digest(ROOT/'src/Language/Induced/Base.hs'),
        'source_sha256': fingerprint,
        'unit_evidence_sha256': digest(out/'unit_evidence.json'),
        'compatibility_evidence_sha256': digest(out/'r1-compatibility-evidence.json')
    }, indent=2)+'\n', encoding='utf-8')

if __name__ == '__main__':
    main()
