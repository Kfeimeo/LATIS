# 绝对位置 place 临时实验

已完成 226/226 个配置。

Full 留出正确：新版 20/58，原版同批 23/58。回归保持，压力测试总体退化；未自然恢复通用 Translate 抽象。下文区分表达能力和有限搜索能力。

语言：`place : ObjectT × CoordT → PlacedT`；基础注册、类型签名和解释器均删除 `Translate`，不预置平移抽象。对象保留实际局部像素几何，旋转不做等价归并。`poseOf` 不再暴露。

搜索：只新增 place 自身的单算子逆语义（目标局部几何、目标绝对原点）；没有注入 Translate 的组合模板。沿用任务内抽象发现。fold 位置分析相应允许 place 生成新位置。

预算沿用 R2：主测试 250000、diagnostic 25000、cost 96、saturation 25000、单次外部超时 300 秒。Full 与消融最多合计五个进程；耗时受并行争用影响，不作速度结论。数据及原版本源码不变，结果保存输入、源码及二进制哈希。

语义检查：基础 Translate 不可构造；非对称旋转对象不等价；81 种位移均能由 place/Anchor/coordAdd 组合精确表达并通过类型检查。旧版依赖 Translate 的兼容测试不适用于本实验，未宣称其通过。

| 测试组 | 模式 | 完成 | 原版训练正确（同批） | 新版训练正确 | 原版留出正确（同批） | 新版留出正确 | 超时 |
|---|---|---:|---:|---:|---:|---:|---:|
| core | BeamSearchLegacy | 1 | 1 | 1 | 1 | 1 | 0 |
| core | FixedAliasCap | 1 | 1 | 1 | 1 | 1 | 0 |
| core | Full | 1 | 1 | 1 | 1 | 1 | 0 |
| core | NoCounterfactualDiagnosis | 1 | 1 | 1 | 1 | 1 | 0 |
| core | NoDiversityPreservation | 1 | 1 | 1 | 1 | 1 | 0 |
| core | NoGroundedLiteralPrior | 1 | 1 | 1 | 1 | 1 | 0 |
| core | NoLetSharing | 1 | 1 | 1 | 1 | 1 | 0 |
| diagnostic | Full | 30 | 1 | 1 | 0 | 0 | 2 |
| regression | BeamSearchLegacy | 17 | 16 | 16 | 15 | 15 | 0 |
| regression | FixedAliasCap | 17 | 16 | 16 | 16 | 16 | 0 |
| regression | Full | 17 | 16 | 16 | 16 | 16 | 0 |
| regression | NoCounterfactualDiagnosis | 17 | 16 | 16 | 16 | 16 | 0 |
| regression | NoDiversityPreservation | 17 | 16 | 16 | 15 | 15 | 0 |
| regression | NoGroundedLiteralPrior | 17 | 16 | 16 | 15 | 16 | 0 |
| regression | NoLetSharing | 17 | 16 | 16 | 15 | 15 | 0 |
| stress | BeamSearchLegacy | 10 | 9 | 6 | 5 | 2 | 0 |
| stress | FixedAliasCap | 10 | 9 | 6 | 5 | 2 | 0 |
| stress | Full | 10 | 9 | 6 | 6 | 3 | 0 |
| stress | NoCounterfactualDiagnosis | 10 | 9 | 6 | 6 | 3 | 0 |
| stress | NoDiversityPreservation | 10 | 9 | 6 | 5 | 2 | 0 |
| stress | NoGroundedLiteralPrior | 10 | 9 | 6 | 5 | 2 | 0 |
| stress | NoLetSharing | 10 | 9 | 6 | 5 | 2 | 0 |

## Full 留出结果变化

- `stress/A-absolute-relative`：True → False，WitnessMissing。
- `stress/B-repeated-progression`：True → False，AbstractionMissing。
- `stress/C-scene-axis`：False → True，None。
- `stress/F-global-better`：True → False，AbstractionMissing。
- `stress/I-equivalent-representations`：True → False，WitnessMissing。

## 核心程序

```text
(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(__cse0)),CoordV (Coord {cx = 0, cy = 0})),tail(__cse0))))
```

## 抽象发现审计

Full 已完成运行共发现 132 个任务内抽象；含 VecT 参数者 0 个，定义中含 coordAdd 者 0 个。没有观察到通用 Translate 的恢复。计数为跨任务总数，各任务的 I0 等名称是局部的。

## 解释范围

删除基础 Translate 并不保证自动发现通用 Translate。抽象采用实际发现的定义（I0 等）；绝对放置/对齐抽象和任意位移函数须区别。搜索仍受有限 witness、观察表达式、递归深度和预算限制；当前结果不能证明表达能力不够。30 个 ARC diagnostic 是之前已打开的数据，不是新的未见评测。

本轮同时改变位置表示与基础词汇，因此总体差异属于组合设置的比较，不能单独归因为旋转语义。原 Base 本来就按实际局部像素几何区分旋转，本轮将位置适配器明确简化为 Object × Coord。

## 独立表达能力核验

对 8 个压力任务另写了纯 place/坐标代数参考程序，均通过类型、训练和留出验证。这些程序只用于搜索后的审计，从未导入搜索器或作为抽象种子。见 base_certificates.json。

包括 A、B、I 的构造都采用 `place(objectOf(obj), coordAdd(Anchor(obj,TL), coordDelta(...)))`。因此这些任务失败不代表 Base 不可表达。

当前搜索的具体限制：R2 Observers 没有从普通场景/物体环境生成 coordDelta 等 VecT 观察项；coordAdd 的 coordinateJoin/coordinateResidual witness 需要条件化一个已观察的右操作数 VecT。在这类环境中，没有该右操作数就不能自然展开 coordAdd。旧版 Translate 则直接给出 VecT 目标规格，随后 coordDelta 可以条件化已有 CoordT。这是本轮表示变化暴露的 witness/观察域缺口，尚不能把退化完全归因于抽象发现算法。
