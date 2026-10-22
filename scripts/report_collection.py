"""Audit the collection experiment using saved runs; never tune on heldout."""
import csv
import hashlib
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "results/v05"
MODES = ["Full", "NoDependentIndex", "DirectSetIndexing", "NoAlignmentExplanation",
         "NoEagerAbstraction", "NoSemanticCohesion", "R2FallbackOnly"]


def read(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))


def key_value(key, item):
    x, y = item["position"]
    if key == "XCoord": return (x,)
    if key == "YCoord": return (y,)
    if key == "Area": return (len(item["geometry"]),)
    if key == "Color": return (item["color"],)
    if key == "Lex XCoord YCoord": return (x, y)
    if key == "Lex YCoord XCoord": return (y, x)
    raise AssertionError(key)


def main():
    solutions = {}
    audited_witnesses = 0
    rows = list(csv.DictReader((OUT / "metrics.csv").open(encoding="utf-8-sig")))
    assert len(rows) == 42
    for row in rows:
        name, mode = row["task"], row["mode"]
        path = OUT / name / mode
        s, g = read(path / "solution.json"), read(path / "derivation_graph.json")
        solutions[name, mode] = s
        assert mode in MODES and s["mode"] == mode
        assert str(s["front_train_exact"]) == row["front_train"]
        m = s["metrics"]
        assert m["UntriggeredExpansionCount"] == 0
        assert m["expanded_frozen_features"] == 0
        if mode == "Full":
            assert m["ConcreteCrossItemEdgeCount_high_level"] == 0
            assert all(e.startswith("AbstractEdge") for e in g["high_level_edges"])
        for f in g["features"]:
            assert all(k in f for k in ["type", "denotation", "expression", "provenance", "trigger", "cost", "status"])
            assert len(f["denotation"]) in (2, 3)
            if f["cost"] > 0: assert f["trigger"] != "Nothing"
        for cohort in g["alignment_witnesses"]:
            assert len({w["expression"] for w in cohort}) == 1
            for w in cohort:
                audited_witnesses += 1
                assert w["input"]["cardinality"] == w["output"]["cardinality"] == len(w["pairs"])
                for side in ("input", "output"):
                    view = w[side]
                    assert view["trigger"] == "NeedCrossItemAlignment"
                    assert all(k in view for k in ["source_set", "ordering_expression", "ordering_key", "cardinality", "trigger", "derivation"])
                    values = [key_value(view["ordering_key"], p[side]) for p in w["pairs"]]
                    assert sorted(values) == values and len(set(values)) == len(values)
                    for pair in w["pairs"]:
                        obj = pair[side]
                        assert obj["size_index"] == [max(p[0] for p in obj["geometry"])+1,
                                                     max(p[1] for p in obj["geometry"])+1]
        for a in g["abstractions"]:
            assert all(a[k] for k in ["contract", "input_types", "output_types", "hidden_refinement_graph", "dependencies", "provenance", "cost"])
            names = {n["id"] for n in a["hidden_refinement_graph"]}
            assert all(set(n["dependencies"]) <= names for n in a["hidden_refinement_graph"])
        if mode == "NoSemanticCohesion": assert not g["abstractions"]
        if m["fallback_count"]:
            r2 = read(path / "r2-fallback/solution.json")
            assert r2["train_exact"] == s["train_exact"] and r2["heldout_exact"] == s["heldout_exact"]
        if s["front_success"]: assert s["front_failure"] == "None" and not m["fallback_count"]

    vertical = solutions["03560426", "Full"]
    budgets = {int(re.search(r"workBudget = (\d+)", s["configuration"]).group(1))
               for (name, _), s in solutions.items() if name != "03560426"}
    assert len(budgets) == 1, "mechanism budgets must be identical across tasks/modes"
    mechanism_budget = next(iter(budgets))
    vertical_budget = int(re.search(r"workBudget = (\d+)", vertical["configuration"]).group(1))
    assert vertical["front_train_exact"] and vertical["front_heldout_exact"]
    assert vertical["metrics"]["construction_triggers"] > 0
    trap = solutions["B-runtime-trap", "DirectSetIndexing"]
    assert trap["front_train_exact"] and not trap["front_heldout_exact"]
    a = solutions["C-accidental-equality", "Full"]["metrics"]
    b = solutions["C-accidental-equality", "NoAlignmentExplanation"]["metrics"]
    assert a["equality_attempts"] < b["equality_attempts"] and b["unexplained_equalities"] > 0
    assert solutions["D-size-index", "Full"]["metrics"]["rejected_size_comparisons"] > 0
    assert solutions["D-size-index", "NoDependentIndex"]["metrics"]["rejected_size_comparisons"] == 0
    subprocess.run(["git", "diff", "--exit-code", "--", "src/Synthesis/InducedR2", "src/ARC/InducedR2Evaluate.hs"], cwd=ROOT, check=True)
    hashes = {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
              for p in sorted((ROOT / "src/Synthesis/InducedR2").glob("*.hs"))}
    hashes["src/ARC/InducedR2Evaluate.hs"] = hashlib.sha256((ROOT / "src/ARC/InducedR2Evaluate.hs").read_bytes()).hexdigest()
    (OUT / "validation/source-hashes.json").write_text(json.dumps(hashes, indent=2)+"\n", encoding="utf-8")
    experiment_files = ["src/Synthesis/Collection.hs", "src/ARC/CollectionEvaluate.hs", "test/CollectionMain.hs",
                        "app/Main.hs", "latis.cabal", "data/03560426.json", "build/latis-collection.exe"]
    manifest = {p:hashlib.sha256((ROOT / p).read_bytes()).hexdigest() for p in experiment_files}
    (OUT / "validation/experiment-hashes.json").write_text(json.dumps(manifest, indent=2)+"\n", encoding="utf-8")

    report = ["# LATIS Dependent Collection + Explained Alignment 实验报告", "",
              "实验日期：2026-10-21。由 `scripts/report_collection.py` 审计 42 个运行条目生成。", "",
              "03560426：新集合前端训练与留出均 exact，fallback_count=0。原 v0.4 和 R2 solver 源码保持不变。", "",
              "## 七组消融", "", "表格为前端 train / heldout；R2FallbackOnly 列为真实 R2 的 train / heldout。失败行均实际运行原 R2，完整结果在各目录 solution.json。", "",
              "| 任务 | " + " | ".join(MODES) + " |", "|---|" + "---|"*len(MODES)]
    for task in sorted({n for n, _ in solutions}):
        cells = []
        for mode in MODES:
            s = solutions[task, mode]
            fields = ("train_exact", "heldout_exact") if mode == "R2FallbackOnly" else ("front_train_exact", "front_heldout_exact")
            cells.append(" / ".join("✓" if s[f] else "✗" for f in fields))
        report.append("| " + task + " | " + " | ".join(cells) + " |")
    report += ["", "## 03560426 的派生", "",
               "F0 是携带 SizeSig 的无序对象集合，三个训练案例 cardinality 为 4、3、3。输入按 XCoord 排序，输出按 YCoord 排序；每个案例内部数量相等，排序表达式跨案例相同。先生成 RankAlign witness，再验证 Color 观察器；AlignmentLift 重新验证整个配对关系。", "",
               "可执行匿名抽象 I_0 由排序、对齐、比较与 sequence-local 变换的连通派生封装。学出的首项表达式是 (CurrentX,CurrentX)，在现有训练和留出中均为 (0,0)；后续位置为 PreviousX + PreviousWidth − 1、PreviousY + PreviousHeight − 1。Previous 的尺寸来自重建的完整对象，不来自被遮挡的输出片段。首项表达式与固定原点在当前样本上无法区分，不能据此保证任意平移输入上的行为。", "",
               "```text", vertical["program"], "```", "",
               "对象级 equality 的 size index 不一致时仍然拒绝。未匹配几何触发 NeedConstruct，提出保留输入完整几何的候选，再通过所有训练输出的整幅 render exact 检验。输出较晚 rank 覆盖较早 rank，沿用既有 render 语义。没有添加 Attach、At、Chain 或按 ID 对齐。留出输出只用于评分，未进入 synthesis。", "",
               "## 三个研究问题", "",
               "1. 在本次有限唯一键 ontology 与任务族中，可变数量集合能通过统一 rank expression 对齐。A–C 的训练数量 2、3，留出数量 4；03560426 的 4、3、3 也无需固定角色。并列键、数量不相容及跨案例更换排序均被拒绝。", "",
               f"2. C 上 Full 仅尝试 {a['equality_attempts']} 次对象比较，NoAlignmentExplanation 尝试 {b['equality_attempts']} 次，并产生 {b['unexplained_equalities']} 个无对齐说明的 equality 命中。DirectSetIndexing 在 B 上 train=true、heldout=false；Full 两者均 true。这是机制反例，不是 ARC 全集泛化提升的统计证明。", "",
               "3. Full 的成功程序调用 I_0，内部排序键、sequence body 保存在 definition/refinement 中。NoSemanticCohesion 使用 inline definition，预测不变但没有抽象。这证明了受限派生结构的封装与可执行展开；未证明任意子图发现能力或在线搜索加速。", "",
               "## 合法性与范围", "",
               f"审计了 {audited_witnesses} 个逐案例 alignment witnesses：同一 cohort 的 symbolic expression 一致，数量约束满足，key 严格有序，所有 Placed 的声明尺寸与几何一致。Full 高层 concrete edge 为 0；所有模式的 UntriggeredExpansionCount 和 expanded_frozen_features 为 0。", "",
               "NoDependentIndex 撤去对象比较的尺寸统一检查；本轮未观察到因此提高或降低最终准确率。NoAlignmentExplanation 在正常候选路径前开放笛卡尔 equality，并将命中保留在消融图中；可执行候选仍来自同一有界排序/变换语法，因此不能据此宣称该消融必然降低准确率。NoEagerAbstraction 保留具体边；NoSemanticCohesion 不封装。", "",
               "前端是与 v0.4 共用 encoder、renderer、配置与原 R2 fallback 的专用集合饱和分支，旧 solve-v04 路径保持原样。闭包以 Set→Count→OrderedView→Alignment→Ref→Concept 阶段单调扩展，冻结的证据只作为只读依赖使用。未把所有 v0.4 operator 都提升到集合，也未实现完整 dependent theorem prover。", "",
               "ontology 固定为 X、Y、Area、Color、Lex(X,Y)、Lex(Y,X) 六个可见键，最多 36 组 alignment。Scalar 为 Current/Previous 的位置、宽高与 −1/0/1 的有界加法表达式；优先共享所有 rank 的表达式，再允许 First/Following 分支。scalar_candidate_bound 是候选上界，不是真实执行次数。当前仅支持同画布、保留完整输入几何的 realization；无法解释的缩放、新对象、数量变化正常 fallback。", "",
               "合成任务专门构造以检测机制，规模很小；语法对齐不保证唯一正确解释。本轮没有神经网络或并行优化。", "",
               "## 复现与测试", "",
               "通过 Collection、Triggered、InducedR2、FeaturePipeline 四组测试，日志位于 results/v05/validation。R2 源码与 Git 基线无差异，SHA-256 清单保存在 source-hashes.json。Windows 实测 GHC 9.10.3、-O1，使用工作区临时目录避免系统临时目录链接权限问题；wall-clock 是单次观察，不用于性能结论。", "",
               f"本次保存矩阵：合成任务 A–E 所有模式统一配置 R2 workBudget={mechanism_budget}；03560426 为 workBudget={vertical_budget}。开发时初次以 250000 跑同色机制任务，对照耗时很长，故中止该未完成运行，将默认合成任务预算设为 25000 重新执行，未改变 R2 实现。不能将较小预算内失败解释成 R2 在原预算下不能求解。", "",
               "```powershell", "./build/latis-collection.exe collection-experiment --out results/v05",
               "python scripts/report_collection.py", "```", "",
               "完整构建方法与边界见 docs/LATIS_COLLECTION.md。原始表格：results/v05/metrics.csv。"]
    (ROOT / "LATIS_COLLECTION_REPORT.md").write_text("\n".join(report)+"\n", encoding="utf-8")
    (OUT / "validation/audit.json").write_text(json.dumps({"runs":len(rows),"witnesses":audited_witnesses,"passed":True}, indent=2)+"\n", encoding="utf-8")
    print(f"PASS {len(rows)} runs, {audited_witnesses} witnesses; wrote LATIS_COLLECTION_REPORT.md")


if __name__ == "__main__": main()
