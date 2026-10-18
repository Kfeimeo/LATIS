"""Round-3 report: (1) mechanism test for non-local deferral in a controlled
environment, (2) frozen end-to-end audit (cross-object / scene / sequence rules)
under B0/B1/B1L/B1Q/B1X/B1QX, (3) path audit of selected programs, (4) fixed-DAG
extractor isolation (refine vs lazy cover at the protocol allowance), and the
layered Q-vs-QX check. Numbers come from result files only."""
import collections, csv, json, pathlib, re, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import report_place_demand_experiment as R
ROOT = R.ROOT; R2 = ROOT / 'results/place-demand-round2'; R3 = ROOT / 'results/place-demand-round3'
VARS = ['B0', 'B1', 'B1L', 'B1Q', 'B1X', 'B1QX']

def parse_diag(path):
    d = {'task': path.stem}
    for line in path.read_text(encoding='utf-8', errors='replace').splitlines():
        m = re.match(r'deduction\(B1Q\): root=(\d+) nodes=(\d+) joins=(\d+) work=(\d+) deferred_released=(\d+)', line)
        if m: d.update(nodes=int(m[2]), joins=int(m[3]), work=int(m[4]), released=int(m[5]))
        m = re.match(r'(refine|lazy): budget=(\d+) attempts=(\d+) candidates=(\d+) train_exact=(\d+) heldout_correct\(post-hoc\)=(\d+)', line)
        if m: d[m[1]] = dict(attempts=int(m[3]), candidates=int(m[4]), train_exact=int(m[5]), held=int(m[6])); cur = m[1]
        m = re.match(r'\s+selected cost=(\d+) heldout=(\w+) :: (.*)', line)
        if m and cur in d: d[cur].update(selected_cost=int(m[1]), selected_heldout=m[2] == 'True', selected=m[3])
        if line.strip() == 'selected: none' and cur in d: d[cur].update(selected=None)
    return d

def main():
    R.VARIANTS = VARS
    rows3, p3 = R.load_rows(R3) if (R3 / 'protocol.json').exists() else ([], None)
    rows2, _ = R.load_rows(R2)
    for r in rows2:
        if r['group'] == 'generated-audit' and r['task'].startswith('audit2-'): r['group'] = 'generated-round2'
    by2 = collections.defaultdict(dict)
    for r in rows2: by2[(r['group'], r['task'])][r['variant']] = r
    L = []; A = L.append
    A('# place-demand 第三轮：非局部机制测试、端到端 audit、路径审计与固定 DAG 的提取器隔离')
    A('')
    A('## 1. 非局部 residual 的机制测试（受控环境，不计入端到端成绩）')
    A('')
    tlog = ROOT / 'results/place-demand-tests-quick-round3.log'
    t = tlog.read_text(encoding='utf-8', errors='replace') if tlog.exists() else ''
    mech = [l for l in t.splitlines() if 'mechanism' in l]
    A('`test/PlaceDemandMain.hs`：目标为场景级坐标 t = Anchor(head(objects(v0)),TL)+(2,1)，环境只有 v0（所有候选基点都是非局部的），三个场景。检查：硬局部策略不产生任何非局部 coordAdd 候选；延后份额为 0 时需求被登记并释放但从未探索（无候选）；份额为正时释放后产生经真实 Base 求值匹配规格的非局部 coordAdd 候选。该测试人为控制了环境，只证明机制“登记→延后→释放→有效候选”成立，不宣称规则不可由其他路径表达，也不计入泛化成绩。')
    A('')
    A('```text'); L += mech or ['(test log missing)']; A('```'); A('')
    A('## 2. 端到端 audit（冻结于求解前；不宣称“必须经过非局部 residual”）')
    A('')
    man = json.loads((ROOT / 'data/place-demand-generated-round3/manifest.json').read_text())
    A(f"`data/place-demand-generated-round3`（manifest hash `{man['manifest_hash'][:16]}…`）：{man['splits']}。独立参考程序（`GeneratedAudit.hs --round3`）对 6 题 train/heldout exact，仅作事后证书。全部正常路径保留；比较的是 Q 与硬局部 B1L 的实际差异。")
    A('')
    if rows3:
        A('| 任务 | ' + ' | '.join(VARS) + ' |'); A('|---|' + '---|' * len(VARS))
        by3 = collections.defaultdict(dict)
        for r in rows3: by3[r['task']][r['variant']] = r
        for task in sorted(by3):
            A(f"| {task} | " + ' | '.join((lambda r: 'n/a' if r is None else f"{int(r['train'])}/{int(r['heldout'])}{'(to)' if r['timeout'] else ''}")(by3[task].get(v)) for v in VARS) + ' |')
        A('')
        A('| 变体 | train | heldout |'); A('|---|---:|---:|')
        for v in VARS: A(f"| {v} | {sum(1 for r in rows3 if r['variant']==v and r['train'])}/{sum(1 for r in rows3 if r['variant']==v)} | {sum(1 for r in rows3 if r['variant']==v and r['heldout'])}/{sum(1 for r in rows3 if r['variant']==v)} |")
        A('')
    A('## 3. 路径审计（第二轮矩阵的选中程序）')
    A('')
    pa = json.loads((R2 / 'path_audit_summary.json').read_text()) if (R2 / 'path_audit_summary.json').exists() else {}
    A('对每个 train exact 的选中程序记录 coordAdd 基点的依赖结构（local = 依赖 lambda/let 绑定变量；non-local = 只依赖场景 v0），以及 trace 中是否出现由延后分支建立的 Join。')
    A('')
    A('| 变体 | train exact | 含 coordAdd | 基点非局部 | 非局部基点且留出正确 | trace 含延后分支 Join |'); A('|---|---:|---:|---:|---:|---:|')
    for v in VARS:
        c = pa.get(v, {})
        A(f"| {v} | {c.get('train_exact',0)} | {c.get('with_coordAdd',0)} | {c.get('nonlocal_base',0)} | {c.get('heldout_with_nonlocal_base',0)} | {c.get('deferred_join_in_trace',0)} |")
    A('')
    A('“trace 含延后分支 Join”在 B1/B1X（ScheduleAll）下指带 deferred-nonlocal 标记但被立即探索的分支；在 B1Q/B1QX 下指第二遍释放后建立的 Join。它回答“延后释放是否真正进入 DAG”，而非该程序是否必须由它产生：当选中程序使用非局部基点时（A、I 等），局部形式也同时存在于 portfolio（B1L 选中的是局部形式），两者都训练 exact，排名选择了其中之一。详见 `path_audit.csv`。')
    A('')
    A('## 4. 固定 DAG 的提取器隔离')
    A('')
    A('`ExtractorDiag.hs`：用 B1Q 配置推导一次得到 DAG，再在同一 DAG 上分别运行原 refine cover 与 lazy cover，给予相同的尝试额度（协议 cover 份额 12500）。只比较提取器：候选数、训练 exact 候选数、事后留出正确候选数、按原排名选中的程序。')
    A('')
    diags = [parse_diag(p) for p in sorted((R2 / 'extractor-diag').glob('*.log'))] if (R2 / 'extractor-diag').exists() else []
    A('| 任务 | DAG 节点/join | refine: 候选/train exact/held-correct | refine 选中 (cost, heldout) | lazy: 候选/train exact/held-correct | lazy 选中 (cost, heldout) |'); A('|---|---|---|---|---|---|')
    for d in diags:
        rf = d.get('refine', {}); lz = d.get('lazy', {})
        A(f"| {d['task']} | {d.get('nodes','?')}/{d.get('joins','?')} | {rf.get('candidates','?')}/{rf.get('train_exact','?')}/{rf.get('held','?')} | {rf.get('selected_cost','—')}, {rf.get('selected_heldout','—')} | {lz.get('candidates','?')}/{lz.get('train_exact','?')}/{lz.get('held','?')} | {lz.get('selected_cost','—')}, {lz.get('selected_heldout','—')} |")
    A('')
    A('### Q 与 QX 结果不同的任务：分层检查')
    A('')
    A('| 任务 | 层 | B1Q | B1QX | 判断 |'); A('|---|---|---|---|---|')
    for (g, t), vs in sorted(by2.items()):
        q, qx = vs.get('B1Q'), vs.get('B1QX')
        if not q or not qx or (q['train'], q['heldout']) == (qx['train'], qx['heldout']): continue
        A(f"| {g}/{t} | 推导（join / 总 work / 延后 work） | {q['join_nodes']} / {q['total_expanded_work']} / {q['deferred_pass_work']} | {qx['join_nodes']} / {qx['total_expanded_work']} / {qx['deferred_pass_work']} | {'DAG 相同' if q['join_nodes']==qx['join_nodes'] else 'DAG 不同（预算交互）'} |")
        A(f"| | 提取（train exact / portfolio / lazy 候选） | {int(q['train'])} / {q['portfolio']} / — | {int(qx['train'])} / {qx['portfolio']} / {qx['cover_lazy_candidates']} | {'提取层差异' if q['train']!=qx['train'] else '两者都得到训练 exact'} |")
        A(f"| | 泛化候选覆盖（held-correct 候选，事后） | {q['held_correct']} | {qx['held_correct']} | {'覆盖消失' if (qx['held_correct'] or 0)==0 and (q['held_correct'] or 0)>0 else ('覆盖仍在' if (qx['held_correct'] or 0)>0 else '两者均无')} |")
        A(f"| | 选择（heldout） | {int(q['heldout'])} | {int(qx['heldout'])} | {'正确候选存在但排名未选中' if (qx['held_correct'] or 0)>0 and not qx['heldout'] else ('选择层无差异' if q['heldout']==qx['heldout'] else '见上层')} |")
    A('')
    A('判读规则：若 lazy cover 在固定 DAG 上仍得到训练 exact 且 held-correct 候选存在、只是选中不同，问题在选择层；若候选消失，继续修提取调度，不能靠调 MDL 掩盖；若 DAG 本身不同（join/work 不同），差异来自完整流水线中的预算交互，而非提取器本身。')
    A('')
    (R3 / 'REPORT_ROUND3.md' if rows3 else R2 / 'REPORT_ROUND3_draft.md').write_text('\n'.join(L) + '\n', encoding='utf-8')
    print('wrote round-3 report', len(L), 'lines')
if __name__ == '__main__': main()
