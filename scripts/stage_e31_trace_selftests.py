"""Drive the viewer self-test (#selftest, headless Chrome) over every trace page of a Stage E3.1
run and record the reports in <out>/validation/trace_selftests.json. Pages whose self-test
cannot be produced are recorded as errors, never as passes."""
import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'test'))
sys.path.insert(0, str(ROOT / 'scripts'))


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--out', required=True)
    a = p.parse_args()
    out = Path(a.out)
    import TraceIOValidation as TV  # noqa: E402  (headless Chrome helper)
    (ROOT / 'build' / 'trace-io-tmp').mkdir(parents=True, exist_ok=True)
    results = {}
    if not Path(TV.CHROME).exists():
        pages = sorted((out / 'traces').glob('*/*/index.html'))
        (out / 'validation' / 'trace_selftests.json').write_text(json.dumps({'not_run': f'headless Chrome not found at {TV.CHROME}', 'pages': [str(p.relative_to(out)) for p in pages]}, ensure_ascii=False, indent=1) + '\n', encoding='utf-8')
        print('viewer self-tests not_run (no Chrome);', len(pages), 'pages rendered')
        return
    for page in sorted((out / 'traces').glob('*/*/index.html')):
        key = f'{page.parent.parent.name}/{page.parent.name}'
        try:
            rep = TV.selftest(page)   # the report's region_cards counts rendered rows (set by the viewer's self-test)
            results[key] = rep
        except Exception as e:  # noqa: BLE001
            results[key] = {'errors': [f'selftest failed: {e}']}
    (out / 'validation' / 'trace_selftests.json').write_text(json.dumps(results, ensure_ascii=False, indent=1) + '\n', encoding='utf-8')
    bad = {k: v for k, v in results.items() if v.get('errors')}
    print(len(results), 'pages;', len(bad), 'with errors', json.dumps(bad)[:500])
    if bad:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
