# place-demand 第三轮：非局部机制测试、端到端 audit、路径审计与固定 DAG 的提取器隔离

## 1. 非局部 residual 的机制测试（受控环境，不计入端到端成绩）

`test/PlaceDemandMain.hs`：目标为场景级坐标 t = Anchor(head(objects(v0)),TL)+(2,1)，环境只有 v0（所有候选基点都是非局部的），三个场景。检查：硬局部策略不产生任何非局部 coordAdd 候选；延后份额为 0 时需求被登记并释放但从未探索（无候选）；份额为正时释放后产生经真实 Base 求值匹配规格的非局部 coordAdd 候选。该测试人为控制了环境，只证明机制“登记→延后→释放→有效候选”成立，不宣称规则不可由其他路径表达，也不计入泛化成绩。

```text
ok: mechanism: hard-local policy yields no candidate with a non-local coordAdd base in a scene-only context
ok: mechanism: with a zero deferred share the non-local branches are registered and released but never explored
ok: mechanism: after release with a positive share, a valid non-local coordAdd candidate exists and matches the specification by real Base evaluation
  mechanism candidate: coordAdd(Anchor(head(objects(v0)),BR),VecV (Vec 1 1))
```

## 2. 端到端 audit（冻结于求解前；不宣称“必须经过非局部 residual”）

`data/place-demand-generated-round3`（manifest hash `e83595a5a247bf0f…`）：{'audit3-crossobj': 'displacement = TL(largest) - TL(smallest)', 'audit3-scene': 'shift so that the leftmost object touches x=0', 'audit3-sequence': 'sort by x; chain each object to x = previous BR x + 2, y = previous TL y'}。独立参考程序（`GeneratedAudit.hs --round3`）对 6 题 train/heldout exact，仅作事后证书。全部正常路径保留；比较的是 Q 与硬局部 B1L 的实际差异。

| 任务 | B0 | B1 | B1L | B1Q | B1X | B1QX |
|---|---|---|---|---|---|---|
| audit3-crossobj-extremes-0 | 0/0 | 0/0(to) | 1/0 | 1/0 | 0/0(to) | 0/0(to) |
| audit3-crossobj-extremes-1 | 0/0 | 0/0(to) | 1/0 | 1/0 | 0/0(to) | 1/0 |
| audit3-scene-leftborder-0 | 1/1 | 0/0 | 1/1 | 1/1 | 0/0 | 1/1 |
| audit3-scene-leftborder-1 | 1/0 | 0/0 | 1/0 | 1/0 | 0/0 | 1/0 |
| audit3-sequence-chain-0 | 1/1 | 1/0 | 1/0 | 1/0 | 1/0 | 1/0 |
| audit3-sequence-chain-1 | 1/0 | 1/0 | 1/0 | 1/0 | 1/0 | 1/0 |

| 变体 | train | heldout |
|---|---:|---:|
| B0 | 4/6 | 2/6 |
| B1 | 2/6 | 0/6 |
| B1L | 6/6 | 1/6 |
| B1Q | 6/6 | 1/6 |
| B1X | 2/6 | 0/6 |
| B1QX | 5/6 | 1/6 |

## 3. 路径审计（第二轮矩阵的选中程序）

对每个 train exact 的选中程序记录 coordAdd 基点的依赖结构（local = 依赖 lambda/let 绑定变量；non-local = 只依赖场景 v0），以及 trace 中是否出现由延后分支建立的 Join。

| 变体 | train exact | 含 coordAdd | 基点非局部 | 非局部基点且留出正确 | trace 含延后分支 Join |
|---|---:|---:|---:|---:|---:|
| B0 | 42 | 0 | 0 | 0 | 0 |
| B1 | 20 | 6 | 1 | 1 | 7 |
| B1L | 49 | 27 | 0 | 0 | 0 |
| B1Q | 47 | 25 | 3 | 2 | 24 |
| B1X | 30 | 14 | 3 | 3 | 17 |
| B1QX | 44 | 24 | 5 | 4 | 24 |

“trace 含延后分支 Join”在 B1/B1X（ScheduleAll）下指带 deferred-nonlocal 标记但被立即探索的分支；在 B1Q/B1QX 下指第二遍释放后建立的 Join。它回答“延后释放是否真正进入 DAG”，而非该程序是否必须由它产生：当选中程序使用非局部基点时（A、I 等），局部形式也同时存在于 portfolio（B1L 选中的是局部形式），两者都训练 exact，排名选择了其中之一。详见 `path_audit.csv`。

## 4. 固定 DAG 的提取器隔离

`ExtractorDiag.hs`：用 B1Q 配置推导一次得到 DAG，再在同一 DAG 上分别运行原 refine cover 与 lazy cover，给予相同的尝试额度（协议 cover 份额 12500）。只比较提取器：候选数、训练 exact 候选数、事后留出正确候选数、按原排名选中的程序。

| 任务 | DAG 节点/join | refine: 候选/train exact/held-correct | refine 选中 (cost, heldout) | lazy: 候选/train exact/held-correct | lazy 选中 (cost, heldout) |
|---|---|---|---|---|---|
| A-absolute-relative | 1894/150 | 441/441/441 | 29, True | 1529/1529/1304 | 29, True |
| B-repeated-progression | 1740/163 | 1/1/1 | 26, True | 1580/1580/153 | 26, True |
| C-scene-axis | 2257/443 | 1/1/0 | 61, False | 819/819/133 | 55, True |
| audit2-newstruct-mirror-1 | 2343/716 | 2/2/0 | 51, False | 936/936/0 | 51, False |
| audit2-nonlocal-seedshift-y-0 | 2199/418 | 1/1/0 | 41, False | 1455/1455/5 | 41, False |
| audit2-same-negated-0 | 2182/536 | 2/2/2 | 29, True | 2261/2261/106 | 29, True |
| dev-relative-1 | 2441/718 | 1/1/1 | 29, True | 1579/1579/197 | 29, True |

### Q 与 QX 结果不同的任务：分层检查

| 任务 | 层 | B1Q | B1QX | 判断 |
|---|---|---|---|---|
| generated-dev/dev-relative-1 | 推导（join / 总 work / 延后 work / 超时） | 718 / 170181 / 62510 / 0 | None / None / None / 1 | 外部 300 s 超时（内部证据缺失） |
| | 提取（train exact / portfolio / lazy 候选 / verifier 调用 / solver 秒） | 1 / 1 / — / 1 / 277.4 | 0 / None / None / None / n/a | 提取层差异 |
| | 泛化候选覆盖（held-correct 候选，事后） | 1 | None | 覆盖消失 |
| | 选择（heldout） | 1 | 0 | 见上层 |
| generated-round2/audit2-newstruct-mirror-1 | 推导（join / 总 work / 延后 work / 超时） | 716 / 217920 / 62516 / 0 | None / None / None / 1 | 外部 300 s 超时（内部证据缺失） |
| | 提取（train exact / portfolio / lazy 候选 / verifier 调用 / solver 秒） | 1 / 4 / — / 4 / 231.5 | 0 / None / None / None / n/a | 提取层差异 |
| | 泛化候选覆盖（held-correct 候选，事后） | 0 | 0 | 两者均无 |
| | 选择（heldout） | 0 | 0 | 选择层无差异 |
| generated-round2/audit2-nonlocal-seedshift-y-0 | 推导（join / 总 work / 延后 work / 超时） | 418 / 154556 / 62615 / 0 | None / None / None / 1 | 外部 300 s 超时（内部证据缺失） |
| | 提取（train exact / portfolio / lazy 候选 / verifier 调用 / solver 秒） | 1 / 1 / — / 1 / 219.6 | 0 / None / None / None / n/a | 提取层差异 |
| | 泛化候选覆盖（held-correct 候选，事后） | 0 | 5 | 覆盖仍在 |
| | 选择（heldout） | 0 | 0 | 正确候选存在但排名未选中 |
| stress/C-scene-axis | 推导（join / 总 work / 延后 work / 超时） | 443 / 89837 / 36282 / 0 | 453 / 222301 / 36282 / 0 | DAG 不同（预算交互） |
| | 提取（train exact / portfolio / lazy 候选 / verifier 调用 / solver 秒） | 1 / 1 / — / 1 / 94.5 | 1 / 931 / 2208 / 1784 / 157.7 | 两者都得到训练 exact |
| | 泛化候选覆盖（held-correct 候选，事后） | 0 | 133 | 覆盖仍在 |
| | 选择（heldout） | 0 | 1 | 见上层 |

判读规则：若 lazy cover 在固定 DAG 上仍得到训练 exact 且 held-correct 候选存在、只是选中不同，问题在选择层；若候选消失，继续修提取调度，不能靠调 MDL 掩盖；若 DAG 本身不同（join/work 不同），差异来自完整流水线中的预算交互，而非提取器本身。

## 5. 结论（按层归因）

- **Q 对 QX 的差异**：4 个任务结果不同，其中 3 个是 QX 侧外部 300 s 超时（dev-relative-1, audit2-newstruct-mirror-1, audit2-nonlocal-seedshift-y-0；B1Q 在同一任务上也已用去 220–277 秒，QX 的 lazy cover 产生约 1500 个候选、每个都经原 verifier 检查，推到了 deadline 之后）。这是固定 3 并发协议下的 wall-clock 失败，内部证据缺失，不能判定为搜索或选择差异；对应命令已加入 `commands_for_external_host.md`，建议在外部主机无 deadline 复跑。
- **提取器本身**（固定 DAG、相同 12500 次尝试）：lazy cover 在全部 7 个任务上得到的训练 exact 候选数 ≥ refine cover（A-absolute-relative: 441→1529; B-repeated-progression: 1→1580; C-scene-axis: 1→819; audit2-newstruct-mirror-1: 2→936; audit2-nonlocal-seedshift-y-0: 1→1455; audit2-same-negated-0: 2→2261; dev-relative-1: 1→1579），事后 held-correct 候选数同样 ≥；C 上 refine 选中 cost 61 留出错、lazy 选中 cost 55 留出对（候选覆盖层的差异，不是排名公式的差异）。完整流水线中 QX 优于 Q 的任务：C-scene-axis；QX 劣于 Q 的任务没有一个不是超时。
- **判断**：在本预算下，X 的作用在提取层是正向的（候选覆盖增加、选中不劣），其代价是验证次数带来的 wall-clock；因此“默认叠加 X”的障碍是时间协议而不是搜索质量。在拿到无 deadline 复跑结果之前，Q 仍是工作基线，X 保持为独立开关。
- **端到端 audit（round 3，6 题）**：训练 B0 4、B1L 6、B1Q 6；留出 B0 2、B1L 1、B1Q 1。Q 相对 B1L：多解 无，少解 无。本集合上未观察到硬局部限制使某类规则长期得不到预算的情形；该结论限于这 6 题与本预算。Q 相对 B0：训练多解 ['audit3-crossobj-extremes-0', 'audit3-crossobj-extremes-1']，留出少解 ['audit3-sequence-chain-0']（其中 held-correct 候选：B0 [249]，B1Q [321]；若 B1Q 的 held-correct 候选 >0 则是选择层在更大 portfolio 中选错，否则是覆盖层）。

