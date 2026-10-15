"""Build an offline ARC/program explorer; replay saved ASTs with the real Base kernel.

Python standard library only. Prediction needs runghc (no synthesis is rerun).
See --help. All generated files go to --out and its adjacent .replay.json.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]


def read_json(path):
    return json.loads(Path(path).read_text(encoding="utf-8-sig"))


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def hs_string(value):
    # Numeric escapes with explicit terminators: data cannot become Haskell code.
    return '"' + ''.join(c if c.isascii() and c.isalnum() else f"\\{ord(c)}\\&" for c in value) + '"'


def hs_type(source):
    tokens = re.findall(r"[A-Za-z][A-Za-z0-9]*|[()]", source)
    if ''.join(tokens) != re.sub(r"\s", "", source):
        raise ValueError(f"Invalid type: {source}")
    arity = {n: 0 for n in 'BoolT IntT ColorT CoordT VecT SizeT SceneT ObjectT PoseT PlacedT CellT AnchorT D4T BBoxT ShapeT'.split()}
    arity.update(ListT=1, SetT=1, OptionT=1, PairT=2, ArrowT=2)
    pos = 0
    def parse():
        nonlocal pos
        if pos >= len(tokens):
            raise ValueError("Incomplete type")
        token = tokens[pos]; pos += 1
        if token == '(':
            result = parse()
            if pos >= len(tokens) or tokens[pos] != ')':
                raise ValueError("Unbalanced type")
            pos += 1
            return result
        if token not in arity:
            raise ValueError(f"Unsupported type {token}")
        args = [parse() for _ in range(arity[token])]
        return '(' + ' '.join([token] + args) + ')'
    result = parse()
    if pos != len(tokens):
        raise ValueError("Trailing type tokens")
    return result


def hs_literal(text):
    if text in ['TL', 'TR', 'BL', 'BR', 'Center']:
        return f"AnchorV {['TL', 'TR', 'BL', 'BR', 'Center'].index(text)}"
    match = re.fullmatch(r'(IntV|ColorV|AnchorV|D4V)\s+\(?(-?\d+)\)?', text)
    if match:
        return f'{match[1]} ({int(match[2])})'
    if text in ['BoolV True', 'BoolV False']:
        return text
    patterns = [
        (r'CoordV \(Coord \{cx = (-?\d+), cy = (-?\d+)\}\)', 'CoordV (Coord ({}) ({}))'),
        (r'VecV \(Vec \(?(-?\d+)\)? \(?(-?\d+)\)?\)', 'VecV (Vec ({}) ({}))'),
        (r'SizeV \(Dimensions \{gridWidth = (-?\d+), gridHeight = (-?\d+)\}\)', 'SizeV (Dimensions ({}) ({}))'),
    ]
    for pattern, template in patterns:
        match = re.fullmatch(pattern, text)
        if match:
            return template.format(*(int(x) for x in match.groups()))
    match = re.fullmatch(r'(ListV|SetV) (.+) \[\]', text)
    if match:
        return f'{match[1]} {hs_type(match[2])} []'
    match = re.fullmatch(r'OptionV (.+) Nothing', text)
    if match:
        return f'OptionV {hs_type(match[1])} Nothing'
    raise ValueError(f"Replay does not support this literal yet: {text}")


def hs_expr(node, env=None):
    """Decode the persisted typed AST using checked constructors, never eval text."""
    env = {} if env is None else env
    text, children, ty = node['expression'], node['children'], hs_type(node['type'])
    match = re.match(r'^\(lambda ([A-Za-z_][A-Za-z_0-9]*):(.+?)\. ', text)
    if match and len(children) == 1:
        name, argtype = match.groups()
        scope = {**env, name: argtype}
        result = f'lambda {hs_string(name)} {hs_type(argtype)} ({hs_expr(children[0], scope)})'
    elif text.startswith('let ') and len(children) == 2:
        match = re.match(r'^let ([A-Za-z_][A-Za-z_0-9]*)=', text)
        if not match:
            raise ValueError('Invalid let binder')
        name = match[1]
        result = f'binding {hs_string(name)} ({hs_expr(children[0], env)}) ({hs_expr(children[1], {**env, name: children[0]["type"]})})'
    elif not children and text in env:
        if hs_type(env[text]) != ty:
            raise ValueError('Variable annotation mismatch')
        result = f'variable {hs_string(text)} {ty}'
    elif not children and not text.endswith('()'):
        result = f'literal ({hs_literal(text)})'
    else:
        match = re.match(r'^([A-Za-z_][A-Za-z_0-9]*)\(', text)
        if not match:
            raise ValueError(f'Unsupported AST node: {text[:100]}')
        args = [hs_expr(c, env) for c in children]
        if match[1] == 'application' and len(args) == 2:
            result = f'checked (application ({args[0]}) ({args[1]}))'
        else:
            result = f'checked (call {hs_string(match[1])} {ty} [{",".join("("+a+")" for a in args)}])'
    # Every node must round-trip, including its type. This also rejects stale,
    # inconsistent, or malicious expression strings without executing those strings.
    return f'confirm {ty} {hs_string(text)} ({result})'


HASKELL = r'''
module Main where
import Language.Induced.Base
import ARC.Dataset
import ARC.Evaluate (jsonString)
import Latent.Encode
import Latent.Render
import Latent.Grid (Coord(..), Vec(..), Dimensions(..))
import qualified Data.Map.Strict as M
import Control.Exception (SomeException, try, evaluate)
import Data.List (intercalate)
import System.Environment (getArgs)
import System.IO (utf8)
import GHC.IO.Encoding (setLocaleEncoding)
checked = either error id
confirm ty txt p | exprType p == ty && exprText p == txt = p
                 | otherwise = error "Saved AST does not round-trip to the Base kernel"
arr xs = "[" ++ intercalate "," xs ++ "]"
predict p x = do
  y <- runFunction p (SceneV (encode defaultEncoder x))
  case y of SceneV s -> render s; _ -> Left "Program did not return a Scene"
row p x = case predict p x of
  Right y -> "{\"prediction\":" ++ jsonGrid y ++ "}"
  Left e -> "{\"error\":" ++ jsonString e ++ "}"
runOne (key,path,p) = do
  result <- try (do
    task <- loadTask path >>= either (ioError . userError) pure
    case typeCheck M.empty p of
      Right (ArrowT SceneT SceneT) -> pure ()
      other -> error ("Invalid program type: " ++ show other)
    let answer = "{\"train\":" ++ arr [row p x | (x,_) <- training task]
              ++ ",\"test\":" ++ arr [row p (testInput q) | q <- tests task] ++ "}"
    _ <- evaluate (length answer)
    pure answer) :: IO (Either SomeException String)
  pure (jsonString key ++ ":" ++ either (\e -> "{\"error\":" ++ jsonString (show e) ++ "}") id result)
main = do
  setLocaleEncoding utf8
  [output] <- getArgs
  answers <- mapM runOne jobs
  writeFile output ("{" ++ intercalate "," answers ++ "}")
'''


def run_replay(items, runghc, timeout):
    results, jobs = {}, []
    for i, item in enumerate(items):
        solution = item['solution']
        if not solution.get('program'):
            results[str(i)] = {'error': '没有已选程序，无法预测'}
            continue
        try:
            ast = solution.get('typed_ast')
            if not ast or ast['expression'] != solution['program']:
                raise ValueError('Missing or inconsistent typed_ast; cannot replay saved program')
            expr = hs_expr(ast)
            jobs.append(f'({hs_string(str(i))},{hs_string(item["task_path"])},({expr}))')
        except (KeyError, ValueError, TypeError) as exc:
            results[str(i)] = {'error': str(exc)}
    if not jobs:
        return results
    if not runghc:
        for i in range(len(items)):
            results.setdefault(str(i), {'error': '未找到 runghc；请通过 --runghc 指定。预测未计算。'})
        return results
    with tempfile.TemporaryDirectory(prefix='latis-view-') as temp:
        source, output = Path(temp)/'Replay.hs', Path(temp)/'predictions.json'
        source.write_text(HASKELL + '\njobs :: [(String,FilePath,Expr)]\njobs = [\n  ' + ',\n  '.join(jobs) + '\n  ]\n', encoding='utf-8')
        try:
            proc = subprocess.run([str(runghc), '-XGHC2021', '-i'+str(ROOT/'src'), str(source), str(output)],
                                  cwd=ROOT, capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=timeout)
            if proc.returncode:
                message = proc.stderr or proc.stdout
                raise RuntimeError('\n'.join(line[:250] for line in message.splitlines())[:5000])
            results.update(read_json(output))
        except (subprocess.TimeoutExpired, OSError, RuntimeError) as exc:
            for i in range(len(items)):
                results.setdefault(str(i), {'error': 'Base replay failed: ' + str(exc)})
    return results


def find_task(solution_path, solution, override):
    if override:
        return override.resolve()
    candidates = [solution_path.parent/'task.json', solution_path.parent.parent/'task.json']
    if solution.get('task'):
        candidates += [Path(solution['task']), ROOT/solution['task']]
    execution = solution_path.parent/'execution.json'
    if execution.exists():
        command = read_json(execution).get('protocol', {}).get('command', [])
        if '--task' in command:
            candidates.append(Path(command[command.index('--task')+1]))
    for path in candidates:
        if path.is_file():
            return path.resolve()
    raise ValueError(f'Cannot locate task for {solution_path}; use --task with a single solution')


def validate_grid(grid):
    return (isinstance(grid, list) and bool(grid) and isinstance(grid[0], list) and bool(grid[0])
            and all(isinstance(row, list) and len(row)==len(grid[0])
                    and all(type(c) is int and 0 <= c <= 9 for c in row) for row in grid))


def load_item(path, task_override=None):
    solution = read_json(path)
    task_path = find_task(path, solution, task_override)
    task = read_json(task_path)
    for split in ['train', 'test']:
        for pair in task.get(split, []):
            if not validate_grid(pair.get('input')) or ('output' in pair and not validate_grid(pair['output'])):
                raise ValueError(f'Invalid ARC grid in {task_path} ({split})')
    portfolio_path = path.parent/'portfolio_diagnostics.json'
    tsl_path = path.parent/'induced_tsl.json'
    tsl = read_json(tsl_path) if tsl_path.exists() else {}
    symbols = [x['symbol'] for x in tsl.get('base_symbols', [])]
    portfolio = None
    if portfolio_path.exists():
        candidates = read_json(portfolio_path).get('candidates', [])
        portfolio = {'count': len(candidates), 'heldout_correct': sum(c.get('heldout_exact') is True for c in candidates)}
    name = task_path.stem if task_path.stem != 'task' else task_path.parent.name
    return {'name': name, 'mode': solution.get('mode', path.parent.name), 'solution': solution,
            'solution_path': str(path), 'task_path': str(task_path), 'task': task, 'portfolio': portfolio, 'tsl_symbols': symbols,
            'task_sha256': digest(task_path), 'solution_sha256': digest(path)}


def find_runghc(explicit):
    if explicit:
        return explicit
    found = shutil.which('runghc')
    if found:
        return found
    # Standard Windows ghcup installations; also honors GHCUP_INSTALL_BASE_PREFIX.
    roots = [Path(os.environ.get('GHCUP_INSTALL_BASE_PREFIX', str(Path.home()))), Path('E:/')]
    for root in roots:
        matches = sorted(root.glob('ghcup/ghc/*/bin/runghc.exe'), reverse=True)
        if matches:
            return str(matches[0])
    return None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--solution', action='append', type=Path, default=[], help='solution.json or its directory; repeatable')
    parser.add_argument('--results', action='append', type=Path, default=[], help='recursively discover solution.json; repeatable')
    parser.add_argument('--mode', default='Full', help='mode filter for --results; use all for every ablation')
    parser.add_argument('--task', type=Path, help='override task JSON (single solution only)')
    parser.add_argument('--out', type=Path, default=ROOT/'docs/latis-explorer.html')
    parser.add_argument('--runghc', help='runghc executable; auto-detected by default')
    parser.add_argument('--timeout', type=int, default=180, help='batch replay deadline in seconds')
    parser.add_argument('--no-predict', action='store_true', help='show saved artifacts only, explicitly mark predictions unavailable')
    args = parser.parse_args()
    paths = [p/'solution.json' if p.is_dir() else p for p in args.solution]
    for root in args.results:
        if not root.is_dir():
            parser.error(f'Results directory does not exist: {root}')
        paths.extend(p for p in sorted(root.rglob('solution.json')) if args.mode == 'all' or p.parent.name == args.mode)
    if not paths and not (args.solution or args.results):
        paths = [ROOT/'results/v03r2/core/03560426/Full/solution.json']
    paths = list(dict.fromkeys(p.resolve() for p in paths))
    if not paths:
        parser.error('No matching solution.json files')
    if args.task and len(paths) != 1:
        parser.error('--task requires exactly one solution')
    if args.timeout < 1:
        parser.error('--timeout must be positive')
    items = []
    try:
        for path in paths:
            items.append(load_item(path, args.task))
    except (OSError, ValueError, KeyError, TypeError) as exc:
        parser.error(str(exc))
    predictions = {} if args.no_predict else run_replay(items, find_runghc(args.runghc), args.timeout)
    for i, item in enumerate(items):
        item['replay'] = predictions.get(str(i), {'error': '使用 --no-predict：未计算预测'})
    evidence = {'format': 'LATIS-visualization-v1', 'replay_engine': 'Language.Induced.Base + defaultEncoder + render',
                'base_sha256': digest(ROOT/'src/Language/Induced/Base.hs'),
                'kernel_sha256': {p: digest(ROOT/p) for p in ['src/Language/Induced/Base.hs', 'src/Latent/Encode.hs', 'src/Latent/Object.hs', 'src/Latent/Grid.hs', 'src/Latent/Render.hs']},
                'selection_feedback': False, 'items': items}
    out = args.out.resolve()
    if out.suffix.lower() != '.html':
        parser.error('--out must end in .html')
    if out in paths or out.with_suffix('.replay.json') in paths:
        parser.error('Output would overwrite an input')
    template = Path(__file__).with_name('latis_visualizer.html').read_text(encoding='utf-8')
    payload = json.dumps(evidence, ensure_ascii=False).replace('&', '\\u0026').replace('<', '\\u003c').replace('>', '\\u003e').replace('\u2028','\\u2028').replace('\u2029','\\u2029')
    out.parent.mkdir(parents=True, exist_ok=True)
    builder = Path(__file__).with_name('latis_blocks.js').read_text(encoding='utf-8')
    out.write_text(template.replace('__LATIS_IDE__', (ROOT/'scripts/latis_ide.js').read_text(encoding='utf-8-sig')).replace('__LATIS_BLOCKS__', builder).replace('__LATIS_DATA__', payload), encoding='utf-8')
    out.with_suffix('.replay.json').write_text(json.dumps(evidence, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    failed = [x for x in items if x['solution'].get('program') and x['replay'].get('error')]
    print(f'HTML: {out}\nTasks: {len(items)}; replay failures for selected programs: {len(failed)}')
    for item in failed:
        print(f'{item["name"]}: {item["replay"]["error"]}', file=sys.stderr)
    return 1 if failed and not args.no_predict else 0


if __name__ == '__main__':
    raise SystemExit(main())
