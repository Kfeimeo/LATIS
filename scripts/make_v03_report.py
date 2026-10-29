"""Report only from sealed measurements; never modifies synthesis code/data."""
import collections
import hashlib
import json
import pathlib
import statistics

ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / "results/v03"

def read(path):
    return json.loads((OUT / path).read_text(encoding="utf-8"))

def table(headers, rows):
    return "| " + " | ".join(headers) + " |\n|" + "|".join("---" for _ in headers) + "|\n" + "".join("| " + " | ".join(map(str, row)) + " |\n" for row in rows)

def fmt(x):
    return "—" if x is None else f"{x:.2f}"

def main():
    stress = read("stress/suite.json")
    regression = read("regression/comparison.json")
    ablation = read("stress/ablation.json")
    audit = read("frozen-audit/audit.json")
    opened = read("audit_opened.json")
    frozen = read("frozen_arc1_tasks.json")
    core = read("core/solution.json")
    assert len(stress) == 10 and len(regression) == 17 and len(audit) == 30
    assert {pathlib.Path(r["task"]).stem for r in audit} == set(frozen["task_ids"])
    for p, digest in opened["source_sha256"].items():
        assert hashlib.sha256((ROOT / p).read_bytes()).hexdigest() == digest, "Source modified after audit opened: " + p
    for p, digest in frozen["baseline_source_sha256"].items():
        assert hashlib.sha256((ROOT / p).read_bytes()).hexdigest() == digest, "v02a source changed: " + p
    for r in regression:
        assert r["v02a"]["program"] == r["v03_disabled"]["program"]
        assert r["v02a"]["solved"] and r["v02a"]["heldout_exact"]
        assert r["v03_full"]["train_exact"] and r["v03_full"]["heldout_exact"]
        old = {k: v for k, v in r["v02a"]["statistics"].items() if "seconds" not in k}
        disabled = {k: v for k, v in r["v03_disabled"]["legacy_statistics"].items() if "seconds" not in k}
        assert old == disabled
    assert core["train_exact"] and core["heldout_exact"] and core["route"] == "Z0"
    selected = [r for r in stress if r["route"] in ("ZL", "ZG", "ZF")]
    assert len(selected) == 7 and all(r["train_exact"] and r["heldout_exact"] and r["statistics"]["delta_mdl"] > 0 for r in selected)
    assert not next(r for r in stress if r["task"].startswith("H-"))["train_exact"]
    avg_delta = statistics.mean(r["statistics"]["delta_mdl"] for r in selected)
    avg_total_l = statistics.mean(r["statistics"]["description_units_saved"] for r in selected)
    program_savings = []
    for r in selected:
        winning = [c for c in r["candidates"] if c["exact"] and c["J1"] == r["objective"]["J"]]
        program_savings.append(min(c["reference_program_length"] - c["program_length"] for c in winning))
    failures = collections.Counter(r["failure"] for r in audit)
    solved = failures["Solved"]
    train = sum(bool(r.get("train_exact")) for r in audit)
    held = sum(bool(r.get("heldout_exact")) for r in audit)
    scope = solved + failures["SearchFailure"] + failures["AmbiguityFailure"]
    modes = [r["mode"] for r in ablation[0]["v03"]]
    by_mode = {m: [r for task in ablation for r in task["v03"] if r["mode"] == m] for m in modes}
    def count(m, key):
        return sum(r["statistics"][key] for r in by_mode[m])
    def successes(m):
        return sum(r["train_exact"] and r["heldout_exact"] for r in by_mode[m])
    no_cost_overinvent = sum(r["route"] in ("ZL", "ZG", "ZF") and all(c["full_mdl_J1"] >= r["statistics"]["level0_program_cost"] for c in r["candidates"] if c["exact"] and c["J1"] == r["objective"]["J"]) for r in by_mode["NoLatentMDL"])
    parts = ["# LATIS v0.3 — Hierarchical Latent Discovery\n",
      "在固定 canonical object ontology 上新增独立 Haskell hierarchical solver。人工 A–J 套件有 7 个 secondary 解，覆盖 local、global、fusion，均通过独立 heldout；D/J 保留 Z0，H 共享编码/表达式的过拟合陷阱被拒绝。以下数值全部来自本次执行，包含负结果。\n",
      "## 架构、范围与可复现协议\n",
      "`Scene/Object/Pose`、connected components、renderer、correspondence、旧 DSA/observer/constraint solver 的全部原 source SHA256 与冻结时一致。保留 `solve-v02a`/`joint-solve`，新增 `solve-v03`。Σ 通过 `HierarchicalState(canonicalState, activeHypotheses)` 组合扩展为含 H_Z 的状态，不重写旧 solver。没有 neural、split/union/occlusion search、SMT、cross-task library 或 iterative cross-latent propagation；后者明确标记 FutureWork。\n",
      "Local grammar：RelativePose、Pairwise(anchors)、Progression、SharedClass，支持原六种排序。Local 保留 class geometry/color、成员 orientation/ID 与 paint permutation，pose code 有确定逆。Global grammar：BBox、bbox-center Axis、像素验证的 Symmetry、四类 Alignment、空间 Progression、Order；Scene residual 显式保留。bbox-center axis 是构造出的坐标轴，不自动声称输入具备镜像对称。Fusion 使用 typed canonical/local/global context，仅开放 active hypothesis 的 symbols。`hypotheses.json` 与 candidate typed AST 可读、可序列化；没有 opaque hash feature。\n",
      "先运行完整原 v0.2A。无 exact 解或 J>25 时观察结构，提出共享编码，再运行 latent ↔ pose-hole ↔ skeleton 固定点约束；最后 branch 并进行原 renderer 的 exact Grid verification。Encoder 不接收 task ID/example ID/test output。输出候选与 correspondence guards 保持析取支持；scene 参数由输入计算，绝不存训练专用向量表。此次 bounded program 使用 MapPose、Add/Subtract/Scale/SwapXY、Rank 与 active symbolic observations，最后只更新 canonical positions。候选向量为 observed step/delta、本向量的 2 倍、-1 倍及 SwapXY；sequence origin 为 first position 或四个 bbox corners，未枚举任意算术组合。Alignment/SharedClass/Symmetry/Order 目前也支持发现/round-trip，尚无独立 stress solve 证明每一种均改善 synthesis。\n",
      "MDL 为 J=L(A)+L(D)+L(P)+K+2E，默认不计可选 L(Z|A)：latent data 是从输入 scene 重算的运行时值，数据未作为训练常量嵌入程序。AST constructor/application/literal 为描述单位；codec 成本固定在 `Latent.MDL.LatentCost`，符号闭包也计 codec 依赖。只在 exact-valid 候选间比较；secondary 必须严格更便宜，或直接路径无 exact 解。NoLatentMDL 仅去掉 encoder/decoder 长度，仍计 K。\n",
      "**Z0 比较的界限**：原 v0.2A 没有序列 rank/scene extrema 的搜索语法。在 triggered 实验中，除了真实 legacy J，还生成、执行、exact-verify 同一坐标规则的独立 `GroundExpr` Z0 展开 AST，J0 取二者最小值。其解释器不调用 latent encoder/decoder。人工表中的有限 J0 通常来自该展开 reference，不能声称 legacy 已找到那些程序，也不是无限制 Z0 language 的最优 MDL。Reference 是树状 AST，未搜索任意 let/CSE；一个更强的 Z0 子表达式共享语言可能缩小优势。LatentDisabled 完全关闭这条新增比较，逐项复现原 v0.2A。\n",
      "状态/传播/验证是工作量计数，不是相同 CPU 成本。Discovery guards 按有限 grammar×训练场景保守收费；其短路检查可能少于名义收费。Expanded 包括 legacy 搜索、codec/reconstruction、expression support 与两路 exact calls；一次 finite propagation/legacy preparation 批次可超过小 state budget。Decoder failure 与 encoder guard rejection 分开记录。first-solution states 记录首次 exact 候选，未必最终最优；wall-clock 用 monotonic 时钟，含搜索/编码/验证，排除 IO/报告以及事后 taxonomy。消融为同进程顺序一次运行，不能作稳定 CPU 性能结论。\n",
      "运行：`python scripts/run_v03.py`（或 `./scripts/run-v03.ps1`）。`--no-audit` 只重跑开发套件；`--audit-only` 复用封存 audit，任何 source/binary/protocol 变化都拒绝覆盖首次结果。`results/v03/tests.log` 保存三套测试。\n",
      "## Q1–Q4：发现、类别、描述长度与完整 MDL\n",
      f"发现 7 个有正完整 ΔMDL 的 secondary 解：{dict(collections.Counter(r['route'] for r in selected))}。相对可执行的 Z0 reference，纯 program AST 平均减少 **{statistics.mean(program_savings):.2f}** 单位；计入 codec 后 L 平均减少 **{avg_total_l:.2f}** 单位，完整 J 平均减少 **{avg_delta:.2f}**。K 不一定减少：引入新坐标系增加符号种类，但缩短表达式树；负的 program_symbols_saved 原样保留。\n",
      table(["Task", "Route", "Train", "Heldout", "J0", "J1", "ΔMDL", "Expanded", "Exact calls"],
        [(r["task"], r["route"] or "unsupported", r["train_exact"], r["heldout_exact"], fmt(r["statistics"]["level0_program_cost"]), fmt(r["statistics"]["level1_program_cost"]), fmt(r["statistics"]["delta_mdl"]), r["statistics"]["total_expanded_states"], r["statistics"]["exact_verifier_calls"]) for r in stress]),
      "\nA/E 使用 first-pair 相对向量，B 使用有序 step/rank progression 变换，C/F 使用 scene bbox axis，G 同时使用 canonical geometry、local rank/step 与 global bbox origin。I 有多个 training-equivalent encoder，按完整 MDL 再以 canonical text 确定性择优，不利用 heldout 消歧。每个任务的 14 项 trace 内容、typed hypotheses 与最终预测见 `results/v03/stress/<task>/latent_trace.md`。\n",
      "## Q5–Q6：lazy、eager 与 program→latent\n",
      table(["Mode", "Train+heldout /10", "Proposals", "Accepted", "Expanded", "Exact calls", "Expression support tests", "Wall ms"],
        [(m, successes(m), count(m,"latent_proposals"), count(m,"accepted_latent_hypotheses"), count(m,"total_expanded_states"), count(m,"exact_verifier_calls"), count(m,"latent_expression_tests"), fmt(sum(r["statistics"]["wall_clock_seconds"] for r in by_mode[m])*1000)) for m in modes]),
      f"\nLazy 的 proposals={count('V03Full','latent_proposals')}，eager={count('EagerLatentEnumeration','latent_proposals')}；expanded 分别 {count('V03Full','total_expanded_states')} 与 {count('EagerLatentEnumeration','total_expanded_states')}。Eager 在运行 Z0 前实际 encode/reconstruct 全部 bounded hypotheses；lazy 对便宜 Z0 完全跳过 discovery。程序反向约束关闭时 exact calls 从 {count('V03Full','exact_verifier_calls')} 变为 {count('NoProgramToLatent','exact_verifier_calls')}。Full 在固定点传播中先检验每个 typed pose expression 是否满足所有训练 witness，删除空 hypothesis，并互限 PointwisePose/OrderedPoseSequence skeleton；NoProgramToLatent 保留 domain 到 exact verification。这证明本有限 grammar 的反向支持筛选有效，不是 unrestricted relational solver。\n",
      f"NoLatentMDL 在此套件检测到 {no_cost_overinvent} 个相对完整 codec MDL 不值得的 invention。若为零，不能据此断言该消融不会过拟合；廉价 Z0 的 lazy trigger 本来就阻止 invention。全表、每个 candidate 的 full/ablation MDL 都保留在 `results/v03/stress/ablation.json`。\n",
      "## Q7：不需 abstraction 与回归\n",
      "D/J 的便宜 legacy exact 解不触发 latent discovery。Eager 在 D/J 即使提出 representation，也必须完整 MDL 更优才能接纳。H 的 training-specific 短表示不能形成一个跨两个例子共享的 exact encoder/program；系统报告 unsupported，未添加按例子切换。17 项 v0.2A regression（原 11+原 6 stress）训练及 heldout 全通过；LatentDisabled 的 AST、非计时 legacy metrics 与 v0.2A 完全相同。公开 03560426 仍由原 scan 解出，完整结果在 `results/v03/core`。\n",
      f"核心任务同时展示 discovery overhead：legacy expanded={core['legacy_statistics']['expanded']}，Full expanded={core['statistics']['total_expanded_states']}；{core['statistics']['latent_proposals']} 个 latent proposals 全部未胜出，保留原 J={core['objective']['J']}。这不影响 exact 解，但说明高成本触发器并不保证 abstraction 有用。\n",
      "## Q8：30-task frozen ARC-1 audit\n",
      f"固定 seed={frozen['random_seed']}，从官方 training 的 400 个排序文件名用 Python Random.sample 均匀取 30，未读 grid、未分层、未按 LATIS suitability 筛选。选题在 v0.3 core 前完成，manifest hash=`{frozen['hash']}`。来源 [官方 ARC-AGI-1 repository](https://github.com/fchollet/ARC-AGI)，commit `{frozen['upstream_commit']}`，每题 SHA256 与原 source baseline hash 保存于 `results/v03/frozen_arc1_tasks.json`。许可证复用 `data/ARC-AGI-LICENSE`。\n",
      f"首次开启时间：{opened['opened_at']}（Asia/Shanghai）。source 与 executable hash、固定 budgets 记录于 `audit_opened.json`。30 题均按固定 25,000 state /32 correspondence /128 solution /60 秒外部 wall budget顺序执行。封存后没有修改 source、grammar、observer、MDL weight 或题集。公开 test labels 只在程序选择后检查。\n",
      f"**RawSolveRate={solved}/30={solved/30:.2%}；TrainExactRate={train}/30={train/30:.2%}；HeldoutExactRate={held}/30={held/30:.2%}。** InScopeSolveRate=" + (f"{solved}/{scope}={solved/scope:.2%}" if scope else "N/A（Solved+SearchFailure+AmbiguityFailure=0，不能报告 0% 或 100%）") + "。外部 timeout 的 train/heldout False 表示没有取得 exact 证书，verification_completed=false，不声称已检查完全部候选。\n",
      table(["Failure taxonomy", "Count"], [(f, failures[f]) for f in ["Solved","RepresentationFailure-Level0","RepresentationFailure-Level1","LanguageFailure","SearchFailure","AmbiguityFailure","BudgetFailure","VerifierOrImplementationFailure"]]),
      "\n逐题及 certificate：\n",
      table(["Task", "Train", "Heldout", "Category", "Evidence"], [(pathlib.Path(r["task"]).stem, r.get("train_exact",False), r.get("heldout_exact",False), r["failure"], r["failure_evidence"]) for r in audit]),
      "\n分类界限：画布 resize 属 LanguageFailure；当前 one-to-one unchanged geometry/color correspondence 可成立，但 secondary pose grammar 没有共享式，记 RepresentationFailure-Level1（限于当前 pose fragment）。可观察同色 component 分裂 certificate 记 Level0；其余缺 correspondence 的任务不擅自声称需要 split/union/occlusion，保守记 LanguageFailure 并注明不能区分更丰富语言与 ontology refinement。SearchFailure 必须有存在性证书，本轮没有这种证据。Train exact / heldout wrong 记 observational AmbiguityFailure，不能据此宣称正确 heldout 规则一定在 grammar 中。该 taxonomy 是有限模型诊断，不是人工 ground-truth ARC rule 标注。\n",
      "## Q9–Q10：瓶颈与下一步\n",
      f"本轮主要观测类别为 {failures.most_common(1)[0][0]}（{failures.most_common(1)[0][1]}/30）。Budget 与保守 LanguageFailure 都不能作为 Level0 ontology 不足的证明。人工套件支持固定 grounded ontology 上的 symbolic coordinate discovery 与 Representation↔Program；这个小型首次 audit 不足以证明 split/union/occlusion search 应成为下一步的主要机制。建议先在独立开发数据上建立更强的语言/ontology failure 证书、研究 canonical CSE 与增量 joint search，再以新版本封存新 audit；若有经核实 Level0 失败证据再进入 ontological hypothesis search。\n",
      "## 证据与限制\n",
      "三套测试包括旧 1518 round trips/语言 checks、旧 joint consistency tests、新 codec inverse/所有 anchor-pair inverse、orientation/paint-order preservation、malformed latent rejection、inactive-symbol rejection、独立 Z0 interpreter equivalence、A–J heldout、strict MDL、fixedpoint idempotence、reverse-constraint verifier savings、17 regression 与 tiny-budget termination。新 system 是有限 task-local abstraction/coordinate grammar；未实现 arbitrary latent constructor composition、relational multivalued concretization、多步动作或跨 latent 迭代。Z0 search 仍完整先运行，尚未与旧 DFS 的每个节点交错推进，因而不宣称彻底改变原搜索复杂度。\n"]
    report = "\n".join(parts)
    (ROOT / "reports" / "v03" / "LATIS_V03_REPORT.md").write_text(report, encoding="utf-8")
    (OUT / "summary.json").write_text(json.dumps({"stress_secondary_solutions": len(selected), "mean_delta_mdl": avg_delta, "mean_program_length_saved": statistics.mean(program_savings), "regressions_passed": len(regression), "raw_solved": solved, "train_exact": train, "heldout_exact": held, "failure_taxonomy": dict(failures)}, indent=2) + "\n", encoding="utf-8")
    print(f"Report verified: stress secondary={len(selected)}, regressions={len(regression)}, ARC solved={solved}/30")

if __name__ == "__main__":
    main()
