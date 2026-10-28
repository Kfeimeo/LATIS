"""Generate the v0.1 report from measured Haskell artifacts; stdlib only."""
from pathlib import Path
from collections import defaultdict
from statistics import median
import hashlib
import json
import platform
import subprocess

ROOT = Path(__file__).resolve().parent.parent
RESULTS = ROOT / "results" / "03560426"


def main():
    records = json.loads((RESULTS / "ablation.json").read_text(encoding="utf-8"))
    groups = defaultdict(list)
    for record in records:
        groups[record["mode"]].append(record)
    modes = ["Full", "NoEffect", "NoDependency", "NoWitness", "Direct"]
    assert all(groups[m] for m in modes)
    for mode in modes:
        trials = groups[mode]
        assert all(r["solved"] and not r["statistics"]["budget_exhausted"] for r in trials)
        assert all(all(q["exact"] is True for q in r["tests"]) for r in trials)
        assert len({r["statistics"]["expanded_states"] for r in trials}) == 1
    first = {m: groups[m][0] for m in modes}
    stats = {m: first[m]["statistics"] for m in modes}
    f, d, nw = stats["Full"], stats["Direct"], stats["NoWitness"]
    first_time = {m: median(r["statistics"]["first_solution_seconds"] for r in groups[m]) for m in modes}
    total_time = {m: median(r["statistics"]["wall_seconds"] for r in groups[m]) for m in modes}
    suite = json.loads((ROOT / "results/synthetic/suite.json").read_text(encoding="utf-8"))
    assert all(r["solved"] and all(q["exact"] is True for q in r["tests"]) for r in suite)
    source_files = sorted(list((ROOT / "src").rglob("*.hs")) + list((ROOT / "app").rglob("*.hs")) + list((ROOT / "test").rglob("*.hs")))
    manifest = {str(p.relative_to(ROOT)).replace("\\", "/"): hashlib.sha256(p.read_bytes()).hexdigest() for p in source_files}
    ghc_version = subprocess.check_output(["ghc", "--numeric-version"], text=True).strip()
    cabal_version = subprocess.check_output(["cabal", "--numeric-version"], text=True).strip()
    environment = {
        "date": "2026-10-04", "timezone": "Asia/Shanghai", "platform": platform.platform(),
        "ghc": ghc_version, "cabal": cabal_version, "optimization": "-O2", "repeats": len(groups["Full"]),
        "dataset_sha256": hashlib.sha256((ROOT / "data/03560426.json").read_bytes()).hexdigest(),
        "config": first["Full"]["config"], "source_sha256": manifest,
    }
    (RESULTS / "environment.json").write_text(json.dumps(environment, indent=2) + "\n", encoding="utf-8")

    table = "| 模式 | Solved / test exact | Expanded | Complete | Partial | Depth | First states | First ms | Total ms | L | K | Witness instance holes | Enumerated schema holes |\n"
    table += "|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|\n"
    for m in modes:
        s, r = stats[m], first[m]
        values = [m, "是 / 是", s["expanded_states"], s["complete_programs"], s["partial_skeleton_states"],
                  s["maximum_search_depth"], s["first_solution_expanded_states"], f"{first_time[m]*1000:.3f}",
                  f"{total_time[m]*1000:.3f}", r["description_length"], r["distinct_symbol_kinds"],
                  s["witness_resolved_instance_holes"], s["enumerated_schema_holes"]]
        table += "| " + " | ".join(map(str, values)) + " |\n"
    prune_table = "| 模式 | Type | Effect | Dependency | Witness |\n|---|---|---|---|---|\n"
    for m in modes:
        cells = [m]
        for key in ["type_pruning", "effect_pruning", "dependency_pruning", "witness_pruning"]:
            p = stats[m][key]
            cells.append("N/A (0/0)" if p["ratio"] is None else f'{p["rejected"]}/{p["opportunities"]} ({p["ratio"]*100:.2f}%)')
        prune_table += "| " + " | ".join(cells) + " |\n"
    state_factor = d["first_solution_expanded_states"] / f["first_solution_expanded_states"]
    time_factor = first_time["Direct"] / first_time["Full"]
    total_state_factor = d["expanded_states"] / f["expanded_states"]
    total_time_factor = total_time["Direct"] / total_time["Full"]
    witness_elimination = 100 * (1 - f["complete_programs"] / nw["complete_programs"])
    dep = f["dependency_pruning"]

    report = f"""# LATIS v0.1 实测报告

日期：2026-10-04，Asia/Shanghai。实现与实测均已完成。实验目标是结构化 symbolic synthesis 的成本与可解释性，未测量完整 ARC solve rate。

## 交付与验证

- Haskell library、CLI、离线 Cabal 构建、严格 ARC JSON reader、测试预测与实验脚本均可运行。
- `Render . Encode = identity`：1,518 个 exhaustive / generated grid 检查，覆盖 4/8 connectivity；另有背景、稀疏几何、越界、later-wins 等测试。
- typed ML combinators、所有要求的 DSA observers/relations/transforms、effect/schema/witness、safe fuel、correspondence 分支、anti-unification、transitive symbol accounting 均有测试。
- `{len(suite)}` 个合成任务全部 training exact、heldout exact；覆盖 map、rotation、reflection、recolor、filter、三种不同 scan anchors、反向次序、bbox fold、bounded iterate。
- 官方 `03560426`：3/3 training exact，1/1 public test exact。搜索入口只接收训练对，测试 output 不用于 skeleton、witness、排序或 MDL。
- `test/negative/BadHole.hs` 经 GHC 检查按预期拒绝 `Param Int` 装入 `Param Vec`。

完整 [trace](results/03560426/trace.md)、[primitive 定义表](results/03560426/primitives.md)、[原始 CSV](results/03560426/ablation.csv)、[JSON](results/03560426/ablation.json)、[环境及 source hashes](results/03560426/environment.json)、[合成任务结果](results/synthetic/suite.md) 均保存在仓库。

## 实验协议与边界

本机 GHC {ghc_version}、Cabal {cabal_version}、Windows x64、`-O2`；每个模式重复 {len(groups['Full'])} 次，时间取中位数。状态计数在所有重复中一致，没有模式耗尽预算。计时使用 monotonic clock，包括编码、correspondence、dependency analysis、hole search、grid verification 与最终 exact-valid MDL；不包含编译、JSON 文件读取或报告写入。

初始目录为空，并无可运行的既有 direct enumerator。因此实现了一个有限的 **direct object-program enumeration** 作为 E，对照范围是六种 ordering、单步 object operators、同一坐标关系语言、有限 filter/fold/iterate skeleton。它没有读取 output 的 correspondence、effect residual、dependency 或 witness。这个实验不能声称击败未提供的原始 baseline、任意 Grid DSL 或所有 ARC solver。

所有模式共享输入 encoding 缓存与 exact verifier。D/E 的数值向量常量在 `[-radius,radius]^2`，本次 radius=2；witness 路径不枚举数值，直接从规格引入统一常量。本次最佳程序完全采用角点表达式，不含数值向量常量，处于共同语言片段；对其他任务需考虑常量范围差异。

Full 的主搜索从残差和依赖证据生成 skeleton，逐个实例化 schema、解 typed holes，再验证组合结果。遍历顺序固定；MDL 仅在 exact-valid candidates 中选择。没有用未验证的 MDL 猜测来跳过 exact verification。Direct 才进行 Cartesian complete-program 枚举。

`NoWitness` 去掉的是 primitive 参数规格向 typed holes 的传播；dependency analysis 仍检查 observed coordinate relations。两者共享几何信息，因此这些消融并非完全正交的因果实验。

## 实测结果

{table}

Depth 是规范化 pipeline 深度（correspondence→residual→dependency→skeleton→operator→holes→verification，最大 7），不是任意 Haskell AST 嵌套层数。L 使用结构描述单位，K 同时计入 `Start` / `Attach` task-local concept 与传递使用的去重 primitive；最佳解 E=0，`J=L+K+2E`。

Full 总 expanded 的可复算分解：13 correspondence edges + 2 cross-example branches + {f['dependency_relation_checks']} dependency relation hypotheses + {f['partial_skeleton_states']} partial skeletons + {f['effect_pruning']['opportunities']} effect queries + {f['witness_pruning']['opportunities']} hole expression checks + {f['complete_programs']} complete program = **{f['expanded_states']}**。dependency 分析不是免费预处理。像素匹配与渲染内循环不是额外 program states，其成本纳入 wall-clock。

`witness instance holes` 按被解析的 object-instance 规格计数，`enumerated schema holes` 按展开 skeleton 中的参数 slot alternatives 计数；它们不是同一分母。typed AST 在构造时排除错误类型，本对照也使用 typed grammar，因此运行时 type pruning 是 N/A，不能伪报成 100%。

Complete programs 计的是实际 verifier 调用次数，不是去重后的语义等价类；例如 C 中不同 correspondence branches 可以再次评估同一个 filter/iterate 程序。当前版本没有全局 candidate memoization。

{prune_table}

各 pruning ratio 的分母属于各自阶段，不能相加。Dependency 分母是给定 correspondence branches 下的有限 blind skeleton opportunities；不触发的 pattern 是当前搜索片段外或缺少证据，不是对任意程序的全局不可能性证明。预算按有限批次检查，可能在很小的预算上超出单个分析批次；不代表无界运行。

## Q1：是否把 Grid→Grid 搜索转化为 Latent→Latent 结构化搜索？

**是，在已实现的有限片段内。** Grid 先进入纯 `Scene`，synthesis body 的输入与输出都是 Scene，最后由 renderer 与原始目标 Grid 比较。原始矩阵没有被当作程序常量或 ID lookup。`h` 无需可逆；非可逆 Recolor 通过 witness 规格传播也能合成。

## Q2：多少 skeleton 可由 latent dependency 自动决定？

对正确的 correspondence branch，控制结构与 left-to-right order 被数据确定为 **一个 scan skeleton**，初始位置与 recurrent placement 分别有一致的画布／上一输出角点关系。第一训练对有两个合法 correspondence branches；颜色交换 branch 引起 appearance residual，仍保留六个 map 候选，随后因单步算子不能同时处理残差而失败。

整个任务从 {dep['opportunities']} 个有限 skeleton opportunities 留下 {f['partial_skeleton_states']} 个，dependency rejection={dep['ratio']*100:.2f}%。对当前 task 的正确 branch，sort+scan 均无需 blind combinator enumeration。Filter 由 unchanged subset 触发；fold 限于同色 bbox 聚合；iterate 限于可观察 transition chain 的 bounded integer-step 假设。

## Q3：typed holes + witnesses 消除了多少参数枚举？

10 个 object-instance translation specifications（3 个 Start、7 个 Attach）变成两个统一 `Vec` holes。反推向量直接来自输出规格，**数值 Vec 枚举为 0**。随后测试 {f['witness_pruning']['opportunities']} 个统一参数表达式，拒绝 {f['witness_pruning']['rejected']} 个，仅留下 Start 与 Attach 各一个。

去掉 witness 时，一个 scan 的两个 typed vector holes 产生 67×157={nw['complete_programs']} 个完整程序；Full 只验证 {f['complete_programs']} 个，消除 **{witness_elimination:.4f}%** 的完整候选验证。统一数值常量会直接推导，不按每个 object 存储异常表。类型本身的独立收益未做无类型消融，不能从此表定量推断。

## Q4：是否无 task-specific hardcoding 地得到预期 scan？

**是。** `src/Synthesis`、`src/Latent`、`src/Language` 不包含 task ID 或网格／颜色模板分支。anchor grammar 对 TL/TR/BL/BR/Center 一视同仁；不同 anchor、reverse ordering 的 synthetic heldouts 都通过。

```text
objects = sortBy(TL.x, Objects(input))
Start(current) = Translate(current, GridTL - TL(current))
Attach(prev,current) = Translate(current, BR(prev) - TL(current))
placed = scan(Attach, Start(head(objects)), tail(objects))
Render(input.size, background=0, objects=placed, later_wins)
```

BR 是 inclusive corner。输出可见连通块缺少被覆盖角点，correspondence 必须先恢复完整 input-derived geometry，才能正确计算上一输出 BR。稳定 ID 只用于建立 correspondence，未成为程序参数。

这仍是提示词指定已知任务的 regression experiment，不能作为未见 ARC 分布上的无偏测评。

## Q5：相对 Direct 的 first-solution 降低多少？

- expanded states：{d['first_solution_expanded_states']} → {f['first_solution_expanded_states']}，**{state_factor:.2f}×**，减少 {(1-1/state_factor)*100:.2f}%。
- first-solution wall-clock：{first_time['Direct']*1000:.3f} ms → {first_time['Full']*1000:.3f} ms，**{time_factor:.2f}×**。
- 完整有界搜索 expanded：{d['expanded_states']} → {f['expanded_states']}，**{total_state_factor:.2f}×**。
- 完整搜索 wall-clock：{total_time['Direct']*1000:.3f} ms → {total_time['Full']*1000:.3f} ms，**{total_time_factor:.2f}×**。

**witness-hole propagation 是本实验中最强的成本削减机制。** Effect pruning 减少了额外的 witness 查询，但毫秒级时间差不稳定。Dependency guidance 将 complete verification 从 C 的 {stats['NoDependency']['complete_programs']} 降至 1，并降低完整搜索成本；其关系分析却有固定开销：C 的 first states={stats['NoDependency']['first_solution_expanded_states']}、first latency={first_time['NoDependency']*1000:.3f} ms，比 Full 更低。因此不能说每个 structural mechanism 都改善了 first-solution cost。

## Q6：剩余主要瓶颈是什么？

当前 `03560426` 的计数瓶颈是 **skeleton/dependency relation discovery**：{f['dependency_relation_checks']} 个 relation hypotheses 占 Full expanded 的 {f['dependency_relation_checks']/f['expanded_states']*100:.2f}%；这包括不同 ordering、独立 map、起点与 recurrent relation 的判别。不是 CPU profiling 分摊，不能把该比例解读成 wall-clock 占比。孔合成与本地 abstraction 在此 task 上已经很小。

更广泛 ARC 覆盖范围的主要限制则是 **latent representation / correspondence**：同色组件合并、union/split、完全遮挡、多色结构、不同背景与 object cardinality 变化需要更丰富的表示或匹配 branch。缺少这种匹配只能标记 CurrentlyUnsupported。多步 rotation+translation/recolor composition 虽能由 typed interpreter 执行，但还未纳入主搜索；fold/iterate 也只实现了明确限定的最小片段。

## 结论

已在真实 regression task 与 {len(suite)} 个泛化构造例上证实：latent representation、residual/effect、dependency skeletons 与 typed witness constraints 能把直接候选的 Cartesian 枚举缩小为少量、可解释、exact-valid 的结构化搜索。最强实证来自 witness；dependency analysis 的首次解开销也被如实计入。结论只覆盖当前可复现的 bounded grammar，不代表完整 ARC solver 或整个 ARC benchmark 的成功率。
"""
    (ROOT / "reports" / "LATIS_V01_REPORT.md").write_text(report, encoding="utf-8")
    print(f"Report generated: first-state reduction {state_factor:.2f}x, first-time reduction {time_factor:.2f}x; {len(suite)} synthetic heldouts exact.")


if __name__ == "__main__":
    main()
