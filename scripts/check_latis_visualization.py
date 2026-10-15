"""Audit actual replay evidence against saved per-task exact flags and HTML payload."""
import argparse
import json
from pathlib import Path
import re
from visualize_latis import validate_grid, hs_type, hs_literal


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('report', type=Path, help='generated HTML report')
    args = parser.parse_args()
    evidence = json.loads(args.report.with_suffix('.replay.json').read_text(encoding='utf-8'))
    html = args.report.read_text(encoding='utf-8')
    payload = re.search(r'<script type="application/json" id="data">(.*?)</script>', html, re.S)
    assert payload and json.loads(payload[1]) == evidence, 'HTML and replay evidence differ'
    assert '<' not in payload[1], 'Embedded JSON must not permit closing the script tag'
    programs = examples = errors = unsolved = 0
    for item in evidence['items']:
        solution, replay = item['solution'], item['replay']
        if not solution.get('program'):
            assert 'error' in replay
            assert not any('prediction' in row for split in ['train', 'test'] for row in replay.get(split, []))
            unsolved += 1
            continue
        assert 'error' not in replay, (item['name'], replay)
        programs += 1
        for split, flag in [('train', 'train_exact'), ('test', 'heldout_exact')]:
            pairs, predictions = item['task'].get(split, []), replay[split]
            assert len(pairs) == len(predictions), (item['name'], split, 'row count')
            for row in predictions:
                assert ('prediction' in row) != ('error' in row), row
                if 'prediction' in row:
                    assert validate_grid(row['prediction'])
                else:
                    assert isinstance(row['error'], str) and row['error']
                    errors += 1
            if type(solution.get(flag)) is bool and pairs and all('output' in pair for pair in pairs):
                exact = all(row.get('prediction') == pair['output'] for row, pair in zip(predictions, pairs))
                assert exact == solution[flag], (item['name'], split, exact, solution[flag])
            examples += len(pairs)
    # Regression for the numeric constructor name encountered in the corpus.
    assert hs_type('ArrowT (PairT D4T PlacedT) PlacedT')
    # Unsupported persisted forms must fail closed, never become executable code.
    for function, source in [(hs_type, 'IntT); unsafePerformIO action'), (hs_literal, 'IntV 0); error "injected"')]:
        try:
            function(source)
        except ValueError:
            pass
        else:
            raise AssertionError('Unsafe persisted syntax accepted')
    print(f'PASS: {programs} programs / {examples} examples; {errors} explicit evaluation failures; {unsolved} entries without a selected program. All saved exact flags agree.')


if __name__ == '__main__':
    main()
