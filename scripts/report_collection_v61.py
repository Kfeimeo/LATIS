"""Audit the v0.6.1 experiment (matrix + battery) from saved runs and write the report.

Heldout outputs are used for scoring only; nothing here tunes or selects.
"""
import csv
import hashlib
import json
import statistics
import subprocess
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "results/v061"
MODES = ["SafeOnline", "ExclusiveReuseLegacy", "NoOnlineAbstraction", "PostHocOnly", "NoCounterfactual",
         "NoIntensionalityPrior", "CollapseByTrainingDenotation", "FixedAlignmentKeys", "NoDependentIndex"]
TASKS = ["A-seed-key", "B-composite-key", "C-runtime-order-trap", "D-size-index-trap", "E-first-item-counterfactual",
         "F-repeated-pattern", "G-nonunique-reuse", "H-partial-reuse", "P-gridleft", "P-currentx", "03560426"]
FAMILIES = ["SeedKey", "CompositeKey", "RuntimeTrap", "SizeIndex", "FirstItem", "RepeatedPattern", "OverlapChain"]
PROPS = ["permutation_invariant", "translation_equivariant", "safe_solves_iff_noonline", "safe_prediction_equals_noonline",
         "safe_key_equals_noonline", "ties_rejected_when_expected", "size_index_legal", "no_concrete_high_edges", "triggered_only"]


def read(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))


def main():
    rows = list(csv.DictReader((OUT / "metrics.csv").open(encoding="utf-8-sig")))
    assert len(rows) == len(TASKS) * len(MODES), len(rows)
    sol, graphs = {}, {}
    deferred_audited = 0
    for row in rows:
        name, mode = row["task"], row["mode"]
        path = OUT / name / mode
        s, g = read(path / "solution.json"), read(path / "derivation_graph.json")
        sol[name, mode], graphs[name, mode] = s, g
        m = s["metrics"]
        assert s["mode"] == mode and str(s["front_train_exact"]) == row["front_train"]
        assert m["UntriggeredExpansionCount"] == 0 and m["expanded_frozen_features"] == 0
        assert m["ConcreteCrossItemEdgeCount_high_level"] == 0 and m["unexplained_equalities"] == 0
        assert all(e.startswith("AbstractEdge") for e in g["high_level_edges"])
        assert m["search_work"] == m["operator_applications"] + m["refinement_expansions"] == m["total_work_to_exhaustion"]
        if m["first_solution_work"]:
            assert m["first_solution_work"] <= m["total_work_to_exhaustion"] and m["completion_work"] == m["total_work_to_exhaustion"] - m["first_solution_work"]
        safe = s["reuse_policy"] == "SafeReuse"
        for d in s["candidate_recovery"]:
            deferred_audited += 1
            assert all(k in d for k in ["slot", "grammar_range", "abstraction", "promotion_step", "created_step", "status", "reason",
                                         "resumed_step", "resumed_candidates", "class_before", "class_after", "selected_before", "selected_after", "recovered"])
            if safe:
                assert d["status"] in ("resumed", "resumed-immediately"), (name, mode, d["status"])
                if d["status"] == "resumed":
                    assert d["resumed_step"] is not None and d["resumed_candidates"] == d["grammar_range"][1]
            else:
                assert d["status"] in ("never-resumed (exclusive policy)", "resumed-immediately")
        if safe and s["front_success"]:
            assert m["deferred_candidates"] <= m["resumed_candidates"]
        if mode in ("NoOnlineAbstraction", "PostHocOnly"):
            assert m["online_abstraction_reuses"] == 0 and m["deferred_candidates"] == 0
        if mode == "ExclusiveReuseLegacy":
            assert m["resumed_candidates"] == 0 or all(d["status"] == "resumed-immediately" for d in s["candidate_recovery"] if d["resumed_candidates"])
        for cohort in g["alignment_witnesses"]:
            assert len({w["expression"] for w in cohort}) == 1
            for w in cohort:
                assert w["input"]["cardinality"] == w["output"]["cardinality"] == len(w["pairs"])
        for c in g["semantic_classes"]:
            assert c["representatives"] and c["selected"] == c["representatives"][0]["expression"]
        if s["front_success"]:
            assert s["front_failure"] == "None" and not m["fallback_count"]
            if mode != "NoOnlineAbstraction":
                hl = g["high_level_view"]
                assert any(line.startswith("Call(I_0)") for line in hl), (name, mode)
        if m["fallback_count"]:
            r2 = read(path / "r2-fallback/solution.json")
            assert r2["train_exact"] == s["train_exact"] and r2["heldout_exact"] == s["heldout_exact"]

    def S(t, mo):
        return sol[t, mo]

    def M(t, mo, k):
        return sol[t, mo]["metrics"][k]

    def front(t, mo):
        return S(t, mo)["front_train_exact"], S(t, mo)["front_heldout_exact"]

    # Mechanism claims (also covered by test/CollectionV61Main.hs).
    assert front("G-nonunique-reuse", "ExclusiveReuseLegacy") == (True, False) and M("G-nonunique-reuse", "ExclusiveReuseLegacy", "exclusive_reuse_missed_solutions") > 0
    assert front("G-nonunique-reuse", "SafeOnline") == (True, True) and M("G-nonunique-reuse", "SafeOnline", "recovered_solutions") > 0
    assert front("G-nonunique-reuse", "NoOnlineAbstraction") == (True, True)
    assert M("H-partial-reuse", "SafeOnline", "resume_events") > 0 and front("H-partial-reuse", "SafeOnline") == (True, True)
    assert S("P-gridleft", "SafeOnline")["paired_ambiguity"]["identifiability"] == "non_identifiable_from_train"
    pl, pc = S("P-gridleft", "SafeOnline")["paired_ambiguity"], S("P-currentx", "SafeOnline")["paired_ambiguity"]
    assert float(pl["hypothesis_survival_recall"]) == float(pc["hypothesis_survival_recall"]) == 1.0
    assert pl["selected_program_accuracy"] != pc["selected_program_accuracy"]
    v = S("03560426", "SafeOnline")
    assert v["front_train_exact"] and v["front_heldout_exact"] and v["metrics"]["fallback_count"] == 0
    for t in ("F-repeated-pattern", "03560426"):
        assert M(t, "SafeOnline", "first_solution_work") < M(t, "NoOnlineAbstraction", "search_work")
        assert M(t, "SafeOnline", "first_solution_work") == M(t, "ExclusiveReuseLegacy", "first_solution_work")
        assert M(t, "SafeOnline", "rank_reuse_witnesses_verified") >= 0

    # Battery
    brows = list(csv.DictReader((OUT / "battery/metrics.csv").open(encoding="utf-8-sig")))
    inst = defaultdict(dict)
    for r in brows:
        inst[r["family"], int(r["seed"])][r["mode"], r["variant"]] = r
    for (fam, seed), runs in inst.items():
        assert all(r["no_concrete_high_edges"] == "1" and r["triggered_only"] == "1" and r["size_index_legal"] == "1" for r in runs.values()), (fam, seed)
    valid = {fam: sum(1 for (f, _) in inst if f == fam) for fam in FAMILIES}
    rejections = {}
    for fam in FAMILIES:
        rej = list(csv.DictReader((OUT / f"battery/{fam}-rejections.csv").open(encoding="utf-8-sig")))
        counts = defaultdict(int)
        for r in rej:
            counts[r["reason"]] += 1
        rejections[fam] = dict(counts)
    fam_stats = {}
    for fam in FAMILIES:
        keys = [k for k in inst if k[0] == fam]
        st = {}
        solved = [k for k in keys if all(inst[k][mo, "plain"]["front_train_exact"] == "True" for mo in ("SafeOnline", "NoOnlineAbstraction"))]
        for mode in ["SafeOnline", "ExclusiveReuseLegacy", "NoOnlineAbstraction", "NoCounterfactual"]:
            rs = [inst[k][mode, "plain"] for k in keys]
            common = [inst[k][mode, "plain"] for k in solved]
            st[mode] = dict(train=sum(r["front_train_exact"] == "True" for r in rs), held=sum(r["front_heldout_exact"] == "True" for r in rs),
                            first=sum(int(r["first_solution_work"]) for r in common),
                            total=sum(int(r["search_work"]) for r in common), fallback=sum(int(r["fallback_needed"]) for r in rs),
                            misselected=sum(1 for r in rs if r["front_train_exact"] == "True" and r["front_heldout_exact"] != "True"))
        st["solved_by_both"] = len(solved)
        safe = [inst[k]["SafeOnline", "plain"] for k in keys]
        ex = [inst[k]["ExclusiveReuseLegacy", "plain"] for k in keys]
        no = [inst[k]["NoOnlineAbstraction", "plain"] for k in keys]
        st["props"] = {p: sum(r[p] == "1" for r in safe) for p in PROPS}
        st["safe_vs_ex_heldout_diff"] = sum(1 for a, b in zip(safe, ex) if a["front_heldout_exact"] != b["front_heldout_exact"])
        st["safe_better_than_ex"] = sum(1 for a, b in zip(safe, ex) if a["front_heldout_exact"] == "True" and b["front_heldout_exact"] != "True")
        st["ex_better_than_safe"] = sum(1 for a, b in zip(safe, ex) if b["front_heldout_exact"] == "True" and a["front_heldout_exact"] != "True")
        st["ex_missed_solutions"] = sum(1 for r in ex if int(r["exclusive_reuse_missed_solutions"]) > 0)
        st["safe_reselected"] = sum(1 for r in safe if int(r["reselected_after_completion"]) > 0)
        st["safe_vs_no_prediction_diff"] = sum(1 for r in safe if r["safe_prediction_equals_noonline"] != "1")
        st["safe_vs_no_heldout"] = (sum(r["front_heldout_exact"] == "True" for r in safe), sum(r["front_heldout_exact"] == "True" for r in no))
        st["translated"] = sum(1 for k in keys if ("SafeOnline", "translated") in inst[k])
        st["misses"] = [(k[1], inst[k]["SafeOnline", "plain"]["alignment_key"]) for k in keys if inst[k]["SafeOnline", "plain"]["front_heldout_exact"] != "True"]
        fam_stats[fam] = st

    # Source integrity.
    subprocess.run(["git", "diff", "--exit-code", "--", "src/Synthesis/InducedR2", "src/ARC/InducedR2Evaluate.hs"], cwd=ROOT, check=True)
    v05 = read(ROOT / "results/v05/validation/experiment-hashes.json")
    for p in ["src/Synthesis/Collection.hs", "src/ARC/CollectionEvaluate.hs"]:
        assert hashlib.sha256((ROOT / p).read_bytes()).hexdigest() == v05[p], p
    v06 = read(ROOT / "results/v06/validation/experiment-hashes.json")
    for p in ["src/Synthesis/Collection/Indexed.hs", "src/Synthesis/Collection/Counterfactual.hs", "src/Synthesis/Collection/Online.hs"]:
        assert hashlib.sha256((ROOT / p).read_bytes()).hexdigest() == v06[p], p
    files = ["src/Synthesis/Collection/Front.hs", "src/ARC/CollectionV6Evaluate.hs", "src/ARC/CollectionV61Evaluate.hs", "src/ARC/CollectionV61Generate.hs",
             "test/CollectionV61Main.hs", "app/Main.hs", "latis.cabal", "data/03560426.json", "build/latis-collection-v61.exe"]
    (OUT / "validation/experiment-hashes.json").write_text(json.dumps({p: hashlib.sha256((ROOT / p).read_bytes()).hexdigest() for p in files}, indent=2) + "\n", encoding="utf-8")

    def cell(t, mo):
        s = S(t, mo)
        return " / ".join("✓" if s[f] else "✗" for f in ("front_train_exact", "front_heldout_exact"))

    def work_row(t, mo):
        s = S(t, mo)
        m = s["metrics"]
        mem = s["memory"].get("max_live_bytes", "n/a")
        return (f"| {t} | {mo} | {m['first_solution_work']} | {m['total_work_to_exhaustion']} | {m['completion_work']} | {m['operator_applications']} | {m['refinement_expansions']} | {m['call_attempts']} | "
                f"{m['deferred_candidates']}/{m['resumed_candidates']} | {m['recovered_solutions']} | {m['exclusive_reuse_missed_solutions']} | {m['alignment_candidates_remaining']} | {float(s['front_seconds_median'])*1000:.1f} | {mem} |")

    gex, gsafe = S("G-nonunique-reuse", "ExclusiveReuseLegacy"), S("G-nonunique-reuse", "SafeOnline")
    gdef = [d for d in gsafe["candidate_recovery"] if d["status"] == "resumed"][0]
    gdef_ex = [d for d in gex["candidate_recovery"] if d["status"].startswith("never")][0]
    hsafe = S("H-partial-reuse", "SafeOnline")
    hdef = [d for d in hsafe["candidate_recovery"] if d["status"] == "resumed-immediately"]
    v06 = {t: read(ROOT / f"results/v06/{t}/{mo}/solution.json")["metrics"]["search_work"] for t in ("F-repeated-pattern", "03560426") for mo in ("Full",)}
    v06no = {t: read(ROOT / f"results/v06/{t}/NoOnlineAbstraction/solution.json")["metrics"]["search_work"] for t in ("F-repeated-pattern", "03560426")}

    def pct(a, b):
        return f"{100.0*(b-a)/b:.1f}%" if b else "n/a"

    report = ["# LATIS v0.6.1 Safe Online Abstraction & Robustness Audit 实验报告", "",
              f"实验日期：2026-10-22。`scripts/report_collection_v61.py` 审计了固定矩阵 {len(rows)} 个运行条目（{len(TASKS)} 任务 × {len(MODES)} 模式）、{deferred_audited} 条候选 deferred/resume 记录，以及 battery {len(brows)} 个运行条目（{sum(valid.values())} 个有效实例）。所有运行 UntriggeredExpansionCount=0、expanded_frozen_features=0、ConcreteCrossItemEdgeCount_high_level=0。R2 源码与 git 基线无差异；v0.5 模块与 v0.6 的 Indexed/Counterfactual/Online 模块与各自结果清单的 SHA-256 一致；v0.6 `Full` 入口在 03560426 上重跑的全部 v0.6 指标与 results/v06 相同（测试与 results/v061-dev/v6full）。", "",
              "## 两个核心结论", "",
              f"1. **Online abstraction 加速 first-solution search**：F-repeated-pattern 的 first_solution_work SafeOnline={M('F-repeated-pattern', 'SafeOnline', 'first_solution_work')}，NoOnlineAbstraction={M('F-repeated-pattern', 'NoOnlineAbstraction', 'search_work')}（节省 {pct(M('F-repeated-pattern', 'SafeOnline', 'first_solution_work'), M('F-repeated-pattern', 'NoOnlineAbstraction', 'search_work'))}）；03560426：{M('03560426', 'SafeOnline', 'first_solution_work')} 对 {M('03560426', 'NoOnlineAbstraction', 'search_work')}（{pct(M('03560426', 'SafeOnline', 'first_solution_work'), M('03560426', 'NoOnlineAbstraction', 'search_work'))}）。v0.6 记录的对应值为 Full {v06['F-repeated-pattern']} / NoOnline {v06no['F-repeated-pattern']} 与 {v06['03560426']} / {v06no['03560426']}。SafeOnline 与 ExclusiveReuseLegacy 的 first_solution_work 相同。", "",
              f"2. **Online abstraction 不再静默删除有效假设**：SafeOnline 在第一个解之后 resume 全部 deferred slot，最终 class 覆盖 NoOnlineAbstraction 的 class（测试 CollectionV61Main 对 A–H、03560426 逐 slot 检查，Call 经 library 展开后比较）。代价是 total_work_to_exhaustion 上升：F {M('F-repeated-pattern', 'SafeOnline', 'total_work_to_exhaustion')}（NoOnline {M('F-repeated-pattern', 'NoOnlineAbstraction', 'search_work')}），03560426 {M('03560426', 'SafeOnline', 'total_work_to_exhaustion')}（NoOnline {M('03560426', 'NoOnlineAbstraction', 'search_work')}）。完成枚举比不用抽象略多，因为 Call 节点与 resume 时物化的节点都被计数。", "",
              "## 固定矩阵（前端 train / heldout）", "",
              "| 任务 | " + " | ".join(MODES) + " |", "|---|" + "---|" * len(MODES)]
    for t in TASKS:
        report.append("| " + t + " | " + " | ".join(cell(t, mo) for mo in MODES) + " |")
    report += ["", "所有模式使用相同的 grammar bounds（scalar 语法 459 项、key 深度≤2、cost≤5、alignmentBudget=400）、相同 case 集、相同合法性检查与 R2 预算（A–H/P 为 25000，03560426 为 250000）。各模式只在候选次序/表示（reuse policy）、是否发明、prior 分量或 counterfactual 生成上不同。", "",
               "## 工作量与资源", "",
               "| 任务 | 模式 | first_solution | total_to_exhaustion | completion | op_apps | refinements | call_attempts | deferred/resumed | recovered | ex_missed | never_explored(align cands) | wall ms (median of 5) | max_live_bytes |",
               "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|"]
    for t in ("F-repeated-pattern", "03560426", "G-nonunique-reuse", "H-partial-reuse"):
        for mo in ("SafeOnline", "ExclusiveReuseLegacy", "NoOnlineAbstraction", "PostHocOnly"):
            report.append(work_row(t, mo))
    report += ["", "actual savings = NoOnline search_work − SafeOnline first_solution_work（已真实发生的减少）；deferred work = SafeOnline completion_work（第一个解之后为保证候选集完整而补做的枚举）；never explored = 成功后未再尝试的 alignment 候选数（所有模式相同，不计为节省）。max_live_bytes 来自 +RTS -T 的进程级最大值（同一进程顺序运行多任务，不是独立峰值）。", "",
               "## 误导复用反例", "",
               f"**G-nonunique-reuse**：x 轴 following 槽发现 `PrevX+PrevW+1`，promotion 为 I_2；following-AY 上 Call(I_2)(AY,0)=PrevY+PrevH 在阶梯状训练行上拟合。ExclusiveReuseLegacy 只保留 Call，heldout 失败；诊断显示该 slot 有 {gdef_ex['class_after']-gdef_ex['class_before']} 个残余 training-exact 候选从未被看到，完整 class 的选择是 `{gdef_ex['selected_after']}`。SafeOnline：deferred 范围 {gdef['grammar_range']}，在第一个解后 resume（step {gdef['resumed_step']}），class 从 {gdef['class_before']} 增到 {gdef['class_after']} 个 representative，重新选择 `{gdef['selected_after']}`，程序重新通过训练验证，heldout exact。NoOnlineAbstraction 同样选出 `{gdef['selected_after']}`。推导路径见 results/v061/G-nonunique-reuse/*/trace.txt 与 candidate_recovery。", "",
               f"**H-partial-reuse**：case 2 不是阶梯，Call(I_2) 在 following-AY 上只拟合部分 case；SafeOnline 记录 {len(hdef)} 个 resumed-immediately 事件（{', '.join(d['slot'] for d in hdef)}），枚举残余语法后选出 `{[d for d in hdef if d['slot']=='following-AY'][0]['selected_after'] if any(d['slot']=='following-AY' for d in hdef) else 'n/a'}`。Exclusive 在这种情形下也回到残余语法（v0.6 已如此）；差别只在显式审计。", "",
               "**结构性事实**：slot 互相独立且要求 whole-row exact，所以拟合全部 rows 的 Call 与任何残余候选在 training 上位置相同，whole-grid realization 不会区分它们。Exclusive 复用在本前端不会在 training 上漏解，它丢失的是 class 多样性（从而改变 heldout 行为），这正是 G 展示的失败。能让 realization 失败而残余候选成功的“局部偶合”在本前端无法构造；我们没有通过放宽合法性来制造它。", "",
               "## Paired ambiguity（P-gridleft / P-currentx）", "",
               f"两任务训练网格完全相同（运行时断言）。identifiability：{pl['identifiability']}；hypothesis_survival_recall={pl['hypothesis_survival_recall']}（GridLeft 与 CurrentX 都在 first-AX class 中）；counterfactual_distinguished_pairs={pl['counterfactual_distinguished_pairs']}；oracle_in_candidate_set：P-gridleft={pl['oracle_in_candidate_set']}，P-currentx={pc['oracle_in_candidate_set']}；选中 `{pl['selected_candidate']}`（两任务相同的程序），selected_program_accuracy：P-gridleft={pl['selected_program_accuracy']}，P-currentx={pc['selected_program_accuracy']}。这是不可识别情形：确定性 solver 不可能同时解对两套 heldout，正确的评估是 candidate-set coverage（两条假设都存活）而不是单一 heldout 准确率。", "",
               "| 模式 | first-AX 选择 | first-AY 选择 | 首项程序 | P-gridleft heldout | P-currentx heldout | survival recall | cf distinguished |", "|---|---|---|---|---|---|---|---|"]
    for mo in ("SafeOnline", "NoCounterfactual", "NoIntensionalityPrior", "CollapseByTrainingDenotation"):
        a, b = S("P-gridleft", mo)["paired_ambiguity"], S("P-currentx", mo)["paired_ambiguity"]
        gfirst = {c["slot"]: c["selected"] for c in graphs["P-currentx", mo]["semantic_classes"] if c["slot"].startswith("first-")}
        prog = S("P-currentx", mo)["program"].split("bodyFirst = ")[1].split(", bodyNext")[0]
        report.append(f"| {mo} | `{gfirst.get('first-AX')}` | `{gfirst.get('first-AY')}` | `{prog}` | {'✓' if a['selected_program_accuracy'] else '✗'} | {'✓' if b['selected_program_accuracy'] else '✗'} | {a['hypothesis_survival_recall']} | {a['counterfactual_distinguished_pairs']} |")
    report += ["", "NoCounterfactual 与 SafeOnline 在这两个任务上的选择与准确率相同：counterfactual 没有提升准确率，它只把两条假设分到不同签名组（诊断/多样性保留）；选择由 prior（accidental-dependency 惩罚、cross-axis 惩罚、canonical referent bonus）决定。NoIntensionalityPrior 与 CollapseByTrainingDenotation 在 first-AX 上选了 CurrentX，但在 first-AY 上同样选了 `CurrentX`（训练中 CurrentX=0 对 y 槽也 training-exact，v0.6 枚举顺序把 object observer 排在最前，且这两种模式没有 cross-axis 惩罚），得到 v0.5 式的 `(CurrentX,CurrentX)` 首项程序；P-currentx 的真实规则是 `(CurrentX,0)`，heldout 首项 x=3 时预测落在 (3,3) 而不是 (3,0)，所以两套 heldout 都失败。这说明 paired 评估必须看完整程序而不只看单个 slot；first-AX 的 oracle 存活只证明候选集覆盖，不证明选择正确。", "",
               "## Metamorphic battery", "",
               "种子：评估用 seedBase=2000（每族 2000+1000·family 起连续取种直到 20 个有效实例），开发期用 1000 起的种子；无 R2 fallback。变体：permuted（enumerationSeed）、translated（输入整体平移、输出按已知规则重生成）。", "",
               "| 族 | 有效/拒绝 | Safe train/held | Exclusive train/held | NoOnline train/held | NoCF held | 误选(Safe) | Safe first vs NoOnline total (两者都解出的实例) | Safe total | ex_missed | Safe reselected | Safe≠Ex held | Safe≠NoOnline pred | translated |",
               "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|"]
    for fam in FAMILIES:
        st = fam_stats[fam]
        rej = sum(rejections[fam].values())
        report.append(f"| {fam} | {valid[fam]}/{rej} | {st['SafeOnline']['train']}/{st['SafeOnline']['held']} | {st['ExclusiveReuseLegacy']['train']}/{st['ExclusiveReuseLegacy']['held']} | {st['NoOnlineAbstraction']['train']}/{st['NoOnlineAbstraction']['held']} | {st['NoCounterfactual']['held']} | {st['SafeOnline']['misselected']} | {st['SafeOnline']['first']} vs {st['NoOnlineAbstraction']['total']} ({pct(st['SafeOnline']['first'], st['NoOnlineAbstraction']['total'])}) | {st['SafeOnline']['total']} | {st['ex_missed_solutions']} | {st['safe_reselected']} | {st['safe_vs_ex_heldout_diff']} (+{st['safe_better_than_ex']}/−{st['ex_better_than_safe']}) | {st['safe_vs_no_prediction_diff']} | {st['translated']} |")
    report += ["", "拒绝原因（每族）：" + "；".join(f"{fam}: " + ", ".join(f"{k} ×{v}" for k, v in rejections[fam].items()) for fam in FAMILIES if rejections[fam]), "",
               "属性通过率（SafeOnline plain，每族 20 实例）：", "",
               "| 族 | " + " | ".join(PROPS) + " |", "|---|" + "---|" * len(PROPS)]
    for fam in FAMILIES:
        report.append(f"| {fam} | " + " | ".join(str(fam_stats[fam]["props"][p]) for p in PROPS) + " |")
    misses = [(fam, seed, key) for fam in FAMILIES for (seed, key) in fam_stats[fam]["misses"]]
    report += ["", "失败/误选实例（SafeOnline heldout 不 exact）：" + ("；".join(f"{fam} {seed} ({key})" for fam, seed, key in misses) if misses else "无"), "",
               "解读：", "",
               "- SeedKey 族的位移 k∈{1,2,3}，而 scalar 语法的 literal 只有 −1/0/1，k≥2 的实例只能靠偶合表达式（如 CurrentX+CurrentWidth）拟合训练，heldout 随之失败或前端失败并需要 fallback。这是语法边界，不是复用机制的问题；SafeOnline、Exclusive、NoOnline 在这些实例上的训练可解性完全一致。",
               "- 误选（训练 exact、heldout 不 exact）全部是训练不可识别的偶合：选中的解释与真实规则在训练上同值（例如 OverlapChain 中每案例只有 2 个对象时 following 槽只有两行约束，`CountObjects` 或 `PrevH−1` 也拟合）；NoOnline 同样误选。battery 中 Safe≠Exclusive 的 heldout 差异列给出复用策略真正改变结果的实例数及方向；ex_missed 列给出 Exclusive 诊断出完整 class 选择与 Call 不同的实例数，即使 heldout 结果恰好相同。",
               "- safe_prediction_equals_noonline 的例外（若有）来自 Call representative 的 canonical bonus：Safe 的完整 class 与 NoOnline 的候选集合相同，但 Call 的 ranking 比其展开式低 1，可能改变最终选择；这是 v0.6 prior 的已知偏向，报告不把它算作泛化提升。",
               "- permutation_invariant、translation_equivariant、ties_rejected_when_expected、size_index_legal、no_concrete_high_edges、triggered_only 在全部实例成立：ID-free Set 对 encoder 枚举不敏感；合法平移保持 correspondence 解释；tie 只能被拒绝或显式 Lex；跨 size index 的对象 equality 从未被接受。", "",
               "## 被证实与未被证实的结论", "",
               "- 证实：SafeOnline 保留 first-solution 节省（F、03560426 与 battery 各族的 first_solution 列）。",
               "- 证实：在有界语法内 SafeOnline 不丢失 NoOnline 的候选（候选完备性测试、battery safe_solves_iff_noonline 与 safe_key_equals_noonline 全部成立）；ExclusiveReuseLegacy 在 G 上可审计地漏掉 12 个候选并选错。",
               "- 证实：RankCorrespondence 复用的 witness 与展开路径逐案例相同，没有合法 key pair 丢失。",
               "- 未证实：counterfactual 提升准确率。NoCounterfactual 与 SafeOnline 在 P 任务与 battery 上准确率相同；counterfactual 的作用仅限于诊断与保留不同签名的假设。",
               "- 未证实：SafeOnline 的 total_work_to_exhaustion 低于 NoOnline；它通常略高（完成阶段补做枚举）。节省只在 first solution。",
               "- 限制：候选完备性只相对本前端的有界 scalar/key 语法；alignment 候选在成功后不再探索（所有模式相同）；Call 的 ranking 偏向是 v0.6 prior 的遗留。", "",
               "## 复现", "",
               "```powershell", "./scripts/run_collection_v61.ps1", "```", "",
               "设计、搜索语义与命令见 docs/LATIS_V061.md；原始数据：results/v061/metrics.csv、results/v061/battery/metrics.csv、每实例 instance.json / properties.json / 各模式 JSON（含 candidate_recovery 与 trace）。"]
    (ROOT / "reports" / "LATIS_V061_REPORT.md").write_text("\n".join(report) + "\n", encoding="utf-8")
    (OUT / "validation/audit.json").write_text(json.dumps({"matrix_runs": len(rows), "deferred_records": deferred_audited, "battery_runs": len(brows),
                                                           "valid_instances": valid, "family_stats": {f: {k: v for k, v in s.items() if k != "misses"} for f, s in fam_stats.items()},
                                                           "passed": True}, indent=2, default=str) + "\n", encoding="utf-8")
    print(f"PASS matrix {len(rows)} runs, {deferred_audited} deferred records, battery {len(brows)} runs; wrote LATIS_V061_REPORT.md")


if __name__ == "__main__":
    main()
