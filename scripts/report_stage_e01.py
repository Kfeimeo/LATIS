"""Render the Stage E0/E1 report tables and a JSON digest from one run directory (read-only)."""
import argparse
import csv
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def mechanism(out):
    matrix = read(out / 'mechanism' / 'matrix.json')
    cells = defaultdict(lambda: defaultdict(lambda: [0, 0]))
    configs = []
    detail = defaultdict(list)
    for row in matrix:
        for r in row:
            if r['config'] not in configs:
                configs.append(r['config'])
            c = cells[r['family']][r['config']]
            c[0] += 1 if r.get('train_exact') else 0
            c[1] += 1 if r.get('heldout_exact') else 0
            cf = r.get('content_first') or {}
            detail[r['family']].append({'seed': r['seed'], 'config': r['config'], 'status': r['status'], 'failure_stage': r.get('failure_stage'), 'classification': cf.get('final_classification'),
                                        'plan': cf.get('selected_plan_text'), 'view': r.get('selected_view'), 'geometry': r.get('geometry_metrics'), 'work': r.get('search_work'), 'first_solution_work': r.get('first_solution_work'), 'seconds': r.get('seconds')})
    lines = ['| 家族 | ' + ' | '.join(configs) + ' |', '|---|' + '---|' * len(configs)]
    for fam in cells:
        lines.append(f'| {fam} | ' + ' | '.join(f"{cells[fam][c][0]}/{cells[fam][c][1]}" for c in configs) + ' |')
    return '\n'.join(lines), detail


def main():
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:  # noqa: BLE001
        pass
    p = argparse.ArgumentParser()
    p.add_argument('--out', required=True)
    a = p.parse_args()
    out = Path(a.out)
    digest = {}
    if (out / 'mechanism' / 'matrix.json').exists():
        table, detail = mechanism(out)
        digest['mechanism'] = detail
        print('## 机制矩阵（train-exact/heldout-exact，3 seeds）\n')
        print(table)
    if (out / 'metrics.json').exists():
        m = read(out / 'metrics.json')
        digest['metrics'] = m
        print('\n## ARC 400\n')
        print('| 配置 | 覆盖 | train-exact | timeout | 新增 vs FrozenCF | 丢失 | 配对 work 比 | 配对秒 基线/配置 | 视图创建题数 | 几何谓词评估 | 选中视图 | 几何核验 |')
        print('|---|---|---|---|---|---|---|---|---|---|---|---|')
        for cfg, x in m['configs'].items():
            print(f"| {cfg} | {x['coverage']} | {x['train_exact']} | {x['statuses'].get('timeout', 0)} | {len(x['new_vs_baseline'])} {x['new_vs_baseline']} | {len(x['lost_vs_baseline'])} {x['lost_vs_baseline']} | {x['paired_work_ratio'] if x['paired_work_ratio'] is None else round(x['paired_work_ratio'], 4)} | {round(x['paired_seconds_baseline'], 1)} / {round(x['paired_seconds_config'], 1)} | {x['views_created_tasks']} | {x['geometry_feature_evaluations_sum']} | {x['selected_views']} | {x['geometry_verification']} |")
        per_task = list(csv.DictReader((out / 'per_task.csv').open(encoding='utf-8')))
        cls = Counter((r['config'], r['classification']) for r in per_task)
        print('\n| 配置 | 分类 | 任务数 |', '\n|---|---|---|')
        for (c, k), n in sorted(cls.items()):
            print(f'| {c} | {k} | {n} |')
        comparison = read(out / 'frozen_vs_content_first_run.json')
        digest['comparison'] = comparison
        print('\n## FrozenCF vs 上一轮 ContentFirstOnly\n```'); print(json.dumps({k: v for k, v in comparison.items() if k != 'differing'}, indent=1)); print(json.dumps(comparison.get('differing', [])[:10], indent=1)); print('```')
        full = [r for r in per_task if r['config'] == 'FullE01']
        digest['fulle01_views_used'] = Counter(r['selected_view'] for r in full if r['selected_view'])
        digest['cover_status'] = {c: m['configs'][c]['cover_status_selected'] for c in m['configs']}
    for task in ('e50d258f', '2dc579da', '543a7ed5'):
        for cfg in ('FrozenCF', 'FullE01'):
            t = out / 'traces' / task / cfg / 'trace.json'
            if not t.exists():
                continue
            tr = read(t)
            rec = read(out / 'traces' / task / cfg / 'solver_record.json')
            cf = rec.get('content_first') or {}
            runs = cf.get('runs') or []
            grids = read(out / 'traces' / task / cfg / 'grids.json')
            views = [[(v.get('result') or {}).get('view', v.get('view')), v.get('applicable'), (v.get('result') or {}).get('background'), (v.get('result') or {}).get('regions'), (v.get('reason') or '')[:70]] for v in grids['pairs'][0].get('views', [])]
            geo_events = Counter(e.get('kind') for e in [] )
            digest.setdefault('traces', {})[f'{task}/{cfg}'] = {
                'status': tr['summary']['status'], 'events': tr['summary']['events_parsed'], 'candidates': tr['summary']['candidates'],
                'funnel': {f['stage']: (f['state'], f['events']) for f in tr['funnel']}, 'first_rejection': tr['blockers']['first_rejection'], 'terminal_blocker': tr['blockers']['terminal_blocker'],
                'size_rule': {k: rec.get('size_rule', {}).get(k) for k in ('exact', 'templates', 'evaluations', 'truncations')} if isinstance(rec.get('size_rule'), dict) else None,
                'content_first': {'classification': cf.get('final_classification'), 'runs': [{k: r.get(k) for k in ('trigger', 'size_first_status', 'plan_universe', 'plans_tried', 'selection_legal_plans', 'specs_derived', 'rendered', 'fits', 'truncated', 'truncation_reason')} for r in runs],
                                  'legal_plans_by_view': dict(Counter(c['plan']['view']['view'] for r in runs for c in r['candidates'] if c['status'] != 'selection_failed')),
                                  'legal_plan_examples': [(c['plan']['text'], c['status'], [x['outcome'] for x in c['cases']]) for r in runs for c in r['candidates'] if c['status'] != 'selection_failed'][:8]},
                'views_case0': views, 'geometry_metrics': {k: v for k, v in ((cf.get('metrics') or {}).items()) if k.startswith('geo_')},
                'html': str((out / 'traces' / task / cfg / 'index.html').resolve().relative_to(ROOT))}
    print('\n## traces\n```'); print(json.dumps(digest.get('traces'), ensure_ascii=False, indent=1, default=str)); print('```')
    (out / 'report_digest.json').write_text(json.dumps(digest, ensure_ascii=False, indent=1, default=str) + '\n', encoding='utf-8')


if __name__ == '__main__':
    main()
