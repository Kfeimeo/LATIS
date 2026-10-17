# Place 双向 witness 与需求驱动观察域实验（place-demand）

受控矩阵：222 个独立执行（74 个任务 × B0/B1/B2，同一 binary `df19678d96ca0b5c…`、同一预算、同一输入，固定 3 个 worker）。额外探索性消融 B1L/B2L：88 个执行（binary `8a6d7f81064a2260…`，独立 protocol）。所有命令、输入/源码/binary hash 与 deadline 在 `results/place-demand/protocol.json`、`results/place-demand-ablations/protocol.json` 及各目录 `execution.json`。

## 结论摘要

- **H1（Place 退化部分来自 coordinate witness 的单向条件化）：支持，但代价重大。** 原来 `WitnessMissing` 的 stress B/I 在 B1 下 train/heldout 均 exact（B0 留出 3/10 → B1 4/10）；trace 证明阻断点确为 `Learn(CoordT; Γ=[v0,v1])` 处 `coordAdd` 无可条件化的 VecT 右操作数。但对称 16 路左侧 residual 在场景级两行子规格（Γ=[v0]，scan seed 等）中与大量偶然 join 相乘，使 DAG 膨胀：stress A/C/F/G、regression map-translate/map-scan-ambiguity 及全部新生成样例在 B1 下 train 失败（固定 cover/saturation 预算无法物化完整 AST，或推导阶段即耗尽 250000 工作预算）。regression 留出 B0 16/17 → B1 14/17；generated-audit train B0 10/12 → B1 0/12。
- **H2（按需求扩展 typed 观察域进一步改善覆盖）：在本轮预算下未获支持。** B2 相对 B1 没有任何任务的 train/heldout 结果变化（stress 4/10，regression 14/17，generated-audit train 0/12）。需求机制本身按设计工作（共 84 个 stress 需求键，resumed 72，新增 VecT 观察项 44928），但新增 VecT 项只让 `coordAdd` 在再学习时多出 join 备选，没有改变已被 B1 膨胀主导的提取结果；在 B1 本已成功的任务上 B2 只增加工作量。
- **额外消融 B1L/B2L（看过 A/C/F trace 后提出，属开发证据）**：把左侧 residual 限制在依赖非 Scene 变量（元素局部）的基点上。stress 留出 B1L 7/10（留出正确：A, B, C, D, G, I, J），regression 留出 16/17，generated-audit train/heldout 12/5（12）；B2L：stress 6/10，regression 16/17。B1L 是在看过失败案例后设计的规则，其 audit 数字不能称为未见审计；它检验的是“退化来源是场景级两行子规格中的 residual 扇出”这一诊断。

## 范围与不变量

保持：Place Base（`place(ObjectT,CoordT)`，无 Translate/poseOf）、对象编码、渲染语义、训练 Grid exact verifier、最终排名、literal prior、结构多样性、抽象发现、训练/留出标签隔离。未添加 primitive、模板、人工 AST、heldout 或生成器真值；未放宽 depth（7）、cost（96）、saturation（25000）、总预算（250000）；B2 的 demand 工作计入总预算。B0 与冻结 place-only 在 stress A 上逐指标一致（work 1161、witness_calls 725），B0 对 58 个原任务的 train/heldout 结果与冻结结果逐题一致（`regression/scan-TR-TL` B0 首次执行被主机 cgroup OOM 杀死，单独重跑后 train/heldout exact，矩阵采用重跑行，见 out-of-protocol-diagnostics/README.md）。

预算：主测试 250000，diagnostic 25000，cost 96，saturation 25000，外部 deadline 300 秒；demand budget 25000、每类型操作数上限 24、最多 3 轮。主机 4 逻辑核（linux），固定 3 个 worker、每题独立进程；与原 Windows 16 核主机不作 wall-clock 比较。

## 实现（`experiments/place-demand`，与 place-only 的差异可用 `diff -r` 列出）

**阶段 A（B1，`Witness.hs: witnessAt Bidirectional`）**：对 `coordAdd(a,v)=t`、`coordDelta(p,q)=v`、`vecAdd(u,w)=y` 按实际参数顺序补全左侧条件化（已观察 a ⇒ v_i=t_i−a_i；已观察 p ⇒ q_i=p_i−v_i；已观察 u ⇒ w_i=y_i−u_i）。每行保持（样例，操作数）配对；residual 是子规格（pointTask），不是被接受的表达式；原 join 与右侧 residual 完整保留，join 存在时沿用原 `preferGround`。候选左操作数按原 grounded MDL rank 排序、上限 16（与原右侧 residual 相同）。另加 credit-aware 剪枝：residual 子任务若只剩 0 层推导额度且其值既非观察项也非常数，则不生成。**更正**：这一剪枝只在无预算截断下可论证为 DAG 等价（credit=0 的子任务不调用 witness、无 invention、pool key 与父任务相同，只能由 forward 观察或 shared 常数闭合，即剪枝条件本身）；在有限总预算下它改变了 MRV lookahead 的域计数与工作消耗序列，截断点随之变化，**有界条件下的结果中性没有证明**，实测见第二轮的 B1U 消融（`results/place-demand-ablations-unpruned`、`REPORT_ROUND2.md`）。未剪枝的首个版本在 stress A 上 11251 个递归子任务耗尽 250000 预算。

**阶段 B（B2，`Learn.hs`）**：witness 调用时若某条件化操作数类型在观察域中完全缺失（`missingOperands`，只看类型签名与观察域；算术 residual 不在有限观察域时报告 IntT），登记需求 `(pool key, Type)` 并记入当前 Learn 调用栈帧。一轮 Learn 后按登记顺序解析：对 CoordT/VecT/IntT，用 Observe 效应、arity≤2、一阶参数的普通 Base 算子按签名一层组合既有观察项（每类型取 rank 最好的 24 个），在该 pool key 的训练环境求值，经原 `selectPool`（结构多样性语义）合并；生成/保留各计 1 单位工作。pool 增长则 epoch+1；memo 条目记录子树登记的需求集合与写入 epoch，仅当其需求在更晚 epoch 被“有增长地”解析时失效并重学（memo hit 时把子树需求集合向上传播）；无增长的解析不唤醒；每个 key/type 只解析一次；轮数与工作有界；调度确定性。`demands.json` 记录每个需求的状态（resumed / still-blocked / suspended）。

**额外开关（B1L/B2L，`BidirectionalLocal`）**：左侧 residual 只条件化至少依赖一个非 SceneT 环境变量的操作数；类型级通用规则，无任务信息。它是在检查 B1 失败 trace（A/C/F 的 join 全部位于 Γ=[v0] 上下文）之后提出的，所以其结果只算开发证据。**更正**：被它删除的“整体平移 residual”（t_i − a_i = c）是合法的常数位移规则，例如 scan seed 的“首对象平移 c”，不能硬排除；B1L 只能作为扇出诊断参考，第二轮改为可恢复的延后调度并冻结了必须使用非局部基点的 audit 规则。

## 测试

`experiments/place-demand/test/PlaceDemandMain.hs`：46 条断言全部通过（`results/place-demand-tests.log`；B1L 补丁后 `--quick` 复跑 PASS，`results/place-demand-tests-quick-after-B1L.log`）。覆盖：coordAdd/coordDelta/vecAdd 两侧逆推经真实 Base 求值回代（负坐标、零向量、三个训练环境、非恒定位移）；只有左/只有右参数可观察；无操作数时安全失败；行置换操作数不跨样例拼接；Vec 子规格经普通 coordDelta join 继续求解（真实引擎）；需求登记、域增长后 memo 失效与唤醒、无新增信息不再唤醒、cap 过小时 still-blocked 终止、预算 0/1 截止、重复执行确定性、同训练值不同依赖结构候选保留；端到端（stress I，B1，全协议预算）：portfolio 全部通过类型检查，选中程序通过原 Grid exact verifier，使用 place/coordAdd/coordDelta 且无 Translate。`CheckPlace.hs` 对本快照 PASS。

旧测试分类（不笼统宣称全部通过）：
- `InducedMain.hs`：needs-rewrite (references removed Translate/poseOf symbols; not run for place)（引用 PoseT, Translate, poseOf）
- `InducedR1Main.hs`：needs-rewrite (references removed Translate/poseOf symbols; not run for place)（引用 Translate）
- `InducedR2Main.hs`：applicable-in-principle (induced Base without Translate references; not part of this round)
- `JointMain.hs`：not-applicable (legacy v0.1/v0.2/v0.3 search, not the induced Base language)
- `LatentMain.hs`：not-applicable (legacy v0.1/v0.2/v0.3 search, not the induced Base language)
- `Main.hs`：not-applicable (legacy v0.1/v0.2/v0.3 search, not the induced Base language)（引用 Translate）
- `experiments/place-only/CheckPlace.hs`：applicable (place registry/semantics check; run and passing for place-demand Base, which is unchanged)
- `experiments/place-demand/test/PlaceDemandMain.hs`：new (phase A/B semantic tests; run and passing)

## 受控矩阵（B0/B1/B2）

| 测试组 | 变体 | 完成 | 训练正确 | 留出正确 | 超时 | 冻结 place-only Full 留出（同批，异主机） |
|---|---|---:|---:|---:|---:|---:|
| core | B0 | 1 | 1 | 1 | 0 | 1 |
| core | B1 | 1 | 1 | 1 | 0 | 1 |
| core | B2 | 1 | 1 | 1 | 0 | 1 |
| regression | B0 | 17 | 16 | 16 | 0 | 16 |
| regression | B1 | 17 | 14 | 14 | 1 | 16 |
| regression | B2 | 17 | 14 | 14 | 2 | 16 |
| stress | B0 | 10 | 6 | 3 | 0 | 3 |
| stress | B1 | 10 | 4 | 4 | 0 | 3 |
| stress | B2 | 10 | 4 | 4 | 0 | 3 |
| diagnostic | B0 | 30 | 1 | 0 | 2 | 0 |
| diagnostic | B1 | 30 | 1 | 0 | 2 | 0 |
| diagnostic | B2 | 30 | 1 | 0 | 2 | 0 |
| generated-dev | B0 | 4 | 2 | 0 | 0 | — |
| generated-dev | B1 | 4 | 0 | 0 | 1 | — |
| generated-dev | B2 | 4 | 0 | 0 | 1 | — |
| generated-audit | B0 | 12 | 10 | 1 | 0 | — |
| generated-audit | B1 | 12 | 0 | 0 | 6 | — |
| generated-audit | B2 | 12 | 0 | 0 | 6 | — |

超时（外部 300 秒，内部计数缺失记 n/a）：23 项：diagnostic/484b58aa/B0, diagnostic/484b58aa/B1, diagnostic/484b58aa/B2, diagnostic/c444b776/B0, diagnostic/c444b776/B1, diagnostic/c444b776/B2, generated-audit/audit-same-progression-1/B1, generated-audit/audit-same-progression-1/B2, generated-audit/audit-same-relative-0/B1, generated-audit/audit-same-relative-0/B2, generated-audit/audit-same-relative-2/B1, generated-audit/audit-same-relative-2/B2, generated-audit/audit-unseen-double-0/B1, generated-audit/audit-unseen-double-0/B2, generated-audit/audit-unseen-negated-1/B1, generated-audit/audit-unseen-negated-1/B2, generated-audit/audit-unseen-xalign-1/B1, generated-audit/audit-unseen-xalign-1/B2, generated-dev/dev-relative-1/B1, generated-dev/dev-relative-1/B2, regression/map-scan-ambiguity/B1, regression/map-scan-ambiguity/B2, regression/map-translate/B2。两个 regression 超时项（map-scan-ambiguity B1/B2、map-translate B2）在无 deadline 的 out-of-protocol 复跑中约 290 秒自行终止：250000 工作预算全部耗于推导（first-exact 0，join 1682/2163），因此它们是搜索预算失败而非主机时钟 artefact；30 个 diagnostic 的两个超时（484b58aa、c444b776）三个变体都出现，与冻结结果相同。

### 相对 B0 的逐题结果变化

B1：
- `generated-audit/audit-same-progression-0`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `generated-audit/audit-same-progression-2`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `generated-audit/audit-same-relative-0`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure，外部超时）
- `generated-audit/audit-same-relative-1`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `generated-audit/audit-same-relative-2`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure，外部超时）
- `generated-audit/audit-unseen-double-0`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure，外部超时）
- `generated-audit/audit-unseen-double-1`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `generated-audit/audit-unseen-negated-0`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `generated-audit/audit-unseen-xalign-0`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `generated-audit/audit-unseen-xalign-1`：B0 train/held=1/1（None） → B1 0/0（SearchFailure，外部超时）
- `generated-dev/dev-progression-1`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `generated-dev/dev-relative-0`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `regression/map-scan-ambiguity`：B0 train/held=1/1（None） → B1 0/0（SearchFailure，外部超时）
- `regression/map-translate`：B0 train/held=1/1（None） → B1 0/0（SearchFailure）
- `stress/B-repeated-progression`：B0 train/held=1/0（AbstractionMissing） → B1 1/1（None）
- `stress/C-scene-axis`：B0 train/held=1/1（None） → B1 0/0（SearchFailure）
- `stress/F-global-better`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `stress/G-fusion`：B0 train/held=1/0（AbstractionMissing） → B1 0/0（SearchFailure）
- `stress/I-equivalent-representations`：B0 train/held=0/0（WitnessMissing） → B1 1/1（None）

B2（相对 B0；B2 与 B1 的 train/heldout 逐题相同）：
- `generated-audit/audit-same-progression-0`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `generated-audit/audit-same-progression-2`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `generated-audit/audit-same-relative-0`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure，外部超时）
- `generated-audit/audit-same-relative-1`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `generated-audit/audit-same-relative-2`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure，外部超时）
- `generated-audit/audit-unseen-double-0`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure，外部超时）
- `generated-audit/audit-unseen-double-1`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `generated-audit/audit-unseen-negated-0`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `generated-audit/audit-unseen-xalign-0`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `generated-audit/audit-unseen-xalign-1`：B0 train/held=1/1（None） → B2 0/0（SearchFailure，外部超时）
- `generated-dev/dev-progression-1`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `generated-dev/dev-relative-0`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `regression/map-scan-ambiguity`：B0 train/held=1/1（None） → B2 0/0（SearchFailure，外部超时）
- `regression/map-translate`：B0 train/held=1/1（None） → B2 0/0（SearchFailure，外部超时）
- `stress/B-repeated-progression`：B0 train/held=1/0（AbstractionMissing） → B2 1/1（None）
- `stress/C-scene-axis`：B0 train/held=1/1（None） → B2 0/0（SearchFailure）
- `stress/F-global-better`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `stress/G-fusion`：B0 train/held=1/0（AbstractionMissing） → B2 0/0（SearchFailure）
- `stress/I-equivalent-representations`：B0 train/held=0/0（WitnessMissing） → B2 1/1（None）

### DAG 规模与提取结果的关系

下表按 join 节点数分桶统计“cost saturation 是否物化出至少一个完整根 AST”（不含超时行）。B1/B2 的 join 爆炸集中在 Γ=[v0] 的两行子规格（scan seed / let 绑定坐标）：例如 stress C 的 1780 个 join 中 coordAdd[v0]=1090、coordDelta[v0]=327，[v0,v1] 上下文为 0；F 的 4153 个 join 中 coordAdd[v0]=2679。

| 变体 | join ≤250 | 251–1000 | >1000 |
|---|---|---|---|
| B0 | 物化 31 / 未物化 36 | 物化 5 / 未物化 0 | 物化 0 / 未物化 0 |
| B1 | 物化 18 / 未物化 30 | 物化 1 / 未物化 1 | 物化 1 / 未物化 13 |
| B2 | 物化 18 / 未物化 29 | 物化 1 / 未物化 1 | 物化 1 / 未物化 13 |
| B1L | 物化 34 / 未物化 3 | 物化 7 / 未物化 0 | 物化 0 / 未物化 0 |
| B2L | 物化 25 / 未物化 2 | 物化 9 / 未物化 2 | 物化 3 / 未物化 2 |

## 额外探索性消融 B1L/B2L（开发证据）

| 测试组 | 变体 | 完成 | 训练正确 | 留出正确 | 超时 | 冻结 place-only Full 留出（同批，异主机） |
|---|---|---:|---:|---:|---:|---:|
| core | B1L | 1 | 1 | 1 | 0 | 1 |
| core | B2L | 1 | 1 | 1 | 0 | 1 |
| regression | B1L | 17 | 16 | 16 | 0 | 16 |
| regression | B2L | 17 | 16 | 16 | 0 | 16 |
| stress | B1L | 10 | 8 | 7 | 0 | 3 |
| stress | B2L | 10 | 9 | 6 | 0 | 3 |
| generated-dev | B1L | 4 | 4 | 3 | 0 | — |
| generated-dev | B2L | 4 | 4 | 3 | 0 | — |
| generated-audit | B1L | 12 | 12 | 5 | 0 | — |
| generated-audit | B2L | 12 | 7 | 4 | 1 | — |

B1L 相对 B0：
- `generated-audit/audit-same-progression-0`：B0 train/held=1/0（AbstractionMissing） → B1L 1/1（None）
- `generated-audit/audit-same-progression-1`：B0 train/held=0/0（WitnessMissing） → B1L 1/0（AbstractionMissing）
- `generated-audit/audit-same-progression-2`：B0 train/held=1/0（AbstractionMissing） → B1L 1/1（None）
- `generated-audit/audit-same-relative-1`：B0 train/held=1/0（AbstractionMissing） → B1L 1/1（None）
- `generated-audit/audit-unseen-negated-1`：B0 train/held=0/0（WitnessMissing） → B1L 1/1（None）
- `generated-dev/dev-progression-0`：B0 train/held=0/0（WitnessMissing） → B1L 1/1（None）
- `generated-dev/dev-progression-1`：B0 train/held=1/0（AbstractionMissing） → B1L 1/1（None）
- `generated-dev/dev-relative-1`：B0 train/held=0/0（WitnessMissing） → B1L 1/1（None）
- `stress/A-absolute-relative`：B0 train/held=0/0（WitnessMissing） → B1L 1/1（None）
- `stress/B-repeated-progression`：B0 train/held=1/0（AbstractionMissing） → B1L 1/1（None）
- `stress/G-fusion`：B0 train/held=1/0（AbstractionMissing） → B1L 1/1（None）
- `stress/I-equivalent-representations`：B0 train/held=0/0（WitnessMissing） → B1L 1/1（None）

B2L 相对 B0：
- `generated-audit/audit-same-progression-0`：B0 train/held=1/0（AbstractionMissing） → B2L 0/0（SearchFailure）
- `generated-audit/audit-same-progression-2`：B0 train/held=1/0（AbstractionMissing） → B2L 1/1（None）
- `generated-audit/audit-same-relative-1`：B0 train/held=1/0（AbstractionMissing） → B2L 1/1（None）
- `generated-audit/audit-same-relative-2`：B0 train/held=1/0（AbstractionMissing） → B2L 0/0（SearchFailure，外部超时）
- `generated-audit/audit-unseen-double-0`：B0 train/held=1/0（AbstractionMissing） → B2L 0/0（SearchFailure）
- `generated-audit/audit-unseen-double-1`：B0 train/held=1/0（AbstractionMissing） → B2L 0/0（SearchFailure）
- `generated-audit/audit-unseen-negated-1`：B0 train/held=0/0（WitnessMissing） → B2L 1/1（None）
- `generated-dev/dev-progression-0`：B0 train/held=0/0（WitnessMissing） → B2L 1/1（None）
- `generated-dev/dev-progression-1`：B0 train/held=1/0（AbstractionMissing） → B2L 1/1（None）
- `generated-dev/dev-relative-1`：B0 train/held=0/0（WitnessMissing） → B2L 1/1（None）
- `stress/A-absolute-relative`：B0 train/held=0/0（WitnessMissing） → B2L 1/1（None）
- `stress/B-repeated-progression`：B0 train/held=1/0（AbstractionMissing） → B2L 1/1（None）
- `stress/C-scene-axis`：B0 train/held=1/1（None） → B2L 1/0（AbstractionMissing）
- `stress/E-local-better`：B0 train/held=0/0（WitnessMissing） → B2L 1/0（AbstractionMissing）
- `stress/G-fusion`：B0 train/held=1/0（AbstractionMissing） → B2L 1/1（None）
- `stress/I-equivalent-representations`：B0 train/held=0/0（WitnessMissing） → B2L 1/1（None）

B1L 的规则在看过 A/C/F 的失败 trace 后制定，因此 generated-audit 在 B1L 下的留出数字是开发证据而非未见审计；它回答的问题是“B1 的退化是否来自场景级两行子规格中的 residual 扇出”，而不是“B1L 泛化更好”。B1L 在 regression 上是否保住 16 个成功项、在 stress 上是否同时保住 C/J 并恢复 A/B/I，见上表与逐题表。

## 逐题表

### stress A–J

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | bidirectional_left_decompositions | join_nodes | cost_bound_reached | materialized_complete_asts | demands_distinct | demands_resumed | demands_still_blocked | demands_suspended | demand_new_vec_observations | demand_new_int_observations | demand_memo_invalidations | demand_memo_reuse |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| A-absolute-relative | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 1161 | 7.1 | 0 | 0 | 96 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| A-absolute-relative | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 88184 | 76.5 | 874 | 670 | 20 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| A-absolute-relative | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 114908 | 83.7 | 874 | 696 | 20 | 0 | 8 | 8 | 0 | 0 | 4608 | 6684 | 348 | 158 |
| A-absolute-relative | B1L | 1 | 1 | None | 2408 | 2408 | 47063 | 104054 | 41.9 | 13 | 27 | 26 | 2408 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| A-absolute-relative | B2L | 1 | 1 | None | 1781 | 1781 | 79146 | 145337 | 46.8 | 13 | 54 | 26 | 1781 | 8 | 8 | 0 | 0 | 4608 | 6684 | 32 | 2 |
| B-repeated-progression | B0 | 1 | 0 | AbstractionMissing | 679 | 0 | 50333 | 115241 | 48.7 | 0 | 31 | 25 | 679 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| B-repeated-progression | B1 | 1 | 1 | None | 1 | 1 | 87967 | 87999 | 94.1 | 554 | 171 | 20 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| B-repeated-progression | B2 | 1 | 1 | None | 1 | 1 | 116910 | 116942 | 102.7 | 554 | 199 | 20 | 1 | 8 | 8 | 0 | 0 | 4608 | 6684 | 374 | 200 |
| B-repeated-progression | B1L | 1 | 1 | None | 678 | 211 | 55858 | 118675 | 39.6 | 13 | 45 | 22 | 774 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| B-repeated-progression | B2L | 1 | 1 | None | 1 | 1 | 72404 | 72436 | 29.2 | 13 | 73 | 22 | 1 | 8 | 8 | 0 | 0 | 4608 | 6684 | 35 | 2 |
| C-scene-axis | B0 | 1 | 1 | None | 671 | 101 | 49943 | 154738 | 70.8 | 0 | 37 | 26 | 671 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| C-scene-axis | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 123460 | 114.2 | 1748 | 1780 | 19 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| C-scene-axis | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 211539 | 187.3 | 1876 | 1846 | 19 | 0 | 14 | 9 | 0 | 5 | 5760 | 6684 | 350 | 96 |
| C-scene-axis | B1L | 1 | 1 | None | 671 | 101 | 57545 | 162340 | 76.9 | 46 | 37 | 26 | 671 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| C-scene-axis | B2L | 1 | 0 | AbstractionMissing | 2226 | 203 | 144201 | 250000 | 153.5 | 139 | 116 | 21 | 2226 | 13 | 9 | 0 | 4 | 5760 | 6668 | 56 | 10 |
| D-object-sufficient | B0 | 1 | 1 | None | 1 | 1 | 35 | 38 | 0.6 | 0 | 1 | 96 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| D-object-sufficient | B1 | 1 | 1 | None | 1 | 1 | 35 | 38 | 0.7 | 0 | 1 | 96 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| D-object-sufficient | B2 | 1 | 1 | None | 1 | 1 | 35 | 38 | 0.5 | 0 | 1 | 96 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| D-object-sufficient | B1L | 1 | 1 | None | 1 | 1 | 35 | 38 | 0.7 | 0 | 1 | 96 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| D-object-sufficient | B2L | 1 | 1 | None | 1 | 1 | 35 | 38 | 0.6 | 0 | 1 | 96 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| E-local-better | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 1169 | 5.9 | 0 | 0 | 96 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| E-local-better | B1 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 7311 | 18.3 | 48 | 0 | 96 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| E-local-better | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250087 | 261.6 | 2680 | 2026 | 0 | 0 | 8 | 8 | 0 | 0 | 4608 | 6684 | 553 | 305 |
| E-local-better | B1L | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 3145 | 9.6 | 13 | 0 | 96 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| E-local-better | B2L | 1 | 0 | AbstractionMissing | 452 | 0 | 120809 | 188706 | 95.3 | 522 | 142 | 23 | 452 | 8 | 8 | 0 | 0 | 4608 | 6684 | 61 | 37 |
| F-global-better | B0 | 1 | 0 | AbstractionMissing | 1364 | 45 | 59118 | 185826 | 90.9 | 0 | 48 | 23 | 1502 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| F-global-better | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 203843 | 177.4 | 4319 | 4153 | 19 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| F-global-better | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250305 | 225.4 | 4648 | 4404 | 0 | 0 | 13 | 9 | 0 | 4 | 5760 | 6684 | 688 | 306 |
| F-global-better | B1L | 1 | 0 | AbstractionMissing | 1364 | 45 | 66048 | 192756 | 97.6 | 46 | 48 | 23 | 1502 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| F-global-better | B2L | 1 | 0 | AbstractionMissing | 1 | 0 | 195565 | 195641 | 170.4 | 907 | 1006 | 19 | 1 | 13 | 9 | 0 | 4 | 5760 | 6668 | 58 | 16 |
| G-fusion | B0 | 1 | 0 | AbstractionMissing | 4491 | 0 | 52332 | 120671 | 109.7 | 0 | 24 | 25 | 4491 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| G-fusion | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 153715 | 165.7 | 2086 | 1583 | 20 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| G-fusion | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250038 | 274.6 | 3150 | 2479 | 0 | 0 | 12 | 9 | 0 | 3 | 5760 | 6684 | 676 | 356 |
| G-fusion | B1L | 1 | 1 | None | 1353 | 810 | 60126 | 123811 | 61.8 | 45 | 51 | 23 | 1353 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| G-fusion | B2L | 1 | 1 | None | 5 | 5 | 165312 | 243135 | 156.9 | 950 | 594 | 18 | 5 | 12 | 9 | 0 | 3 | 5760 | 6684 | 42 | 32 |
| H-overfitting-trap | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 1779 | 11.3 | 0 | 0 | 96 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| H-overfitting-trap | B1 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 8342 | 22.9 | 64 | 0 | 96 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| H-overfitting-trap | B2 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 59454 | 73.6 | 192 | 0 | 96 | 0 | 8 | 8 | 0 | 0 | 4608 | 6668 | 85 | 4 |
| H-overfitting-trap | B1L | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 3794 | 15.7 | 18 | 0 | 96 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| H-overfitting-trap | B2L | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 41736 | 45.3 | 100 | 0 | 96 | 0 | 8 | 8 | 0 | 0 | 4608 | 6668 | 39 | 4 |
| I-equivalent-representations | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 1135 | 6.4 | 0 | 0 | 96 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| I-equivalent-representations | B1 | 1 | 1 | None | 1 | 1 | 83845 | 83882 | 85.7 | 494 | 178 | 18 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| I-equivalent-representations | B2 | 1 | 1 | None | 1 | 1 | 112671 | 112708 | 93.2 | 494 | 211 | 18 | 1 | 8 | 8 | 0 | 0 | 4608 | 6684 | 352 | 156 |
| I-equivalent-representations | B1L | 1 | 1 | None | 1737 | 363 | 54552 | 122937 | 44.8 | 11 | 37 | 22 | 1737 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| I-equivalent-representations | B2L | 1 | 1 | None | 186 | 144 | 77841 | 141918 | 42.5 | 11 | 70 | 21 | 186 | 8 | 8 | 0 | 0 | 4608 | 6684 | 31 | 2 |
| J-no-useful-abstraction | B0 | 1 | 1 | None | 398 | 398 | 40934 | 130811 | 32.2 | 0 | 27 | 30 | 398 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| J-no-useful-abstraction | B1 | 1 | 1 | None | 4 | 4 | 112622 | 188033 | 103.5 | 1451 | 1392 | 20 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| J-no-useful-abstraction | B2 | 1 | 1 | None | 2 | 2 | 128373 | 166005 | 104.5 | 1451 | 1412 | 19 | 2 | 5 | 5 | 0 | 0 | 4608 | 1682 | 433 | 177 |
| J-no-useful-abstraction | B1L | 1 | 1 | None | 322 | 322 | 41686 | 136805 | 30.8 | 13 | 28 | 30 | 323 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| J-no-useful-abstraction | B2L | 1 | 1 | None | 2729 | 2729 | 58272 | 155004 | 48.8 | 13 | 65 | 23 | 2731 | 4 | 4 | 0 | 0 | 4608 | 0 | 27 | 1 |

### 新生成样例（generated-dev / generated-audit）

生成器 `scripts/generate_place_demand_samples.py` 独立于搜索器（自带栅格渲染与 4 连通分量解码校验，规则按输入栅格分量的 raster 顺序定义，无隐藏 id）；manifest 含每个 task 的 SHA-256，在任何求解前冻结提交（hash `277a53e492f26514…`）。`GeneratedAudit.hs` 为 16 个任务各给出独立 Base 参考程序（train/heldout exact），仅作事后可表达性证书。dev 集（原 A/B/I 同规则）用于开发；audit-same-rule（同规则新实例，含一个“位移等于首对象绝对坐标”的混淆训练用例 audit-same-relative-2）与 audit-unseen（negated/double/x-align 三种原 stress 中没有的组合规则）只在矩阵完成后评分；B0/B1/B2 看过 audit 结果后未再修改。

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | bidirectional_left_decompositions | join_nodes | cost_bound_reached | demands_resumed | demand_new_vec_observations |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| dev-progression-0 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 5095 | 26.0 | 0 | 0 | 96 | 0 | 0 |
| dev-progression-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250001 | 274.9 | 1540 | 1035 | 0 | 0 | 0 |
| dev-progression-0 | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250001 | 273.0 | 1540 | 1035 | 0 | 0 | 0 |
| dev-progression-0 | B1L | 1 | 1 | None | 1 | 1 | 76953 | 76985 | 52.9 | 55 | 320 | 22 | 0 | 0 |
| dev-progression-0 | B2L | 1 | 1 | None | 1 | 1 | 250000 | 250000 | 141.0 | 613 | 1271 | 19 | 9 | 5760 |
| dev-progression-1 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 55844 | 55922 | 46.2 | 0 | 96 | 26 | 0 | 0 |
| dev-progression-1 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 193177 | 173.7 | 762 | 1017 | 20 | 0 | 0 |
| dev-progression-1 | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250502 | 200.6 | 826 | 1232 | 0 | 9 | 5760 |
| dev-progression-1 | B1L | 1 | 1 | None | 1 | 1 | 72183 | 72215 | 53.3 | 45 | 166 | 22 | 0 | 0 |
| dev-progression-1 | B2L | 1 | 1 | None | 1 | 1 | 241508 | 241540 | 103.4 | 285 | 661 | 20 | 9 | 5760 |
| dev-relative-0 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 80841 | 80927 | 85.2 | 0 | 191 | 27 | 0 | 0 |
| dev-relative-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250058 | 266.8 | 1504 | 1464 | 0 | 0 | 0 |
| dev-relative-0 | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250058 | 273.8 | 1504 | 1464 | 0 | 0 | 0 |
| dev-relative-0 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 105387 | 105424 | 105.4 | 85 | 197 | 27 | 0 | 0 |
| dev-relative-0 | B2L | 1 | 0 | AbstractionMissing | 2 | 0 | 160452 | 160544 | 122.0 | 85 | 291 | 25 | 9 | 5760 |
| dev-relative-1 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 28412 | 192.4 | 0 | 0 | 96 | 0 | 0 |
| dev-relative-1 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| dev-relative-1 | B2 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| dev-relative-1 | B1L | 1 | 1 | None | 1 | 1 | 107634 | 107671 | 221.5 | 81 | 242 | 23 | 0 | 0 |
| dev-relative-1 | B2L | 1 | 1 | None | 2 | 2 | 151805 | 151891 | 243.0 | 81 | 292 | 23 | 9 | 5760 |

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | bidirectional_left_decompositions | join_nodes | cost_bound_reached | demands_resumed | demand_new_vec_observations |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| audit-same-progression-0 | B0 | 1 | 0 | AbstractionMissing | 180 | 0 | 66790 | 133710 | 80.7 | 0 | 102 | 30 | 0 | 0 |
| audit-same-progression-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250000 | 260.0 | 1294 | 1933 | 20 | 0 | 0 |
| audit-same-progression-0 | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250079 | 263.1 | 1358 | 1983 | 0 | 9 | 5760 |
| audit-same-progression-0 | B1L | 1 | 1 | None | 2 | 2 | 77015 | 114703 | 71.3 | 54 | 189 | 28 | 0 | 0 |
| audit-same-progression-0 | B2L | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250313 | 128.3 | 421 | 1459 | 0 | 9 | 5760 |
| audit-same-progression-1 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 13988 | 93.2 | 0 | 0 | 96 | 0 | 0 |
| audit-same-progression-1 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-progression-1 | B2 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-progression-1 | B1L | 1 | 0 | AbstractionMissing | 4 | 2 | 94209 | 169888 | 162.7 | 75 | 218 | 29 | 0 | 0 |
| audit-same-progression-1 | B2L | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250031 | 216.9 | 651 | 1071 | 0 | 9 | 5760 |
| audit-same-progression-2 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 62939 | 63027 | 34.9 | 0 | 143 | 31 | 0 | 0 |
| audit-same-progression-2 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250000 | 269.9 | 1344 | 1586 | 0 | 0 | 0 |
| audit-same-progression-2 | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250435 | 271.3 | 1344 | 1586 | 0 | 4 | 2304 |
| audit-same-progression-2 | B1L | 1 | 1 | None | 2 | 2 | 81186 | 118875 | 59.1 | 45 | 251 | 28 | 0 | 0 |
| audit-same-progression-2 | B2L | 1 | 1 | None | 1 | 1 | 207999 | 208031 | 127.4 | 589 | 1099 | 21 | 9 | 5760 |
| audit-same-relative-0 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 90549 | 90616 | 114.3 | 0 | 288 | 23 | 0 | 0 |
| audit-same-relative-0 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-relative-0 | B2 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-relative-0 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 111998 | 112035 | 135.1 | 80 | 297 | 23 | 0 | 0 |
| audit-same-relative-0 | B2L | 1 | 0 | AbstractionMissing | 2 | 0 | 182580 | 182666 | 156.3 | 80 | 360 | 23 | 9 | 5760 |
| audit-same-relative-1 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 74654 | 74743 | 46.4 | 0 | 252 | 27 | 0 | 0 |
| audit-same-relative-1 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250061 | 242.1 | 1506 | 1635 | 0 | 0 | 0 |
| audit-same-relative-1 | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250061 | 236.4 | 1506 | 1635 | 0 | 0 | 0 |
| audit-same-relative-1 | B1L | 1 | 1 | None | 1 | 1 | 91412 | 91449 | 60.4 | 55 | 263 | 26 | 0 | 0 |
| audit-same-relative-1 | B2L | 1 | 1 | None | 2 | 2 | 151658 | 151744 | 72.6 | 55 | 321 | 26 | 9 | 5760 |
| audit-same-relative-2 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 110154 | 110202 | 256.9 | 0 | 268 | 21 | 0 | 0 |
| audit-same-relative-2 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-relative-2 | B2 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-relative-2 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 129138 | 129168 | 274.8 | 69 | 279 | 21 | 0 | 0 |
| audit-same-relative-2 | B2L | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-double-0 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 92654 | 92738 | 146.3 | 0 | 315 | 47 | 0 | 0 |
| audit-unseen-double-0 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-double-0 | B2 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-double-0 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 115180 | 115264 | 158.7 | 86 | 323 | 47 | 0 | 0 |
| audit-unseen-double-0 | B2L | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250009 | 244.5 | 283 | 850 | 0 | 9 | 5760 |
| audit-unseen-double-1 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 73766 | 73836 | 61.3 | 0 | 185 | 24 | 0 | 0 |
| audit-unseen-double-1 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250016 | 267.6 | 1422 | 1027 | 0 | 0 | 0 |
| audit-unseen-double-1 | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250016 | 262.1 | 1422 | 1027 | 0 | 0 | 0 |
| audit-unseen-double-1 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 87651 | 87721 | 75.1 | 51 | 185 | 24 | 0 | 0 |
| audit-unseen-double-1 | B2L | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250034 | 242.4 | 724 | 780 | 0 | 9 | 5760 |
| audit-unseen-negated-0 | B0 | 1 | 0 | AbstractionMissing | 12 | 0 | 84135 | 126001 | 132.7 | 0 | 97 | 32 | 0 | 0 |
| audit-unseen-negated-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250012 | 259.1 | 1569 | 2230 | 0 | 0 | 0 |
| audit-unseen-negated-0 | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250012 | 268.2 | 1569 | 2230 | 0 | 0 | 0 |
| audit-unseen-negated-0 | B1L | 1 | 0 | AbstractionMissing | 4 | 2 | 109830 | 185675 | 170.4 | 85 | 118 | 32 | 0 | 0 |
| audit-unseen-negated-0 | B2L | 1 | 0 | AbstractionMissing | 4 | 2 | 163092 | 201550 | 168.4 | 85 | 172 | 30 | 9 | 5760 |
| audit-unseen-negated-1 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 17446 | 116.2 | 0 | 0 | 96 | 0 | 0 |
| audit-unseen-negated-1 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-negated-1 | B2 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-negated-1 | B1L | 1 | 1 | None | 1 | 1 | 90958 | 90995 | 152.8 | 89 | 195 | 22 | 0 | 0 |
| audit-unseen-negated-1 | B2L | 1 | 1 | None | 2 | 2 | 132202 | 132294 | 166.4 | 89 | 250 | 22 | 9 | 5760 |
| audit-unseen-xalign-0 | B0 | 1 | 0 | AbstractionMissing | 1007 | 42 | 53247 | 128113 | 71.1 | 0 | 35 | 29 | 0 | 0 |
| audit-unseen-xalign-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 249111 | 274.5 | 1740 | 1001 | 20 | 0 | 0 |
| audit-unseen-xalign-0 | B2 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250495 | 289.8 | 1804 | 1014 | 0 | 9 | 9216 |
| audit-unseen-xalign-0 | B1L | 1 | 0 | AbstractionMissing | 1007 | 42 | 67952 | 142818 | 82.1 | 64 | 35 | 29 | 0 | 0 |
| audit-unseen-xalign-0 | B2L | 1 | 0 | AbstractionMissing | 1 | 0 | 250000 | 250000 | 205.2 | 1184 | 690 | 0 | 9 | 9216 |
| audit-unseen-xalign-1 | B0 | 1 | 1 | None | 1273 | 240 | 56058 | 137291 | 83.0 | 0 | 48 | 30 | 0 | 0 |
| audit-unseen-xalign-1 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | 0 | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-xalign-1 | B2 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-xalign-1 | B1L | 1 | 1 | None | 1379 | 240 | 73766 | 156106 | 97.1 | 64 | 61 | 29 | 0 | 0 |
| audit-unseen-xalign-1 | B2L | 1 | 1 | None | 1 | 1 | 250000 | 250000 | 208.8 | 1094 | 673 | 0 | 10 | 10368 |

generated 集合的 B0 结果本身说明：同规则新实例（多对象、随机形状）下，原 Place 搜索 train exact 但留出几乎全错（AbstractionMissing），即原搜索选中的是训练一致但不泛化的程序；B1/B2 的 0 train 是推导预算耗尽。audit-same-relative-2 的混淆训练（位移=首对象 TL）在 B0 下 train exact、留出错，与设计的歧义一致，但没有真值的反事实只能证明歧义，不能判定哪个程序正确。

### regression

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | bidirectional_left_decompositions | join_nodes | demands_resumed | demand_new_vec_observations |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| constant-transform | B0 | 1 | 1 | None | 1412 | 1412 | 27639 | 93523 | 15.4 | 0 | 11 | 0 | 0 |
| constant-transform | B1 | 1 | 1 | None | 1412 | 1412 | 27639 | 93523 | 15.4 | 0 | 11 | 0 | 0 |
| constant-transform | B2 | 1 | 1 | None | 1412 | 1412 | 27639 | 93523 | 15.9 | 0 | 11 | 0 | 0 |
| constant-transform | B1L | 1 | 1 | None | 1412 | 1412 | 27639 | 93523 | 22.1 | 0 | 11 | 0 | 0 |
| constant-transform | B2L | 1 | 1 | None | 1412 | 1412 | 27639 | 93523 | 17.0 | 0 | 11 | 0 | 0 |
| equivalent-expressions | B0 | 1 | 1 | None | 256 | 256 | 30167 | 111984 | 19.0 | 0 | 9 | 0 | 0 |
| equivalent-expressions | B1 | 1 | 1 | None | 1369 | 1369 | 52488 | 164570 | 29.9 | 24 | 41 | 0 | 0 |
| equivalent-expressions | B2 | 1 | 1 | None | 1302 | 1302 | 56231 | 168523 | 29.6 | 24 | 55 | 1 | 1152 |
| equivalent-expressions | B1L | 1 | 1 | None | 459 | 459 | 32682 | 116417 | 14.8 | 1 | 10 | 0 | 0 |
| equivalent-expressions | B2L | 1 | 1 | None | 301 | 301 | 40319 | 132822 | 15.7 | 1 | 24 | 1 | 1152 |
| filter-color | B0 | 1 | 1 | None | 142 | 122 | 69102 | 157105 | 37.6 | 0 | 352 | 0 | 0 |
| filter-color | B1 | 1 | 1 | None | 142 | 122 | 69102 | 157105 | 38.9 | 0 | 352 | 0 | 0 |
| filter-color | B2 | 1 | 1 | None | 142 | 122 | 69102 | 157105 | 39.3 | 0 | 352 | 0 | 0 |
| filter-color | B1L | 1 | 1 | None | 142 | 122 | 69102 | 157105 | 36.9 | 0 | 352 | 0 | 0 |
| filter-color | B2L | 1 | 1 | None | 142 | 122 | 69102 | 157105 | 36.9 | 0 | 352 | 0 | 0 |
| fold-bbox | B0 | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.7 | 0 | 0 | 0 | 0 |
| fold-bbox | B1 | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.7 | 0 | 0 | 0 | 0 |
| fold-bbox | B2 | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.6 | 0 | 0 | 0 | 0 |
| fold-bbox | B1L | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.6 | 0 | 0 | 0 | 0 |
| fold-bbox | B2L | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.7 | 0 | 0 | 0 | 0 |
| grid-without-prev | B0 | 1 | 1 | None | 581 | 437 | 40005 | 95623 | 17.8 | 0 | 26 | 0 | 0 |
| grid-without-prev | B1 | 1 | 1 | None | 717 | 573 | 46019 | 105236 | 18.2 | 52 | 83 | 0 | 0 |
| grid-without-prev | B2 | 1 | 1 | None | 642 | 498 | 53464 | 113010 | 19.5 | 52 | 91 | 2 | 1152 |
| grid-without-prev | B1L | 1 | 1 | None | 612 | 468 | 42031 | 99140 | 17.5 | 5 | 28 | 0 | 0 |
| grid-without-prev | B2L | 1 | 1 | None | 558 | 414 | 49728 | 107586 | 17.7 | 5 | 36 | 2 | 1152 |
| iterate-chain | B0 | 1 | 1 | None | 214 | 214 | 30291 | 112294 | 19.2 | 0 | 9 | 0 | 0 |
| iterate-chain | B1 | 1 | 1 | None | 1041 | 1041 | 51243 | 178284 | 28.0 | 44 | 77 | 0 | 0 |
| iterate-chain | B2 | 1 | 1 | None | 1029 | 1029 | 57351 | 174989 | 28.6 | 44 | 92 | 1 | 1152 |
| iterate-chain | B1L | 1 | 1 | None | 393 | 393 | 40547 | 136344 | 15.5 | 6 | 23 | 0 | 0 |
| iterate-chain | B2L | 1 | 1 | None | 414 | 414 | 47825 | 150237 | 17.9 | 6 | 38 | 1 | 1152 |
| map-recolor | B0 | 1 | 1 | None | 1412 | 1412 | 27656 | 93551 | 15.4 | 0 | 11 | 0 | 0 |
| map-recolor | B1 | 1 | 1 | None | 1412 | 1412 | 27656 | 93551 | 15.3 | 0 | 11 | 0 | 0 |
| map-recolor | B2 | 1 | 1 | None | 1412 | 1412 | 27656 | 93551 | 15.4 | 0 | 11 | 0 | 0 |
| map-recolor | B1L | 1 | 1 | None | 1412 | 1412 | 27656 | 93551 | 14.7 | 0 | 11 | 0 | 0 |
| map-recolor | B2L | 1 | 1 | None | 1412 | 1412 | 27656 | 93551 | 15.8 | 0 | 11 | 0 | 0 |
| map-reflectH | B0 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 16.5 | 0 | 11 | 0 | 0 |
| map-reflectH | B1 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 16.0 | 0 | 11 | 0 | 0 |
| map-reflectH | B2 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 15.8 | 0 | 11 | 0 | 0 |
| map-reflectH | B1L | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 15.6 | 0 | 11 | 0 | 0 |
| map-reflectH | B2L | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 14.8 | 0 | 11 | 0 | 0 |
| map-rotate90 | B0 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 15.9 | 0 | 11 | 0 | 0 |
| map-rotate90 | B1 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 15.5 | 0 | 11 | 0 | 0 |
| map-rotate90 | B2 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 15.4 | 0 | 11 | 0 | 0 |
| map-rotate90 | B1L | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 14.5 | 0 | 11 | 0 | 0 |
| map-rotate90 | B2L | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 14.8 | 0 | 11 | 0 | 0 |
| map-scan-ambiguity | B0 | 1 | 1 | None | 427 | 366 | 58789 | 160713 | 139.5 | 0 | 66 | 0 | 0 |
| map-scan-ambiguity | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| map-scan-ambiguity | B2 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| map-scan-ambiguity | B1L | 1 | 1 | None | 462 | 398 | 82970 | 138136 | 140.9 | 85 | 57 | 0 | 0 |
| map-scan-ambiguity | B2L | 1 | 1 | None | 1425 | 1047 | 145125 | 250000 | 181.0 | 85 | 165 | 10 | 11520 |
| map-translate | B0 | 1 | 1 | None | 368 | 46 | 63016 | 120896 | 173.6 | 0 | 46 | 0 | 0 |
| map-translate | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250046 | 294.2 | 1906 | 2163 | 0 | 0 |
| map-translate | B2 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| map-translate | B1L | 1 | 1 | None | 475 | 85 | 83983 | 139390 | 182.5 | 76 | 54 | 0 | 0 |
| map-translate | B2L | 1 | 1 | None | 1289 | 275 | 136064 | 197120 | 204.6 | 76 | 132 | 9 | 10368 |
| scan-BL-TL | B0 | 1 | 1 | None | 3444 | 2952 | 24024 | 89279 | 89.3 | 0 | 13 | 0 | 0 |
| scan-BL-TL | B1 | 1 | 1 | None | 3444 | 2952 | 26800 | 92055 | 96.9 | 16 | 13 | 0 | 0 |
| scan-BL-TL | B2 | 1 | 1 | None | 3444 | 2952 | 51232 | 116487 | 135.0 | 48 | 13 | 2 | 1152 |
| scan-BL-TL | B1L | 1 | 1 | None | 3444 | 2952 | 25291 | 90546 | 87.0 | 5 | 13 | 0 | 0 |
| scan-BL-TL | B2L | 1 | 1 | None | 3444 | 2952 | 42176 | 107431 | 108.7 | 26 | 13 | 2 | 1152 |
| scan-BR-TL | B0 | 1 | 1 | None | 3444 | 2952 | 22479 | 87734 | 79.4 | 0 | 13 | 0 | 0 |
| scan-BR-TL | B1 | 1 | 1 | None | 3444 | 2952 | 25468 | 90723 | 93.4 | 16 | 13 | 0 | 0 |
| scan-BR-TL | B2 | 1 | 1 | None | 3444 | 2952 | 50335 | 115590 | 121.8 | 48 | 13 | 2 | 1152 |
| scan-BR-TL | B1L | 1 | 1 | None | 3444 | 2952 | 23746 | 89001 | 66.7 | 5 | 13 | 0 | 0 |
| scan-BR-TL | B2L | 1 | 1 | None | 3444 | 2952 | 40558 | 105813 | 102.9 | 26 | 13 | 2 | 1152 |
| scan-TR-TL | B0 | 1 | 1 | None | 3444 | 2952 | 22456 | 87711 | 71.2 | 0 | 13 | 0 | 0 |
| scan-TR-TL | B1 | 1 | 1 | None | 3444 | 2952 | 25376 | 90631 | 89.9 | 16 | 13 | 0 | 0 |
| scan-TR-TL | B2 | 1 | 1 | None | 3444 | 2952 | 49555 | 114810 | 105.0 | 48 | 13 | 2 | 1152 |
| scan-TR-TL | B1L | 1 | 1 | None | 3444 | 2952 | 23723 | 88978 | 80.2 | 5 | 13 | 0 | 0 |
| scan-TR-TL | B2L | 1 | 1 | None | 3444 | 2952 | 40029 | 105284 | 82.2 | 26 | 13 | 2 | 1152 |
| scan-reverse | B0 | 1 | 1 | None | 84 | 72 | 2637 | 25913 | 19.7 | 0 | 9 | 0 | 0 |
| scan-reverse | B1 | 1 | 1 | None | 84 | 72 | 5647 | 28923 | 24.0 | 16 | 9 | 0 | 0 |
| scan-reverse | B2 | 1 | 1 | None | 84 | 72 | 27341 | 50617 | 60.9 | 48 | 9 | 2 | 1152 |
| scan-reverse | B1L | 1 | 1 | None | 84 | 72 | 3918 | 27194 | 18.3 | 5 | 9 | 0 | 0 |
| scan-reverse | B2L | 1 | 1 | None | 84 | 72 | 17550 | 40826 | 38.1 | 26 | 9 | 2 | 1152 |
| true-scan-lazy-prev | B0 | 1 | 1 | None | 144 | 132 | 3232 | 25339 | 19.7 | 0 | 9 | 0 | 0 |
| true-scan-lazy-prev | B1 | 1 | 1 | None | 144 | 132 | 6378 | 28485 | 24.8 | 16 | 9 | 0 | 0 |
| true-scan-lazy-prev | B2 | 1 | 1 | None | 144 | 132 | 30623 | 52730 | 66.5 | 48 | 9 | 2 | 1152 |
| true-scan-lazy-prev | B1L | 1 | 1 | None | 144 | 132 | 4475 | 26582 | 21.0 | 5 | 9 | 0 | 0 |
| true-scan-lazy-prev | B2L | 1 | 1 | None | 144 | 132 | 20316 | 42423 | 39.6 | 26 | 9 | 2 | 1152 |
| wrong-early-skeleton | B0 | 1 | 1 | None | 2940 | 2940 | 29260 | 103256 | 72.1 | 0 | 13 | 0 | 0 |
| wrong-early-skeleton | B1 | 1 | 1 | None | 2940 | 2940 | 32432 | 106428 | 80.4 | 16 | 13 | 0 | 0 |
| wrong-early-skeleton | B2 | 1 | 1 | None | 2940 | 2940 | 56284 | 130280 | 119.6 | 48 | 13 | 2 | 1152 |
| wrong-early-skeleton | B1L | 1 | 1 | None | 2940 | 2940 | 30530 | 104526 | 67.8 | 5 | 13 | 0 | 0 |
| wrong-early-skeleton | B2L | 1 | 1 | None | 2940 | 2940 | 45958 | 119954 | 88.5 | 26 | 13 | 2 | 1152 |

### 30 个 PreviouslyOpenedDiagnosticSet（budget 25000）

三个变体的 train/heldout 结果逐题相同：d23f8c26=1/0（其余 train=0）；B1 左侧分解命中合计 64，B2 resumed 需求 0。在 25000 预算下该集合对两种机制都不敏感；它仍只是 previously-opened diagnostics。

## 阶段 A/B 诊断汇总

| 组 | 变体 | 左侧分解命中 | 需求键 | resumed | still-blocked | suspended | 新 VecT | 新 IntT | demand work | memo 失效 | memo 需求复用 |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| core | B0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| core | B1 | 16 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| core | B2 | 48 | 2 | 2 | 0 | 0 | 1152 | 1670 | 5824 | 23 | 0 |
| core | B1L | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| core | B2L | 26 | 2 | 2 | 0 | 0 | 1152 | 1670 | 5824 | 12 | 0 |
| regression | B0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| regression | B1 | 2122 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| regression | B2 | 408 | 16 | 16 | 0 | 0 | 10368 | 11690 | 45368 | 196 | 0 |
| regression | B1L | 203 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| regression | B2L | 329 | 35 | 35 | 0 | 0 | 32256 | 11690 | 89144 | 332 | 16 |
| stress | B0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| stress | B1 | 11638 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| stress | B2 | 15919 | 84 | 72 | 0 | 12 | 44928 | 55138 | 206040 | 3859 | 1758 |
| stress | B1L | 218 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| stress | B2L | 2668 | 82 | 71 | 0 | 11 | 44928 | 53424 | 202444 | 381 | 106 |
| diagnostic | B0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| diagnostic | B1 | 64 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| diagnostic | B2 | 64 | 8 | 0 | 0 | 8 | 0 | 0 | 0 | 0 | 2 |
| generated-dev | B0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| generated-dev | B1 | 3806 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| generated-dev | B2 | 3870 | 38 | 9 | 0 | 29 | 5760 | 6684 | 25604 | 636 | 926 |
| generated-dev | B1L | 266 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| generated-dev | B2L | 1064 | 66 | 36 | 0 | 30 | 23040 | 26720 | 102388 | 282 | 92 |
| generated-audit | B0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| generated-audit | B1 | 8875 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| generated-audit | B2 | 9003 | 77 | 22 | 0 | 55 | 17280 | 11702 | 59216 | 2260 | 2147 |
| generated-audit | B1L | 817 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| generated-audit | B2L | 5255 | 169 | 100 | 0 | 69 | 71424 | 63424 | 276516 | 943 | 241 |

suspended 需求 = 解析前 demand budget（25000）或总预算已耗尽而未解析的键；still-blocked = 解析后无新观察项或类型不支持。本轮没有 still-blocked（24 个操作数的一层组合总能产生新项），而 suspended 很多：说明在 B2 下预算不是被“无法生成”而是被“生成太多”占用。cache：memo 需求复用计 memo hit 时向上传播需求集合的次数；失效计域增长后被重学的条目。

## 代表性案例（可追踪链）

### stress I（B1 成功）

训练规格 → `Learn(CoordT; Γ=[v0,v1])`（每对象目标坐标）→ `coordAdd` 左侧条件化 a=Anchor(v1,·) 得到 VecT residual 子规格 v_i=t_i−a_i → `coordDelta` join（p、q 均为已观察锚点）→ 完整候选 → 原 Grid 验证 → 冻结选择后留出 exact。选中程序：`(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))`；first-exact work 83845，总 work 83882，portfolio 1，held-correct 1。B0 下同一子任务只有 `coord` 的两个 IntT 子任务且都为空（trace：`MRV immediate domains=[(0,0),(1,0)]`），map witness 被拒绝。

```text
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=134 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=166 children=[165,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=214 children=[182,213]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=216 children=[11,215]; coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=218 children=[11,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
```

### stress A（B1 失败：候选提取；事后无预算 cover 组装出 7024 个训练 exact 程序，见 out-of-protocol-diagnostics/assemblability）

同一条链在 A 的 DAG 中存在（`Nonempty VS_coordAdd node=135 children=[11,134]`，child 11 为含 `Anchor(v1,TL)` 的 Union，134 为 coordDelta join），map join 非空；但 cover（12500）与 saturation（25000）物化 0 个完整 AST，C 只到 20（完整程序 cost≈29），join 670（其中 coordAdd[v0] 374、coordDelta[v0] 171）。out-of-protocol 的 4 倍 saturation 复跑仍 0 个完整 AST（C=23）。第一个实际阻断的子任务：**候选提取**（固定 cover/saturation 预算下，场景级两行子规格的 join 级多样性）。 B1L 把 [v0] 上下文的左侧 residual 关掉后：train/held 1/1，join 27，程序 `(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))`。

```text
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=134 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=135 children=[11,134]; coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=136 children=[11,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=137 children=[57,136]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_place node=139 children=[7,138]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_map node=149 children=[140,148]; map witness: corresponding f(x_i)=y_i; element instances=6
Nonempty VS_coordDelta node=152 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
```

### stress B（B2：需求登记→解析→重学）

`coordAdd` 在 Γ=[v0,v1] 的 pool 中缺 VecT → 登记 (pool key, VecT) → 一轮后按签名生成 coordDelta/vec 组合、求值、合并（VecT 新项 4608）→ epoch+1 → 失效 374 个 memo 条目 → 重学。结果与 B1 相同（程序 `(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))`），总 work 116942 vs B1 87999：需求机制可达但在此无增益。

```text
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Nonempty VS_coordAdd node=89 children=[11,88]; coordinate/vector inverse: condition on left operand and deduce right component specification
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Nonempty VS_coordAdd node=281 children=[280,276]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=287 children=[285,286]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=289 children=[275,288]; coordinate/vector inverse: condition on left operand and deduce right component specification
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Nonempty VS_coordAdd node=342 children=[340,341]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=345 children=[343,344]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=347 children=[87,346]; coordinate/vector inverse: condition on left operand and deduce right component specification
```

### stress C（B0 成功 → B1 失败）

B0：train/held 1/1，join 37，C 到 26，程序 `(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coord(subtract(add(x(Anchor(fst(__r1b0),Center)),IntV (-1)),colorToInt(head(setToList(ObjectColors(objectOf(snd(__r1b0))))))),y(Anchor(snd(__r1b0),Center))))),place(objectOf(head(objects(v0))),coord(x(__cse0),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))`（无 coordAdd）。B1：join 1780（coordAdd[v0] 1090），左侧分解 1748，推导 109101 ms，0 个完整 AST。B1 没有删除 B0 的任何分解，它只是把同一预算分给了更多训练一致的备选；因此这是提取/调度瓶颈，不是 witness 错误。 B1L：1/1。

## 负结果与限制

- B1 的对称 residual 使训练一致 DAG 在弱约束子规格中爆炸；在现行“探索所有分解、保留所有结构代表、固定提取预算”的 R2 设计下，这直接转化为 train 失败（A/C/F/G、2 个 regression、全部 generated）。这不是 Base 不可表达（独立证书存在），也不是 witness 不支持（链在 DAG 中）；第一个阻断的子任务是候选提取（A/C/F）或推导预算耗尽（generated、两个 regression）。
- B2 在本轮没有改变任何 train/heldout 结果。一层签名组合产生的 VecT/IntT 观察项数量巨大（stress B2 新 VecT 44928），demand budget 常被前几个键耗尽（suspended 12 / 84），并且新 join 备选加剧了提取压力。H2 在“B1 已修复”的前提下测试，但 B1 本身没有干净修复，所以 H2 的否定结论只对本设置成立。
- 新生成样例的 B0 结果（train exact、留出错）说明原搜索对多对象随机形状实例选择了不泛化的训练一致程序；候选数增加不等于泛化提高，held-correct 列才是覆盖证据。
- 超时内部证据缺失记 n/a；两个 regression 超时经无 deadline 复跑确认是预算失败。wall-clock 受 3 并发与主机差异影响，不作加速结论。一次 cgroup OOM 是执行失败，已单独重跑。
- 30 个 diagnostic 在 25000 预算下对两机制不敏感，仍称 previously-opened。
- B1L 是事后规则；它恢复 A/B/I 并保住 C 的证据来自开发集，其 audit 数字不能称未见。

## 下一阶段判断

证据最支持的动作是**先修已定位的瓶颈，而不是继续 demand closure 或局部抽象反馈**：双向 witness 已经使 A/B/I 的链可达（H1 的机制部分成立），真正阻断的是“弱约束子规格中的 residual/join 扇出 × 固定提取预算”。开发证据 B1L（仅把左侧 residual 限制在元素局部基点）在相同预算下 stress 留出 7/10、regression 留出 16/17、generated-audit 留出 5/12，说明扇出而非 witness 语义是瓶颈。下一步应在不改预算口径的前提下，把“residual 不得是规格的整体平移”做成有理论依据的通用条件（例如要求 residual 子规格相对父规格有信息增益，或在 cover/saturation 中按子规格约束强度调度），**重新生成未见 audit 样例**后以同一受控矩阵检验；demand closure 应在提取瓶颈解决后、以“候选覆盖相同的工作量”重新评估：本轮 B2 的新增信息被提取预算吞没，而 B2L 相对 B1L 在 stress 上没有增益（6/10 vs 7/10），且改变了部分任务的选择结果。
