# LATIS 阶段 D：统一类型化参数与有界对象组合

本版替代第一轮部分实现说明。原 Stage C 未提交代码与历史求解器保持原有搜索语义；新增能力由 Config.stageD 控制，默认 stageDOff。原始第一轮结果留在 results/stage_d/baseline_c_replay，完整批次在 results/stage_d/full_p0。

## 1. 接口与复用审计

| 构件 | 当前源码位置 |
|---|---|
| A 表达式/类型 | `src/Synthesis/Collection/Typed.hs:118` (`data TExpr`) |
| A hole 合成 | `src/Synthesis/Collection/Typed.hs:279` (`synthesizeTyped ::`) |
| B Lambda/VSA | `src/Synthesis/Collection/Referent.hs:53` (`data LTerm`) |
| B witnessed relation | `src/Synthesis/Collection/Referent.hs:268` (`relate ::`) |
| 旧 C AST | `src/Synthesis/Collection/Relation.hs:91` (`data ObjectTransform`) |
| 旧 C 执行 | `src/Synthesis/Collection/Relation.hs:223` (`emitObjects ::`) |
| 旧 C 迁移 | `src/Synthesis/Collection/Relation.hs:408` (`migrateTransform ::`) |
| 运行/来源证据 | `src/Synthesis/Collection/Front.hs:206` (`runProgramObjects ::`) |
| 原位置体合成 | `src/Synthesis/Collection/Front.hs:802` (`fitBody ::`) |
| 尺寸规则 | `src/Synthesis/Collection/Size.hs:78` (`data SizeRule`) |
| 旧关系证据 | `src/Synthesis/Collection/Relation.hs:447` (`data RelationWitness`) |
| 配置 | `src/Synthesis/Collection/Front.hs:90` (`data Config`) |
| 触发链 | `src/Synthesis/Collection/Front.hs:491` (`unifiedPath ::`) |
| 参数适配 | `src/Synthesis/Collection/Parameter.hs:34` (`checkedParam ::`) |
| TypedGoal/预算 | `src/Synthesis/Collection/Unified.hs:20` (`data StageD`) |
| 联合/逆向搜索 | `src/Synthesis/Collection/Unified.hs:265` (`searchUnified ::`) |
| 双层证据 | `src/Synthesis/Collection/Relation.hs:314` (`executePipeline ::`) |
| 像素独立核验 | `src/Synthesis/Collection/Relation.hs:431` (`verifyRenderWitness ::`) |

复用 A 的 TExpr、枚举器、hole 填充、binding 与 evaluator；B 的 LTerm、类型检查、hash-consing、精确因子化、DAG 求值和 relate；C 的选择、几何构造与真实渲染。没有第二套算术解释器，没有修改 ML 算子语义。原序列位置体的 OrderedView/Previous 规则不移植到副本列表。

## 2. 类型、来源与执行

Param 的构造子私有，访问函数不是可更新 record labels。checkedParam 递归检查算子签名与 arity；PositiveCount、ArcColor、Int、Bool 在使用处检查 refinement。Int/Bool 算术委托 Typed.evalT → applyOp → Language.ML.eval。Mod 除零显式失败。

ParamContext 分开携带输入尺寸、由输入 SizeRule 计算的输出尺寸、WholeInputSet、SelectedSet、CurrentObject。CurrentObject 在每一步重绑定，两个源集合固定。可用叶子包括位置、extent、输入/输出尺寸、对象/颜色计数、集合 min/max、合法的单色观察。WholeColors 是输入对象的前景颜色种数，不含 encoder 背景 0。没有目标输出对象 leaf，也没有 Previous 或无 witness 的集合索引。

Pipeline 限制 1..2 个步骤，选择不计深度：MapPosition(Int,Int) 为绝对位置；MapColor(Color)；Copies(PositiveCount,dx,dy) 包含 copy index=0 的原位副本；LegacyStep 复用 Hollow/FillBBox；另外保留 SetMerge/SetCrop 的可执行桥接。复制有显式 copy role，保留源 ID；一对多、多对一和删除都允许。源对象按稳定几何键决定新管线的渲染优先级，不将其伪装为 Previous/rank。形状构造新建 Object，extent/size signature 从新几何重建，不跨 sort 转换。

输入/中间对象检查非空、颜色范围与连通性；局部合法 DiagonalBar 可作为既有视图对象，交叉/分叉不隐式合并。输出尺寸 1..30；新 Pipeline 的复制/中间集合上限 900，超过为 budget 状态；旧 MigratedBody 豁免此新增预算以保持合法重叠发射语义。任一越界像素仍由 Render 整体拒绝，无隐式裁剪。后绘对象覆盖先绘对象。

runProgram → runProgramObjects 统一执行旧/新 AST。关系路径只接受旧 C 的占位 sequence body；其它 body 显式报错，改用 MapPosition，绝不静默忽略。原 sequence 路径仍通过旧 OrderedView 执行；来源 ID 从输入的 ID-free Placed 映射恢复，不使用 placedToObject 固定的 ID 0 作为所有来源。

## 3. 旧语法迁移与成本

migrateCount/Offset 将 KConst、KCountObjects、KCountColors、StepRight/Down/Left/Up/Diagonal 翻译为 A 表达式。KFitAcross/Down 使用带输入/输出尺寸来源的兼容 quotient leaf，除数检查非零。它们是旧 quotient 的明确兼容原语，新增参数搜索仍使用通用 A 算子，不将任意新表达式硬编码回 K*。

MigratedBody 保存旧语法的成本和原渲染顺序，并携带实际执行的新步骤；运行时核对注解与规范翻译一致，拒绝伪造低成本包装。普通 Pipeline 的成本为操作节点加 A tCost（AST 节点数 + 4×常数数）；存入 VSA 不改变 prior。调度优先级与最终 semantic prior 分开：已检查的 train-exact 程序最终按 transformCost 排序，预算以外的候选保持 deferred，不能声称全局最优。

## 4. 参数搜索与 B 快照

旧 A/B/C 路径先运行；只有旧关系候选无 fit 才打开 unifiedPath。搜索按 selector、有限 step skeleton 展开。能建立唯一源对象、形状/颜色对应及算术 copy role 的训练案例，产生有 witness 的逆向参数约束；输出角色的几何排序要验证唯一性与等差位置，不能直接索引无序集合。约束只用于训练，最后仍前向验证完整网格。

无法逆向约束时，执行无独立标量标签的有界联合枚举：A 模板、共享常数和复制 offset 的组合经过完整训练 Grid 验证。此 fallback 是有意限定的小宇宙，不覆盖任意多源/多步图算法。相同输入矛盾输出显式拒绝。

逆向值是可满足的候选赋值，不是宣称唯一真标签。单副本案例的 offset 不可识别时，0 是当前有限提案之一；其它规律可能因预算或提案范围未被搜索到。所有被返回的表达式仍须前向整格验证，不能把未覆盖解释为 DSL 不可表达。

位置参数使用移动前 CurrentObject；复制参数使用前序移动结果。每个参数 hole 建立 TypedGoal：refinement、可见 leaf、上下文 witness、深度与预算。A 候选转 LTerm 后按 AST identity 存储，B intern/factorClass 共享节点，evaluateDAG 的结果实际过滤搜索参数。If 的 Bool 子目标与父 Int 共享相同节点，费用只计一次。按角色和输入上下文缓存已验证的候选，避免反复构建大宇宙。

relate 的 Confirmed/Pending/Rejected 规则未改。案例相对 CaseAgree 不合并 intensionally 不同的项；边只调度，不证明全域相等。观察不到依赖变化的 constant-looking 表达式可以为 Pending，不会被永久删除。参数 representative 上限和模板 frontier 都有 deferred 记录，可用相同 TypedGoal 再展开。

NoParamVSA 真正不创建 DAG，使用同一参数候选的直接求值；NoReferentOrdering 保留图而关闭边排序。程序组合宇宙先截断、再按 B 边排序，因此固定宇宙差分可验证候选/fit 集一致；实际跑到 representative 或案例预算时的差异必须标为截断。

严格 ComposeOnly 不调用通用表达式枚举：count 等于默认 C 的 KConst 2/3/4、计数特征与 KFit 参数；copy 的 dx/dy 必须是同一个旧 OffsetExpr 的翻译，不能混配不同 gap。位置适配使用闭合常数/标量平移与 bbox 位移模板。无逆向标签的 fallback 也只允许这些闭合参数，不暗中打开 A 的新表达式空间。

本版没有 ShapeMask/Set[Object] 全类型 VSA，没有 Object e-graph；对象程序是有限 AST 与去重集合，只有参数级 Typed VSA。

## 5. Witness 与度量

StepWitness 保存输入/输出 EmittedObject、源 ID、步骤和参数值；verifyPipeline 从输入与程序重放。RenderWitness 保存按真实顺序的像素贡献，verifyRenderWitness 独立折叠像素逐格核验；Python 再从 JSON emission 重放。结构化 derivation_steps 还包含参数表达式 AST、refinement、逐对象 binding 与中间几何，可核验来源路径和 SizeSig。

额外的独立 Python 审计只读取结果，不参与搜索或选程序：核验输入像素覆盖、selector、表达式 binding、各个 typed step、copy role、SizeSig、保留对象与最终覆盖顺序。旧 scalar/C 指令保留其 Haskell 重放和迁移差分，并独立核验像素。pixel contribution 中 emission 是直接绘制者，source IDs 是该对象的变换祖先，不声称每个祖先都直接提供该像素。

分别报告 Object-Count-exact、Emitted-Object-exact、Render-exact、Train-exact、Transform/Render-Witness-valid。旧 RelationWitness 的对象匹配定义保留；同色渲染后连接时 emitted exact 可为假，而 render/witness valid 为真，不要求双射。

## 6. 预算、时间与资源口径

默认 D 预算：每目标 40000 A row/probe checks、全运行 180000；最多 20000 个模板/目标、32 个参数 representative；96 个 skeleton、2000 个参数组合、4000 个前向案例执行、16 个 train-exact 程序。A 原子模板可能一次检查多行，预留 9×案例数+2，确保新 D 参数总预算不会越界。B 边查询每目标最多 4096 次、保留 128 条 supported/pending 边，DAG 节点数由 32 个深度 2 表达式限制。旧 C 预算与触发行为保留。

状态区分 fit、no-fit、not-applicable、各层 truncated、外层 timeout。新 D Work = A row/probe checks + 前向案例调用 + 实际参数节点求值 + relate 调用 + witness 重放调用；这是确定性的混合工作计数，不是 CPU 指令数。直接求值在候选全部训练有定义时按完整 AST 节点计，DAG 按实际访问节点计；relate 状态被强制求值后计数。

通过 GHC 用户事件记录搜索起止与首次整格精确时刻，首解时间不以整个枚举时间代替。格式依据 [GHC eventlog 文档](https://downloads.haskell.org/ghc/9.14-latest/docs/users_guide/eventlog-formats.html)，解析器读取安装版本自身声明的事件大小。外层每题每配置 60 秒，RTS -M4g -T；超时未落盘的 counters 为 null/missing，不填 0。

ARC 每目标报告节点/类/边、序列化尺寸估计和进程 RTS peak live heap；估计值不叫实际 DAG heap。另以独立进程、相同 260 个候选（取前 512 个模板再按 AST 去重）、强制 GC 前后 live bytes，测量共享池的真实 retained heap 增量，重复三次，与不建图对照。P1 的通用 Shape 参数、对象级 VSA、任意深度均未实现。
