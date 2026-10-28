"""Generate v0.3R research report from completed, fingerprinted experiments."""
import collections
import csv
import json
import pathlib
import importlib.util
import hashlib

ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / "results/v03r"
MODES = ["InducedTSLFull", "LegacyFamilies", "NoWitness", "NoVersionSpaceSharing",
         "NoTaskAbstraction", "NoEffectPropagation", "NoFVDependency"]


def table(headers, rows):
    return "\n".join(["| " + " | ".join(headers) + " |", "|" + "|".join(["---"] * len(headers)) + "|"] +
                     ["| " + " | ".join(str(v) for v in row) + " |" for row in rows])


def metric(row, name):
    return row.get("statistics", {}).get(name)


def total(rows, name):
    return sum(metric(r, name) or 0 for r in rows)


def logged(rows, name):
    values = [metric(r, name) for r in rows if metric(r, name) is not None]
    if not values:
        return "n/a"
    return str(sum(values)) if len(values) == len(rows) else f"{sum(values)} ({len(values)}/{len(rows)} measured)"


def exact(rows):
    return f"{sum(bool(r.get('train_exact')) for r in rows)}/{len(rows)}"


def held(rows):
    return f"{sum(bool(r.get('heldout_exact')) for r in rows)}/{len(rows)}"


def main():
    groups = {g: json.loads((OUT / g / "comparison.json").read_text()) for g in ["core", "regression", "stress", "diagnostic"]}
    for g, count in [("core", 1), ("regression", 17), ("stress", 10)]:
        assert len(groups[g]) == count * 7, (g, len(groups[g]))
        assert all(sum(r["ablation"] == m for r in groups[g]) == count for m in MODES)
    assert len(groups["diagnostic"]) == 60
    assert all(r.get("evaluation_set") == "PreviouslyOpenedDiagnosticSet" for r in groups["diagnostic"])
    # Data identity across modes, and task sets identical to v0.3 snapshots.
    for rows in groups.values():
        for task in {r["task"] for r in rows}:
            assert len({r["input_sha256"] for r in rows if r["task"] == task}) == 1
    protocol = json.loads((OUT / "protocol.json").read_text())
    for path, expected in protocol['fingerprint']['source_sha256'].items():
        assert hashlib.sha256((ROOT / path).read_bytes()).hexdigest() == expected, path
    binaries = set()
    for g, rows in groups.items():
        for r in rows:
            run = json.loads((OUT / g / r["task"] / r["ablation"] / "execution.json").read_text())
            assert run["protocol"]["fingerprint"] == protocol["fingerprint"]
            binaries.add(run['protocol']['command'][0])
    for binary in binaries:
        assert hashlib.sha256(pathlib.Path(binary).read_bytes()).hexdigest() == protocol['fingerprint']['binary_sha256']
    spec = importlib.util.spec_from_file_location("v03r_runner", ROOT / "scripts/run_v03r.py")
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    manifest, regression, stress = runner.validate_inputs()
    tests = (OUT / "tests.log").read_text()
    for name in ["induced-tests", "joint-tests", "latent-tests", "latis-tests"]:
        assert f"Test suite {name}: PASS" in tests, name
    core = {r["ablation"]: r for r in groups["core"]}
    full, eager, bottom = core["InducedTSLFull"], core["NoVersionSpaceSharing"], core["NoWitness"]
    assert full["train_exact"] and full["heldout_exact"]
    activated = [x["symbol"] for x in full["base_activated"]]
    forbidden = set("Attach Start Progression AlignmentTask ChainObjects MapPose ScanP OrderedPoseSequence PointwisePose AttachChain ProgressionTask".split())
    assert not forbidden.intersection(activated)
    assert metric(full, "structural_prior_count") == 0
    assert "scan" in activated and full["task_invented"]
    for rows in groups.values():
        for r in rows:
            if r['ablation'] != 'LegacyFamilies' and not r.get('external_timeout'):
                assert metric(r, 'structural_prior_count') == 0
                assert not forbidden.intersection(s['symbol'] for s in r.get('base_activated', []))
    for folder in [ROOT / 'src/Language/Induced', ROOT / 'src/Synthesis/Induced']:
        for source in folder.glob('*.hs'):
            for line in source.read_text().splitlines():
                if line.startswith('import '):
                    assert not any(name in line for name in ['Synthesis.Skeleton', 'Synthesis.Joint', 'Synthesis.Hierarchical', 'Latent.Program', 'Latent.Local', 'Latent.Global']), (source, line)
    core_table = table(["Mode", "Train/Heldout", "VS nodes", "Complete ASTs", "Child ASTs", "Work", "Seconds", "Inventions"],
        [[m, f"{int(core[m].get('train_exact', False))}/{int(core[m].get('heldout_exact', False))}",
          metric(core[m], "version_space_nodes"), metric(core[m], "materialized_complete_asts"), metric(core[m], "materialized_child_asts"),
          metric(core[m], "total_expanded_work"), f"{metric(core[m], 'wall_clock_seconds') or 0:.3f}", metric(core[m], "invented_abstractions")] for m in MODES])
    ablation_rows = []
    for group in ["regression", "stress"]:
        for mode in MODES:
            rows = [r for r in groups[group] if r["ablation"] == mode]
            ablation_rows.append([group, mode, exact(rows), held(rows), logged(rows, "total_expanded_work"), logged(rows, "version_space_nodes"),
                                  logged(rows, "materialized_complete_asts"), f"{total(rows, 'wall_clock_seconds'):.3f}",
                                  sum(bool(r.get("external_timeout")) for r in rows)])
    ablation_table = table(["Set", "Mode", "Train exact", "Heldout exact", "Logged work", "VS nodes", "Complete ASTs", "Seconds", "Timeouts"], ablation_rows)
    def paired(group):
        items = {}
        for r in groups[group]:
            items.setdefault(r["task"], {})[r["ablation"]] = r
        return items
    regress_table = table(["Task", "Legacy train/held", "Induced train/held", "Induced diagnosis"],
        [[t, f"{int(rs['LegacyFamilies'].get('train_exact', False))}/{int(rs['LegacyFamilies'].get('heldout_exact', False))}",
          f"{int(rs['InducedTSLFull'].get('train_exact', False))}/{int(rs['InducedTSLFull'].get('heldout_exact', False))}",
          rs['InducedTSLFull'].get('failure')] for t, rs in sorted(paired("regression").items())])
    stress_table = table(["Task", "Legacy train/held", "Induced train/held", "Induced diagnosis"],
        [[t, f"{int(rs['LegacyFamilies'].get('train_exact', False))}/{int(rs['LegacyFamilies'].get('heldout_exact', False))}",
          f"{int(rs['InducedTSLFull'].get('train_exact', False))}/{int(rs['InducedTSLFull'].get('heldout_exact', False))}",
          rs['InducedTSLFull'].get('failure')] for t, rs in sorted(paired("stress").items())])
    diag_full = [r for r in groups['diagnostic'] if r['ablation'] == 'InducedTSLFull']
    diag_old = [r for r in groups['diagnostic'] if r['ablation'] == 'LegacyFamilies']
    diag_table = table(["Mode", "Train exact", "Heldout exact", "Failure taxonomy", "Seconds", "Timeouts"],
        [[mode, exact(rows), held(rows), dict(collections.Counter(r.get('failure') for r in rows)),
          f"{total(rows, 'wall_clock_seconds'):.3f}", sum(bool(r.get('external_timeout')) for r in rows)]
         for mode, rows in [('InducedTSLFull', diag_full), ('LegacyFamilies', diag_old)]])
    changes = table(["Task", "Legacy diagnosis", "Induced diagnosis", "Induced evidence"],
        [[t, rs['LegacyFamilies'].get('failure'), rs['InducedTSLFull'].get('failure'), rs['InducedTSLFull'].get('failure_evidence')]
         for t, rs in sorted(paired('diagnostic').items())])
    inventory = collections.Counter(s['symbol'] for r in diag_full for s in r.get('base_activated', []))
    inventions = full['task_invented']
    inv_table = table(["Name", "Occurrences", "Portfolio saving", "Originating expression"],
        [[i['name'], i['repeated_occurrences'], i['mdl_saving'], f"`{i['originating_ast']['expression']}`"] for i in inventions])
    # Retain all new metrics in a flat CSV for analysis, including missing
    # timeout/legacy fields as blank rather than inventing zero measurements.
    all_rows = [dict(r, group=g) for g, rows in groups.items() for r in rows]
    fields = sorted({k for r in all_rows for k in r.get('statistics', {})})
    with (OUT / 'metrics.csv').open('w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=['group', 'task', 'ablation', 'train_exact', 'heldout_exact', 'failure'] + fields)
        writer.writeheader()
        for r in all_rows:
            writer.writerow(dict({k: r.get(k) for k in ['group', 'task', 'ablation', 'train_exact', 'heldout_exact', 'failure']}, **r.get('statistics', {})))
    full_reg = [r for r in groups['regression'] if r['ablation'] == 'InducedTSLFull']
    old_reg = [r for r in groups['regression'] if r['ablation'] == 'LegacyFamilies']
    full_stress = [r for r in groups['stress'] if r['ablation'] == 'InducedTSLFull']
    old_stress = [r for r in groups['stress'] if r['ablation'] == 'LegacyFamilies']
    node_saving = metric(eager, 'version_space_nodes') - metric(full, 'version_space_nodes')
    program_saving = metric(eager, 'materialized_complete_asts') - metric(full, 'materialized_complete_asts')
    text = f"""# LATIS v0.3R — Induced-TSL Rebaseline

独立新 solver 已实现；03560426 的 train 与 heldout 逐格 exact，StructuralPriorCount=0。旧 solver 和数据未改写。覆盖率不能视为 v0.3 的无损替代：17 回归 train={exact(full_reg)}、heldout={held(full_reg)}（legacy {exact(old_reg)}/{held(old_reg)}）；A–J train={exact(full_stress)}、heldout={held(full_stress)}（legacy {exact(old_stress)}/{held(old_stress)}）。所有数字来自本次 sequential run；失败与限制在下面公开。

## 可复现协议和定义

`cabal --config-file=scripts/cabal.config build all --offline`；`python scripts/run_v03r.py --tests`；`python scripts/make_v03r_report.py`。CLI：`latis solve-v03r --task PATH --out PATH --mode InducedTSLFull`。核心 trace：[induced_tsl_trace.md](results/v03r/03560426/induced_tsl_trace.md)。完整 source/binary/task hashes：[protocol.json](results/v03r/protocol.json)；全部计数：[metrics.csv](results/v03r/metrics.csv)。四个 test suites 本次全部 PASS，包含 1518 round trips、旧 solver regressions、typed kernel/witness/VSA、core heldout，以及改变画布和首物体 x 的独立扰动检查。

固定 B = typed ML + ARC semantic atoms。Q=(type,specification,typed environment)。TSLτ=Signature(VSroot)∪Iτ。此处 VSroot 是 **bounded discovered support** 的 underapproximation：非空支持必须可审计，但未发现支持不是 operator 不可能支持该 task 的证明。TSL 比 winning program 的 used-symbol closure 更宽：核心有 {len(activated)} 个 BaseActivated，而 winning program 有 {metric(full, 'distinct_symbol_count')} 个 distinct symbols。Base没有 ScanP、Attach、MapPose、Progression 等结构。

基于 [Microsoft PROSE witness 文档](https://www.microsoft.com/en-us/research/project/prose-framework/backpropagation/) 的 operator specification backpropagation 思路，LATIS 为整个 task 推导受支持的 Base signature，并在合成后发现匿名字典项。版本空间的参考是 [Microsoft 的 VSA 文档](https://www.microsoft.com/en-us/research/project/prose-framework/usage/)；未依赖 PROSE SDK 或固定 task DSL。

## Q1：核心是否脱离 privileged structures？

是。new learner 不导入/调用 Synthesis.Skeleton、Joint、Hierarchical 或 Latent.Program。训练 pairs 是 synthesis 唯一参数，没有 task ID/test outputs。实际选中程序为：

```text
{full['program']}
```

它用 sortBy 的 generic key，head/tail，Translate，参数化 Anchor，coordDelta 与 generic scan。canvasSize 是 Base observer。没有 chain/ordered-pose/pointwise family 分支。Registry 与 AST 的 forbidden-symbol 检查通过。StructuralPriorCount=0 是对 registry/witness dispatch/依赖图的结构审计结果；不是仅凭程序名称计数。LegacyFamilies 保留至少 MapP/ScanP/FoldBBoxP/IterateP/PlaceEach 等结构；新路径没有这些 family。

## Q2：scan 支持是否由 witness 推导？

是。根 function graph → lambda binding → mkScene 的 correspondence/Render-valid residual → List PlacedObject specification。Learn 对全部 return-compatible Base ops 求 witness；map 产生逐元素函数约束，scan 产生 seed=y₀、step((yᵢ₋₁,xᵢ))=yᵢ、以及 tail input list。只有所有 child VS 非空才能创建 Join_scan，失败的 map/scan child branches 会记录。Translate 的 vector instance constraints 是 TL(target)−TL(source)，向量表达式从 Anchor 与 coordDelta 的组合中学习；没有 blind vector lattice。step 的 pair parameter 访问路径 `.0/.1` 从 AST 和 witness bindings 自动导出，不使用 depends-on-prev family。

Trace、[version_space.json](results/v03r/03560426/version_space.json) 和 [induced_tsl.json](results/v03r/03560426/induced_tsl.json) 给出 root spec、compatible rules、effect pruning、子任务/MRV、map/scan 支持、Translate vectors、表达式、FV/access paths、VS nodes、inventions、exact/MDL。

## Q3：Attach 是否真正 invention？

是，发现的是匿名 I0；“Attach”只是事后对其语义的解释。发现器只读取 distinct exact-valid portfolio AST，做 alpha-normalized repeated-lambda detection，完全不匹配 Attach 名称或预先给定 BR/TL pattern。

{inv_table}

定义成本=L+2，引用成本=2。**saving 的范围是多程序 portfolio**，不是 selected program。单个 scan 已只写一次 lambda，命名它不能虚报单程序压缩；winning Base AST保持独立计分。NoTaskAbstraction 不影响本次核心 exact/search，只移除字典和相应 TSL符号。当前只有 exact subtree/alpha-equivalence abstraction；一般参数 anti-unification、lambda-lifting 和 invention 引导后续搜索尚未实现。

## Q4：版本空间相对完整 AST enumeration 节省多少？

核心 VSA 有 {metric(full, 'version_space_nodes')} 个 nodes，{metric(full, 'union_nodes')} Union、{metric(full, 'join_nodes')} Join，包含 {full['version_space_derivations']} 个 **derivations** 的计数上界，最终 materialize {metric(full, 'materialized_complete_asts')} 个 complete AST。derivations 可能表达同一 AST/语义，不能称为 {full['version_space_derivations']} 个不同程序。

与实际 NoVersionSpaceSharing 相比，VS nodes 减少 {node_saving}（{metric(eager, 'version_space_nodes')}→{metric(full, 'version_space_nodes')}），child AST constructions {metric(eager, 'materialized_child_asts')}→{metric(full, 'materialized_child_asts')}；**complete AST 数量差是 {program_saving}**，因为两者都受同一个 extraction frontier 限制。不能用 derivation 上界冒充实测完整枚举节省。共享模式保留 Joins 直到 extraction；无共享模式关闭 Learn memo/hash-consing，立即 materialize child products。观察表达式会先 materialize，数量单列 observer_terms，不冒充 complete programs。

## Q5：Witness 相对 bottom-up 的收益？

核心 Full train/heldout={full['train_exact']}/{full['heldout_exact']}，NoWitness={bottom['train_exact']}/{bottom['heldout_exact']}。Full expanded work={metric(full, 'total_expanded_work')}，NoWitness={metric(bottom, 'total_expanded_work')}；solver seconds {metric(full, 'wall_clock_seconds'):.3f} vs {metric(bottom, 'wall_clock_seconds'):.3f}。收益是同一 Base 上找到受规格支持的正确结构；**本次不支持普遍速度提升的结论**。NoWitness 确实在 typed lambda contexts 和 root 中做 finite bottom-up enumeration，witness_calls=0；没有改用 legacy solver。

Bottom-up beam=8/type、products≤64/operator-instance，lambda-body rounds≤3，body AST≤24，root rounds≤7、AST≤40；Full 的 witness/observer bounds 不同，因此这不是共同穷尽空间上的效率定理。所有模式仍用同一 Base、canonical grounding 和 final exact verifier。NoWitness failures 是 SearchFailure，不能据此声称语言不表达该任务。

## Q6：哪些 symbol Activated / Invented？

核心 BaseActivated：`{', '.join(activated)}`。TaskInvented：`{', '.join(i['name'] for i in inventions)}`。每个 symbol 的支持 specification/witness 记录在 induced_tsl.json；只有 reachable nonempty root VS nodes 进入 Signature，死分支不进入。Observer-composed terms 的支持是 exact forward-observation witness；它们不是无限 grammar 支持证明。原 30 diagnostic set 中发现的 BaseActivated 频数：`{dict(inventory)}`。

## Q7：17 回归是否退化？

新 solver {exact(full_reg)} train、{held(full_reg)} heldout；本次 legacy {exact(old_reg)} train、{held(old_reg)} heldout。数据逐 byte 使用 v0.3 task snapshots，未修改任务以迁就新语言。

{regress_table}

失败优先归为 BaseMissing/WitnessMissing/SearchFailure/SpecificationRepresentationMissing/AbstractionMissing/ImplementationBug，没有加入 task family。BaseMissing 对 intrinsic geometry construction 的判断限定于当前 synthesis literal/witness policy；不声称排除了任意 Base AST 的所有编程可能。canvas corner 与更深 coordinate compositions 的缺失经常是条件 witness/observer 域问题，不是应新增 MoveToCorner。

## Q8：A–J latent stress 是否仍成立？

新 solver {exact(full_stress)} train、{held(full_stress)} heldout；legacy {exact(old_stress)} train、{held(old_stress)} heldout。

{stress_table}

旧 hierarchical discovery 保留并明确为 LegacyFamilies 单独测量。新路径的 secondary observations 是 Base expressions，未调用手写 local/global codecs；因此不宣称保持 v0.3 全部 latent coverage。缺少 aggregate/sequence witnesses、deeper compositional observations 和 residual/codec discovery 时，正确结果是记录退化，而不是把 ProgressionTask/MapPose 改名后重新加入 Base。

## 七个 ablations

{core_table}

Legacy 不具有新 learning-task/VSA metrics，表中的 None 代表 unavailable，不是零。Legacy 的 expanded 与新 total_expanded_work 含义不同，不能按整数预算相同宣称工作量公平一致。核心新 AST L={metric(full, 'program_ast_length')}、K={metric(full, 'distinct_symbol_count')}，MDL score={full['mdl']['score']}；J=L+K+sum(lambda-body FV cardinalities)+2×constant exceptions。旧宏程序的 L/J 不与之作直接单位比较。

{ablation_table}

Logged work 对缺失 timeout/legacy 字段不填伪造值；完整 metrics.csv/JSON保留空值。NoEffect 关闭 conditional effect prune，witness/forward checks仍验证结果。NoFV 关闭基于 FV 的实例 coalescing，冲突标签始终不得合并。NoTaskAbstraction 是真实 post-synthesis feature removal；没有编造 solved/time 增益。

## Q9：原 30 diagnostic 的 taxonomy 是否改变？

**PreviouslyOpenedDiagnosticSet**，manifest hash `{manifest['hash']}`。不是新的 unseen audit；原 v0.3 首次 audit 与其 source seal 保留不动。两条路径本次重新运行，budget=25000、correspondence=32、legacy solutions=128、新 frontier=32、depth=7、external timeout=60s。相同数据与预算参数不意味着算法计数单位相同。

{diag_table}

旧 taxonomy 是 v0.3 Language/Budget/Level0/Level1 等诊断，新 taxonomy 是本请求的六类；分类标签变化本身不代表 solve-rate 提升或新 generalization。逐题证据：

`5521c0d9` 的新 Base 程序是 map + Translate + scalar subtraction：dy=y(current)−15，因此 y_out=2×y_in−15；本次 train/heldout 都 exact，legacy 为 Level1 failure。`d23f8c26` 只有 train exact、heldout 失败，仍列为 AbstractionMissing。这些是已打开数据上的 rebaseline diagnostics，没有新的 unseen 含义。

{changes}

## Q10：当前真正缺失什么？

1. **Witness coverage / specification representation**：kernel 的 forward semantics 比 deductive witnesses 宽。sort/argmin/argmax/fold/zip/range/let/if 的通用 inverse 学习没有全部实现；有限 forward observers 只覆盖其中部分非空支持。现有 conditional arithmetic witness要求 residual operand 在观察域内；不做无限整数递归。map/scan 当前是等元素类型、等长度的 partial witnesses，kernel 本身 fully polymorphic。
2. **Recursive composition/search control**：depth=7、64 decompositions/rule、96 observations/type（同语义≤2 alternatives）、finite observer closure、terminal-observation policy、frontier=32 都是公开限制。MRV 使用 surviving immediate domains 作估计。更长 compositions 即使表达式可写，也可能没有 witness 支持。没有完整 VS completeness 宣称。
3. **Base semantic coverage**：cells 是 lossless observer；它不能替代 Object-from-cells / intrinsic-geometry constructor。BaseMissing 在本报告是 direct intrinsic-object construction 的条件性 coverage diagnosis，**D4 shape 检查不证明整个 Scene -> Scene Base 无法表达任务**：有些目标可能通过 cloning/tiling existing objects 再 Render 得到，当前 correspondence/witness 未覆盖这种分解。必须先检查这样的 Base composition，不能只凭该分类就断言需要新 primitive。新增任何真正 atomic constructor 都应先回答复用性、无法简洁 composition、不是 family rename、type/semantics/effect/witness/cost 五项；本次没有以旧任务名称扩 Base。
4. **Hierarchical latent discovery / abstraction**：新路径没有一般 codec synthesis、parameter anti-unification、lambda-lifting 或 discovery/search feedback；旧手写结构只在 legacy ablation存在。portfolio compression 不等于 one-program/codec compression。
5. **Accounting/performance**：work units 包含 learning visits/rules/witness lookahead/spec comparisons；witness calls 包含 MRV lookahead，successful/failed decomposition指尝试 Join 后的结果。observer_terms是 retained forward terms；整个 forward evaluator、correspondence 内部 steps 和 serialization 不都逐步算进 work units。solver monotonic wall time及外部 process elapsed单独记录。first_solution_states 是第一批 extracted AST经过exact检查时的 cumulative work，算法不会在每个子任务提前检验整个 Grid。单次顺序计时不证明统计速度优势。

支持核心研究问题的证据：没有任务结构 family，规格推动 generic scan+Translate+Anchor composition，且 Signature(VS) 包含非 winner 支持、I0 在合成后被发现。尚未解决的研究问题：自动诱导更丰富 secondary languages、完整 witnesses 与低成本广域搜索。现有退化和 diagnostic failures 是测量结果，不能被抽象名称或重新标为 unseen 来掩盖。
"""
    (ROOT / 'reports' / 'LATIS_V03R_REPORT.md').write_text(text, encoding='utf-8')
    (OUT / 'summary.json').write_text(json.dumps({'core': core, 'regression': {'train': exact(full_reg), 'heldout': held(full_reg)},
        'stress': {'train': exact(full_stress), 'heldout': held(full_stress)}, 'diagnostic_label': 'PreviouslyOpenedDiagnosticSet',
        'diagnostic': {'train': exact(diag_full), 'heldout': held(diag_full)}, 'test_suites': 4}, indent=2) + '\n', encoding='utf-8')
    print('Generated LATIS_V03R_REPORT.md and metrics.csv from all completed experiments.')


if __name__ == '__main__':
    main()
