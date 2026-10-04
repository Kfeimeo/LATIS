# LATIS v0.1 architecture

```mermaid
flowchart TD
  Dataset[ARC.Dataset: training grids only] --> Encode[Latent.Encode: deterministic 4/8 components]
  Encode --> Scene[Latent.Object: Scene / Object / sparse colored geometry]
  Scene --> Correspondence[Latent.Correspondence: candidate graph + occlusion DAG + legal branches]
  Correspondence --> Residual[Synthesis.Residual: position / geometry / appearance]
  Correspondence --> Dependency[Synthesis.Dependency: observed structural relations]
  Residual --> Effects[Language.Effect: eligibility proofs]
  Dependency --> Skeleton[Synthesis.Skeleton: map / scan / filter / fold / iterate]
  Skeleton --> Search[Synthesis.Search: goal-directed structured traversal]
  Effects --> Search
  Schema[Language.Schema: type + semantics + effect + typed slots] --> Search
  Search --> Hole[Synthesis.Hole: GADT Param and typed constraints]
  Witness[Language.Witness: output specification to parameter constraints] --> Hole
  Hole --> Abstraction[Synthesis.Abstraction: anti-unification and local lambdas]
  Abstraction --> Candidate[Typed Scene to Scene program]
  Candidate --> ML[Language.ML + Language.DSA: pure evaluation]
  ML --> Render[Latent.Render: ordered, later object wins]
  Render --> Verify[Synthesis.Verify: exact Grid equality on all training pairs]
  Verify --> MDL[Synthesis.MDL: score exact-valid programs only]
  MDL --> Predict[ARC.Evaluate: withheld test prediction and measurements]
```

The encoder and renderer preserve `Render(Encode(g)) = g`. Transformations need not be invertible. Matching reconstructs input-derived geometry hidden behind later objects; no probabilistic inverse renderer is used.

The language has no recursive AST constructor. `iterateWhile` receives nonnegative fuel and propagates evaluation failures. Unsupported correspondence or search fragments remain diagnostics, rather than global impossibility claims.

The Direct benchmark shares representation and verification, but traverses complete object programs without correspondence, residual, dependency, or witness information. All timings include analysis work and cache input encoding once.
# v0.2A joint constraint controller

新入口为 `Synthesis.Joint.jointSearch`；原 `Synthesis.Search.search` 保留。

```mermaid
flowchart LR
  IO[Training grids] --> Old[Existing Encode and Correspondence]
  Old --> Sigma[ConstraintState: P Gamma C D R M]
  Sigma --> Prop[Pure PropagateToFixpoint]
  Prop --> Eff[Existing effects and schemas]
  Eff --> Wit[Existing typed witnesses]
  Wit --> Expr[Existing grammar and scoped domains]
  Expr --> FV[Free variables and dependency edges]
  FV --> Skel[Map and Scan support]
  Skel --> Expr
  Skel --> Prop
  Prop --> MRV[MRV after fixedpoint]
  MRV --> Sigma
  MRV --> Verify[Existing exact verifier]
  Verify --> MDL[Existing MDL over E=0]
  MDL --> Frontier[Deferred contexts after active frontier exhausted]
  Frontier --> Sigma
```

`Constraint.State` 保存 guarded skeleton domains 与 GADT holes；`Constraint.Propagate` 负责 type/value/effect/dependency/structural 规则和 provenance；`Expression.FreeVars/Domain` 读取原 typed `Param` grammar；`Search.Memo` 实现表达式、规范 partial state 和 program caches；`Joint` 负责 fixedpoint/MRV/deferred frontier 与预算；`ARC.JointEvaluate` 生成新结果/压力任务/消融。没有新算子、observer 或 latent segmentation。

传播不随机挑候选；branch 在固定点后执行。context 展开先尝试 current，失败才试 admissible larger scopes；穷尽模式会把已访问 assignments 视为 nogoods，再搜索 deferred scope，同时保留已找到程序。所有 constraint 带 rule、correspondence branch、pair、object 与 premises；candidate 依赖边带 guard，不能混为最终依赖。只有严格相同 seed/step AST 且无 Previous 的 scan 全局等价 map，训练等价候选仍保留。

终止条件、memo keys、穷尽范围、状态事件定义与消融负结果见 `LATIS_V02A_REPORT.md`。前面的 v0.1 架构文档保留。
