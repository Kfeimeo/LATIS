"""Render the Stage E3.1 report tables and a JSON digest from one run directory (read-only)."""
import argparse
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PHASES = ['scene_build', 'partition_expand', 'selector_precheck', 'dependency_prune', 'candidate_execution', 'mdl_compute', 'minimal_cover']


def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


def fmt(x, nd=1):
    if x is None:
        return '—'
    if isinstance(x, float):
        return f'{x:.{nd}f}'
    return str(x)


def mechanism(out):
    matrix = read(out / 'mechanism' / 'matrix.json')
    cells = defaultdict(lambda: defaultdict(lambda: [0, 0]))
    exposures = defaultdict(lambda: defaultdict(list))
    cands = defaultdict(lambda: defaultdict(list))
    counts = defaultdict(lambda: defaultdict(list))
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
                cands[r['family']][r['config']].append(int(m.get('rg_first_fit_candidate_index', -1)))
            counts[r['family']][r['config']].append((int(m.get('rg_executed', 0)), int(m.get('rg_prechecked', 0)), int(m.get('rg_pruned', 0))))
            detail[r['family']].append({'seed': r['seed'], 'config': r['config'], 'status': r['status'], 'kind': r.get('program_kind'), 'program': r.get('region_program'), 'metrics': m, 'failure_stage': r.get('failure_stage')})
    def table(cellf):
        lines = ['| 家族 | ' + ' | '.join(configs) + ' |', '|---|' + '---|' * len(configs)]
        for fam in cells:
            lines.append(f'| {fam} | ' + ' | '.join(cellf(fam, c) for c in configs) + ' |')
        return '\n'.join(lines)
    t1 = table(lambda fam, c: f"{cells[fam][c][0]}/{cells[fam][c][1]}")
    t2 = table(lambda fam, c: '/'.join(map(str, exposures[fam][c])) if exposures[fam][c] else '—')
    t3 = table(lambda fam, c: '/'.join(map(str, cands[fam][c])) if cands[fam][c] else '—')
    t4 = table(lambda fam, c: '/'.join(f'{e}+{p}+{q}' for e, p, q in counts[fam][c]) if counts[fam][c] else '—')
    return t1, t2, t3, t4, detail, configs


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
        t1, t2, t3, t4, detail, _ = mechanism(out)
        digest['mechanism'] = detail
        print('## 机制矩阵（train-exact/heldout-exact，3 seeds）\n'); print(t1)
        print('\n## 首个 fit 的曝光序号（已执行候选中的序号；按 seed）\n'); print(t2)
        print('\n## 首个 fit 的候选位置（含被跳过候选的固定宇宙位置；按 seed）\n'); print(t3)
        print('\n## 执行数+预检查跳过数+剪枝数（按 seed）\n'); print(t4)
    if (out / 'metrics.json').exists():
        m = read(out / 'metrics.json')
        digest['metrics'] = m
        print('\n## ARC 400（同一二进制 ' + m['binary_sha256'][:16] + '…）\n')
        print('| 配置 | 覆盖 | train-exact | Solve@60s（事件/上界） | timeout | 崩溃 | 留存 vs E3 | 新增 | 丢失 | 配对 work 比 vs 基线 | 配对秒 基线/配置 | 执行 | 预检查跳过 | 剪枝 | invalid 剩余 | no_fit | 预算截断题 | 峰值 live | MDL ms | cover ms | 核验 |')
        print('|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|')
        for cfg, x in m['configs'].items():
            pv = x.get('paired_vs_reference') or {}
            sw = pv.get('search_work') or {}; sec = pv.get('total_to_budget_seconds') or {}
            print(f"| {cfg} | {x['coverage']} | {x['train_exact']} | {x['solve_at_60s']}（{x['solve_at_60s_basis']['eventlog_marker']}/{x['solve_at_60s_basis']['wall_clock_upper_bound']}） | {x['statuses'].get('timeout', 0)} | {x['statuses'].get('runtime_error', 0)} | {x['retained_vs_e3_fullE3']} | {len(x['new_vs_e3_fullE3'])} {x['new_vs_e3_fullE3']} | {len(x['lost_vs_e3_fullE3'])} {x['lost_vs_e3_fullE3']} | {fmt(sw.get('ratio'), 4)} | {fmt(sec.get('reference'))} / {fmt(sec.get('config'))} | {x['sums']['rg_executed']} | {x['sums']['rg_prechecked']} | {x['sums']['rg_pruned']} | {x['sums']['rg_execution_invalid']} | {x['sums']['rg_no_fit']} | {x['region_budget_cut_tasks']} | {x['peak_live_bytes']} | {fmt(x['sums']['mdl_compute_ms'], 0)} | {fmt(x['sums']['minimal_cover_ms'], 0)} | {x['independent_verification']} |")
        print('\n## 分阶段耗时（全部任务求和，ms；count = 计时次数 = 缓存条目/候选数）\n')
        print('| 配置 | ' + ' | '.join(PHASES) + ' |'); print('|---|' + '---|' * len(PHASES))
        for cfg, x in m['configs'].items():
            print(f'| {cfg} | ' + ' | '.join(f"{fmt(x['sums'][ph + '_ms'], 0)} / {x['sums'][ph + '_count']}" for ph in PHASES) + ' |')
        print('\n## 配对对照（与 E31_PatchedBaseline 共同完成的任务）\n')
        keys = ['search_work', 'total_to_budget_seconds', 'rg_executed', 'rg_prechecked', 'rg_pruned', 'rg_execution_invalid', 'rts_allocated_bytes', 'rts_gc_cpu_ns', 'mdl_compute_ms', 'minimal_cover_ms', 'scene_build_ms', 'selector_precheck_ms', 'candidate_execution_ms']
        print('| 配置 | 共同题 | ' + ' | '.join(keys) + ' |'); print('|---|---|' + '---|' * len(keys))
        for cfg, x in m['configs'].items():
            pv = x.get('paired_vs_reference') or {}
            print(f"| {cfg} | {pv.get('common_completed', '—')} | " + ' | '.join((lambda d: f"{fmt(d.get('config'), 0)} ({fmt(d.get('ratio'), 3)})")(pv.get(k) or {}) for k in keys) + ' |')
        print('\n## MDL 缓存与证明状态（求和）\n')
        print('| 配置 | shape basis | objects | distinct masks | static hits | proven | bounded | not computed | c_rect computed |'); print('|---|---|---|---|---|---|---|---|---|')
        for cfg, x in m['configs'].items():
            s = x['sums']
            print(f"| {cfg} | {x['shape_basis']} | {s['rg_mdl_objects']} | {s['rg_mdl_distinct_masks']} | {s['rg_mdl_cache_hits_static']} | {s['rg_mdl_proven']} | {s['rg_mdl_bounded']} | {s['rg_mdl_not_computed']} | {s['rg_crect_computed']} |")
        print('\n| 配置 | 分类 | 任务数 |\n|---|---|---|')
        for cfg, x in m['configs'].items():
            for k, n in sorted(x['classifications'].items()):
                print(f'| {cfg} | {k} | {n} |')
        print('\nregion programs:', json.dumps({cfg: x['region_programs'] for cfg, x in m['configs'].items()}, ensure_ascii=False))
        print('\n## E31_PatchedBaseline vs E3 FullE3（逐题）\n```'); print(json.dumps({k: v for k, v in m['patched_baseline_vs_e3_fullE3'].items() if k != 'differing'}, indent=1)); print(json.dumps(m['patched_baseline_vs_e3_fullE3'].get('differing', [])[:12], indent=1)); print('```')
        print('\n## FrozenE01 vs E3 FrozenE01\n```'); print(json.dumps({k: v for k, v in m['frozen_vs_e3_frozen'].items() if k != 'differing'}, indent=1)); print(json.dumps(m['frozen_vs_e3_frozen'].get('differing', [])[:12], indent=1)); print('```')
        print('\n## 单 worker 复查\n```'); print(json.dumps(m.get('single_worker_replays'), indent=1)); print('```')
        print('crashed records kept:', m.get('crashed_records_kept'))
    if (out / 'verification_e31.json').exists():
        v = read(out / 'verification_e31.json')
        digest['verification'] = v
        print('\n## 独立核验\n```')
        for cfg, x in v['configs'].items():
            print(cfg, json.dumps({k: (x[k] if not isinstance(x[k], list) else len(x[k])) for k in x}, default=str))
        for k, x in v['equivalences'].items():
            print(k, json.dumps({kk: vv for kk, vv in x.items() if kk != 'differing'}), 'differing:', len(x['differing']))
        print('```')
    traces = {}
    for d in sorted((out / 'traces').glob('*/*')) if (out / 'traces').exists() else []:
        t = d / 'trace.json'
        if not t.exists():
            continue
        tr = read(t)
        rec = read(d / 'solver_record.json') if (d / 'solver_record.json').exists() else {}
        rs = rec.get('region_search') or {}
        run = rs.get('run') or {}
        traces[f'{d.parent.name}/{d.name}'] = {'status': tr['summary']['status'], 'program_kind': rec.get('program_kind'), 'selected': (rs.get('selected_program') or {}).get('text') or rec.get('content_first_plan'),
                                              'views': [v['view'] for v in run.get('views', [])], 'universe': run.get('universe'), 'executed': run.get('executed'), 'pruned': run.get('pruned'),
                                              'prechecked': (run.get('precheck') or {}).get('skipped'), 'first_fit_exposure': run.get('first_fit_exposure'), 'first_fit_candidate_index': run.get('first_fit_candidate_index'),
                                              'outcomes': run.get('outcome_counts'), 'shape_basis': run.get('shape_basis'), 'html': str((d / 'index.html').resolve().relative_to(ROOT))}
    digest['traces'] = traces
    print('\n## traces\n```'); print(json.dumps(traces, ensure_ascii=False, indent=1, default=str)); print('```')
    (out / 'report_digest.json').write_text(json.dumps(digest, ensure_ascii=False, indent=1, default=str) + '\n', encoding='utf-8')


if __name__ == '__main__':
    main()
