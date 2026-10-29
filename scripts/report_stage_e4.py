"""Render the Stage E4 report tables and a JSON digest from one run directory (read-only)."""
import argparse
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))


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
    mech = out / 'mechanism' / 'matrix.json'
    if mech.exists():
        m = read(mech)
        configs, cells, detail = [], defaultdict(dict), defaultdict(list)
        for row in m:
            for r in row:
                if r['config'] not in configs:
                    configs.append(r['config'])
                best = ((r.get('output_skeleton') or {}).get('best') or {}) if isinstance(r.get('output_skeleton'), dict) else {}
                same_view = (best.get('cost') or {}).get('independent_total')
                cells[r['family']].setdefault(r['config'], []).append((r.get('e4_status'), r.get('expected_e4_status'), (r.get('heldout_structural') or {}).get('oracle_parameter_structural_reconstruction'), r.get('e4_holes'), r.get('e4_relations'), r.get('e4_shared_cost'), f"{same_view}|{r.get('e4_independent_cost')}", r.get('e4_ambiguity'), r.get('train_exact')))
                detail[r['family']].append({k: r.get(k) for k in ('seed', 'config', 'e4_status', 'e4_reason', 'e4_skeleton', 'e4_holes', 'e4_relations', 'e4_shared_cost', 'e4_independent_cost', 'e4_ambiguity', 'heldout_structural', 'train_exact', 'seconds')})
        digest['mechanism'] = detail
        abbrev = {'StructureVerifiedAllOutputs': 'Verified', 'NoNontrivialSharedStructure': 'Trivial', 'RepresentationUnavailable': 'ReprUnavail', 'SingleOutputStructuralCompression': 'Single', 'BudgetTruncated': 'Budget', 'ExhaustedInBoundedGrammar': 'Exhausted', 'StructureVerifiedSubset': 'Subset', 'NotAttempted': 'Off', None: 'Off'}
        print('## 机制矩阵（E4 状态，3 seeds；期望状态在括号内；h=heldout 结构实例化 t/f/n）\n')
        print('| 家族 | 期望 | ' + ' | '.join(configs) + ' |'); print('|---|---|' + '---|' * len(configs))
        for fam, by in cells.items():
            exp = next(iter(by.values()))[0][1]
            print(f'| {fam} | {abbrev.get(exp, exp)} | ' + ' | '.join('/'.join(abbrev.get(x[0], str(x[0])) + ('h' + {'true': 't', 'false': 'f'}.get(x[2], 'n')) for x in by.get(c, [])) for c in configs) + ' |')
        print('\n## 机制：holes / relations / shared cost / independent cost / ambiguity（E4_OutputSkeletonOnly，按 seed）\n')
        print('| 家族 | holes | relations | shared | independent | ambiguity | train_exact |'); print('|---|---|---|---|---|---|---|')
        for fam, by in cells.items():
            xs = by.get('E4_OutputSkeletonOnly', [])
            print(f"| {fam} | {'/'.join(str(x[3]) for x in xs)} | {'/'.join(str(x[4]) for x in xs)} | {'/'.join(str(x[5]) for x in xs)} | {'/'.join(str(x[6]) for x in xs)} | {'/'.join(str(x[7]) for x in xs)} | {'/'.join(str(x[8]) for x in xs)} |")
    if (out / 'metrics.json').exists():
        met = read(out / 'metrics.json')
        digest['metrics'] = met
        for sd, md in met['modes'].items():
            print(f"\n## {sd}（{md['coverage']} 题，覆盖按 /{md['tasks']} 报告）\n")
            print('| 配置 | 记录 | train-exact | 与 E4_Off 同程序/同 exactness | 逐格重放 | E4 状态分布 | holes 中位 | 压缩比中位 | 预算截断题 | 配对墙钟 off/cfg | 峰值 live | prediction_ready=true |')
            print('|---|---|---|---|---|---|---|---|---|---|---|---|')
            for cfg, x in md['per_config'].items():
                pw = x.get('paired_wall_vs_E4_Off') or {}
                print(f"| {cfg} | {x['records']} | {x['train_exact']} | {x['same_program_and_exactness_as_E4_Off']} | {x['pixel_replay_exact']} | {json.dumps(x['e4_statuses'])} | {x['e4_holes_median']} | {x['e4_compression_median']} | {len(x['e4_truncated_tasks'])} | {pw.get('off', '—')} / {pw.get('config', '—')} | {x['peak_live_bytes']} | {x['prediction_ready_true']} |")
            for cfg, x in md['per_config'].items():
                if x['e4_status_by_stratum']:
                    print(f"\n{cfg} 按 Quick40 分层：")
                    for s, c in x['e4_status_by_stratum'].items():
                        print(f'- {s}: {json.dumps(c)}')
                    print(f"- StructureVerifiedAllOutputs 任务: {x['e4_verified_all_tasks']}")
        print('\nfull400:', met['full400'], '|', met['historical_baseline_note'])
    if (out / 'verification.json').exists():
        v = read(out / 'verification.json')
        digest['verification'] = v
        print('\n## 独立核验\n```')
        for sd, s in v['subdirs'].items():
            print(sd, json.dumps({k: (val if not isinstance(val, list) else len(val)) for k, val in s.items()}, default=str))
        print('mechanism', json.dumps(v['mechanism'], default=str)[:600])
        print('```')
    if (out / 'per_task.csv').exists():
        import csv
        csv.field_size_limit(10 ** 9)
        rows = list(csv.DictReader(open(out / 'per_task.csv', encoding='utf-8')))
        focus = ['543a7ed5', 'e50d258f', '2dc579da', '1c786137', '5582e5ca', 'd9fac9be', 'c909285e', '0b148d64', '90f3ed37', '484b58aa']
        print('\n## 定向任务（E4_OutputSkeletonOnly）\n')
        print('| 任务 | mode | 旧 solver 状态 | E4 状态 | holes | relations | shared / independent | 骨架 / 原因 |'); print('|---|---|---|---|---|---|---|---|')
        for r in rows:
            if r['task_id'] in focus and r['config'] == 'E4_OutputSkeletonOnly':
                print(f"| {r['task_id']} | {r['mode']} | {r['status']} | {r['e4_status']} | {r['e4_holes']} | {r['e4_relations']} | {r['e4_shared_cost']} / {r['e4_independent_cost']} | {(r['e4_skeleton'] or r['e4_reason'] or '')[:140]} |")
        digest['focus'] = [r for r in rows if r['task_id'] in focus]
    (out / 'report_digest.json').write_text(json.dumps(digest, ensure_ascii=False, indent=1, default=str) + '\n', encoding='utf-8')


if __name__ == '__main__':
    main()
