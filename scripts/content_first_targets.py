"""Targets of the ExploreAlternatives phase: every task that FrozenD or
ContentFirstOnly solved in the formal phase.

ExploreAlternatives only differs from ContentFirstOnly after a Size-first first
solution, so unsolved tasks would repeat the ContentFirstOnly record.
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
    for rec in out.glob('tasks/*/*/stage-d-*.json'):
        r = json.loads(rec.read_text(encoding='utf-8'))
        if r.get('train_exact'):
            ids.add(rec.parent.parent.name)
    (out / 'explore_targets.txt').write_text('\n'.join(sorted(ids)) + '\n', encoding='utf-8')
    print(len(ids), 'explore targets')


if __name__ == '__main__':
    main()
