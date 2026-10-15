# LATIS v0.3R.1：01–07 详细图解与讲稿

每张 PNG 为 3840×2160，SVG 可编辑。可按 01→07 顺序展示。

图像重建：使用安装了 Pillow 的 Python 运行 `scripts/make_v03r1_pipeline_details.py`。仅改展示材料，不更改 solver / Base / 实验结果。

## 01 训练 IO → Encode → Scene

输入是 ARC 的多对训练 grids。默认 encoder 将背景色 0 排除，再按相同颜色、4 连通关系抽出对象。每个对象分开保存全局 position 和局部稀疏彩色 geometry；Scene 保存 canvas size、background 和 objects。

图中 03560426 第一张 input 的四个分量是实际数据，编号按 encoder 的 y/x 扫描顺序；不是按颜色或任务语义排序。蓝色对象 origin=(0,7)，局部 geometry 的范围是 x=0..1、y=0..2。输出 grid 用同一 encoder 转换。保留原始 grids，稍后仍需检查 Render(P(Encode(input))) 是否逐像素等于原 output。

这一步产出 Scene 输入输出对，不产生程序，不选 scan / Attach 等 family。默认可配置 encoder 不等于模型学习了新的对象分割。

代码：`src/Latent/Encode.hs`；入口组装：`src/Synthesis/InducedR1/Learn.hs` 的 `inducedSearch`。

## 02 Typed specification：把“例子”变成“必须满足的约束”

根问题 Q0 的 target type 是 Scene→Scene；每个训练示例成为 FunctionPoint(env, inputScene, outputScene)。根 environment Γ 为空，所以最后得到的程序必须闭合；同一程序 P 必须同时满足全部训练行。

当 generic lambda witness 拆开 λs:Scene.[body]，input Scene 被绑定到 s，子问题改为 Point(env[s=input], output)。此时 Γ={s:Scene}，body 可读取 s。其他 deduction 也会产生一般 Point、函数输入输出图 FunctionPoint，以及用于 stable sort/extremum 的 FunctionOrder。后者要求 key(x)<key(y) 或 ≤，而不是强行指定 key 的数值名次。

它描述“做到什么”，不指定“怎样做”。heldout labels 不在 specification 中；所有诊断均在 selection 之后进行。

代码：`src/Synthesis/InducedR1/Specification.hs`、`src/Synthesis/InducedR1/Witness.hs`。

## 03 Learn：类型筛选、条件化 witness、递归与剪枝

Learn(Q) 先检查剩余 depth / work budget。有可用 inventions 时会先检查它们（见 07）。进入 Base 路径后查询 memo、取得有限 forward observation pool，尝试已经满足 Q 的表达式。key 函数还可以通过关系约束检查。

若没有 forward Leaf，按目标返回类型筛选 Base operators，再用 effect checks 和 witness 产生有限、相关的 decompositions。每个 decomposition 给出 child specifications 与组合函数。MRV 根据即时 forward/witness 域估计，先解较受约束的 child；任一 child 为空，整个 decomposition 被丢弃。

图中 Translate 是教学放大的实际位移例子：蓝色对象从 TL=(0,7) 移到 TL=(0,0)，故 v=(0,−7)。Translate witness 条件化 source，检查颜色与 geometry 一致，反推出 Vec specification；Vec 子问题再由 coordDelta 等通用组合求解。整图不是完整 root 搜索 trace。

当前默认 depth=7、work budget=250000，观测与 witness 域也有上限。forward observation 一旦匹配，当前实现会关闭更深的推导。这能避免 identity/alias 爆炸，但也可能漏掉泛化更好的长表达式。搜索失败只说明当前有界可达性不足，不能推出 Base 不可表达。

代码：`src/Synthesis/InducedR1/Learn.hs` 的 `learnBase`、`src/Synthesis/InducedR1/Witness.hs`。

## 04 Version space：把组合可能性保存为共享 DAG

Leaf 保存一个已经满足 specification 的表达式。Union 保存若干可选方案。Join 保存一个 operator 与其 children 的候选空间，组合时只使用同一 decomposition 的 children，避免错误混合相关约束。

图中节点编号来自实际 core `version_space.json`：root #70 是 lambda，#69 是 mkScene，#68 是 scan，children 是 step #54、seed #66、tail #67。seed #66 的 source #57 有两个候选，Vec #65 也有多个候选。#3 canvasSize 是 Union，不是 Leaf。图中省略部分 descendants。

图右侧还有真实共享实例：#35 subtract 与 #64 vec 都引用 #31 Leaf Int 0。节点 interning 按结构 key 复用节点并保留支持理由；memo 按 canonical specification 等条件复用搜索结果。这是 DAG，不必立即展开所有完整 AST。Union 是 VS 数据结构，绝不是新增到 Base 的 union 操作。

代码：`src/Synthesis/Induced/VersionSpace.hs`；证据：`results/v03r1/core/03560426/Full/version_space.json`。

## 05 Frontier：从共享候选空间取出有限具体程序

materialize 自底向上提取：Leaf 给出表达式，Union 合并、去重，Join 取 children 的 AST products 并 assemble。每个节点按原 Base rank 排序，最多保留 k 个候选；Join 最多尝试 k² 组 product。默认 k=32。这个限制会影响可达性；frontier 不是全部可表达程序。

在线循环先用 matches(Q0,P) 保留满足训练 Scene specification 的候选，才允许 discovery 读取这些 AST。图中的三棵树是局部教学示意，不是三条逐字序列化候选；真实 core 最终 portfolio count=32。

发现子树时做 binder alpha-normalization，避免仅因变量名不同错过相同结构。最终 loop 结束后还有一次完整 extraction、原始 grid exact verifier 和 Base rank selection；heldout 此时才评估。最终 ranking 与 06 的 invention portfolio MDL 是不同环节，当前最终 selection 不以 dictionary encoded length 排序。

代码：`materialize`、`rank`；调用处：`learnLoop`、`inducedSearch`。

## 06 自动 abstraction：AU、lambda lifting、MDL

发现器从 exact-spec frontier 提取有限 AST 子项；会同时考虑 exact pattern 与 typed first-order anti-unification。相同 operator/结构对齐，同类型差异变成 hole；相同差异对复用参数。依赖局部 binder 的 mismatch 被拒绝，不执行任意高阶 AU。

图中 λx.3x+7 和 λx.3x+8 产生 λx.3x+β，x 已绑定，β 是自由变量。lambda lifting 变成 λβ:Int.λx:Int.add(multiply(x,3),β)，使定义 FV=∅。kernel 检查 closed/type，参数、AST size 有界；definition 只含原 Base，可以完整展开。

MDL 同时计算 dictionary cost 和 programs encoded cost，用非重叠 AST cover 防止重复计算 nested saving。图中的四个 offset 候选各 AST length=6，共24；闭合定义 length=7，dictionary entry cost=7+2=9；每个 reference 是2+一个 literal 参数长度1，四次共12；after=21，saving=3，因此接受。它是 affine 单元测试形式的局部教学算例，原测试候选 frontier 人工提供并验证，不可声称该例全程由 Learn 发现。实际 core 的 Attach-like I0 则由实际 Learn frontier 自动发现。

默认最多2 rounds、6 inventions、AST≤96、parameters≤4；候选子树≤160、AU pairs≤512。短 exact closed functions 优先，其后才是参数化候选。只有 incremental positive MDL saving 才加入 dictionary。

代码：`src/Synthesis/InducedR1/Abstraction.hs`；测试：`test/InducedR1Main.hs`。

## 07 TSL 与反馈：装入当前 Engine，让后续 Learn 实际调用

第一次 Learn 在固定 Base 上 bootstrap。得到非空 root VS 后提取 supported Base symbols；后续在线轮只使用 supported Base 与 accepted definitions。TSL 可理解为 Signature(root VS)∪I_task；运行时 support set 持续累积。definitions 不注册成新 Base primitive，不安装专用 witness。

Learn 先检查可用 inventions。若定义的函数类型直接与目标相同，可检查整个闭合函数；否则从 typed observations 取显式参数候选（每 type 最多6，每 invention 最多64组），ordinary application / Base evaluation 检查全部 specification 行。命中时记录 actual invention hit，返回保存 Base 展开表达式的 Leaf，并关闭该 subproblem；没有命中则回到 generic Base Learn。

标准 root loop 接受 definitions 后清除旧 memo，重新 Learn 根问题，避免把旧解缓存误算为 invention 加速。只有 accepted 非空、未到 rounds 上限、预算未耗尽才继续。专门 related-demand harness 则在同一 Engine 中依次接收后续需求；只用已收到的 frontier 做 discovery，不提前读取未来 labels。

图中的真实同一 task 40-demand stress：Full 后续逻辑工作280，NoOnline 46320，实际命中40；含 discovery 总逻辑工作71579 vs82043。但 Full 总耗时27.8s，baseline13.6s。逻辑计量不等于 CPU/时间。此 fixture 可以学 exact closed subtree，不能单独证明 AU / lifting 必要。

任务结束后 Engine 被丢弃，下一 task 从新 Engine 开始。没有 cross-task library。在线字典接受是压缩收益，不保证训练 IO 唯一确定泛化规则。

代码：`useInventions`、`learn`、`learnLoop`、`learnTaskSequence`；数据：`results/v03r1/abstraction_stress.json`。

## 展示时的三个边界

- 固定 Base，StructuralPriorCount=0，没有手写 Attach / Progression / ScanP family。
- 当前为 sound bounded underapproximation：没有找到程序不等于 Base 不可表达。
- 回归为 train16/17、heldout14/17；已证明局部反馈降低搜索工作，尚未证明完整时间普遍加速。
