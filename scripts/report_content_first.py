"""Render docs/LATIS_CONTENT_FIRST_REPORT.md tables from one content-first run.

Reads only the raw records of results/content_first/<run_id> (mechanism matrix,
leakage, regression, per_task.csv, metrics.json, funnel.json, traces) and
prints Markdown fragments plus a JSON digest; it never recomputes a solver
result. The prose of the report is written by hand around these tables.
"""
import argparse
import csv
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def mechanism_table(out):
    matrix = read(out / 'mechanism' / 'matrix.json')
    cells = defaultdict(lambda: defaultdict(lambda: [0, 0, 0]))
    configs = []
    for row in matrix:
        for r in row:
            if r['config'] not in configs:
                configs.append(r['config'])
            c = cells[r['family']][r['config']]
            c[0] += 1 if r.get('train_exact') else 0
            c[1] += 1 if r.get('heldout_exact') else 0
            c[2] += 1
    lines = ['| 家族 | ' + ' | '.join(configs) + ' |', '|---|' + '---|' * len(configs)]
    for fam in cells:
        lines.append(f'| {fam} | ' + ' | '.join(f"{cells[fam][c][0]}/{cells[fam][c][1]}" for c in configs) + ' |')
    detail = {}
    for row in matrix:
        for r in row:
            cf = r.get('content_first') or {}
            detail.setdefault(r['family'], []).append({'seed': r['seed'], 'config': r['config'], 'status': r['status'], 'failure_stage': r.get('failure_stage'),
                                                      'classification': cf.get('final_classification'), 'plan': cf.get('selected_plan_text'),
                                                      'metrics': {k: v for k, v in (cf.get('metrics') or {}).items() if v}, 'seconds': r.get('seconds'), 'search_work': r.get('search_work'), 'first_solution_work': r.get('first_solution_work')})
    return '\n'.join(lines), detail


def regression_table(out):
    p = out / 'mechanism' / 'regression.json'
    if not p.exists():
        return 'regression.json missing', {}
    rows = read(p)
    summary = {'tasks': len(rows), 'all_configs_train_exact': 0, 'program_equal': 0, 'predictions_equal': 0, 'work_equal': 0, 'problems': []}
    for r in rows:
        cfgs = r.get('configs', [])
        ok = all(c['train_exact'] for c in cfgs)
        summary['all_configs_train_exact'] += ok
        summary['program_equal'] += all(c['program_equal_to_first'] for c in cfgs)
        summary['predictions_equal'] += all(c['predictions_equal_to_first'] for c in cfgs)
        summary['work_equal'] += all(c['work_equal_to_first'] for c in cfgs)
        if not ok or not all(c['program_equal_to_first'] and c['predictions_equal_to_first'] for c in cfgs):
            summary['problems'].append(r['task'])
    lines = ['| 任务 | ' + ' | '.join(c['config'] for c in rows[0]['configs']) + ' | 程序相同 | 预测相同 | work 相同 |', '|---|' + '---|' * (len(rows[0]['configs']) + 3)]
    for r in rows:
        cfgs = r['configs']
        lines.append(f"| {r['task']} | " + ' | '.join(('Y' if c['train_exact'] else 'N') + f" ({c['search_work']})" for c in cfgs) + f" | {all(c['program_equal_to_first'] for c in cfgs)} | {all(c['predictions_equal_to_first'] for c in cfgs)} | {all(c['work_equal_to_first'] for c in cfgs)} |")
    return '\n'.join(lines), summary


def arc_tables(out):
    metrics = read(out / 'metrics.json')
    funnel = read(out / 'funnel.json') if (out / 'funnel.json').exists() else {}
    comparison = read(out / 'frozen_vs_dplus_baseline.json') if (out / 'frozen_vs_dplus_baseline.json').exists() else {}
    lines = ['| 配置 | 覆盖 | train-exact | timeout | 新增 vs FrozenD | 丢失 | 配对 work 比 | 首解秒中位 | 独立核验 |', '|---|---|---|---|---|---|---|---|---|']
    for cfg, m in metrics['configs'].items():
        lines.append(f"| {cfg} | {m['coverage']} | {m['train_exact']} | {m['statuses'].get('timeout', 0)} | {len(m['new_vs_FrozenD'])} {m['new_vs_FrozenD']} | {len(m['lost_vs_FrozenD'])} {m['lost_vs_FrozenD']} | {m['paired_work_ratio'] if m['paired_work_ratio'] is None else round(m['paired_work_ratio'], 4)} | {m['distributions']['first_train_exact_seconds']['median']} | {m['independent_verification']} |")
    per_task = list(csv.DictReader((out / 'per_task.csv').open(encoding='utf-8')))
    cls = Counter((r['config'], r['content_first_classification'] or 'n/a') for r in per_task)
    cls_lines = ['| 配置 | 分类 | 任务数 |', '|---|---|---|'] + [f'| {c} | {k} | {n} |' for (c, k), n in sorted(cls.items())]
    size_status = Counter((r['config'], r['size_first_status']) for r in per_task if r['config'] == 'ContentFirstOnly')
    return '\n'.join(lines), '\n'.join(cls_lines), funnel, comparison, dict(size_status), per_task


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
    mech, detail = mechanism_table(out)
    digest['mechanism_detail'] = detail
    print('## 机制矩阵（train-exact/heldout-exact，3 seeds）\n')
    print(mech)
    if (out / 'mechanism' / 'leakage.json').exists():
        print('\n## 泄漏对照\n')
        print('```'); print(json.dumps(read(out / 'mechanism' / 'leakage.json'), ensure_ascii=False, indent=1)); print('```')
    reg, regsum = regression_table(out)
    digest['regression'] = regsum
    print('\n## 旧解回归\n'); print(reg); print(json.dumps(regsum))
    if (out / 'metrics.json').exists():
        arc, cls, funnel, comparison, size_status, per_task = arc_tables(out)
        digest.update(funnel=funnel, comparison=comparison, size_status={str(k): v for k, v in size_status.items()})
        print('\n## ARC 400\n'); print(arc); print('\n'); print(cls)
        print('\n## 漏斗\n```'); print(json.dumps(funnel, ensure_ascii=False, indent=1)); print('```')
        print('\n## FrozenD vs D+ D0_Frozen\n```'); print(json.dumps({k: v for k, v in comparison.items() if k != 'differing'}, indent=1)); print(json.dumps(comparison.get('differing', [])[:20], indent=1)); print('```')
        print('\nsize_first_status (ContentFirstOnly):', size_status)
        cf_solved = [r for r in per_task if r['config'] == 'ContentFirstOnly' and r['program_kind'] == 'content_first_output_spec']
        print('\ncontent-first programs:', [(r['task_id'], r['selected_plan'], r['independent_verification']) for r in cf_solved])
        digest['content_first_programs'] = [(r['task_id'], r['selected_plan']) for r in cf_solved]
        explore = [r for r in per_task if r['config'] == 'ContentFirstExploreAlternatives']
        alts = [(r['task_id'], r['cf_alternative_fits'], r['alternative_fit_plans']) for r in explore if r['cf_alternative_fits'] not in (None, '', '0')]
        print('\nexplore alternatives with fits:', alts)
        digest['explore_alternatives'] = alts
        digest['explore_count'] = len(explore)
    for task in ('2dc579da', 'e50d258f', '0b148d64', 'c909285e'):
        for cfg in ('FrozenD', 'ContentFirstOnly'):
            t = out / 'traces' / task / cfg / 'trace.json'
            if t.exists():
                tr = read(t)
                rec = read(out / 'traces' / task / cfg / 'solver_record.json')
                cf = rec.get('content_first') or {}
                runs = cf.get('runs') or []
                digest.setdefault('traces', {})[f'{task}/{cfg}'] = {
                    'status': tr['summary']['status'], 'events': tr['summary']['events_parsed'], 'candidates': tr['summary']['candidates'],
                    'funnel': {f['stage']: (f['state'], f['events']) for f in tr['funnel']},
                    'first_rejection': tr['blockers']['first_rejection'], 'terminal_blocker': tr['blockers']['terminal_blocker'],
                    'size_rule': {k: rec.get('size_rule', {}).get(k) for k in ('exact', 'templates', 'evaluations', 'truncations')} if isinstance(rec.get('size_rule'), dict) else rec.get('size_rule'),
                    'content_first': {'classification': cf.get('final_classification'), 'runs': [{k: r.get(k) for k in ('trigger', 'size_first_status', 'plan_universe', 'plans_tried', 'selection_legal_plans', 'specs_derived', 'rendered', 'fits', 'truncated')} for r in runs],
                                      'legal_plans': [(c['plan']['text'], c['status'], [x['outcome'] for x in c['cases']], [x['reason'][:80] for x in c['cases'] if x['outcome'] not in ('exact', 'not_executed')]) for r in runs for c in r['candidates'] if c['status'] != 'selection_failed'],
                                      'selection_failure_reasons': Counter(e['reason'].split(':')[0][:60] for r in runs for c in r['candidates'] for e in c['selections'] if not e['legal'])},
                    'html': str((out / 'traces' / task / cfg / 'index.html').resolve().relative_to(ROOT))}
    print('\n## traces\n```'); print(json.dumps(digest.get('traces'), ensure_ascii=False, indent=1, default=str)); print('```')
    (out / 'report_digest.json').write_text(json.dumps(digest, ensure_ascii=False, indent=1, default=str) + '\n', encoding='utf-8')


if __name__ == '__main__':
    main()
