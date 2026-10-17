# place-demand 第二轮：公平调度与惰性提取能否在保留双向 witness 分解的前提下获得局部限制的效率？

## 对第一轮报告的更正

1. **credit-aware 剪枝的“结果中性”说法过强。** 能论证的只有无预算截断下的 DAG 等价：被剪的 residual 子任务 credit=0，`learnBase` 在 remaining==0 时不调用 witness、无 invention、pool key 与父任务相同，只能由 forward 观察或 shared 常数闭合，而这正是剪枝条件。但在有限总预算下剪枝改变了 MRV lookahead 的域计数（兄弟子任务求解顺序）和工作消耗序列，截断点随之变化，不能推出结果不变。本轮用开关 `bidirectional-unpruned`（B1U）在协议预算下实测（下表），原报告中“结果中性”改为“无界等价有论证，有界中性未证明，实测见 B1U”。
2. **“整体平移 residual”不能硬排除。** t_i − a_i = c 是合法的常数位移规则，典型情形是 scan seed（Γ=[v0]）里“首对象平移 c”；B1L 的硬限制删除了这条路径。B1L 只作为扇出诊断的参考，不再作为改进候选；本轮改为可恢复的延后调度（B1Q），并冻结了必须使用非局部基点的 audit 规则（seedshift_x/y）来测量局部偏好的代价。

## A 的失败层级（事后诊断，不注入求解）

`AssembleDiag.hs`：对 stress A 用 B1 推导得到同一 DAG（2902 节点、670 join），然后以 10^8 次尝试上限运行**原 cover 算法**（同一 Join assemble 函数、同一分解内关联约束、同一原 Grid verifier）。结果：

```text
deduction: root=2902 nodes=2902 work=50684 joins=670
unbounded cover: candidates=7024 attempts=149768
training-exact assembled programs: 7024
  cost=29 heldout(post-hoc)=True symbols=["Anchor","canvasSize","coordAdd","coordDelta","head","lambda","literal","map","mkScene","objectOf","objects","place","tail"]
  (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))
  cost=29 heldout(post-hoc)=True symbols=["Anchor","canvasSize","coordAdd","coordDelta","head","lambda","literal","map","mkScene","objectOf","objects","place","tail"]
  (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BR))))),objects(v0))))
  cost=29 heldout(post-hoc)=True symbols=["Anchor","canvasSize","coordAdd","coordDelta","head","lambda","literal","map","mkScene","objectOf","objects","place","tail"]
  (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),Center))))),objects(v0))))
  cost=29 heldout(post-hoc)=True symbols=["Anchor","canvasSize","coordAdd","coordDelta","head","lambda","literal","map","mkScene","objectOf","objects","place","tail"]
  (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TL))))),objects(v0))))
  cost=29 heldout(post-hoc)=True symbols=["Anchor","canvasSize","coordAdd","coordDelta","head","lambda","literal","map","mkScene","objectOf","objects","place","tail"]
```

无预算 cover 组装出 7024 个训练 exact 程序（最低 cost 29，事后留出 exact），需要 149768 次 assemble 尝试；协议的 12500 次得到 0 个。因此 A 在 B1 下的第一个阻断层是**候选提取**（固定 cover 预算 × join 级多样性），不是关联约束、binder/env 或 DAG 构造问题。

## B1U：取消 credit-aware 剪枝（协议预算）

| 组 | B1（第一轮） | B1U | 结果不同的任务 |
|---|---|---|---|
| stress | train 4/10，留出 4/10 | train 3/10，留出 3/10，超时 0 | J-no-useful-abstraction: B1 1/1 → B1U 0/0 |
| regression | train 14/17，留出 14/17 | train 14/17，留出 14/17，超时 0 | 无 |

B1U 与 B1 使用同一分解集合（剪枝只去掉 credit=0 且既非观察项也非常数的 residual 子任务），差异完全来自有限预算下的工作消耗与调度顺序。

## 第二轮矩阵

binary `73d3c1c7a47466ea…`，预算与第一轮相同（250000 / cost 96 / saturation 25000 / 300 s），B1Q/B1QX 的延后份额 62500（含在总预算内），固定 3 worker。generated-round2 是冻结于任何第二轮求解之前的新 audit（manifest hash `474087d241041af1…`）：audit2-same（同规则新实例）、audit2-nonlocal（seedshift_x/y，seed 需要非局部基点+常数位移）、audit2-newstruct（mirror_relative）。

执行失败：矩阵中被主机 cgroup OOM 杀死的行（3 并发时单个 scan-* 任务 RSS 约 5.8 GB）已用 `--workers 1` 单独重跑并替换（重跑 protocol 另存为 `protocol-rerun-*.json`）；当前仍标 ImplementationBug 的行：[('regression', 'wrong-early-skeleton', 'B1Q')]。

| 组 | 变体 | 完成 | 训练正确 | 留出正确 | 超时 |
|---|---|---:|---:|---:|---:|
| core | B0 | 1 | 1 | 1 | 0 |
| core | B1 | 1 | 1 | 1 | 0 |
| core | B1L | 1 | 1 | 1 | 0 |
| core | B1Q | 1 | 1 | 1 | 0 |
| core | B1X | 1 | 1 | 1 | 0 |
| core | B1QX | 1 | 1 | 1 | 0 |
| regression | B0 | 17 | 16 | 16 | 0 |
| regression | B1 | 17 | 14 | 14 | 0 |
| regression | B1L | 16 | 15 | 15 | 0 |
| regression | B1Q | 17 | 15 | 15 | 0 |
| regression | B1X | 17 | 14 | 14 | 0 |
| regression | B1QX | 17 | 16 | 16 | 0 |
| stress | B0 | 10 | 6 | 3 | 0 |
| stress | B1 | 10 | 4 | 4 | 0 |
| stress | B1L | 10 | 8 | 7 | 0 |
| stress | B1Q | 10 | 8 | 6 | 0 |
| stress | B1X | 10 | 8 | 7 | 0 |
| stress | B1QX | 10 | 8 | 7 | 0 |
| generated-dev | B0 | 4 | 2 | 0 | 0 |
| generated-dev | B1 | 4 | 0 | 0 | 1 |
| generated-dev | B1L | 4 | 4 | 3 | 0 |
| generated-dev | B1Q | 4 | 4 | 3 | 0 |
| generated-dev | B1X | 4 | 1 | 1 | 1 |
| generated-dev | B1QX | 4 | 3 | 2 | 1 |
| generated-audit | B0 | 12 | 10 | 1 | 0 |
| generated-audit | B1 | 12 | 0 | 0 | 4 |
| generated-audit | B1L | 12 | 12 | 5 | 0 |
| generated-audit | B1Q | 12 | 11 | 5 | 1 |
| generated-audit | B1X | 12 | 3 | 2 | 4 |
| generated-audit | B1QX | 12 | 11 | 5 | 1 |
| generated-round2 | B0 | 10 | 7 | 1 | 0 |
| generated-round2 | B1 | 10 | 1 | 1 | 2 |
| generated-round2 | B1L | 10 | 8 | 3 | 0 |
| generated-round2 | B1Q | 10 | 7 | 2 | 1 |
| generated-round2 | B1X | 10 | 3 | 2 | 2 |
| generated-round2 | B1QX | 10 | 5 | 2 | 4 |

### generated-round2 按家族

| 家族 | 变体 | 训练正确 | 留出正确 |
|---|---|---:|---:|
| audit2-same | B0 | 3/5 | 0/5 |
| audit2-same | B1 | 0/5 | 0/5 |
| audit2-same | B1L | 4/5 | 2/5 |
| audit2-same | B1Q | 3/5 | 1/5 |
| audit2-same | B1X | 1/5 | 1/5 |
| audit2-same | B1QX | 3/5 | 1/5 |
| audit2-nonlocal | B0 | 3/3 | 1/3 |
| audit2-nonlocal | B1 | 1/3 | 1/3 |
| audit2-nonlocal | B1L | 3/3 | 1/3 |
| audit2-nonlocal | B1Q | 3/3 | 1/3 |
| audit2-nonlocal | B1X | 2/3 | 1/3 |
| audit2-nonlocal | B1QX | 2/3 | 1/3 |
| audit2-newstruct | B0 | 1/2 | 0/2 |
| audit2-newstruct | B1 | 0/2 | 0/2 |
| audit2-newstruct | B1L | 1/2 | 0/2 |
| audit2-newstruct | B1Q | 1/2 | 0/2 |
| audit2-newstruct | B1X | 0/2 | 0/2 |
| audit2-newstruct | B1QX | 0/2 | 0/2 |

### 逐题

#### core

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | join_nodes | cost_bound_reached | materialized_complete_asts | deferred_branches | deferred_released | deferred_pass_work | cover_lazy_candidates |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 03560426 | B0 | 1 | 1 | None | 1026 | 1026 | 8362 | 49313 | 40.8 | 13 | 96 | 1026 | 0 | 0 | 0 | 0 |
| 03560426 | B1 | 1 | 1 | None | 1026 | 1026 | 13440 | 54391 | 54.8 | 13 | 96 | 1026 | 0 | 0 | 0 | 0 |
| 03560426 | B1L | 1 | 1 | None | 1026 | 1026 | 10251 | 51202 | 44.1 | 13 | 96 | 1026 | 0 | 0 | 0 | 0 |
| 03560426 | B1Q | 1 | 1 | None | 1026 | 1026 | 14085 | 55036 | 47.4 | 13 | 96 | 1026 | 11 | 1 | 3834 | 0 |
| 03560426 | B1X | 1 | 1 | None | 1026 | 1026 | 13400 | 54259 | 45.0 | 13 | 96 | 1026 | 0 | 0 | 0 | 60 |
| 03560426 | B1QX | 1 | 1 | None | 1026 | 1026 | 14045 | 54904 | 49.7 | 13 | 96 | 1026 | 11 | 1 | 3834 | 60 |

#### regression

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | join_nodes | cost_bound_reached | materialized_complete_asts | deferred_branches | deferred_released | deferred_pass_work | cover_lazy_candidates |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| constant-transform | B0 | 1 | 1 | None | 1412 | 1412 | 27639 | 93523 | 14.8 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| constant-transform | B1 | 1 | 1 | None | 1412 | 1412 | 27639 | 93523 | 14.8 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| constant-transform | B1L | 1 | 1 | None | 1412 | 1412 | 27639 | 93523 | 14.7 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| constant-transform | B1Q | 1 | 1 | None | 1412 | 1412 | 27639 | 93523 | 14.6 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| constant-transform | B1X | 1 | 1 | None | 1412 | 1412 | 27544 | 93210 | 14.9 | 11 | 29 | 1412 | 0 | 0 | 0 | 240 |
| constant-transform | B1QX | 1 | 1 | None | 1412 | 1412 | 27544 | 93210 | 15.2 | 11 | 29 | 1412 | 0 | 0 | 0 | 240 |
| equivalent-expressions | B0 | 1 | 1 | None | 256 | 256 | 30167 | 111984 | 17.9 | 9 | 29 | 256 | 0 | 0 | 0 | 0 |
| equivalent-expressions | B1 | 1 | 1 | None | 1369 | 1369 | 52488 | 164570 | 30.1 | 41 | 24 | 1369 | 0 | 0 | 0 | 0 |
| equivalent-expressions | B1L | 1 | 1 | None | 459 | 459 | 32682 | 116417 | 15.7 | 10 | 27 | 459 | 0 | 0 | 0 | 0 |
| equivalent-expressions | B1Q | 1 | 1 | None | 717 | 717 | 52870 | 165162 | 26.0 | 49 | 23 | 717 | 15 | 1 | 2492 | 0 |
| equivalent-expressions | B1X | 1 | 1 | None | 1369 | 1369 | 50882 | 161369 | 38.2 | 41 | 24 | 1369 | 0 | 0 | 0 | 3544 |
| equivalent-expressions | B1QX | 1 | 1 | None | 1302 | 1302 | 52066 | 163589 | 41.1 | 49 | 23 | 1302 | 15 | 1 | 2492 | 3478 |
| filter-color | B0 | 1 | 1 | None | 142 | 122 | 69102 | 157105 | 39.0 | 352 | 25 | 142 | 0 | 0 | 0 | 0 |
| filter-color | B1 | 1 | 1 | None | 142 | 122 | 69102 | 157105 | 36.7 | 352 | 25 | 142 | 0 | 0 | 0 | 0 |
| filter-color | B1L | 1 | 1 | None | 142 | 122 | 69102 | 157105 | 38.4 | 352 | 25 | 142 | 0 | 0 | 0 | 0 |
| filter-color | B1Q | 1 | 1 | None | 142 | 122 | 69102 | 157105 | 36.5 | 352 | 25 | 142 | 0 | 0 | 0 | 0 |
| filter-color | B1X | 1 | 1 | None | 3393 | 2782 | 81588 | 194563 | 69.5 | 352 | 25 | 3393 | 0 | 0 | 0 | 7908 |
| filter-color | B1QX | 1 | 1 | None | 3393 | 2782 | 81588 | 194563 | 71.0 | 352 | 25 | 3393 | 0 | 0 | 0 | 7908 |
| fold-bbox | B0 | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.6 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| fold-bbox | B1 | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.5 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| fold-bbox | B1L | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.5 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| fold-bbox | B1Q | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.5 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| fold-bbox | B1X | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.6 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| fold-bbox | B1QX | 0 | 0 | BaseExpressibilityUnknown | 0 | 0 | 0 | 37 | 0.6 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| grid-without-prev | B0 | 1 | 1 | None | 581 | 437 | 40005 | 95623 | 17.9 | 26 | 33 | 581 | 0 | 0 | 0 | 0 |
| grid-without-prev | B1 | 1 | 1 | None | 717 | 573 | 46019 | 105236 | 18.1 | 83 | 32 | 717 | 0 | 0 | 0 | 0 |
| grid-without-prev | B1L | 1 | 1 | None | 612 | 468 | 42031 | 99140 | 19.7 | 28 | 33 | 612 | 0 | 0 | 0 | 0 |
| grid-without-prev | B1Q | 1 | 1 | None | 537 | 393 | 46728 | 107225 | 18.1 | 55 | 30 | 537 | 40 | 1 | 1514 | 0 |
| grid-without-prev | B1X | 1 | 1 | None | 717 | 573 | 45230 | 103658 | 17.1 | 83 | 32 | 717 | 0 | 0 | 0 | 816 |
| grid-without-prev | B1QX | 1 | 1 | None | 537 | 393 | 46044 | 105857 | 17.4 | 55 | 30 | 537 | 40 | 1 | 1514 | 750 |
| iterate-chain | B0 | 1 | 1 | None | 214 | 214 | 30291 | 112294 | 18.8 | 9 | 31 | 214 | 0 | 0 | 0 | 0 |
| iterate-chain | B1 | 1 | 1 | None | 1041 | 1041 | 51243 | 178284 | 26.4 | 77 | 24 | 1041 | 0 | 0 | 0 | 0 |
| iterate-chain | B1L | 1 | 1 | None | 393 | 393 | 40547 | 136344 | 15.5 | 23 | 25 | 393 | 0 | 0 | 0 | 0 |
| iterate-chain | B1Q | 1 | 1 | None | 1020 | 1020 | 53823 | 171715 | 26.2 | 87 | 23 | 1020 | 14 | 3 | 2978 | 0 |
| iterate-chain | B1X | 1 | 1 | None | 1041 | 1041 | 49811 | 175430 | 32.3 | 77 | 24 | 1041 | 0 | 0 | 0 | 3000 |
| iterate-chain | B1QX | 1 | 1 | None | 1020 | 1020 | 52453 | 169003 | 34.4 | 87 | 23 | 1020 | 14 | 3 | 2978 | 2854 |
| map-recolor | B0 | 1 | 1 | None | 1412 | 1412 | 27656 | 93551 | 15.4 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-recolor | B1 | 1 | 1 | None | 1412 | 1412 | 27656 | 93551 | 15.0 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-recolor | B1L | 1 | 1 | None | 1412 | 1412 | 27656 | 93551 | 15.6 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-recolor | B1Q | 1 | 1 | None | 1412 | 1412 | 27656 | 93551 | 15.0 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-recolor | B1X | 1 | 1 | None | 1412 | 1412 | 27561 | 93238 | 14.9 | 11 | 29 | 1412 | 0 | 0 | 0 | 240 |
| map-recolor | B1QX | 1 | 1 | None | 1412 | 1412 | 27561 | 93238 | 15.2 | 11 | 29 | 1412 | 0 | 0 | 0 | 240 |
| map-reflectH | B0 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 15.3 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-reflectH | B1 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 14.4 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-reflectH | B1L | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 15.2 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-reflectH | B1Q | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 14.5 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-reflectH | B1X | 1 | 1 | None | 1412 | 1412 | 27547 | 93224 | 14.9 | 11 | 29 | 1412 | 0 | 0 | 0 | 240 |
| map-reflectH | B1QX | 1 | 1 | None | 1412 | 1412 | 27547 | 93224 | 14.3 | 11 | 29 | 1412 | 0 | 0 | 0 | 240 |
| map-rotate90 | B0 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 14.6 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-rotate90 | B1 | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 14.0 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-rotate90 | B1L | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 14.6 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-rotate90 | B1Q | 1 | 1 | None | 1412 | 1412 | 27642 | 93537 | 14.4 | 11 | 29 | 1412 | 0 | 0 | 0 | 0 |
| map-rotate90 | B1X | 1 | 1 | None | 1412 | 1412 | 27547 | 93224 | 14.7 | 11 | 29 | 1412 | 0 | 0 | 0 | 240 |
| map-rotate90 | B1QX | 1 | 1 | None | 1412 | 1412 | 27547 | 93224 | 14.5 | 11 | 29 | 1412 | 0 | 0 | 0 | 240 |
| map-scan-ambiguity | B0 | 1 | 1 | None | 427 | 366 | 58789 | 160713 | 131.7 | 66 | 33 | 427 | 0 | 0 | 0 | 0 |
| map-scan-ambiguity | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250042 | 288.2 | 1682 | 0 | 0 | 0 | 0 | 0 | 0 |
| map-scan-ambiguity | B1L | 1 | 1 | None | 462 | 398 | 82970 | 138136 | 141.6 | 57 | 33 | 462 | 0 | 0 | 0 | 0 |
| map-scan-ambiguity | B1Q | 1 | 1 | None | 474 | 410 | 155298 | 250000 | 195.1 | 401 | 23 | 474 | 531 | 15 | 62627 | 0 |
| map-scan-ambiguity | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250042 | 285.8 | 1682 | 0 | 0 | 0 | 0 | 0 | 0 |
| map-scan-ambiguity | B1QX | 1 | 1 | None | 1616 | 815 | 155298 | 250000 | 216.2 | 401 | 23 | 1616 | 531 | 15 | 62627 | 3942 |
| map-translate | B0 | 1 | 1 | None | 368 | 46 | 63016 | 120896 | 161.4 | 46 | 37 | 368 | 0 | 0 | 0 | 0 |
| map-translate | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250046 | 274.8 | 2163 | 0 | 0 | 0 | 0 | 0 | 0 |
| map-translate | B1L | 1 | 1 | None | 475 | 85 | 83983 | 139390 | 179.3 | 54 | 35 | 475 | 0 | 0 | 0 | 0 |
| map-translate | B1Q | 1 | 1 | None | 545 | 126 | 155963 | 250000 | 222.6 | 387 | 26 | 545 | 450 | 15 | 62521 | 0 |
| map-translate | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250046 | 281.5 | 2163 | 0 | 0 | 0 | 0 | 0 | 0 |
| map-translate | B1QX | 1 | 1 | None | 1687 | 76 | 155963 | 250000 | 248.5 | 387 | 26 | 1687 | 450 | 15 | 62521 | 4370 |
| scan-BL-TL | B0 | 1 | 1 | None | 3444 | 2952 | 24024 | 89279 | 80.1 | 13 | 96 | 3444 | 0 | 0 | 0 | 0 |
| scan-BL-TL | B1 | 1 | 1 | None | 3444 | 2952 | 26800 | 92055 | 86.8 | 13 | 96 | 3444 | 0 | 0 | 0 | 0 |
| scan-BL-TL | B1L | 1 | 1 | None | 3444 | 2952 | 25291 | 90546 | 74.2 | 13 | 96 | 3444 | 0 | 0 | 0 | 0 |
| scan-BL-TL | B1Q | 1 | 1 | None | 3444 | 2952 | 27424 | 92679 | 79.6 | 13 | 96 | 3444 | 11 | 1 | 2133 | 0 |
| scan-BL-TL | B1X | 1 | 1 | None | 3444 | 2952 | 26748 | 91889 | 88.0 | 13 | 96 | 3444 | 0 | 0 | 0 | 90 |
| scan-BL-TL | B1QX | 1 | 1 | None | 3444 | 2952 | 27372 | 92513 | 77.0 | 13 | 96 | 3444 | 11 | 1 | 2133 | 90 |
| scan-BR-TL | B0 | 1 | 1 | None | 3444 | 2952 | 22479 | 87734 | 76.5 | 13 | 96 | 3444 | 0 | 0 | 0 | 0 |
| scan-BR-TL | B1 | 1 | 1 | None | 3444 | 2952 | 25468 | 90723 | 81.9 | 13 | 96 | 3444 | 0 | 0 | 0 | 0 |
| scan-BR-TL | B1L | 1 | 1 | None | 3444 | 2952 | 23746 | 89001 | 64.5 | 13 | 96 | 3444 | 0 | 0 | 0 | 0 |
| scan-BR-TL | B1Q | 1 | 1 | None | 3444 | 2952 | 26073 | 91328 | 69.7 | 13 | 96 | 3444 | 11 | 1 | 2327 | 0 |
| scan-BR-TL | B1X | 1 | 1 | None | 3444 | 2952 | 25416 | 90557 | 81.5 | 13 | 96 | 3444 | 0 | 0 | 0 | 90 |
| scan-BR-TL | B1QX | 1 | 1 | None | 3444 | 2952 | 26021 | 91162 | 71.9 | 13 | 96 | 3444 | 11 | 1 | 2327 | 90 |
| scan-TR-TL | B0 | 1 | 1 | None | 3444 | 2952 | 22456 | 87711 | 69.7 | 13 | 96 | 3444 | 0 | 0 | 0 | 0 |
| scan-TR-TL | B1 | 1 | 1 | None | 3444 | 2952 | 25376 | 90631 | 94.3 | 13 | 96 | 3444 | 0 | 0 | 0 | 0 |
| scan-TR-TL | B1L | 1 | 1 | None | 3444 | 2952 | 23723 | 88978 | 66.3 | 13 | 96 | 3444 | 0 | 0 | 0 | 0 |
| scan-TR-TL | B1Q | 1 | 1 | None | 3444 | 2952 | 25958 | 91213 | 87.4 | 13 | 96 | 3444 | 11 | 1 | 2235 | 0 |
| scan-TR-TL | B1X | 1 | 1 | None | 3444 | 2952 | 25324 | 90465 | 83.3 | 13 | 96 | 3444 | 0 | 0 | 0 | 90 |
| scan-TR-TL | B1QX | 1 | 1 | None | 3444 | 2952 | 25906 | 91047 | 77.0 | 13 | 96 | 3444 | 11 | 1 | 2235 | 90 |
| scan-reverse | B0 | 1 | 1 | None | 84 | 72 | 2637 | 25913 | 16.8 | 9 | 96 | 84 | 0 | 0 | 0 | 0 |
| scan-reverse | B1 | 1 | 1 | None | 84 | 72 | 5647 | 28923 | 22.5 | 9 | 96 | 84 | 0 | 0 | 0 | 0 |
| scan-reverse | B1L | 1 | 1 | None | 84 | 72 | 3918 | 27194 | 18.9 | 9 | 96 | 84 | 0 | 0 | 0 | 0 |
| scan-reverse | B1Q | 1 | 1 | None | 84 | 72 | 6252 | 29528 | 22.5 | 9 | 96 | 84 | 11 | 1 | 2334 | 0 |
| scan-reverse | B1X | 1 | 1 | None | 84 | 72 | 5620 | 28838 | 21.0 | 9 | 96 | 84 | 0 | 0 | 0 | 33 |
| scan-reverse | B1QX | 1 | 1 | None | 84 | 72 | 6225 | 29443 | 23.0 | 9 | 96 | 84 | 11 | 1 | 2334 | 33 |
| true-scan-lazy-prev | B0 | 1 | 1 | None | 144 | 132 | 3232 | 25339 | 18.3 | 9 | 96 | 144 | 0 | 0 | 0 | 0 |
| true-scan-lazy-prev | B1 | 1 | 1 | None | 144 | 132 | 6378 | 28485 | 24.1 | 9 | 96 | 144 | 0 | 0 | 0 | 0 |
| true-scan-lazy-prev | B1L | 1 | 1 | None | 144 | 132 | 4475 | 26582 | 20.4 | 9 | 96 | 144 | 0 | 0 | 0 | 0 |
| true-scan-lazy-prev | B1Q | 1 | 1 | None | 144 | 132 | 7013 | 29120 | 25.7 | 9 | 96 | 144 | 11 | 1 | 2538 | 0 |
| true-scan-lazy-prev | B1X | 1 | 1 | None | 144 | 132 | 6346 | 28385 | 23.1 | 9 | 96 | 144 | 0 | 0 | 0 | 48 |
| true-scan-lazy-prev | B1QX | 1 | 1 | None | 144 | 132 | 6981 | 29020 | 24.7 | 9 | 96 | 144 | 11 | 1 | 2538 | 48 |
| wrong-early-skeleton | B0 | 1 | 1 | None | 2940 | 2940 | 29260 | 103256 | 68.9 | 13 | 56 | 2940 | 0 | 0 | 0 | 0 |
| wrong-early-skeleton | B1 | 1 | 1 | None | 2940 | 2940 | 32432 | 106428 | 80.6 | 13 | 56 | 2940 | 0 | 0 | 0 | 0 |
| wrong-early-skeleton | B1Q | 0 | 0 | ImplementationBug | n/a | 2940 | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| wrong-early-skeleton | B1X | 1 | 1 | None | 2940 | 2940 | 32366 | 106216 | 76.9 | 13 | 56 | 2940 | 0 | 0 | 0 | 132 |
| wrong-early-skeleton | B1QX | 1 | 1 | None | 2940 | 2940 | 33001 | 106851 | 80.0 | 13 | 56 | 2940 | 11 | 1 | 2537 | 132 |

#### stress

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | join_nodes | cost_bound_reached | materialized_complete_asts | deferred_branches | deferred_released | deferred_pass_work | cover_lazy_candidates |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| A-absolute-relative | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 1161 | 6.7 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| A-absolute-relative | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 88184 | 71.1 | 670 | 20 | 0 | 0 | 0 | 0 | 0 |
| A-absolute-relative | B1L | 1 | 1 | None | 2408 | 2408 | 47063 | 104054 | 42.0 | 27 | 26 | 2408 | 0 | 0 | 0 | 0 |
| A-absolute-relative | B1Q | 1 | 1 | None | 2409 | 2409 | 81136 | 145294 | 81.5 | 150 | 20 | 2409 | 435 | 4 | 26705 | 0 |
| A-absolute-relative | B1X | 1 | 1 | None | 4711 | 4711 | 100684 | 166095 | 150.5 | 670 | 20 | 4711 | 0 | 0 | 0 | 332 |
| A-absolute-relative | B1QX | 1 | 1 | None | 2165 | 1940 | 81136 | 146012 | 83.5 | 150 | 20 | 2165 | 435 | 4 | 26705 | 3058 |
| B-repeated-progression | B0 | 1 | 0 | AbstractionMissing | 679 | 0 | 50333 | 115241 | 44.8 | 31 | 25 | 679 | 0 | 0 | 0 | 0 |
| B-repeated-progression | B1 | 1 | 1 | None | 1 | 1 | 87967 | 87999 | 88.6 | 171 | 20 | 1 | 0 | 0 | 0 | 0 |
| B-repeated-progression | B1L | 1 | 1 | None | 678 | 211 | 55858 | 118675 | 39.2 | 45 | 22 | 774 | 0 | 0 | 0 | 0 |
| B-repeated-progression | B1Q | 1 | 1 | None | 1 | 1 | 73454 | 73486 | 66.1 | 163 | 20 | 1 | 297 | 4 | 30071 | 0 |
| B-repeated-progression | B1X | 1 | 1 | None | 1790 | 207 | 100442 | 163259 | 123.1 | 171 | 20 | 1886 | 0 | 0 | 0 | 3328 |
| B-repeated-progression | B1QX | 1 | 1 | None | 1706 | 207 | 85929 | 148748 | 95.6 | 163 | 20 | 1802 | 297 | 4 | 30071 | 3160 |
| C-scene-axis | B0 | 1 | 1 | None | 671 | 101 | 49943 | 154738 | 67.5 | 37 | 26 | 671 | 0 | 0 | 0 | 0 |
| C-scene-axis | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 123460 | 109.9 | 1780 | 19 | 0 | 0 | 0 | 0 | 0 |
| C-scene-axis | B1L | 1 | 1 | None | 671 | 101 | 57545 | 162340 | 76.3 | 37 | 26 | 671 | 0 | 0 | 0 | 0 |
| C-scene-axis | B1Q | 1 | 0 | AbstractionMissing | 1 | 0 | 89741 | 89837 | 94.5 | 443 | 19 | 1 | 944 | 8 | 36282 | 0 |
| C-scene-axis | B1X | 1 | 1 | None | 320 | 36 | 135960 | 250000 | 153.3 | 1785 | 19 | 320 | 0 | 0 | 0 | 553 |
| C-scene-axis | B1QX | 1 | 1 | None | 931 | 133 | 102181 | 222301 | 157.7 | 453 | 19 | 931 | 944 | 8 | 36282 | 2208 |
| D-object-sufficient | B0 | 1 | 1 | None | 1 | 1 | 35 | 38 | 0.6 | 1 | 96 | 1 | 0 | 0 | 0 | 0 |
| D-object-sufficient | B1 | 1 | 1 | None | 1 | 1 | 35 | 38 | 0.6 | 1 | 96 | 1 | 0 | 0 | 0 | 0 |
| D-object-sufficient | B1L | 1 | 1 | None | 1 | 1 | 35 | 38 | 0.6 | 1 | 96 | 1 | 0 | 0 | 0 | 0 |
| D-object-sufficient | B1Q | 1 | 1 | None | 1 | 1 | 35 | 38 | 0.6 | 1 | 96 | 1 | 0 | 0 | 0 | 0 |
| D-object-sufficient | B1X | 1 | 1 | None | 1 | 1 | 33 | 36 | 0.6 | 1 | 96 | 1 | 0 | 0 | 0 | 1 |
| D-object-sufficient | B1QX | 1 | 1 | None | 1 | 1 | 33 | 36 | 0.5 | 1 | 96 | 1 | 0 | 0 | 0 | 1 |
| E-local-better | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 1169 | 6.5 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| E-local-better | B1 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 7311 | 17.1 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| E-local-better | B1L | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 3145 | 9.0 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| E-local-better | B1Q | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 8216 | 19.3 | 0 | 96 | 0 | 35 | 3 | 5071 | 0 |
| E-local-better | B1X | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 7311 | 18.5 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| E-local-better | B1QX | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 8216 | 19.7 | 0 | 96 | 0 | 35 | 3 | 5071 | 0 |
| F-global-better | B0 | 1 | 0 | AbstractionMissing | 1364 | 45 | 59118 | 185826 | 85.8 | 48 | 23 | 1502 | 0 | 0 | 0 | 0 |
| F-global-better | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 203843 | 171.9 | 4153 | 19 | 0 | 0 | 0 | 0 | 0 |
| F-global-better | B1L | 1 | 0 | AbstractionMissing | 1364 | 45 | 66048 | 192756 | 93.8 | 48 | 23 | 1502 | 0 | 0 | 0 | 0 |
| F-global-better | B1Q | 1 | 0 | AbstractionMissing | 1 | 0 | 116117 | 116193 | 130.7 | 762 | 20 | 1 | 2214 | 9 | 62518 | 0 |
| F-global-better | B1X | 1 | 0 | AbstractionMissing | 621 | 96 | 216343 | 250000 | 189.4 | 4158 | 19 | 621 | 0 | 0 | 0 | 1116 |
| F-global-better | B1QX | 1 | 0 | AbstractionMissing | 981 | 42 | 128566 | 249526 | 199.3 | 770 | 20 | 981 | 2214 | 9 | 62518 | 2510 |
| G-fusion | B0 | 1 | 0 | AbstractionMissing | 4491 | 0 | 52332 | 120671 | 104.1 | 24 | 25 | 4491 | 0 | 0 | 0 | 0 |
| G-fusion | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 153715 | 159.3 | 1583 | 20 | 0 | 0 | 0 | 0 | 0 |
| G-fusion | B1L | 1 | 1 | None | 1353 | 810 | 60126 | 123811 | 60.4 | 51 | 23 | 1353 | 0 | 0 | 0 | 0 |
| G-fusion | B1Q | 1 | 1 | None | 5 | 5 | 109698 | 187521 | 131.0 | 416 | 20 | 5 | 1041 | 9 | 62021 | 0 |
| G-fusion | B1X | 1 | 1 | None | 926 | 673 | 166215 | 244492 | 191.9 | 1583 | 20 | 926 | 0 | 0 | 0 | 1114 |
| G-fusion | B1QX | 1 | 1 | None | 1519 | 857 | 122147 | 190877 | 163.8 | 410 | 20 | 1519 | 1041 | 9 | 62021 | 2804 |
| H-overfitting-trap | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 1779 | 10.2 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| H-overfitting-trap | B1 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 8342 | 21.8 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| H-overfitting-trap | B1L | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 3794 | 13.9 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| H-overfitting-trap | B1Q | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 9601 | 24.2 | 0 | 96 | 0 | 46 | 4 | 5807 | 0 |
| H-overfitting-trap | B1X | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 8342 | 21.9 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| H-overfitting-trap | B1QX | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 9601 | 24.6 | 0 | 96 | 0 | 46 | 4 | 5807 | 0 |
| I-equivalent-representations | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 1135 | 5.8 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| I-equivalent-representations | B1 | 1 | 1 | None | 1 | 1 | 83845 | 83882 | 81.6 | 178 | 18 | 1 | 0 | 0 | 0 | 0 |
| I-equivalent-representations | B1L | 1 | 1 | None | 1737 | 363 | 54552 | 122937 | 42.9 | 37 | 22 | 1737 | 0 | 0 | 0 | 0 |
| I-equivalent-representations | B1Q | 1 | 1 | None | 2 | 2 | 70312 | 70398 | 61.5 | 167 | 18 | 2 | 266 | 4 | 28204 | 0 |
| I-equivalent-representations | B1X | 1 | 1 | None | 1845 | 209 | 96317 | 159084 | 110.8 | 178 | 18 | 1845 | 0 | 0 | 0 | 3188 |
| I-equivalent-representations | B1QX | 1 | 1 | None | 1907 | 232 | 82756 | 149552 | 90.3 | 167 | 18 | 1907 | 266 | 4 | 28204 | 3312 |
| J-no-useful-abstraction | B0 | 1 | 1 | None | 398 | 398 | 40934 | 130811 | 30.9 | 27 | 30 | 398 | 0 | 0 | 0 | 0 |
| J-no-useful-abstraction | B1 | 1 | 1 | None | 4 | 4 | 112622 | 188033 | 100.8 | 1392 | 20 | 4 | 0 | 0 | 0 | 0 |
| J-no-useful-abstraction | B1L | 1 | 1 | None | 322 | 322 | 41686 | 136805 | 30.4 | 28 | 30 | 323 | 0 | 0 | 0 | 0 |
| J-no-useful-abstraction | B1Q | 1 | 1 | None | 6 | 6 | 79933 | 155945 | 71.9 | 440 | 21 | 6 | 760 | 5 | 39042 | 0 |
| J-no-useful-abstraction | B1X | 1 | 1 | None | 888 | 764 | 125122 | 240657 | 120.3 | 1394 | 20 | 888 | 0 | 0 | 0 | 964 |
| J-no-useful-abstraction | B1QX | 1 | 1 | None | 4048 | 3674 | 92416 | 203221 | 126.0 | 444 | 21 | 4048 | 760 | 5 | 39042 | 2961 |

#### generated-dev

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | join_nodes | cost_bound_reached | materialized_complete_asts | deferred_branches | deferred_released | deferred_pass_work | cover_lazy_candidates |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| dev-progression-0 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 5095 | 25.9 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| dev-progression-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250001 | 262.7 | 1035 | 0 | 0 | 0 | 0 | 0 | 0 |
| dev-progression-0 | B1L | 1 | 1 | None | 1 | 1 | 76953 | 76985 | 51.6 | 320 | 22 | 1 | 0 | 0 | 0 | 0 |
| dev-progression-0 | B1Q | 1 | 1 | None | 2 | 2 | 139486 | 177226 | 118.1 | 615 | 22 | 2 | 345 | 10 | 62502 | 0 |
| dev-progression-0 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250001 | 265.5 | 1035 | 0 | 0 | 0 | 0 | 0 | 0 |
| dev-progression-0 | B1QX | 1 | 1 | None | 2769 | 76 | 151930 | 213998 | 174.4 | 615 | 22 | 2769 | 345 | 10 | 62502 | 3674 |
| dev-progression-1 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 55844 | 55922 | 44.7 | 96 | 26 | 1 | 0 | 0 | 0 | 0 |
| dev-progression-1 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 193177 | 167.3 | 1017 | 20 | 0 | 0 | 0 | 0 | 0 |
| dev-progression-1 | B1L | 1 | 1 | None | 1 | 1 | 72183 | 72215 | 53.1 | 166 | 22 | 1 | 0 | 0 | 0 | 0 |
| dev-progression-1 | B1Q | 1 | 1 | None | 1 | 1 | 134703 | 134735 | 109.1 | 363 | 21 | 1 | 310 | 7 | 62520 | 0 |
| dev-progression-1 | B1X | 1 | 1 | None | 2064 | 221 | 205677 | 250000 | 202.5 | 1017 | 20 | 2064 | 0 | 0 | 0 | 3228 |
| dev-progression-1 | B1QX | 1 | 1 | None | 1692 | 97 | 147178 | 209037 | 140.7 | 363 | 21 | 1692 | 310 | 7 | 62520 | 2858 |
| dev-relative-0 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 80841 | 80927 | 83.8 | 191 | 27 | 1 | 0 | 0 | 0 | 0 |
| dev-relative-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250058 | 254.6 | 1464 | 0 | 0 | 0 | 0 | 0 | 0 |
| dev-relative-0 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 105387 | 105424 | 103.0 | 197 | 27 | 1 | 0 | 0 | 0 | 0 |
| dev-relative-0 | B1Q | 1 | 0 | AbstractionMissing | 1 | 0 | 167961 | 167998 | 147.6 | 710 | 21 | 1 | 363 | 15 | 62574 | 0 |
| dev-relative-0 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250058 | 255.1 | 1464 | 0 | 0 | 0 | 0 | 0 | 0 |
| dev-relative-0 | B1QX | 1 | 0 | AbstractionMissing | 1824 | 0 | 180433 | 245223 | 181.7 | 710 | 21 | 1824 | 363 | 15 | 62574 | 3408 |
| dev-relative-1 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 28412 | 186.1 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| dev-relative-1 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| dev-relative-1 | B1L | 1 | 1 | None | 1 | 1 | 107634 | 107671 | 222.3 | 242 | 23 | 1 | 0 | 0 | 0 | 0 |
| dev-relative-1 | B1Q | 1 | 1 | None | 1 | 1 | 170144 | 170181 | 277.4 | 718 | 21 | 1 | 341 | 14 | 62510 | 0 |
| dev-relative-1 | B1X | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| dev-relative-1 | B1QX | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |

#### generated-audit

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | join_nodes | cost_bound_reached | materialized_complete_asts | deferred_branches | deferred_released | deferred_pass_work | cover_lazy_candidates |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| audit-same-progression-0 | B0 | 1 | 0 | AbstractionMissing | 180 | 0 | 66790 | 133710 | 75.8 | 102 | 30 | 180 | 0 | 0 | 0 | 0 |
| audit-same-progression-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250000 | 249.9 | 1933 | 20 | 0 | 0 | 0 | 0 | 0 |
| audit-same-progression-0 | B1L | 1 | 1 | None | 2 | 2 | 77015 | 114703 | 71.0 | 189 | 28 | 2 | 0 | 0 | 0 | 0 |
| audit-same-progression-0 | B1Q | 1 | 1 | None | 1 | 1 | 139518 | 139550 | 116.2 | 822 | 21 | 1 | 350 | 9 | 62503 | 0 |
| audit-same-progression-0 | B1X | 1 | 1 | None | 1548 | 94 | 250000 | 250000 | 261.1 | 1933 | 19 | 1651 | 0 | 0 | 0 | 1018 |
| audit-same-progression-0 | B1QX | 1 | 1 | None | 1798 | 99 | 151993 | 219767 | 162.8 | 822 | 21 | 1873 | 350 | 9 | 62503 | 2490 |
| audit-same-progression-1 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 13988 | 90.4 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| audit-same-progression-1 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-progression-1 | B1L | 1 | 0 | AbstractionMissing | 4 | 2 | 94209 | 169888 | 160.3 | 218 | 29 | 4 | 0 | 0 | 0 | 0 |
| audit-same-progression-1 | B1Q | 1 | 0 | AbstractionMissing | 5 | 2 | 156808 | 233032 | 217.2 | 427 | 29 | 5 | 357 | 12 | 62568 | 0 |
| audit-same-progression-1 | B1X | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-progression-1 | B1QX | 1 | 0 | AbstractionMissing | 2151 | 38 | 169252 | 243515 | 242.4 | 410 | 29 | 2151 | 357 | 12 | 62568 | 3380 |
| audit-same-progression-2 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 62939 | 63027 | 33.6 | 143 | 31 | 1 | 0 | 0 | 0 | 0 |
| audit-same-progression-2 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250000 | 263.1 | 1586 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-same-progression-2 | B1L | 1 | 1 | None | 2 | 2 | 81186 | 118875 | 60.0 | 251 | 28 | 2 | 0 | 0 | 0 | 0 |
| audit-same-progression-2 | B1Q | 1 | 1 | None | 1 | 1 | 143797 | 143829 | 101.3 | 862 | 23 | 1 | 259 | 8 | 62611 | 0 |
| audit-same-progression-2 | B1X | 1 | 1 | None | 1215 | 129 | 250000 | 250000 | 272.5 | 1586 | 0 | 1215 | 0 | 0 | 0 | 1215 |
| audit-same-progression-2 | B1QX | 1 | 1 | None | 1077 | 138 | 156272 | 222700 | 138.3 | 862 | 23 | 1077 | 259 | 8 | 62611 | 2118 |
| audit-same-relative-0 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 90549 | 90616 | 115.0 | 288 | 23 | 1 | 0 | 0 | 0 | 0 |
| audit-same-relative-0 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | 0 | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-relative-0 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 111998 | 112035 | 132.3 | 297 | 23 | 1 | 0 | 0 | 0 | 0 |
| audit-same-relative-0 | B1Q | 1 | 0 | AbstractionMissing | 2 | 0 | 174581 | 174667 | 183.0 | 792 | 23 | 2 | 329 | 12 | 62555 | 0 |
| audit-same-relative-0 | B1X | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-relative-0 | B1QX | 1 | 0 | AbstractionMissing | 2204 | 96 | 187025 | 250000 | 221.8 | 792 | 23 | 2204 | 329 | 12 | 62555 | 4250 |
| audit-same-relative-1 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 74654 | 74743 | 47.8 | 252 | 27 | 1 | 0 | 0 | 0 | 0 |
| audit-same-relative-1 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250061 | 242.2 | 1635 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-same-relative-1 | B1L | 1 | 1 | None | 1 | 1 | 91412 | 91449 | 60.3 | 263 | 26 | 1 | 0 | 0 | 0 | 0 |
| audit-same-relative-1 | B1Q | 1 | 1 | None | 2 | 2 | 153959 | 154054 | 104.5 | 625 | 26 | 2 | 297 | 10 | 62513 | 0 |
| audit-same-relative-1 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250061 | 234.8 | 1635 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-same-relative-1 | B1QX | 1 | 1 | None | 1973 | 124 | 166397 | 240498 | 142.8 | 625 | 26 | 1973 | 297 | 10 | 62513 | 3638 |
| audit-same-relative-2 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 110154 | 110202 | 252.9 | 268 | 21 | 1 | 0 | 0 | 0 | 0 |
| audit-same-relative-2 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-relative-2 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 129138 | 129168 | 266.6 | 279 | 21 | 1 | 0 | 0 | 0 | 0 |
| audit-same-relative-2 | B1Q | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-relative-2 | B1X | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-same-relative-2 | B1QX | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-double-0 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 92654 | 92738 | 138.6 | 315 | 47 | 1 | 0 | 0 | 0 | 0 |
| audit-unseen-double-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250000 | 290.2 | 1426 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-double-0 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 115180 | 115264 | 160.7 | 323 | 47 | 1 | 0 | 0 | 0 | 0 |
| audit-unseen-double-0 | B1Q | 1 | 0 | AbstractionMissing | 2 | 0 | 177818 | 215856 | 219.4 | 673 | 47 | 2 | 335 | 11 | 62587 | 0 |
| audit-unseen-double-0 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250000 | 292.6 | 1426 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-double-0 | B1QX | 1 | 0 | AbstractionMissing | 73 | 0 | 180953 | 248650 | 262.1 | 673 | 47 | 73 | 335 | 11 | 62587 | 126 |
| audit-unseen-double-1 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 73766 | 73836 | 61.0 | 185 | 24 | 1 | 0 | 0 | 0 | 0 |
| audit-unseen-double-1 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250016 | 252.3 | 1027 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-double-1 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 87651 | 87721 | 74.2 | 185 | 24 | 1 | 0 | 0 | 0 | 0 |
| audit-unseen-double-1 | B1Q | 1 | 0 | AbstractionMissing | 2 | 0 | 150211 | 188176 | 132.3 | 490 | 24 | 2 | 307 | 10 | 62511 | 0 |
| audit-unseen-double-1 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250016 | 253.4 | 1027 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-double-1 | B1QX | 1 | 0 | AbstractionMissing | 2221 | 0 | 162619 | 245674 | 174.6 | 490 | 24 | 2221 | 307 | 10 | 62511 | 3994 |
| audit-unseen-negated-0 | B0 | 1 | 0 | AbstractionMissing | 12 | 0 | 84135 | 126001 | 132.1 | 97 | 32 | 12 | 0 | 0 | 0 | 0 |
| audit-unseen-negated-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250012 | 258.2 | 2230 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-negated-0 | B1L | 1 | 0 | AbstractionMissing | 4 | 2 | 109830 | 185675 | 164.9 | 118 | 32 | 4 | 0 | 0 | 0 | 0 |
| audit-unseen-negated-0 | B1Q | 1 | 0 | AbstractionMissing | 5 | 2 | 172369 | 248710 | 205.3 | 968 | 31 | 5 | 322 | 13 | 62505 | 0 |
| audit-unseen-negated-0 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250012 | 252.6 | 2230 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-negated-0 | B1QX | 1 | 0 | AbstractionMissing | 2813 | 2 | 184807 | 250000 | 214.2 | 946 | 31 | 2813 | 322 | 13 | 62505 | 5000 |
| audit-unseen-negated-1 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 17446 | 110.7 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-negated-1 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-negated-1 | B1L | 1 | 1 | None | 1 | 1 | 90958 | 90995 | 146.1 | 195 | 22 | 1 | 0 | 0 | 0 | 0 |
| audit-unseen-negated-1 | B1Q | 1 | 1 | None | 1 | 1 | 153461 | 153498 | 208.5 | 770 | 20 | 1 | 437 | 15 | 62503 | 0 |
| audit-unseen-negated-1 | B1X | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit-unseen-negated-1 | B1QX | 1 | 1 | None | 3279 | 65 | 165933 | 233534 | 245.4 | 770 | 20 | 3279 | 437 | 15 | 62503 | 3770 |
| audit-unseen-xalign-0 | B0 | 1 | 0 | AbstractionMissing | 1007 | 42 | 53247 | 128113 | 67.9 | 35 | 29 | 1007 | 0 | 0 | 0 | 0 |
| audit-unseen-xalign-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 249111 | 264.2 | 1001 | 20 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-xalign-0 | B1L | 1 | 0 | AbstractionMissing | 1007 | 42 | 67952 | 142818 | 82.1 | 35 | 29 | 1007 | 0 | 0 | 0 | 0 |
| audit-unseen-xalign-0 | B1Q | 1 | 0 | AbstractionMissing | 1502 | 75 | 134385 | 206752 | 136.9 | 410 | 28 | 1502 | 356 | 10 | 62542 | 0 |
| audit-unseen-xalign-0 | B1X | 1 | 0 | AbstractionMissing | 1689 | 10 | 250000 | 250000 | 270.1 | 1001 | 19 | 1689 | 0 | 0 | 0 | 1642 |
| audit-unseen-xalign-0 | B1QX | 1 | 0 | AbstractionMissing | 1502 | 75 | 133656 | 205294 | 135.1 | 410 | 28 | 1502 | 356 | 10 | 62542 | 2902 |
| audit-unseen-xalign-1 | B0 | 1 | 1 | None | 1273 | 240 | 56058 | 137291 | 81.6 | 48 | 30 | 1273 | 0 | 0 | 0 | 0 |
| audit-unseen-xalign-1 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250002 | 285.8 | 1222 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-xalign-1 | B1L | 1 | 1 | None | 1379 | 240 | 73766 | 156106 | 93.5 | 61 | 29 | 1379 | 0 | 0 | 0 | 0 |
| audit-unseen-xalign-1 | B1Q | 1 | 1 | None | 2 | 2 | 129160 | 204454 | 139.5 | 377 | 22 | 2 | 423 | 12 | 62500 | 0 |
| audit-unseen-xalign-1 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250002 | 289.3 | 1222 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit-unseen-xalign-1 | B1QX | 1 | 1 | None | 1892 | 198 | 141608 | 210760 | 153.8 | 351 | 22 | 1892 | 423 | 12 | 62500 | 3740 |

#### generated-round2

| 任务 | 变体 | train | heldout | failure | portfolio | held-correct | first-exact work | total work | solver s | join_nodes | cost_bound_reached | materialized_complete_asts | deferred_branches | deferred_released | deferred_pass_work | cover_lazy_candidates |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| audit2-newstruct-mirror-0 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 13762 | 74.2 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| audit2-newstruct-mirror-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250083 | 258.4 | 1718 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-newstruct-mirror-0 | B1L | 0 | 0 | SearchFailure | 0 | 0 | 0 | 105489 | 126.7 | 202 | 80 | 0 | 0 | 0 | 0 | 0 |
| audit2-newstruct-mirror-0 | B1Q | 0 | 0 | SearchFailure | 0 | 0 | 0 | 168013 | 171.3 | 497 | 80 | 0 | 337 | 16 | 62524 | 0 |
| audit2-newstruct-mirror-0 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250083 | 256.4 | 1718 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-newstruct-mirror-0 | B1QX | 0 | 0 | SearchFailure | 0 | 0 | 0 | 168013 | 177.6 | 497 | 80 | 0 | 337 | 16 | 62524 | 0 |
| audit2-newstruct-mirror-1 | B0 | 1 | 0 | AbstractionMissing | 2 | 0 | 95853 | 133816 | 159.5 | 326 | 26 | 2 | 0 | 0 | 0 | 0 |
| audit2-newstruct-mirror-1 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250137 | 270.4 | 1414 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-newstruct-mirror-1 | B1L | 1 | 0 | AbstractionMissing | 2 | 0 | 116029 | 153992 | 179.4 | 328 | 26 | 2 | 0 | 0 | 0 | 0 |
| audit2-newstruct-mirror-1 | B1Q | 1 | 0 | AbstractionMissing | 4 | 0 | 178604 | 217920 | 231.5 | 716 | 26 | 4 | 327 | 12 | 62516 | 0 |
| audit2-newstruct-mirror-1 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250137 | 271.1 | 1414 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-newstruct-mirror-1 | B1QX | 0 | 0 | SearchFailure (timeout) | n/a | 0 | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit2-nonlocal-seedshift-x-0 | B0 | 1 | 1 | None | 1014 | 54 | 28119 | 68227 | 149.7 | 10 | 96 | 1014 | 0 | 0 | 0 | 0 |
| audit2-nonlocal-seedshift-x-0 | B1 | 1 | 1 | None | 4447 | 318 | 73826 | 141171 | 212.3 | 14 | 61 | 4447 | 0 | 0 | 0 | 0 |
| audit2-nonlocal-seedshift-x-0 | B1L | 1 | 1 | None | 2028 | 108 | 49769 | 106296 | 182.4 | 11 | 96 | 2028 | 0 | 0 | 0 | 0 |
| audit2-nonlocal-seedshift-x-0 | B1Q | 1 | 1 | None | 1968 | 240 | 78466 | 146161 | 203.2 | 22 | 55 | 1968 | 47 | 7 | 13978 | 0 |
| audit2-nonlocal-seedshift-x-0 | B1X | 1 | 1 | None | 4447 | 318 | 73763 | 140981 | 221.0 | 14 | 61 | 4447 | 0 | 0 | 0 | 96 |
| audit2-nonlocal-seedshift-x-0 | B1QX | 1 | 1 | None | 1968 | 240 | 78387 | 145916 | 210.5 | 22 | 55 | 1968 | 47 | 7 | 13978 | 96 |
| audit2-nonlocal-seedshift-x-1 | B0 | 1 | 0 | AbstractionMissing | 797 | 0 | 49228 | 137810 | 188.2 | 11 | 67 | 797 | 0 | 0 | 0 | 0 |
| audit2-nonlocal-seedshift-x-1 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 167116 | 221.8 | 640 | 22 | 0 | 0 | 0 | 0 | 0 |
| audit2-nonlocal-seedshift-x-1 | B1L | 1 | 0 | AbstractionMissing | 347 | 0 | 67891 | 158176 | 191.2 | 14 | 48 | 347 | 0 | 0 | 0 | 0 |
| audit2-nonlocal-seedshift-x-1 | B1Q | 1 | 0 | AbstractionMissing | 347 | 0 | 130391 | 220676 | 239.0 | 334 | 48 | 347 | 291 | 9 | 62500 | 0 |
| audit2-nonlocal-seedshift-x-1 | B1X | 1 | 0 | AbstractionMissing | 2214 | 0 | 179616 | 251265 | 255.4 | 643 | 22 | 2214 | 0 | 0 | 0 | 3154 |
| audit2-nonlocal-seedshift-x-1 | B1QX | 1 | 0 | AbstractionMissing | 347 | 0 | 130305 | 220413 | 233.5 | 334 | 48 | 347 | 291 | 9 | 62500 | 171 |
| audit2-nonlocal-seedshift-y-0 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 74996 | 75064 | 151.9 | 119 | 26 | 1 | 0 | 0 | 0 | 0 |
| audit2-nonlocal-seedshift-y-0 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit2-nonlocal-seedshift-y-0 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 91886 | 91941 | 167.0 | 141 | 23 | 1 | 0 | 0 | 0 | 0 |
| audit2-nonlocal-seedshift-y-0 | B1Q | 1 | 0 | AbstractionMissing | 1 | 0 | 154501 | 154556 | 219.6 | 418 | 23 | 1 | 267 | 13 | 62615 | 0 |
| audit2-nonlocal-seedshift-y-0 | B1X | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit2-nonlocal-seedshift-y-0 | B1QX | 0 | 0 | SearchFailure (timeout) | n/a | 5 | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit2-same-double-0 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 30665 | 192.5 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-double-0 | B1 | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit2-same-double-0 | B1L | 0 | 0 | SearchFailure | 0 | 0 | 0 | 108010 | 232.2 | 96 | 80 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-double-0 | B1Q | 0 | 0 | SearchFailure | 0 | 0 | 0 | 170532 | 282.9 | 306 | 80 | 0 | 194 | 10 | 62522 | 0 |
| audit2-same-double-0 | B1X | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit2-same-double-0 | B1QX | 0 | 0 | SearchFailure (timeout) | n/a | 0 | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit2-same-negated-0 | B0 | 0 | 0 | WitnessMissing | 0 | 0 | 0 | 31546 | 215.1 | 0 | 96 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-negated-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250043 | 283.3 | 1514 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-negated-0 | B1L | 1 | 1 | None | 2 | 1 | 119193 | 156933 | 269.1 | 183 | 30 | 2 | 0 | 0 | 0 | 0 |
| audit2-same-negated-0 | B1Q | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit2-same-negated-0 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250043 | 283.8 | 1514 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-negated-0 | B1QX | 0 | 0 | SearchFailure (timeout) | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a | n/a |
| audit2-same-progression-0 | B0 | 1 | 0 | AbstractionMissing | 7 | 0 | 59980 | 136725 | 70.2 | 138 | 24 | 7 | 0 | 0 | 0 | 0 |
| audit2-same-progression-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 200248 | 201.3 | 1053 | 21 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-progression-0 | B1L | 1 | 1 | None | 1 | 1 | 77069 | 77101 | 67.5 | 194 | 24 | 1 | 0 | 0 | 0 | 0 |
| audit2-same-progression-0 | B1Q | 1 | 1 | None | 1 | 1 | 139594 | 139626 | 126.3 | 839 | 22 | 1 | 293 | 9 | 62525 | 0 |
| audit2-same-progression-0 | B1X | 1 | 1 | None | 1527 | 76 | 212748 | 250000 | 239.0 | 1053 | 21 | 1527 | 0 | 0 | 0 | 2150 |
| audit2-same-progression-0 | B1QX | 1 | 1 | None | 1787 | 74 | 152069 | 220736 | 176.3 | 839 | 22 | 1787 | 293 | 9 | 62525 | 2464 |
| audit2-same-relative-0 | B0 | 1 | 0 | AbstractionMissing | 1 | 0 | 96036 | 96133 | 132.5 | 305 | 23 | 1 | 0 | 0 | 0 | 0 |
| audit2-same-relative-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250012 | 242.9 | 1749 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-relative-0 | B1L | 1 | 0 | AbstractionMissing | 1 | 0 | 125392 | 125429 | 159.2 | 309 | 23 | 1 | 0 | 0 | 0 | 0 |
| audit2-same-relative-0 | B1Q | 1 | 0 | AbstractionMissing | 2 | 0 | 187952 | 188051 | 203.5 | 620 | 23 | 2 | 299 | 15 | 62524 | 0 |
| audit2-same-relative-0 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250012 | 245.0 | 1749 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-relative-0 | B1QX | 1 | 0 | AbstractionMissing | 2063 | 76 | 200388 | 250000 | 246.9 | 620 | 23 | 2063 | 299 | 15 | 62524 | 3838 |
| audit2-same-xalign-0 | B0 | 1 | 0 | AbstractionMissing | 1271 | 35 | 56894 | 138253 | 93.9 | 39 | 31 | 1271 | 0 | 0 | 0 | 0 |
| audit2-same-xalign-0 | B1 | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250002 | 256.4 | 1338 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-xalign-0 | B1L | 1 | 0 | AbstractionMissing | 1271 | 35 | 80822 | 162181 | 111.7 | 39 | 31 | 1271 | 0 | 0 | 0 | 0 |
| audit2-same-xalign-0 | B1Q | 1 | 0 | AbstractionMissing | 1418 | 36 | 144799 | 227676 | 152.9 | 503 | 31 | 1418 | 375 | 13 | 62508 | 0 |
| audit2-same-xalign-0 | B1X | 0 | 0 | SearchFailure | 0 | 0 | 0 | 250002 | 251.2 | 1338 | 0 | 0 | 0 | 0 | 0 | 0 |
| audit2-same-xalign-0 | B1QX | 1 | 0 | AbstractionMissing | 1418 | 36 | 144136 | 226350 | 150.1 | 503 | 31 | 1418 | 375 | 13 | 62508 | 2712 |

### 验收重点

- 恢复已有 regression：B0 留出 16/17；B1 14；B1L 15；B1Q 15；B1X 14；B1QX 16。相对 B0 丢失：B1: ['map-scan-ambiguity', 'map-translate']; B1L: ['wrong-early-skeleton']; B1Q: ['wrong-early-skeleton']; B1X: ['map-scan-ambiguity', 'map-translate']; B1QX: 无。
- A 产生可验证完整候选：B0: train 0 / held 0, portfolio 0; B1: train 0 / held 0, portfolio 0; B1L: train 1 / held 1, portfolio 2408; B1Q: train 1 / held 1, portfolio 2409; B1X: train 1 / held 1, portfolio 4711; B1QX: train 1 / held 1, portfolio 2165。
- 保留 B/I 收益：B0: ['C', 'D', 'J']; B1: ['B', 'D', 'I', 'J']; B1L: ['A', 'B', 'C', 'D', 'G', 'I', 'J']; B1Q: ['A', 'B', 'D', 'G', 'I', 'J']; B1X: ['A', 'B', 'C', 'D', 'G', 'I', 'J']; B1QX: ['A', 'B', 'C', 'D', 'G', 'I', 'J']。
- 必须使用非局部基点的任务（audit2-nonlocal，3 题）：B0: train 3 / held 1; B1: train 1 / held 1; B1L: train 3 / held 1; B1Q: train 3 / held 1; B1X: train 2 / held 1; B1QX: train 2 / held 1。局部硬限制 B1L 若在此为 0 而 B1Q/B1QX 不为 0，说明延后而非删除保住了非局部规则的求解能力；若所有变体都为 0，则该能力在协议预算内对任何变体都未达成，不能据此偏好任一方案。

## 研究问题的回答

问题：在保留双向 witness 分解的条件下，能否通过公平调度（Q）与惰性提取（X）获得局部限制（B1L）的效率，同时保留非局部规则的求解能力？

| 变体 | 五组合计 train | 五组合计 heldout | 相对 B1L 留出差集（B1L 有而它没有） | 它有而 B1L 没有 |
|---|---:|---:|---|---|
| B0 | 41/53 | 21/53 | stress/A-absolute-relative, stress/B-repeated-progression, stress/G-fusion, stress/I-equivalent-representations, generated-dev/dev-progression-0, generated-dev/dev-progression-1, generated-dev/dev-relative-1, generated-audit/audit-same-progression-0, generated-audit/audit-same-progression-2, generated-audit/audit-same-relative-1, generated-audit/audit-unseen-negated-1, generated-round2/audit2-same-negated-0, generated-round2/audit2-same-progression-0 | regression/wrong-early-skeleton |
| B1 | 19/53 | 19/53 | regression/map-scan-ambiguity, regression/map-translate, stress/A-absolute-relative, stress/C-scene-axis, stress/G-fusion, generated-dev/dev-progression-0, generated-dev/dev-progression-1, generated-dev/dev-relative-1, generated-audit/audit-same-progression-0, generated-audit/audit-same-progression-2, generated-audit/audit-same-relative-1, generated-audit/audit-unseen-negated-1, generated-audit/audit-unseen-xalign-1, generated-round2/audit2-same-negated-0, generated-round2/audit2-same-progression-0 | regression/wrong-early-skeleton |
| B1L | 47/53 | 33/53 | 无 | 无 |
| B1Q | 45/53 | 31/53 | stress/C-scene-axis, generated-round2/audit2-same-negated-0 | 无 |
| B1X | 29/53 | 26/53 | regression/map-scan-ambiguity, regression/map-translate, generated-dev/dev-progression-0, generated-dev/dev-relative-1, generated-audit/audit-same-relative-1, generated-audit/audit-unseen-negated-1, generated-audit/audit-unseen-xalign-1, generated-round2/audit2-same-negated-0 | regression/wrong-early-skeleton |
| B1QX | 43/53 | 32/53 | generated-dev/dev-relative-1, generated-round2/audit2-same-negated-0 | regression/wrong-early-skeleton |

- **Q（延后调度）**：五组合计留出 31（B1 19，B1L 33，B0 21）。延后而非删除非局部 residual，在 regression 上丢失 ['wrong-early-skeleton']，在 stress 上得到 ['A', 'B', 'D', 'G', 'I', 'J']。与 B1L 的差集见表：差异来自延后份额（62500）本身的工作消耗与它加入 DAG 的非局部备选对提取/选择的影响。
- **X（惰性提取）单独**：合计留出 26。它修复的是提取层（A/C/G 等“DAG 中有可组装正确程序但 cover 预算不足”的情形），但不减少推导工作，所以在推导阶段就耗尽预算的任务（regression map-translate/map-scan-ambiguity、多数 generated）上仍失败。
- **Q+X**：合计留出 32。两者互补（优于各自单独）。
- **非局部基点代价（audit2-nonlocal，3 题）**：B0 train 3/3, held 1/3; B1 train 1/3, held 1/3; B1L train 3/3, held 1/3; B1Q train 3/3, held 1/3; B1X train 2/3, held 1/3; B1QX train 2/3, held 1/3。该家族没有按设计区分局部硬限制与延后调度：连 B0 也能在训练上求解其中的 seed（经 `coord`/算术分量路径而非 coordAdd），所以它测到的不是“非局部 residual 的必要性”，而是另一条已有路径；要测量局部偏好的真实代价，需要构造 `coord`/算术路径也不可达的非局部规则。这是本轮 audit 设计的一个失误，如实记录。
- **B1L 仍是有用的参考而非方案**：它在 audit2-same-negated-0 等任务上优于 B1Q（延后份额的成本），但它删除了合法规则；Q 用可恢复的方式得到接近的覆盖。

## 下一步

1. 非局部代价的 audit 需要重做：规则必须使 `coord(add(x,·),add(y,·))` 等分量路径不可用（例如位移随场景变化、且不等于任何可观察标量之差），再冻结后评估 B1L/B1Q/B1QX。
2. Q 的份额与 X 的候选集相互作用（B1QX 在若干任务上不如 B1Q）需要单独消融：固定 Q，比较 refine/lazy cover 的 portfolio 与选择差异，并把 lazy cover 的 phase-2 扩展与 saturation 的分工写清楚。
3. 推导预算耗尽（而非提取）仍是 generated 集上的主要失败：延后份额之外，第一遍局部队列本身在多对象实例上也很重，需要按子规格约束强度（行数/依赖）对分支排序的下一版调度。
