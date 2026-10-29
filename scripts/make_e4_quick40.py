"""Freeze the Stage E4 Quick40 manifest from the Stage E3.1 frozen per-task results (read-only input).

Exactly 40 distinct ARC-AGI-1 training task ids in five strata, chosen by fixed rules and a
published seed from `results/stage_e31/e31-20261028-main/per_task.csv` (E31_Full rows):

  solved_regression (8)      the 4 Region solutions, the 2 content-first solutions, 2 Size-first solutions
                             (seeded sample of the 20)
  representation_failure (12) e50d258f, 543a7ed5, then a seeded sample of tasks whose region search built a
                             separating (k>=2) split but found no rule (region_rule_unavailable)
  construction_failure (8)   tasks whose legacy pipeline reached a parameter / realization stage and failed
                             (failure_stage in size_rule, grid_realization, grid_exact_check, transformation,
                             alignment_validation, alignment)
  high_cost (4)              484b58aa plus the 3 remaining tasks with the largest E31_Full wall clock
  random_unsolved (8)        seeded sample of the remaining unsolved tasks
Strata are filled in this order; a task already taken is skipped and the next legal candidate used.
The manifest records task_id, stratum, selection_reason, prior_status, prior_work, prior_wall, seed,
source_run and its own sha256 (over the canonical task list). Running again reproduces it; a
different output means the source run or the rules changed, never the E4 results.
"""
import argparse
import csv
import hashlib
import json
import random
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE_RUN = 'results/stage_e31/e31-20261028-main'
SEED = 20261029
CONSTRUCTION_STAGES = {'size_rule', 'grid_realization', 'grid_exact_check', 'transformation', 'alignment_validation', 'alignment'}


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--out', default=str(ROOT / 'manifests' / 'e4_quick40.json'))
    p.add_argument('--check', action='store_true', help='verify an existing manifest instead of writing')
    a = p.parse_args()
    csv.field_size_limit(10 ** 9)
    rows = {r['task_id']: r for r in csv.DictReader(open(ROOT / SOURCE_RUN / 'per_task.csv', encoding='utf-8')) if r['config'] == 'E31_Full'}
    assert len(rows) == 400
    rng = random.Random(SEED)
    taken, picks = set(), []

    def take(tid, stratum, reason):
        if tid in taken:
            return False
        r = rows[tid]
        picks.append({'task_id': tid, 'stratum': stratum, 'selection_reason': reason, 'prior_status': r['status'], 'prior_classification': r['classification'],
                      'prior_failure_stage': r['failure_stage'], 'prior_program_kind': r['program_kind'] or None, 'prior_work': int(float(r['search_work'])) if r['search_work'] else None,
                      'prior_wall_seconds': round(float(r['wall_seconds']), 3), 'prior_region_k2plus_splits': int(r['rg_k2plus_splits'] or 0)})
        taken.add(tid)
        return True

    def sample(cands, n, stratum, reason):
        cands = [t for t in sorted(cands) if t not in taken]
        chosen = rng.sample(cands, min(n, len(cands)))
        for t in sorted(chosen):
            take(t, stratum, reason)
    # 1. solved regression
    for t in sorted(t for t, r in rows.items() if r['program_kind'] == 'region'):
        take(t, 'solved_regression', 'E3/E3.1 Region solution (must be included)')
    for t in sorted(t for t, r in rows.items() if r['program_kind'] == 'content_first'):
        take(t, 'solved_regression', 'content-first solution (must be included)')
    sample([t for t, r in rows.items() if r['train_exact'] == 'True' and r['program_kind'] == 'legacy'], 2, 'solved_regression', f'Size-first solution, seeded sample (seed {SEED}) of the 20')
    # 2. representation failures
    for t in ('e50d258f', '543a7ed5'):
        take(t, 'representation_failure', 'audited E2/E3 oracle task: CountColor/ArgMax selector resp. constructive shell/fill missing')
    sample([t for t, r in rows.items() if r['train_exact'] != 'True' and r['classification'] == 'region_rule_unavailable' and int(r['rg_k2plus_splits'] or 0) > 0], 10,
           'representation_failure', 'region tree had a separating split but the finite region-program universe held no rule; seeded sample')
    # 3. construction failures
    sample([t for t, r in rows.items() if r['train_exact'] != 'True' and r['failure_stage'] in CONSTRUCTION_STAGES], 8,
           'construction_failure', 'legacy pipeline reached a parameter-synthesis / realization stage and failed (failure_stage label); seeded sample')
    # 4. high cost
    take('484b58aa', 'high_cost', 'E3 8-worker timeout / 160-220 s task (must be included)')
    for t in sorted((t for t in rows if t not in taken), key=lambda t: (-float(rows[t]['wall_seconds']), t))[:3]:
        take(t, 'high_cost', 'largest E31_Full wall clock among the remaining tasks')
    # 5. random unsolved
    sample([t for t, r in rows.items() if r['train_exact'] != 'True'], 8, 'random_unsolved', f'seeded sample (seed {SEED}) of the remaining unsolved tasks')
    assert len(picks) == 40 and len({x['task_id'] for x in picks}) == 40, len(picks)
    canonical = json.dumps([x['task_id'] for x in picks], separators=(',', ':'))
    manifest = {'name': 'e4_quick40', 'version': 1, 'source_run': SOURCE_RUN, 'source_config': 'E31_Full', 'seed': SEED,
                'note': 'stratified mechanism-oriented diagnostic set; NOT an unbiased sample of the 400 tasks; results are reported /40 and never scaled to /400',
                'strata': {'solved_regression': 8, 'representation_failure': 12, 'construction_failure': 8, 'high_cost': 4, 'random_unsolved': 8},
                'tasks': picks, 'task_ids_sha256': hashlib.sha256(canonical.encode()).hexdigest()}
    out = Path(a.out)
    if a.check:
        old = json.loads(out.read_text(encoding='utf-8'))
        same = old['task_ids_sha256'] == manifest['task_ids_sha256'] and [x['task_id'] for x in old['tasks']] == [x['task_id'] for x in picks]
        print('manifest', 'unchanged' if same else 'DIFFERS', old['task_ids_sha256'])
        raise SystemExit(0 if same else 1)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(manifest, ensure_ascii=False, indent=1) + '\n', encoding='utf-8')
    print(out, manifest['task_ids_sha256'])
    for s in manifest['strata']:
        print(s, [x['task_id'] for x in picks if x['stratum'] == s])


if __name__ == '__main__':
    main()
