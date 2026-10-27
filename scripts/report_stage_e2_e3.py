"""Render the Stage E2/E3 report tables and a JSON digest from one run directory (read-only)."""
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
    exposures = defaultdict(lambda: defaultdict(list))
    pruned = defaultdict(lambda: defaultdict(list))
    configs = []
    detail = defaultdict(list)
    for row in matrix:
        for r in row:
            if r['config'] not in configs:
                configs.append(r['config'])
            c = cells[r['family']][r['config']]
            c[0] += 1 if r.get('train_exact') else 0
            c[1] += 1 if r.get('heldout_exact') else 0
            m = r.get('region_metrics') or {}
            if r.get('train_exact') and r.get('program_kind') == 'region_program':
                exposures[r['family']][r['config']].append(int(m.get('rg_first_fit_exposure', -1)))
            pruned[r['family']][r['config']].append((int(m.get('rg_executed', 0)), int(m.get('rg_pruned', 0))))
            detail[r['family']].append({'seed': r['seed'], 'config': r['config'], 'status': r['status'], 'kind': r.get('program_kind'), 'program': r.get('region_program'), 'metrics': m, 'failure_stage': r.get('failure_stage')})
    lines = ['| 家族 | ' + ' | '.join(configs) + ' |', '|---|' + '---|' * len(configs)]
    for fam in cells:
        lines.append(f'| {fam} | ' + ' | '.join(f"{cells[fam][c][0]}/{cells[fam][c][1]}" for c in configs) + ' |')
    exp_lines = ['| 家族 | ' + ' | '.join(configs) + ' |', '|---|' + '---|' * len(configs)]
    for fam in cells:
        exp_lines.append(f'| {fam} | ' + ' | '.join(('/'.join(map(str, exposures[fam][c])) if exposures[fam][c] else '—') for c in configs) + ' |')
    pr_lines = ['| 家族 | ' + ' | '.join(configs) + ' |', '|---|' + '---|' * len(configs)]
    for fam in cells:
        pr_lines.append(f'| {fam} | ' + ' | '.join(('/'.join(f'{e}+{p}' for e, p in pruned[fam][c]) if pruned[fam][c] else '—') for c in configs) + ' |')
    return '\n'.join(lines), '\n'.join(exp_lines), '\n'.join(pr_lines), detail


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
        t1, t2, t3, detail = mechanism(out)
        digest['mechanism'] = detail
        print('## 机制矩阵（train-exact/heldout-exact，3 seeds）\n'); print(t1)
        print('\n## 首个 fit 的曝光序号（region 程序解；按 seed）\n'); print(t2)
        print('\n## 执行数+剪枝数（按 seed）\n'); print(t3)
    if (out / 'metrics.json').exists():
        m = read(out / 'metrics.json')
        digest['metrics'] = m
        print('\n## ARC 400\n')
        print('| 配置 | 覆盖 | train-exact | Solve@60s | timeout | 崩溃 | 新增 | 丢失 | 配对 work 比 | 配对秒 基线/配置 | region 触发题 | 执行 | 剪枝 | 预算截断题 | k≥2 题 | 峰值内存 | 核验 |')
        print('|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|')
        for cfg, x in m['configs'].items():
            print(f"| {cfg} | {x['coverage']} | {x['train_exact']} | {x['solve_at_60s']} | {x['statuses'].get('timeout', 0)} | {x['statuses'].get('runtime_error', 0)} | {len(x['new_vs_baseline'])} {x['new_vs_baseline']} | {len(x['lost_vs_baseline'])} {x['lost_vs_baseline']} | {x['paired_work_ratio'] if x['paired_work_ratio'] is None else round(x['paired_work_ratio'], 4)} | {round(x['paired_seconds_baseline'], 1)} / {round(x['paired_seconds_config'], 1)} | {x['region_triggered_tasks']} | {x['region_executed_sum']} | {x['region_pruned_sum']} | {x['region_budget_cut_tasks']} | {x['region_k2plus_tasks']} | {x['peak_live_bytes']} | {x['independent_verification']} |")
        print('\n| 配置 | 分类 | 任务数 |\n|---|---|---|')
        for cfg, x in m['configs'].items():
            for k, n in sorted(x['classifications'].items()):
                print(f'| {cfg} | {k} | {n} |')
        print('\nregion programs:', {cfg: x['region_programs'] for cfg, x in m['configs'].items()})
        comp = read(out / 'frozen_vs_e01.json') if (out / 'frozen_vs_e01.json').exists() else {}
        digest['comparison'] = comp
        print('\n## FrozenE01 vs E0/E1 FullE01\n```'); print(json.dumps({k: v for k, v in comp.items() if k != 'differing'}, indent=1)); print(json.dumps(comp.get('differing', [])[:10], indent=1)); print('```')
        print('crashed records kept:', m.get('crashed_records_kept'))
    for task in ('2dc579da', 'e50d258f', '543a7ed5', 'c909285e', '0b148d64'):
        for cfg in ('FrozenE01', 'FullE3'):
            t = out / 'traces' / task / cfg / 'trace.json'
            if not t.exists():
                continue
            tr = read(t)
            rec = read(out / 'traces' / task / cfg / 'solver_record.json')
            rs = rec.get('region_search') or {}
            run = rs.get('run') or {}
            digest.setdefault('traces', {})[f'{task}/{cfg}'] = {
                'status': tr['summary']['status'], 'program_kind': rec.get('program_kind'), 'selected': (rs.get('selected_program') or {}).get('text') or rec.get('content_first_plan'),
                'views': [v['view'] for v in run.get('views', [])], 'rejected': [(v['view'], v['reason'][:80]) for v in run.get('rejected_views', [])],
                'k_hist': [(t2['case_index'], t2['view'], t2['tree']['k_histogram'], t2['tree']['leaf_kinds']) for t2 in run.get('trees', [])],
                'universe': run.get('universe'), 'executed': run.get('executed'), 'pruned': run.get('pruned'), 'fits': [f['text'] for f in run.get('fits', [])], 'budget_cut': run.get('budget_cut'),
                'first_fit_exposure': run.get('first_fit_exposure'), 'goals': [(g['goal_id'], g['status'], g['used'], g['total']) for g in run.get('goals', [])],
                'outcomes': dict(Counter(e['outcome'] for e in run.get('exposures', []))), 'top_reasons': Counter(e['reason'][:60] for e in run.get('exposures', [])).most_common(5),
                'funnel': {f['stage']: (f['state'], f['events']) for f in tr['funnel']}, 'html': str((out / 'traces' / task / cfg / 'index.html').resolve().relative_to(ROOT))}
    print('\n## traces\n```'); print(json.dumps(digest.get('traces'), ensure_ascii=False, indent=1, default=str)); print('```')
    (out / 'report_digest.json').write_text(json.dumps(digest, ensure_ascii=False, indent=1, default=str) + '\n', encoding='utf-8')


if __name__ == '__main__':
    main()
