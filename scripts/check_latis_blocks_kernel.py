"""Compare browser type schemes with the unchanged Haskell kernel."""
import argparse
import json
from pathlib import Path
import subprocess
import tempfile
from visualize_latis import ROOT, hs_type, hs_string, find_runghc, run_replay, load_item

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--node', default='node')
parser.add_argument('--runghc')
args = parser.parse_args()
with tempfile.TemporaryDirectory(prefix='latis-block-types-') as directory:
    temp = Path(directory)
    fixtures = temp/'fixtures.json'
    exported = temp/'user-program.json'
    subprocess.run([args.node, str(ROOT/'scripts/test_latis_blocks.js'), str(fixtures), str(exported)], check=True, cwd=ROOT)
    rows = json.loads(fixtures.read_text())
    checks = []
    for row in rows:
        operands = [f'variable {hs_string("arg"+str(i))} {hs_type(t)}' for i,t in enumerate(row['args'])]
        env = 'M.fromList ['+','.join(f'({hs_string("arg"+str(i))},{hs_type(t)})' for i,t in enumerate(row['args']))+']'
        if row['name']=='application':
            expression = f'application ({operands[0]}) ({operands[1]})'
        else:
            expression = f'call {hs_string(row["name"])} {hs_type(row["out"])} [{",".join("("+v+")" for v in operands)}]'
        native = f'(({expression}) >>= typeCheck ({env})) == Right {hs_type(row["out"])}'
        checks.append(f'({hs_string(row["name"])},({native}),{str(row["accepted"])})')
    source = '''module Main where
import Language.Induced.Base
import qualified Data.Map.Strict as M
main = case [(n,actual,expected) | (n,actual,expected) <- checks, actual /= expected] of
  [] -> putStrLn ("PASS: " ++ show (length checks) ++ " browser/kernel type comparisons")
  failures -> error (show failures)
checks = [
  '''+',\n  '.join(checks)+'\n  ]\n'
    (temp/'Check.hs').write_text(source, encoding='utf-8')
    runghc=find_runghc(args.runghc)
    if not runghc:
        raise SystemExit('runghc not found')
    subprocess.run([runghc,'-XGHC2021','-i'+str(ROOT/'src'),str(temp/'Check.hs')],cwd=ROOT,check=True,timeout=120)
    replay=run_replay([load_item(exported)],runghc,120)['0']
    assert 'error' not in replay, replay
    assert all('prediction' in r for split in ['train','test'] for r in replay[split]), replay
    print('PASS: user-edited program export typechecks and executes in the original Haskell Base kernel.')
