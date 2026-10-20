"""Audit saved v0.4 runs and generate a reproducible, bounded-claims report."""
import csv
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "results/v04"


def read(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))


def main():
    with (OUT / "stress/metrics.csv").open(encoding="utf-8-sig", newline="") as f:
        rows = list(csv.DictReader(f))
    assert len(rows) == 70, "incomplete seven-task / ten-mode matrix"
    solutions = {}
    for row in rows:
        key = row["task"], row["mode"]
        solution = read(OUT / "stress" / key[0] / key[1] / "solution.json")
        solutions[key] = solution
        assert int(row["search_work"]) == solution["metrics"]["search_work"]
        for field in ("UntriggeredExpansionCount", "ConcreteParameterExposureCount"):
            assert solution["metrics"][field] == 0, (key, field)
        graph = read(OUT / "stress" / key[0] / key[1] / "derivation_graph.json")
        ids = {n["id"] for n in graph["features"]}
        for edge in graph["hyperedges"]:
            assert edge["child"] in ids and set(edge["parents"]) <= ids
            assert all(edge["evidence"][name] for name in
                       ("trigger", "parent_goal", "type_reason", "ontology_slice", "provenance"))
            assert edge["arguments"] and all(arg["provenance"] for arg in edge["arguments"])
        if key[1] == "Full":
            assert solution["metrics"]["expanded_frozen_features"] == 0
    baseline = {}
    with (OUT / "r2-baseline/metrics.csv").open(encoding="utf-8-sig", newline="") as f:
        for row in csv.DictReader(f):
            baseline[row["task"]] = row
    assert len(baseline) == 7
    h = read(OUT / "03560426/solution.json")
    assert h["train_exact"] and h["heldout_exact"] and h["metrics"]["fallback_count"] == 1

    tests = {}
    for name in ("triggered-tests", "latis-tests", "feature-pipeline-tests", "induced-r2-tests"):
        log = ROOT / f"dist-newstyle/build/x86_64-windows/ghc-9.14.1/latis-0.1.0.0/t/{name}/opt/test/latis-0.1.0.0-{name}.log"
        assert f"Test suite {name}: PASS" in log.read_text(encoding="utf-8-sig")
        tests[name] = "PASS"

    text = ["# LATIS v0.4 实验报告", "", "实验日期：2026-10-20。此报告由 `scripts/report_v04.py` 从保存的结果生成。", "",
            "新增前端在 A–F 六个机制任务上训练及留出均正确；G 拒绝当前语法内只能靠具体坐标记忆的候选。03560426 前端失败后，原版 R2 训练与留出均正确。", "",
            "## 剪枝与共享", "", "| 比较 | Full work | 消融 work | 消融 / Full |", "|---|---:|---:|---:|"]
    for task, mode in [("A-match-pruning", "NoMatchedFeaturePruning"),
                       ("D-irrelevant-library", "NoVisibility"),
                       ("B-transform-reuse", "NoTransformReuse")]:
        full = solutions[task, "Full"]["metrics"]["search_work"]
        other = solutions[task, mode]["metrics"]["search_work"]
        assert full < other
        text.append(f"| {task} / {mode} | {full} | {other} | {other/full:.2f} |")
    text += ["", "work 是定义构建、案例求值、构造和全局选择的逻辑费用，不是耗时。D 的 200 个不可见噪声算子没有增加 Full 的 operator applications。该结论限于注册 ontology slice；不是任意外部库增长下的复杂度证明。", "",
             "## Full 与独立 R2 基线", "", "| 任务 | 前端 train / heldout | 前端 work | R2 train / heldout | R2 expanded work |", "|---|---|---:|---|---:|"]
    for task in sorted(baseline):
        s, b = solutions[task, "Full"], baseline[task]
        text.append(f"| {task} | {s['train_exact']} / {s['heldout_exact']} | {s['metrics']['search_work']} | {b['train_exact']} / {b['heldout_exact']} | {b['r2_search_work']} |")
    text += ["", "两种 work 的计量不同，不应据此直接计算跨 solver 加速比。保存的 wall-clock 为单次、部分并行运行，不能作为稳定性能统计。机制矩阵的 R2FallbackOnly 行只表示前端关闭；上表引用另行真实运行的 `r2-baseline/`。", "",
             "## 03560426 vertical slice", "", f"前端失败点：`{h['front_failure']}`。",
             "", "训练输入的对象数量为 4、3、3，颜色也随案例变化。当前固定语义角色向量不能完整覆盖这些可变对象集合，因此在进入 saturation 前明确失败；没有用对象下标或手写 Attach/At/Chain 绕过。",
             "", f"fallback_count=1；R2 expanded work={h['r2_search_work']}；训练、留出 exact 均为 true。R2 源码没有更改。", "",
             "## 不变量与验证", "", "70 个前端矩阵条目均满足 UntriggeredExpansionCount=0、ConcreteParameterExposureCount=0；脚本逐条检查 graph 节点、hyperedge 引用和 trigger/argument evidence。Full 中 expanded_frozen_features=0。", "",
             "通过测试套件：" + "、".join(tests) + "。新增测试覆盖三层 closure、共享成本全局最优、硬预算、多个结构别名、负向 capture 检查、层级 refinement 和 controlled widening。", "",
             "## 结论与限制", "", "极小 Object/Position 起点能覆盖本次有限任务族；冻结与可见性在 A、D 上显著减少逻辑工作。E 展示了 source 无对象时通过全输出 witness 构造；F 展示了跨尺寸 GridBR 指称。", "",
             "C 中匿名关系来自成功派生拓扑，最终程序实际调用这些关系；较大关系沿已登记依赖构成多层级。关系发现目前发生在完整解释之后，search-reduction 是结构估计：NoRelationInvention 和 FlatRelations 没有展示在线搜索收益，不据此宣称收益。", "",
             "前端仍是固定角色、有限 typed wrappers 与矩形构造语法的原型，未覆盖可变数量对象的关系闭包、遮挡及一般稀疏形状构造。全局最优仅限已生成的候选图，不能推导 ARC 整体泛化提升。失败 fallback 保持 R2 的原预算和搜索行为；前端训练 exact 不等于未知案例上的正确性保证。", "",
             "实现与复现命令见 [设计说明](docs/LATIS_V04.md)。原始矩阵见 [metrics.csv](results/v04/stress/metrics.csv)，R2 基线见 [baseline metrics](results/v04/r2-baseline/metrics.csv)。"]
    (ROOT / "LATIS_V04_REPORT.md").write_text("\n".join(text) + "\n", encoding="utf-8")
    sources = ["src/Synthesis/Triggered.hs", "src/ARC/TriggeredEvaluate.hs", "src/ARC/TriggeredStress.hs",
               "src/Synthesis/FeaturePipeline.hs", "test/TriggeredMain.hs", "app/Main.hs", "latis.cabal",
               "src/Synthesis/InducedR2/Learn.hs", "scripts/report_v04.py"]
    manifest = {"date": "2026-10-20", "tests": tests, "matrix_rows": len(rows),
                "source_sha256": {p: hashlib.sha256((ROOT / p).read_bytes()).hexdigest() for p in sources}}
    (OUT / "validation.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    print("PASS: 70 runs, 7 R2 baselines, H fallback, graph evidence, and four test suites audited.")


if __name__ == "__main__":
    main()
