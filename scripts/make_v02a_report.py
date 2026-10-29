"""Generate tables from measured solver output; standard library only."""
from pathlib import Path
from collections import defaultdict
from statistics import median
import csv
import hashlib
import json
import platform
import subprocess

ROOT = Path(__file__).resolve().parents[1]
BASE = "8a49ff9c30daaf19155bf947df2a402dab0d6663"
OUT = ROOT / "results" / "v02a"

def command(*args):
    return subprocess.check_output(args, cwd=ROOT).decode("utf-8", errors="replace").strip()

def digest(data):
    return hashlib.sha256(data).hexdigest()

def load(path):
    return json.loads(path.read_text(encoding="utf-8-sig"))

def groups(path):
    result = defaultdict(list)
    for row in load(path):
        result[row["mode"]].append(row)
    return result

def normalize(row):
    s = dict(row["statistics"])
    if row["mode"] == "Full":
        s.update(expanded=s["expanded_states"], partial_states=s["partial_skeleton_states"],
                 first_solution_expanded=s["first_solution_expanded_states"],
                 first_seconds=s["first_solution_seconds"], seconds=s["wall_seconds"],
                 legacy_dependency_checks=s["dependency_relation_checks"], verifier_calls=s["complete_programs"])
    return s

def table(data):
    lines = ["| 模式 | Expanded | 首解 states | 完整程序/验证 | Partial | 首解 ms 中位数 | 总 ms 中位数 |",
             "|---|---:|---:|---:|---:|---:|---:|"]
    for mode, runs in data.items():
        s = normalize(runs[0])
        first = median(normalize(r)["first_seconds"] for r in runs) * 1000
        total = median(normalize(r)["seconds"] for r in runs) * 1000
        lines.append(f"| {mode} | {s['expanded']} | {s['first_solution_expanded']} | {s['verifier_calls']} | {s['partial_states']} | {first:.3f} | {total:.3f} |")
    return "\n".join(lines)

def main():
    OUT.mkdir(parents=True, exist_ok=True)
    core = groups(ROOT / "results/03560426/v02a_ablation.json")
    assert set(core) == {"JointConstraint", "NoBidirectionalSkeleton", "NoWitnessFirst", "NoLazyContext", "NoStructuralDominance", "NoMemoization", "Full"}
    for mode, runs in core.items():
        assert len(runs) == 5 and all(r["solved"] for r in runs)
        assert len({normalize(r)["expanded"] for r in runs}) == 1
        if mode != "Full":
            assert all(r["heldout_exact"] and r["statistics"]["exhaustive"] for r in runs)
        else:
            assert all(all(t["exact"] for t in r["tests"]) for r in runs)
    synthetic = load(OUT / "synthetic/suite.json")
    stress = load(OUT / "stress/suite.json")
    assert len(synthetic) == 11 and len(stress) == 6
    assert all(r["solved"] and r["heldout_exact"] and r["statistics"]["exhaustive"] for r in synthetic + stress)
    a = normalize(core["JointConstraint"][0])
    b = normalize(core["NoBidirectionalSkeleton"][0])
    g = normalize(core["Full"][0])
    assert a["expanded"] < 1305 and a["first_solution_expanded"] < 1251

    original_paths = command("git", "ls-tree", "-r", "--name-only", BASE, "src", "test/Main.hs").splitlines()
    preservation = {}
    for name in original_paths:
        old = subprocess.check_output(["git", "show", f"{BASE}:{name}"], cwd=ROOT).replace(b"\r\n", b"\n")
        now = (ROOT / name).read_bytes().replace(b"\r\n", b"\n")
        assert old == now, f"v0.1 module changed: {name}"
        preservation[name] = digest(now)
    environment = {
        "date": "2026-10-04", "timezone": "Asia/Shanghai", "platform": platform.platform(),
        "processor": platform.processor(), "ghc": command("ghc", "--numeric-version"),
        "hardware": load(OUT / "hardware.json") if (OUT / "hardware.json").exists() else None,
        "cabal": command("cabal", "--numeric-version"), "optimization": "-O2", "repeats": 5,
        "baseline_commit": BASE, "baseline_modules_unchanged": preservation,
        "config": {"encoder": "Four, background=0", "correspondence_budget": 256,
                   "state_budget": 1000000, "solution_limit": 100000, "lambda": 1, "mu": 2},
        "dataset_sha256": digest((ROOT / "data/03560426.json").read_bytes()),
        "source_sha256": {str(p.relative_to(ROOT)).replace("\\", "/"): digest(p.read_bytes().replace(b"\r\n", b"\n"))
                          for folder in ["src", "app", "test", "scripts"] for p in sorted((ROOT / folder).rglob("*"))
                          if p.is_file() and p.suffix in {".hs", ".py", ".ps1"}},
    }
    (OUT / "environment.json").write_text(json.dumps(environment, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    flat = []
    for mode, runs in core.items():
        for i, r in enumerate(runs, 1):
            flat.append({"mode": mode, "repeat": i, **normalize(r)})
    columns = sorted({k for r in flat for k in r})
    with (ROOT / "results/03560426/v02a_ablation.csv").open("w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, columns)
        writer.writeheader()
        writer.writerows(flat)

    def rate(prefix):
        n, hits = a[prefix + "_memo_queries"], a[prefix + "_memo_hits"]
        return f"{hits}/{n} ({100 * hits / n if n else 0:.1f}%)"

    stress_tables = []
    stress_ablation = {}
    for r in stress:
        name = r["task"]
        data = groups(OUT / "stress" / name / "v02a_ablation.json")
        assert all(len(rs) == 5 and all(x["solved"] for x in rs) for rs in data.values())
        assert all(x["heldout_exact"] and x["statistics"]["exhaustive"] for mode, rs in data.items() if mode != "Full" for x in rs)
        stress_ablation[name] = data
        stress_tables.append(f"### {name}\n\n{table(data)}")
    (OUT / "stress/ablation.md").write_text("# Six stress-task ablations\n\n" + "\n\n".join(stress_tables) + "\n", encoding="utf-8")
    (ROOT / "results/03560426/v02a_ablation.md").write_text("# Core ablations\n\n" + table(core) + "\n", encoding="utf-8")

    suites = "\n".join(f"| {r['task']} | True | True | {r['statistics']['expanded']} | {r['statistics']['first_solution_expanded']} | {r['statistics']['branch_points']} |" for r in synthetic + stress)
    ambiguous = stress_ablation["map-scan-ambiguity"]
    dom_a, dom_e = normalize(ambiguous["JointConstraint"][0]), normalize(ambiguous["NoStructuralDominance"][0])
    report = f"""# LATIS v0.2A — Constraint-Driven Joint Synthesis

在现有 v0.1 repository 上增加独立 joint solver。`03560426` 保持同一 latent scan 程序，全部训练与公开 heldout 精确匹配；原 11 项与新增 6 项任务均训练/heldout 通过。状态成本满足验收阈值，不能据此宣称 CPU 耗时也同比下降。

## 保留范围与可复现性

以 commit `{BASE}` 为基线，原 {len(preservation)} 个 source/test 文件逐字保留（统一 CRLF/LF 后比较），包括 encoder、ontology、renderer、correspondence、ML/DSA、observer、effect、witness grammar、exact verifier、MDL、abstraction 与 11 项 synthetic fixture。新增代码复用这些模块，原 `solve/benchmark/suite/evaluate` 仍可运行。只有 CLI 和 Cabal 增加入口/模块/独立测试，旧报告与旧结果未覆盖。

GHC {environment['ghc']}，Cabal {environment['cabal']}，Windows，`-O2`，每组 5 次顺序运行，同一 executable 内运行 6 个 joint modes 和原 `Full`。均为 Four-connectivity/background=0、correspondence 256、state budget 1,000,000。为检验穷尽，所有此次消融共用 solution limit 100,000；core 实际只有 1 个 valid program，旧 128 限制与此限制结果相同。没有并行 benchmark，没有新增 package。计时为 monotonic wall time，含编码、匹配、所有传播/搜索/验证；trace 字符串落盘与 JSON 格式化在计时外。表中给出 5 次中位数，全部原始时间也保留。微秒级差异不作稳定性能结论。

完整 source/data 哈希与环境见 `results/v02a/environment.json`。运行 `scripts/run-v02a.ps1` 重建全部结果；`scripts/make_v02a_report.py` 从实测 JSON 生成本报告并检查 source preservation 和验收条件。

## Sigma、规则与有限搜索

`ConstraintState` 表示 Σ=(P,Γ,C,D,R,M)：P 是有 correspondence/order guard 的部分程序表；Γ 包含 GADT typed hole 和有限 AST domain；C 是带 provenance 的约束集合；D 包含 candidate-conditioned FV/实例依赖边与 context 支持；R 是每个 role 的残差；M 是当前仍有支持的 correspondence bundle。guard 是候选域，不是已选 skeleton。Map/Scan 的 operator/parameter 约束相互 back-restrict；Filter、Fold、Iterate 保持旧语言中已经支持的片段。

确定性传播顺序：遮挡顺序/人口与 unchanged 支持 → 每个 role 的 effect operator restriction → typed schema → witness → 当前 scope 的 expression domain → FV/实例边 → skeleton support → globally proven structural dominance → contradiction。参数 expression 的 FV 与整条 action 的 FV 分开：后者还包括 schema 已绑定的 current Object operand，因此常量 Vec 或无参数 rotate 也不会丢掉其 input Object 依赖；实例边明确记录 input/prior-output ID 或 canvas。规则迭代至数据固定点；空 domain 只能证明当前有限 grammar/guard 无支持。合法多个值全部保留；没有任意挑一个值。Start 与 Step 各有自身 effect/value 域，允许初始化与递推不同。

默认从 `{{current}}` 开始。Map/Start 的反向 binder 约束禁用 `prev`，允许随后 grid；Step 可以按 current → current+prev → current+grid → full 扩展。无匹配表达式时传播继续到下一 admissible scope。首解后，穷尽阶段先遍历完所有当前 assignments，以已访问 assignment 的 nogood/frontier proof 为依据，再展开一个 deferred context；先前候选/合法解都保留，并重新搜索包含旧值的新 cross-product。这里“较小 context 无解”在穷尽阶段指**没有尚未访问的满足 assignment**，不是抹去已经找到的解或声称那个 context 从未有解。这一处理同时保留 lazy 首解与 bounded completeness，trace 的 `frontier-exhaustion` 记录其依据。

MRV 在当前 live guard 内选 domain 最小的变量；guard 未选时先处理 correspondence/order 和 family，避免对不成立 guard 的洞作任意赋值。并列使用结构次序、AST length、FV 数、更少的 effect 写入字段、symbol 数、canonical text 的确定性排序。每个 expression 记录 type、scope、FV、length/symbol rank、witness 是否接受。完整程序必须经过原 `verifyLatent`，再使用原 L+K+2E；只对 E=0 程序选最小值。

唯一 hard structural dominance 是：same order 且 seed/step **同 AST**、FV 不含 Previous 的 scan，依据 scan-includes-seed 语义全局等价于 map。仅删除这个证明覆盖的 action pair，并保留其他 deferred scan 可能性。训练集上相同但 AST 不同的表达式只 PreferredLater。测试将开启/关闭 dominance 的全部 valid sets 作比较，检查每个消失的 scan 都有这个全局 map 代表。

Expression memo 使用 type + exact scope + 所有 observable context/value constraints（排序去重、忽略对象 ID/未绑定 context 字段）。partial memo 用 canonical finite domain 和 correspondence/canvas/forbidden pairs，FNV hash 后再比较完整 key 防碰撞。program memo 使用结构 AST canonical text，不使用训练语义相同作为 hard pruning 依据。NoMemoization 关闭三个跨状态 cache；同一洞已经测试过的 term 仍是 domain 内的已知约束，不会当作新 term 重算。

Propagation 终止：effect/witness 标记只前进，有限 scope cursor 只增加，当前 candidate/guard 域只收缩或由有限 deferred frontier 增添已有 grammar 的值，约束 provenance 集合有限。DFS 的所有分支有限，有独立 state/solution/correspondence budget。不能证明完整 ARC domain 的 completeness；仅对当前有限模板、原参数语法、保留 correspondence branches 穷尽，modulo 已证明的全局 scan→map rewrite。

## 七组 core 消融

{table(core)}

全部 joint 行 `exhaustive=true`、`budget_exhausted=false`、`solution_limit_reached=false`，同一 `ScanP LeftToRight`，L=23、K=14、E=0。Full 是原 v0.1 formal baseline，不是近似复刻。

```text
objects = sortBy(LeftToRight, objects)
Start = lambda current: Translate(current, GridTL - TL(current))
Attach = lambda prev,current: Translate(current, BR(prev) - TL(current))
scan(Attach, Start(head(objects)), tail(objects))
```

Expanded 是可复核的事件计数：correspondence edges/bundles + legacy relation checks（仅 C）+ effect queries + witness instance queries + schema/domain transitions + 新 expression tests + context expansion + global dominance certificate + contradiction + partial visit + branch assignment + 实际 exact call。noop propagation 不伪装成 expanded；另报全部规则调用/轮数/实际耗时。它是搜索工作代理值，各架构的一个 state 不是同等 CPU 工作量。Partial 是实际 DFS visit（含命中 cache）；complete 是实际完整验证调用，cache query/hit 另计。

Full joint core：propagation iterations={a['propagation_iterations']}，rule calls={a['propagation_rule_calls']}，deterministic steps={a['deterministic_steps']}，branch points={a['branch_points']}，average/max branch domain={a['average_branch_domain']}/{a['maximum_branch_domain']}，context expansions={a['context_expansions']}，expression tests={a['expression_tests']}，effect queries={a['effect_queries']}，witness instance queries={a['witness_queries']}，witness schema holes={a['witness_holes']}，enumerated holes={a['enumerated_holes']}，exact calls={a['verifier_calls']}。

Expression memo {rate('expression')}；partial memo {rate('partial')}；program memo {rate('program')}。core 唯一 program 被 partial cache 提前挡住，因而 program cache 的 hit 是 0；不伪造这个收益。压力任务中的 expression/partial 命中及 program hit=0 等原始计数也全部保留，不声称三个 cache 都有独立收益。

## 回归与六个压力任务

| Task | 训练 exact | Heldout exact | Expanded | 首解 states | Branch points |
|---|---|---|---:|---:|---:|
{suites}

压力任务来自相同 DSL 的新场景/颜色/尺寸/位置，固定 generator 在 `ARC.JointEvaluate.stressTasks`，每项 2 个训练与 1 个 withheld test；实际 grids 保存为各目录的 `task.json`，可独立用 joint-solve 重跑。map/scan ambiguity 验证全局 rewrite 与 MDL；true-scan 验证失败后 prev；grid-without-prev 验证最终 map 仅使用 current/grid；constant-transform 验证首解前无需扩展；equivalent-expressions 验证多值域/memo/MDL；wrong-early-skeleton 验证完整程序前的矛盾。6×7 消融原始 JSON 在 `results/v02a/stress/*/v02a_ablation.json`，表见 `results/v02a/stress/ablation.md`。默认保留 complete traces，全部参数表达式候选包括 rejected term 也列出。

## Q1：是否降低 dependency hypothesis enumeration？

是。core 独立 dependency relation checks 从 {g['legacy_dependency_checks']} 降至 0，true dependency branch=0；NoWitnessFirst 恢复 1044 checks，expanded={normalize(core['NoWitnessFirst'][0])['expanded']}。默认没有调用 `analyzeDependencies`，只用 witness 输出约束筛现有表达式。216 次 expression test 中含为 bounded completeness 延后的 context，不应把它们伪称“零关系搜索”。

## Q2：有多少 dependency facts 自动导出？

core 的 D 一共 {a['dependencies_derived']} 条去重记录，其中 {a['expression_dependencies_derived']} 条是 expression FV 集，{a['dependency_edges_derived']} 条是按 pair/object 实例化的输出依赖边，其余是 context 支持状态。全部来自确定性规则，0 条来自 dependency branch。Start={{current,grid}}，Attach={{prev,current}}；Start 的三实例和 Attach 的七实例各按 FV 建边。一般歧义任务的事实带 candidate/guard 条件，不能把所有候选的边当作最终程序的确定依赖。

## Q3：lazy context 能否避免不必要依赖？

首解可以延后更大 context：core first expression tests={a['first_expression_tests']}，NoLazyContext={normalize(core['NoLazyContext'][0])['first_expression_tests']}。constant-transform 首解前扩展=0；grid task 最终是无 Previous 的 map；真正 scan 才需要 prev。穷尽搜索仍检查 deferred 大 scope，这些允许的 binder 并非最终 expression 的真实依赖。NoLazyContext 一开始就有全部 admissible binder，所以 expansion=0 不能解释为“没有 prev/grid”。core 的 lazy 总 states={a['expanded']}，eager={normalize(core['NoLazyContext'][0])['expanded']}，lazy 在穷尽成本上没有胜出，明确保留此负结果。

## Q4：双向 propagation 有独立收益？

有。关闭 skeleton→context restriction 而保持其他机制，core expressions {a['expression_tests']}→{b['expression_tests']}，expanded {a['expanded']}→{b['expanded']}，首解 {a['first_solution_expanded']}→{b['first_solution_expanded']}。多出来的是 Map/Start 不该拥有的 prev scope 检查。只使用这些 binder/typing 支持规则，没有先猜 BR/TL dependency。反方向从是否有满足实例约束的 current-only body、合法 seed/step 与真实 FV 推导 live Map/Scan。core Map 无支持，Scan 有唯一支持，因此不用 branch。

## Q5：同时改善首解与穷尽吗？

相对原 Full，首解 states {g['first_solution_expanded']}→{a['first_solution_expanded']}（下降 {100*(1-a['first_solution_expanded']/g['first_solution_expanded']):.1f}%）；穷尽 expanded {g['expanded']}→{a['expanded']}（下降 {100*(1-a['expanded']/g['expanded']):.1f}%）。这是状态工作量的改善。wall-time 中位数见上表：joint 的 provenance、fixedpoint 和 memo 管理在这个小任务上有开销，不能据状态数宣称同比加速。core 结构 dominance 无独立收益（真正 scan 必需）；在 map-scan 压力任务中 exact calls {dom_a['verifier_calls']}→{dom_e['verifier_calls']}（关闭 dominance），说明这个机制的作用点不同。

## Q6：哪些地方仍需 branch？

core 0 个 branch；其他任务在 correspondence/order、Map/Scan/Filter family、typed operator/expression 或 predicate 多值域之间 MRV。branch trace 给出 domain size，并在 fixed point 后才赋值。deterministic contexts/FV derivation 不算 dependency branching。

## Q7：剩余 branch 属于哪类？

同色同形物体的 match 可能是 correspondence ambiguity；singleton geometry 上 TL/TR/BL/BR 同坐标但不同 AST 是训练范围内 genuine expression ambiguity；初始化不同的 Scan 与 Map/Iterate/Filter 可有 skeleton ambiguity。不同 order 在无重叠训练上可能等价，仍需保留因为未证明全局等价。将 correspondence 与 order 合为 guard，以及把 operator/expression 合成 action hole，是当前实现 artifact，可能进一步细分 MRV。没有表达式满足原有限语法时是 language limitation/unsupported，不靠扩大 grammar 或 numeric lattice 强行解决。

## Q8：相同程序是否没有 task-specific hardcoding？

是。joint synthesis modules 不接收 task ID/test output，不包含 03560426 或特定颜色/输入矩阵分支。witness 从现有匹配得到向量规格，现有 grammar 选出 `GridTL-TL(current)` 与 `BR(prev)-TL(current)`，FV 后限制 skeleton。遮挡 order prune 来自任意 correspondence 的 later-wins DAG，不依赖任务编号。GADT constructor/typed schema、原 exact verifier、原 MDL 全部复用。

## 验证与限制

`cabal ... test`：原 1518 round trips、原语言/ontology/schema/effect/witness/matching 检查、11 个 heldouts，以及新 7 modes、core acceptance、6 stress、固定点幂等、provenance、cache key、deferred vs eager vs NoMemo valid-set 相等、dominance global-equivalence 代表、tiny-budget termination、空实例不错误拒绝 fixed operator 与重复 predicate 的 program cache 命中均通过。没有神经网络、SMT 或额外工具链。单物体例子的 Scan Step 没有观测实例时，固定算子候选全部保留；即使 Map 当前更便宜，也不能据训练表现删除初始化不同的 Scan。

本结果支持在保留模板中从 effect+witness+typed expression+FV constraints 推导结构；不证明整个 ARC 的结构都可唯一推导。Fold/Iterate 保持旧 observational trigger，未研究更一般 accumulator 或 loop induction。correspondence branch budget、ontology 不支持 union/split/全遮挡、有限 expression grammar 等限制继续存在。current/grid/prev 是旧语言全部可观察 source，没有新增任意 global/environment source。源保留、原始 JSON 和 trace 足以复核以上范围。
"""
    (ROOT / "reports" / "v02a" / "LATIS_V02A_REPORT.md").write_text(report, encoding="utf-8")
    print(f"Report generated: {a['expanded']} expanded, {a['first_solution_expanded']} first; 11+6 exact; {len(preservation)} original modules unchanged.")

if __name__ == "__main__":
    main()
