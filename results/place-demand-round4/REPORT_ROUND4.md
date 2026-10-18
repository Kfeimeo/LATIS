# place-demand 第四轮：在 Q 上增加单一可解释的分支排序策略（B1QS）

binary `a2aa17eb69a06474…`；预算与前几轮相同；固定 3 worker。策略 S：在一次 Learn 调用内，对分解按（无 forward 观察且未在 memo 中解决的子任务数 升序，已在 memo 中解决的子任务数 降序，原成本估计 升序，原索引）排序；只用已缓存的廉价信号，每个被评分的分支计 1 单位工作（`branch_order_scored`）；不删除任何分支；队列比例、评分公式之外的部分与 B1Q 完全相同；未与 X 组合。

| 组 | 变体 | 完成 | 训练正确 | 留出正确 | 超时 |
|---|---|---:|---:|---:|---:|
| core | B1Q | 1 | 1 | 1 | 0 |
| core | B1QS | 1 | 1 | 1 | 0 |
| regression | B1Q | 17 | 16 | 16 | 0 |
| regression | B1QS | 17 | 16 | 16 | 0 |
| stress | B1Q | 10 | 8 | 6 | 0 |
| stress | B1QS | 10 | 8 | 6 | 0 |
| generated-dev | B1Q | 4 | 4 | 3 | 0 |
| generated-dev | B1QS | 4 | 4 | 3 | 0 |
| generated-audit | B1Q | 12 | 11 | 5 | 1 |
| generated-audit | B1QS | 12 | 11 | 5 | 1 |
| generated-round2 | B1Q | 10 | 7 | 2 | 1 |
| generated-round2 | B1QS | 10 | 7 | 2 | 1 |
| generated-round3 | B1Q | 6 | 6 | 1 | 0 |
| generated-round3 | B1QS | 6 | 6 | 1 | 0 |

## 结果不同的任务（分层）

无。

## 工作量与首个 exact 的变化（结果相同的任务）

在 53 个两者都训练 exact 的任务上，B1QS 的 first-exact work 比 B1Q 小的有 1 个，大的有 52 个（评分本身的计费已含在 work 内）。work 是离散计数，不作 wall-clock 结论。

## 判断

合计 train B1Q 53 / B1QS 53，heldout B1Q 34 / B1QS 34。S 没有独立收益，不进入与 X 的组合。
