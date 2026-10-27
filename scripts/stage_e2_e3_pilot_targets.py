"""Pilot subset for the non-full Stage E2/E3 configurations: every task whose FullE3 region
search opened at least one separating (k >= 2) split, plus every task solved by any full
configuration (old 22 + new), so the ablation is measured where the region path is active.
The subset is written to <out>/pilot_targets.txt and its rule recorded.
"""
import argparse
import json
from pathlib import Path


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--out', required=True)
    a = p.parse_args()
    out = Path(a.out)
    ids = set()
    rule = {'k2plus_in_FullE3': 0, 'solved_by_any_full_config': 0}
    for rec in out.glob('tasks/*/*/stage-d-*.json'):
        if '.crashed' in rec.name:
            continue
        r = json.loads(rec.read_text(encoding='utf-8'))
        tid = rec.parent.parent.name
        if r.get('train_exact'):
            ids.add(tid); rule['solved_by_any_full_config'] += 1
        if rec.parent.name == 'FullE3':
            run = (r.get('region_search') or {}).get('run') or {}
            k2 = sum(int(v) for t in run.get('trees', []) for k, v in t['tree']['k_histogram'].items() if int(k) >= 2)
            if k2 > 0:
                ids.add(tid); rule['k2plus_in_FullE3'] += 1
    (out / 'pilot_targets.txt').write_text('\n'.join(sorted(ids)) + '\n', encoding='utf-8')
    (out / 'pilot_targets_rule.json').write_text(json.dumps({'rule': __doc__.strip(), 'counts': rule, 'subset_size': len(ids)}, indent=1) + '\n', encoding='utf-8')
    print(len(ids), 'pilot targets', rule)


if __name__ == '__main__':
    main()
