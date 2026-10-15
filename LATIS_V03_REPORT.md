# LATIS v0.3 — Hierarchical Latent Discovery

在固定 canonical object ontology 上新增独立 Haskell hierarchical solver。人工 A–J 套件有 7 个 secondary 解，覆盖 local、global、fusion，均通过独立 heldout；D/J 保留 Z0，H 共享编码/表达式的过拟合陷阱被拒绝。以下数值全部来自本次执行，包含负结果。

## 架构、范围与可复现协议

`Scene/Object/Pose`、connected components、renderer、correspondence、旧 DSA/observer/constraint solver 的全部原 source SHA256 与冻结时一致。保留 `solve-v02a`/`joint-solve`，新增 `solve-v03`。Σ 通过 `HierarchicalState(canonicalState, activeHypotheses)` 组合扩展为含 H_Z 的状态，不重写旧 solver。没有 neural、split/union/occlusion search、SMT、cross-task library 或 iterative cross-latent propagation；后者明确标记 FutureWork。

Local grammar：RelativePose、Pairwise(anchors)、Progression、SharedClass，支持原六种排序。Local 保留 class geometry/color、成员 orientation/ID 与 paint permutation，pose code 有确定逆。Global grammar：BBox、bbox-center Axis、像素验证的 Symmetry、四类 Alignment、空间 Progression、Order；Scene residual 显式保留。bbox-center axis 是构造出的坐标轴，不自动声称输入具备镜像对称。Fusion 使用 typed canonical/local/global context，仅开放 active hypothesis 的 symbols。`hypotheses.json` 与 candidate typed AST 可读、可序列化；没有 opaque hash feature。

先运行完整原 v0.2A。无 exact 解或 J>25 时观察结构，提出共享编码，再运行 latent ↔ pose-hole ↔ skeleton 固定点约束；最后 branch 并进行原 renderer 的 exact Grid verification。Encoder 不接收 task ID/example ID/test output。输出候选与 correspondence guards 保持析取支持；scene 参数由输入计算，绝不存训练专用向量表。此次 bounded program 使用 MapPose、Add/Subtract/Scale/SwapXY、Rank 与 active symbolic observations，最后只更新 canonical positions。候选向量为 observed step/delta、本向量的 2 倍、-1 倍及 SwapXY；sequence origin 为 first position 或四个 bbox corners，未枚举任意算术组合。Alignment/SharedClass/Symmetry/Order 目前也支持发现/round-trip，尚无独立 stress solve 证明每一种均改善 synthesis。

MDL 为 J=L(A)+L(D)+L(P)+K+2E，默认不计可选 L(Z|A)：latent data 是从输入 scene 重算的运行时值，数据未作为训练常量嵌入程序。AST constructor/application/literal 为描述单位；codec 成本固定在 `Latent.MDL.LatentCost`，符号闭包也计 codec 依赖。只在 exact-valid 候选间比较；secondary 必须严格更便宜，或直接路径无 exact 解。NoLatentMDL 仅去掉 encoder/decoder 长度，仍计 K。

**Z0 比较的界限**：原 v0.2A 没有序列 rank/scene extrema 的搜索语法。在 triggered 实验中，除了真实 legacy J，还生成、执行、exact-verify 同一坐标规则的独立 `GroundExpr` Z0 展开 AST，J0 取二者最小值。其解释器不调用 latent encoder/decoder。人工表中的有限 J0 通常来自该展开 reference，不能声称 legacy 已找到那些程序，也不是无限制 Z0 language 的最优 MDL。Reference 是树状 AST，未搜索任意 let/CSE；一个更强的 Z0 子表达式共享语言可能缩小优势。LatentDisabled 完全关闭这条新增比较，逐项复现原 v0.2A。

状态/传播/验证是工作量计数，不是相同 CPU 成本。Discovery guards 按有限 grammar×训练场景保守收费；其短路检查可能少于名义收费。Expanded 包括 legacy 搜索、codec/reconstruction、expression support 与两路 exact calls；一次 finite propagation/legacy preparation 批次可超过小 state budget。Decoder failure 与 encoder guard rejection 分开记录。first-solution states 记录首次 exact 候选，未必最终最优；wall-clock 用 monotonic 时钟，含搜索/编码/验证，排除 IO/报告以及事后 taxonomy。消融为同进程顺序一次运行，不能作稳定 CPU 性能结论。

运行：`python scripts/run_v03.py`（或 `./scripts/run-v03.ps1`）。`--no-audit` 只重跑开发套件；`--audit-only` 复用封存 audit，任何 source/binary/protocol 变化都拒绝覆盖首次结果。`results/v03/tests.log` 保存三套测试。

## Q1–Q4：发现、类别、描述长度与完整 MDL

发现 7 个有正完整 ΔMDL 的 secondary 解：{'ZL': 4, 'ZG': 2, 'ZF': 1}。相对可执行的 Z0 reference，纯 program AST 平均减少 **16.00** 单位；计入 codec 后 L 平均减少 **6.14** 单位，完整 J 平均减少 **5.86**。K 不一定减少：引入新坐标系增加符号种类，但缩短表达式树；负的 program_symbols_saved 原样保留。

| Task | Route | Train | Heldout | J0 | J1 | ΔMDL | Expanded | Exact calls |
|---|---|---|---|---|---|---|---|---|
| A-absolute-relative | ZL | True | True | 28.00 | 24.00 | 4.00 | 1718 | 30 |
| B-repeated-progression | ZL | True | True | 43.00 | 33.00 | 10.00 | 2492 | 140 |
| C-scene-axis | ZG | True | True | 33.00 | 26.00 | 7.00 | 2276 | 2 |
| D-object-sufficient | Z0 | True | True | 9.00 | — | — | 10955 | 2811 |
| E-local-better | ZL | True | True | 30.00 | 26.00 | 4.00 | 1718 | 30 |
| F-global-better | ZG | True | True | 33.00 | 26.00 | 7.00 | 2276 | 2 |
| G-fusion | ZF | True | True | 48.00 | 43.00 | 5.00 | 1900 | 24 |
| H-overfitting-trap | unsupported | False | False | — | — | — | 1673 | 0 |
| I-equivalent-representations | ZL | True | True | 28.00 | 24.00 | 4.00 | 2242 | 62 |
| J-no-useful-abstraction | Z0 | True | True | 19.00 | — | — | 763 | 6 |


A/E 使用 first-pair 相对向量，B 使用有序 step/rank progression 变换，C/F 使用 scene bbox axis，G 同时使用 canonical geometry、local rank/step 与 global bbox origin。I 有多个 training-equivalent encoder，按完整 MDL 再以 canonical text 确定性择优，不利用 heldout 消歧。每个任务的 14 项 trace 内容、typed hypotheses 与最终预测见 `results/v03/stress/<task>/latent_trace.md`。

## Q5–Q6：lazy、eager 与 program→latent

| Mode | Train+heldout /10 | Proposals | Accepted | Expanded | Exact calls | Expression support tests | Wall ms |
|---|---|---|---|---|---|---|---|
| V03Full | 9 | 468 | 7 | 28013 | 3107 | 7113 | 56490.18 |
| NoLocalLatent | 5 | 60 | 3 | 19370 | 2825 | 144 | 58135.50 |
| NoGlobalLatent | 6 | 204 | 4 | 22504 | 3005 | 2506 | 58905.95 |
| NoFusion | 8 | 264 | 6 | 23048 | 3013 | 2650 | 57487.70 |
| NoLatentMDL | 9 | 468 | 7 | 28013 | 3107 | 7113 | 58759.04 |
| EagerLatentEnumeration | 9 | 890 | 7 | 30680 | 3169 | 8662 | 56590.12 |
| NoProgramToLatent | 9 | 468 | 7 | 34546 | 16753 | 0 | 58704.49 |
| LatentDisabled | 2 | 0 | 0 | 18826 | 2817 | 0 | 55144.82 |


Lazy 的 proposals=468，eager=890；expanded 分别 28013 与 30680。Eager 在运行 Z0 前实际 encode/reconstruct 全部 bounded hypotheses；lazy 对便宜 Z0 完全跳过 discovery。程序反向约束关闭时 exact calls 从 3107 变为 16753。Full 在固定点传播中先检验每个 typed pose expression 是否满足所有训练 witness，删除空 hypothesis，并互限 PointwisePose/OrderedPoseSequence skeleton；NoProgramToLatent 保留 domain 到 exact verification。这证明本有限 grammar 的反向支持筛选有效，不是 unrestricted relational solver。

NoLatentMDL 在此套件检测到 0 个相对完整 codec MDL 不值得的 invention。若为零，不能据此断言该消融不会过拟合；廉价 Z0 的 lazy trigger 本来就阻止 invention。全表、每个 candidate 的 full/ablation MDL 都保留在 `results/v03/stress/ablation.json`。

## Q7：不需 abstraction 与回归

D/J 的便宜 legacy exact 解不触发 latent discovery。Eager 在 D/J 即使提出 representation，也必须完整 MDL 更优才能接纳。H 的 training-specific 短表示不能形成一个跨两个例子共享的 exact encoder/program；系统报告 unsupported，未添加按例子切换。17 项 v0.2A regression（原 11+原 6 stress）训练及 heldout 全通过；LatentDisabled 的 AST、非计时 legacy metrics 与 v0.2A 完全相同。公开 03560426 仍由原 scan 解出，完整结果在 `results/v03/core`。

核心任务同时展示 discovery overhead：legacy expanded=314，Full expanded=1397；55 个 latent proposals 全部未胜出，保留原 J=37.0。这不影响 exact 解，但说明高成本触发器并不保证 abstraction 有用。

## Q8：30-task frozen ARC-1 audit

固定 seed=20261004，从官方 training 的 400 个排序文件名用 Python Random.sample 均匀取 30，未读 grid、未分层、未按 LATIS suitability 筛选。选题在 v0.3 core 前完成，manifest hash=`2a0c08338b17b6f5b29ac650955a3b5549dcf276307a7186f140dbd2c47d9f8d`。来源 [官方 ARC-AGI-1 repository](https://github.com/fchollet/ARC-AGI)，commit `399030444e0ab0cc8b4e199870fb20b863846f34`，每题 SHA256 与原 source baseline hash 保存于 `results/v03/frozen_arc1_tasks.json`。许可证复用 `data/ARC-AGI-LICENSE`。

首次开启时间：2026-10-04T18:59:42.132718+08:00（Asia/Shanghai）。source 与 executable hash、固定 budgets 记录于 `audit_opened.json`。30 题均按固定 25,000 state /32 correspondence /128 solution /60 秒外部 wall budget顺序执行。封存后没有修改 source、grammar、observer、MDL weight 或题集。公开 test labels 只在程序选择后检查。

**RawSolveRate=0/30=0.00%；TrainExactRate=0/30=0.00%；HeldoutExactRate=0/30=0.00%。** InScopeSolveRate=N/A（Solved+SearchFailure+AmbiguityFailure=0，不能报告 0% 或 100%）。外部 timeout 的 train/heldout False 表示没有取得 exact 证书，verification_completed=false，不声称已检查完全部候选。

| Failure taxonomy | Count |
|---|---|
| Solved | 0 |
| RepresentationFailure-Level0 | 1 |
| RepresentationFailure-Level1 | 1 |
| LanguageFailure | 20 |
| SearchFailure | 0 |
| AmbiguityFailure | 0 |
| BudgetFailure | 8 |
| VerifierOrImplementationFailure | 0 |


逐题及 certificate：

| Task | Train | Heldout | Category | Evidence |
|---|---|---|---|---|
| 1bfc4729 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 1fad071e | False | False | LanguageFailure | Canvas dimensions change; all preserved pose/operator programs keep the canvas |
| 23b5c85d | False | False | LanguageFailure | Canvas dimensions change; all preserved pose/operator programs keep the canvas |
| 2dc579da | False | False | LanguageFailure | Canvas dimensions change; all preserved pose/operator programs keep the canvas |
| 363442ee | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 36d67576 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 39e1d7f9 | False | False | BudgetFailure | External 60-second wall budget reached |
| 3eda0437 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 40853293 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 4347f46a | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 469497ad | False | False | LanguageFailure | Canvas dimensions change; all preserved pose/operator programs keep the canvas |
| 484b58aa | False | False | BudgetFailure | External 60-second wall budget reached |
| 54d9e175 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 5521c0d9 | False | False | RepresentationFailure-Level1 | One-to-one unchanged geometry/color pose correspondence exists, but no shared expression in the bounded secondary coordinate grammar survived; classification limited to this pose fragment |
| 5ad4f10b | False | False | BudgetFailure | State/solution/correspondence bound reached; no impossibility claim |
| 5c2c9af4 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 623ea044 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 694f12f3 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 7837ac64 | False | False | BudgetFailure | State/solution/correspondence bound reached; no impossibility claim |
| 855e0971 | False | False | RepresentationFailure-Level0 | Output separates same-color subsets of a single input component at fixed pixel coordinates: component split required by the supported object correspondence path |
| 868de0fa | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| 8efcae92 | False | False | BudgetFailure | State/solution/correspondence bound reached; no impossibility claim |
| 9f236235 | False | False | LanguageFailure | Canvas dimensions change; all preserved pose/operator programs keep the canvas |
| aba27056 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| c444b776 | False | False | BudgetFailure | External 60-second wall budget reached |
| d23f8c26 | False | False | BudgetFailure | State/solution/correspondence bound reached; no impossibility claim |
| d90796e8 | False | False | BudgetFailure | State/solution/correspondence bound reached; no impossibility claim |
| e48d4e1a | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| ef135b50 | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |
| f35d900a | False | False | LanguageFailure | No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds |


分类界限：画布 resize 属 LanguageFailure；当前 one-to-one unchanged geometry/color correspondence 可成立，但 secondary pose grammar 没有共享式，记 RepresentationFailure-Level1（限于当前 pose fragment）。可观察同色 component 分裂 certificate 记 Level0；其余缺 correspondence 的任务不擅自声称需要 split/union/occlusion，保守记 LanguageFailure 并注明不能区分更丰富语言与 ontology refinement。SearchFailure 必须有存在性证书，本轮没有这种证据。Train exact / heldout wrong 记 observational AmbiguityFailure，不能据此宣称正确 heldout 规则一定在 grammar 中。该 taxonomy 是有限模型诊断，不是人工 ground-truth ARC rule 标注。

## Q9–Q10：瓶颈与下一步

本轮主要观测类别为 LanguageFailure（20/30）。Budget 与保守 LanguageFailure 都不能作为 Level0 ontology 不足的证明。人工套件支持固定 grounded ontology 上的 symbolic coordinate discovery 与 Representation↔Program；这个小型首次 audit 不足以证明 split/union/occlusion search 应成为下一步的主要机制。建议先在独立开发数据上建立更强的语言/ontology failure 证书、研究 canonical CSE 与增量 joint search，再以新版本封存新 audit；若有经核实 Level0 失败证据再进入 ontological hypothesis search。

## 证据与限制

三套测试包括旧 1518 round trips/语言 checks、旧 joint consistency tests、新 codec inverse/所有 anchor-pair inverse、orientation/paint-order preservation、malformed latent rejection、inactive-symbol rejection、独立 Z0 interpreter equivalence、A–J heldout、strict MDL、fixedpoint idempotence、reverse-constraint verifier savings、17 regression 与 tiny-budget termination。新 system 是有限 task-local abstraction/coordinate grammar；未实现 arbitrary latent constructor composition、relational multivalued concretization、多步动作或跨 latent 迭代。Z0 search 仍完整先运行，尚未与旧 DFS 的每个节点交错推进，因而不宣称彻底改变原搜索复杂度。
