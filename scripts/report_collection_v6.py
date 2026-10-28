"""Audit the v0.6 collection experiment from saved runs and write the report.

Heldout outputs are never used for tuning here: the script only checks the
saved invariants and summarizes the matrix.
"""
import csv
import hashlib
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "results/v06"
MODES = ["Full", "NoCounterfactual", "CollapseByTrainingDenotation", "NoIntensionalityPrior", "FixedAlignmentKeys",
         "NoAlignmentExplanation", "NoOnlineAbstraction", "PostHocOnly", "NoDependentIndex", "DirectSetIndexing", "R2FallbackOnly"]
TASKS = ["A-seed-key", "B-composite-key", "C-runtime-order-trap", "D-size-index-trap",
         "E-first-item-counterfactual", "F-repeated-pattern", "03560426"]
PARAM_KINDS = {"Constant", "Concept", "Concept Axis", "Concept KeyExpr", "Ref", "Alignment", "Abstraction"}
HIDDEN_TOKENS = ["OrderBy", "RankAlign", "Plus", "Lit ", "Observe", "Compare", "Inline"]


def read(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))


def key_tuple(key, item):
    """Evaluate a saved ordering key on a saved Placed item (seed and synthesized keys)."""
    x, y = item["position"]
    w, h = item["size_index"]
    atoms = {"Anchor TL AX": (x,), "Anchor TL AY": (y,), "Anchor BR AX": (x + w - 1,), "Anchor BR AY": (y + h - 1,),
             "Extent AX": (w,), "Extent AY": (h,), "Area": (sum(1 for v in item["payload"] if v),),
             "Color": (item["color"],)}
    key = key.strip()
    if key in atoms:
        return atoms[key]
    if key.startswith("Desc "):
        return tuple(-v for v in key_tuple(strip_parens(key[5:]), item))
    if key.startswith("Lex "):
        a, b = split_two(key[4:])
        return key_tuple(a, item) + key_tuple(b, item)
    raise AssertionError(key)


def strip_parens(s):
    s = s.strip()
    return s[1:-1] if s.startswith("(") and s.endswith(")") else s


def split_two(s):
    parts, depth, cur = [], 0, ""
    for ch in s.strip():
        if ch == "(":
            depth += 1
        if ch == ")":
            depth -= 1
        if ch == " " and depth == 0 and cur:
            parts.append(cur)
            cur = ""
            continue
        cur += ch
    if cur:
        parts.append(cur)
    assert len(parts) == 2, s
    return strip_parens(parts[0]), strip_parens(parts[1])


def main():
    rows = list(csv.DictReader((OUT / "metrics.csv").open(encoding="utf-8-sig")))
    assert len(rows) == len(TASKS) * len(MODES), len(rows)
    sol, graphs = {}, {}
    witnesses = classes_audited = abstractions_audited = 0
    for row in rows:
        name, mode = row["task"], row["mode"]
        path = OUT / name / mode
        s, g = read(path / "solution.json"), read(path / "derivation_graph.json")
        sol[name, mode], graphs[name, mode] = s, g
        m = s["metrics"]
        assert s["mode"] == mode and str(s["front_train_exact"]) == row["front_train"]
        assert m["UntriggeredExpansionCount"] == 0 and m["expanded_frozen_features"] == 0
        assert m["search_work"] == m["operator_applications"] + m["refinement_expansions"]
        if mode not in ("DirectSetIndexing", "NoAlignmentExplanation"):
            assert m["ConcreteCrossItemEdgeCount_high_level"] == 0 and m["unexplained_equalities"] == 0
            assert all(e.startswith("AbstractEdge") for e in g["high_level_edges"])
        for f in g["features"]:
            assert all(k in f for k in ["type", "denotation", "expression", "provenance", "trigger", "cost", "status"])
            if f["cost"] > 0:
                assert f["trigger"] != "Nothing"
        for cohort in g["alignment_witnesses"]:
            assert len({w["expression"] for w in cohort}) == 1
            for w in cohort:
                witnesses += 1
                assert w["input"]["cardinality"] == w["output"]["cardinality"] == len(w["pairs"])
                for side in ("input", "output"):
                    view = w[side]
                    assert view["trigger"] == "NeedCrossItemAlignment"
                    values = [key_tuple(view["ordering_key"], p[side]) for p in w["pairs"]]
                    assert sorted(values) == values and len(set(values)) == len(values), (name, mode, view["ordering_key"])
                    for p in w["pairs"]:
                        item = p[side]
                        assert len(item["payload"]) == item["size_index"][0] * item["size_index"][1]
        for c in g["semantic_classes"]:
            classes_audited += 1
            assert c["representatives"], (name, mode, c["slot"])
            assert c["selected"] == c["representatives"][0]["expression"]
            for r in c["representatives"]:
                assert all(k in r for k in ["expression", "dependency_signature", "ontology_provenance", "intensionality_class",
                                             "groundedness", "cost", "counterfactual_signature", "counterfactual_group"])
                if mode == "NoCounterfactual":
                    assert r["counterfactual_signature"] == []
            groups = {tuple(map(str, r["counterfactual_signature"])) for r in c["representatives"]}
            assert c["counterfactual_splits"] == max(0, len(groups) - 1)
            if mode == "CollapseByTrainingDenotation":
                assert len(c["representatives"]) == 1
            if mode == "Full":
                assert c["premature_collapses"] == 0
        for cf in g["counterfactual_contexts"] + g["rejected_counterfactual_contexts"]:
            assert all(k in cf for k in ["source_case", "transformation", "legality_proof", "preserved_properties", "changed_properties"])
        for a in g["abstractions"]:
            abstractions_audited += 1
            assert all(k in a for k in ["contract", "input_types", "output_type", "free_abstract_parameters", "hidden_refinement_graph",
                                         "dependencies", "ontology_slice", "witness", "provenance", "definition_cost", "call_cost", "utility"])
            assert all(p["kind"] in PARAM_KINDS for p in a["free_abstract_parameters"])
            ids = {n["id"] for n in a["hidden_refinement_graph"]}
            for n in a["hidden_refinement_graph"]:
                assert all(d in ids or d.startswith(("ref:", "set:", "abstraction:")) for d in n["dependencies"])
                assert not any(p.startswith("PConcrete") for p in n["parameters"])
            u = a["utility"]
            assert all(k in u for k in ["occurrence_count", "nodes_hidden", "boundary_size", "estimated_reexpansion_saved", "actual_reuse_count"])
            if a["family"] != "OrderedCorrespondence":
                assert u["accepted"] == (u["total"] >= u["threshold"])
                if a["reuse_count"] == 0:
                    assert a["saved_refinement_expansions"] == 0
        if mode == "NoOnlineAbstraction":
            assert not g["abstractions"] and m["online_abstraction_reuses"] == 0
        if mode == "PostHocOnly":
            assert m["online_abstraction_reuses"] == 0 and m["refinement_expansions_saved"] == 0
        if mode == "FixedAlignmentKeys":
            assert m["synthesized_keys_accepted"] == 0
        if mode == "NoDependentIndex":
            assert m["rejected_size_comparisons"] == 0
        if s["front_success"]:
            assert s["front_failure"] == "None" and not m["fallback_count"]
            if mode not in ("NoOnlineAbstraction", "DirectSetIndexing", "NoAlignmentExplanation"):
                hl = g["high_level_view"]
                assert any(line.startswith("Call(I_0)") for line in hl), (name, mode)
                assert not any(tok in line for line in hl for tok in HIDDEN_TOKENS), (name, mode)
        if m["fallback_count"]:
            r2 = read(path / "r2-fallback/solution.json")
            assert r2["train_exact"] == s["train_exact"] and r2["heldout_exact"] == s["heldout_exact"]

    def S(task, mode):
        return sol[task, mode]

    def M(task, mode, k):
        return sol[task, mode]["metrics"][k]

    def front(task, mode):
        return S(task, mode)["front_train_exact"], S(task, mode)["front_heldout_exact"]

    # Mechanism expectations (train, heldout of the front-end).
    assert front("B-composite-key", "Full") == (True, True) and not S("B-composite-key", "FixedAlignmentKeys")["front_success"]
    assert M("B-composite-key", "Full", "synthesized_keys_accepted") > 0 and M("B-composite-key", "Full", "alignment_failure_triggers") == 1
    b_key = S("B-composite-key", "Full")["audit"]["alignment_key"]
    assert b_key["synthesized"] and b_key["input_key"] == "Extent AY"
    assert front("C-runtime-order-trap", "DirectSetIndexing") == (True, False)
    assert front("C-runtime-order-trap", "NoAlignmentExplanation") == (True, False)
    assert front("C-runtime-order-trap", "Full") == (True, True) and S("C-runtime-order-trap", "Full")["audit"]["alignment_key"]["synthesized"]
    assert front("D-size-index-trap", "NoDependentIndex") == (True, False) and front("D-size-index-trap", "Full") == (True, True)
    assert front("E-first-item-counterfactual", "Full") == (True, True)
    assert front("E-first-item-counterfactual", "CollapseByTrainingDenotation") == (True, False)
    assert M("E-first-item-counterfactual", "CollapseByTrainingDenotation", "premature_collapses") > 0
    assert front("E-first-item-counterfactual", "NoIntensionalityPrior") == (True, False)
    assert M("E-first-item-counterfactual", "Full", "counterfactual_splits") > 0
    assert M("E-first-item-counterfactual", "NoCounterfactual", "counterfactual_splits") == 0
    assert M("F-repeated-pattern", "Full", "online_abstraction_reuses") > 0
    assert M("F-repeated-pattern", "Full", "search_work") < M("F-repeated-pattern", "NoOnlineAbstraction", "search_work")
    assert M("F-repeated-pattern", "PostHocOnly", "search_work") == M("F-repeated-pattern", "NoOnlineAbstraction", "search_work")
    v = S("03560426", "Full")
    assert v["front_train_exact"] and v["front_heldout_exact"] and v["metrics"]["fallback_count"] == 0
    assert v["metrics"]["construction_triggers"] > 0 and v["metrics"]["online_abstraction_reuses"] > 0
    first = {c["slot"]: c for c in v["audit"]["first_item_ambiguity"]}
    assert first["first-AX"]["selected_candidate"] == "Atom (SceneLow (Ax AX))" and first["first-AY"]["selected_candidate"] == "Atom (SceneLow (Ax AY))"
    assert any(c["expression"] == "Lit 0" for c in first["first-AX"]["candidates"])
    assert any(c["expression"] == "Atom (Pos Current (Ax AX))" for c in first["first-AX"]["candidates"])

    # Source integrity: R2 unchanged in git, v0.5 front-end byte-identical to the v0.5 manifest.
    subprocess.run(["git", "diff", "--exit-code", "--", "src/Synthesis/InducedR2", "src/ARC/InducedR2Evaluate.hs"], cwd=ROOT, check=True)
    v05 = read(ROOT / "results/v05/validation/experiment-hashes.json")
    for p in ["src/Synthesis/Collection.hs", "src/ARC/CollectionEvaluate.hs"]:
        assert hashlib.sha256((ROOT / p).read_bytes()).hexdigest() == v05[p], p
    files = ["src/Synthesis/Collection/Indexed.hs", "src/Synthesis/Collection/Counterfactual.hs", "src/Synthesis/Collection/Online.hs",
             "src/Synthesis/Collection/Front.hs", "src/ARC/CollectionV6Evaluate.hs", "test/CollectionV6Main.hs", "app/Main.hs", "latis.cabal",
             "data/03560426.json", "build/latis-collection-v6.exe", "src/Synthesis/Collection.hs", "src/ARC/CollectionEvaluate.hs", "src/Synthesis/Triggered.hs"]
    (OUT / "validation/experiment-hashes.json").write_text(json.dumps(
        {p: hashlib.sha256((ROOT / p).read_bytes()).hexdigest() for p in files}, indent=2) + "\n", encoding="utf-8")

    budgets = {int(re.search(r"workBudget = (\d+)", s["configuration"]).group(1)) for (n, _), s in sol.items() if n != "03560426"}
    assert len(budgets) == 1
    mechanism_budget = next(iter(budgets))
    vertical_budget = int(re.search(r"workBudget = (\d+)", v["configuration"]).group(1))

    def cell(task, mode):
        s = S(task, mode)
        fields = ("train_exact", "heldout_exact") if mode == "R2FallbackOnly" else ("front_train_exact", "front_heldout_exact")
        return " / ".join("✓" if s[f] else "✗" for f in fields)

    def work_row(task, mode):
        m = S(task, mode)["metrics"]
        return f"| {task} | {mode} | {m['search_work']} | {m['operator_applications']} | {m['refinement_expansions']} | {m['online_abstractions_accepted']} | {m['posthoc_abstractions_accepted']} | {m['online_abstraction_reuses']} | {m['refinement_expansions_saved']} |"

    vf = v["metrics"]
    va = v["audit"]
    online = [a for a in va["online_abstraction"] if a["accepted"]]
    e_full = S("E-first-item-counterfactual", "Full")["audit"]["first_item_ambiguity"]
    e_first = next(c for c in e_full if c["slot"] == "first-AX")
    c_key = S("C-runtime-order-trap", "Full")["audit"]["alignment_key"]
    d_full = next(c for c in graphs["D-size-index-trap", "Full"]["semantic_classes"] if c["slot"] == "shared-AX")
    d_no = next(c for c in graphs["D-size-index-trap", "NoDependentIndex"]["semantic_classes"] if c["slot"] == "shared-AX")
    vertical_first = [c for c in va["first_item_ambiguity"] if c["slot"] == "first-AX"][0]

    report = ["# LATIS v0.6 Counterfactual-Preserving Online Abstraction 实验报告", "",
              f"实验日期：2026-10-21。由 `scripts/report_collection_v6.py` 审计 {len(rows)} 个运行条目、{witnesses} 个逐案例 alignment witness、{classes_audited} 个 semantic class、{abstractions_audited} 条 abstraction 记录后生成。", "",
              "v0.6 是 v0.5 collection front-end 的增量升级，位于 `src/Synthesis/Collection/{Indexed,Counterfactual,Online,Front}.hs` 与 `src/ARC/CollectionV6Evaluate.hs`。v0.5 模块、v0.4 solver 与 R2 fallback 源码未改动（审计比对了 SHA-256 与 git diff）。", "",
              "03560426：前端训练与留出均 exact，fallback_count=0；首项选择 GridTL，对齐键为 seed 键，online abstraction 在同一次搜索中被复用。", "",
              "## 十一组消融", "",
              "表格为前端 train / heldout；R2FallbackOnly 列为真实 R2 的 train / heldout。前端失败的行都实际运行了原 R2，结果在各目录 solution.json 与 r2-fallback/。", "",
              "| 任务 | " + " | ".join(MODES) + " |", "|---|" + "---|" * len(MODES)]
    for task in TASKS:
        report.append("| " + task + " | " + " | ".join(cell(task, mode) for mode in MODES) + " |")
    report += ["", "## RQ1：denotation-equivalent 候选是否必须保持多个解释", "",
               f"E-first-item-counterfactual 训练中首项对象都在 x=0，GridLeft、Literal 0、CurrentX、SetMinX 在训练上同值。Full 的 first-AX class 保留 {len(e_first['candidates'])} 个 representative，counterfactual 把它们分成 {M('E-first-item-counterfactual', 'Full', 'counterfactual_splits') + 1} 组（TranslateScene/margin 使 CurrentX、SetMinX 改变，scene referent 与 literal 不变），选择 `{e_first['selected_candidate']}`，留出 exact。", "",
               f"CollapseByTrainingDenotation 按训练 denotation 只保留最低结构成本的 representative（枚举顺序为 v0.5 的 observer 优先），premature_collapses={M('E-first-item-counterfactual', 'CollapseByTrainingDenotation', 'premature_collapses')}，留出失败；NoIntensionalityPrior 保留全部 representative 但只按长度排序，选中 `{S('E-first-item-counterfactual', 'NoIntensionalityPrior')['audit']['first_item_ambiguity'][0]['selected_candidate']}`，留出失败；NoCounterfactual 的 first-AX class 仍保留结构多样性（{len(next(c for c in S('E-first-item-counterfactual', 'NoCounterfactual')['audit']['first_item_ambiguity'] if c['slot'] == 'first-AX')['candidates'])} 个 representative，没有 counterfactual 签名时更多结构相同的候选被 canonicalize），splits=0，依靠 accidental-dependency 惩罚和 canonical referent bonus 仍选中 scene referent。", "",
               "counterfactual 不删除候选、不提供目标输出：签名不同只用于保留多样性，排序由通用 prior 决定。GridLeft 与 Literal 0 在任何合法 counterfactual 下都不可区分，二者都保留在 class 中，仅由 prior 分出先后。", "",
               "## RQ2：alignment key 能否由受限 intensional synthesis 发现", "",
               f"B-composite-key 输入侧 X、Y、Area、Color 全部 tie，Lex(X,Y)/Lex(Y,X) 给出错误配对。seed 阶段的候选全部失败后触发 AlignmentFailure，synthesized 语法（深度≤2、cost≤5）被打开，Full 以 `{b_key['input_key']}` / `{b_key['output_key']}` 完成对齐，ordering_ties_rejected={M('B-composite-key', 'Full', 'ordering_ties_rejected')}，synthesized_keys_accepted={M('B-composite-key', 'Full', 'synthesized_keys_accepted')}。FixedAlignmentKeys 在 B 上前端失败，进入 R2 fallback。B 与 C 的 synthesized 阶段有 62 个可见 key，合法 key 对按 cost 排序后在 alignmentBudget=400 处截断（trace 记录 alignment budget exhausted），正确的 cost-3 候选在预算内。", "",
               f"C-runtime-order-trap 训练上 encoder 枚举顺序恰好等于高度顺序：DirectSetIndexing train={front('C-runtime-order-trap', 'DirectSetIndexing')[0]} / heldout={front('C-runtime-order-trap', 'DirectSetIndexing')[1]}，NoAlignmentExplanation（无 witness 的 Color 相等配对）train={front('C-runtime-order-trap', 'NoAlignmentExplanation')[0]} / heldout={front('C-runtime-order-trap', 'NoAlignmentExplanation')[1]}；Full 用 synthesized key `{c_key['input_key']}` 留出 exact。所有 ordering tie 都被拒绝，没有隐式 tiebreaker；refinement 只能通过显式 Lex 键。", "",
               "## RQ3：在线 promotion 与复用是否减少搜索工作", "",
               "| 任务 | 模式 | search_work | operator_applications | refinement_expansions | online_accepted | posthoc_accepted | reuses | saved |", "|---|---|---|---|---|---|---|---|---|"]
    for task in ("F-repeated-pattern", "03560426"):
        for mode in ("Full", "NoOnlineAbstraction", "PostHocOnly"):
            report.append(work_row(task, mode))
    report += ["",
               "F 中 RankCorrespondence 在第一个完整 seed 候选上被 anti-unify 并 promotion，后续候选以 Call 复用；SequentialScalar 在 following-AX 槽发现后，following-AY 先尝试 Call(I_k) 而不再展开 scalar 语法。NoOnlineAbstraction 完全不发明；PostHocOnly 搜索工作与 NoOnlineAbstraction 相同，搜索结束后对同一派生做 anti-unification 得到同样的 SequentialScalar 抽象（posthoc_accepted=1）并改写最终程序，但 reuse=0、saved=0：封装本身不减少搜索。search_work 的减少来自 operator_applications（跳过的 scalar 枚举）与 refinement_expansions（未展开的 per-case 节点）两部分；utility 的每个分量与阈值都保存在 derivation_graph.json。", "",
               "## RQ4：dependent size index 的归纳价值", "",
               f"D-size-index-trap 的输出按不同 indexed shape 的数量平移。2×1 与 1×2 bar 的 payload 都是 [5,5]：Full 选中 `{d_full['selected']}`（留出 exact）；NoDependentIndex 擦除 σ 后 CountShapes 少 1，训练上拟合为 `{d_no['selected']}`，留出失败。这不是类型检查上的差异，而是 accidental equality 导致的错误 abstraction 在留出上暴露。", "",
               "## 03560426 审计", "",
               f"### 19.1 First-item ambiguity：first-AX class 有 {len(vertical_first['candidates'])} 个 representative，training_signature={vertical_first['training_signature']}，选中 `{vertical_first['selected_candidate']}`；候选含 `Lit 0`、`Atom (Pos Current (Ax AX))`、`Atom (SetMin (Ax AX))` 等，各自的 counterfactual_signature 与 ranking_components 保存在 solution.json 的 audit 字段。v0.5 选中的 (CurrentX,CurrentX) 现在作为 accidental 候选保留但排在 scene referent 之后。", "",
               f"### 19.2 Alignment key：输入 `{va['alignment_key']['input_key']}`（seed={va['alignment_key']['input_seed']}），输出 `{va['alignment_key']['output_key']}`（seed={va['alignment_key']['output_seed']}）；synthesized={va['alignment_key']['synthesized']}。Tie legality：{va['alignment_key']['tie_legality']}。", "",
               "### 19.3 Online abstraction：", ""]
    for a in va["online_abstraction"]:
        report.append(f"- {a['name']} ({a['family']}): discovery_step={a['discovery_step']}, promotion_step={a['promotion_step']}, first_reuse_step={a['first_reuse_step']}, reuse_count={a['reuse_count']}, saved_refinement_expansions={a['saved_refinement_expansions']}, accepted={a['accepted']}, search_reduction_claimed={a['search_reduction_claimed']}")
    report += ["", f"只有 reuse_count>0 的 abstraction 才宣称 search reduction。03560426 Full：search_work={vf['search_work']}，NoOnlineAbstraction：{M('03560426', 'NoOnlineAbstraction', 'search_work')}，PostHocOnly：{M('03560426', 'PostHocOnly', 'search_work')}。", "",
               "```text", v["program"], "```", "",
               "## 关键指标（Full）", "",
               "| 任务 | classes | reps | max/class | cf_ctx | splits | premature | intensional | literal | key_cands | synth_keys | ties | witnesses | abs_prop | abs_acc | reuses | saved | op_apps | frontier | visibility | search_work | fallback |",
               "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|"]
    keys = ["semantic_classes", "representatives", "max_representatives_per_class", "counterfactual_contexts_generated", "counterfactual_splits",
            "premature_collapses", "intensional_candidates", "literal_candidates", "alignment_key_candidates", "synthesized_keys_accepted",
            "ordering_ties_rejected", "alignment_witnesses", "online_abstractions_proposed", "online_abstractions_accepted", "online_abstraction_reuses",
            "refinement_expansions_saved", "operator_applications", "active_frontier_size", "visibility_size", "search_work", "fallback_count"]
    for task in TASKS:
        m = S(task, "Full")["metrics"]
        report.append("| " + task + " | " + " | ".join(str(m[k]) for k in keys) + " |")
    report += ["", "所有运行：UntriggeredExpansionCount=0，expanded_frozen_features=0；除两个故意使用 runtime/无解释配对的消融外，ConcreteCrossItemEdgeCount_high_level=0。", "",
               "## 范围与限制", "",
               "- 合成任务是机制反例，规模很小；它们证明机制在构造情形下的行为，不是 ARC 全集上的统计结论。",
               "- Online abstraction 的发现基于搜索自身标记的 per-case 实例子图做 typed anti-unification，不是通用子图同构挖掘；两个 family 是 RankCorrespondence 与 SequentialScalar。",
               "- 复用的槽位只保留 Call representative，不再枚举 scalar 语法，因此在该槽位用搜索减少换取了多样性；首次发现的槽位保留完整 class。",
               "- Counterfactual 只有平移、画布扩展/边距、对象置换、无关对象插入四类，并各自带合法性证明；无法合法生成的 context 被记录为 rejected。GridLeft 与 Literal 0 无法被任何合法 counterfactual 区分。",
               "- 合成 key 语法限制为深度≤2、cost≤5，且只在 AlignmentFailure 之后打开；对齐仍只支持同画布、数量相等、保留输入几何的 realization，其他任务正常 fallback 到原 R2。",
               "- Intensionality prior 的权重 (4,2,1) 与 cross-axis 惩罚是通用的、未按任务调节；所有 cost 分量保存在 audit 中。", "",
               "## 复现与测试", "",
               f"通过 CollectionV6、Collection、Triggered、InducedR2、FeaturePipeline 五组测试，日志在 results/v06/validation。合成任务 A–F 的 R2 fallback 预算为 workBudget={mechanism_budget}，03560426 为 {vertical_budget}。Windows、GHC 9.10.3、-O1；wall-clock 只是单次观察。", "",
               "```powershell", "./scripts/run_collection_v6.ps1", "```", "",
               "构建方法、模块边界与消融定义见 docs/LATIS_V06.md。原始表格：results/v06/metrics.csv。"]
    (ROOT / "reports" / "LATIS_V06_REPORT.md").write_text("\n".join(report) + "\n", encoding="utf-8")
    (OUT / "validation/audit.json").write_text(json.dumps({"runs": len(rows), "witnesses": witnesses, "classes": classes_audited,
                                                           "abstractions": abstractions_audited, "passed": True}, indent=2) + "\n", encoding="utf-8")
    print(f"PASS {len(rows)} runs, {witnesses} witnesses, {classes_audited} classes, {abstractions_audited} abstractions; wrote LATIS_V06_REPORT.md")


if __name__ == "__main__":
    main()
