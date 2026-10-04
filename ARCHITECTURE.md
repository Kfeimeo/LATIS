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
