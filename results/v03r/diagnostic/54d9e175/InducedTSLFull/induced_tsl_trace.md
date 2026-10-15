# LATIS v0.3R induced TSL trace

Only training IO enters Learn; test labels are evaluated after selection. StructuralPriorCount=0.

The root is a typed Scene -> Scene graph. Return-type filtering visits the entire Base registry. Effect checks restrict conditional witness input domains. Each witness produces child learning tasks; a rule is activated only after every child has a nonempty version space. No task classifier selects scan.

## Deduction and child specifications

```text
Root specification Q0: ArrowT SceneT SceneT; observations=4; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=4; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(SceneT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
Induced TSL=Signature(root VS) union inventions. BaseActivated=[]; TaskInvented=[]; StructuralPriorCount=0

```

## Supported map / scan rules

```text

```

## Final expression and free-variable dependencies

```text
UNSOLVED
FV={}
```

## Version space, inventions, induced TSL, exact verification and MDL

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\data\\arc1-frozen\\54d9e175.json","mode":"InducedTSLFull","train_exact":false,"heldout_exact":false,"heldout_available":true,"failure":"BaseMissing","failure_evidence":"object correspondence unavailable and output component shape lies outside input D4 closure; Base lacks an Object-from-cells constructor (cells observer alone cannot create intrinsic geometry); conditional coverage diagnosis, not a universal impossibility proof","program":null,"typed_ast":null,"portfolio_count":0,"version_space_derivations":0,"base_activated":[],"task_invented":[],"statistics":{"base_symbols_activated":0,"base_symbols_rejected":64,"bottom_up_terms":0,"branch_points":0,"depth_cutoffs":0,"distinct_symbol_count":0,"effect_pruned":0,"exact_verifier_calls":0,"expression_tests":4,"failed_witness_decompositions":1,"first_solution_states":0,"fv_bindings_eliminated":0,"induced_tsl_symbol_count":0,"invented_abstractions":0,"join_nodes":0,"lookahead_witness_calls":12,"materialized_child_asts":0,"materialized_complete_asts":0,"memo_hits":0,"memo_queries":2,"memoized_learning_tasks":2,"observer_terms":532,"program_ast_length":0,"propagation_steps":22,"recursive_learning_tasks":2,"root_learning_tasks":1,"semantic_deduplications":0,"structural_deduplications":0,"structural_prior_count":0,"successful_witness_decompositions":0,"total_expanded_work":40,"union_nodes":0,"version_space_nodes":0,"witness_calls":34,"witness_unavailable":21,"wall_clock_seconds":0.3018184},"bounded":false,"configuration":{"work_budget":25000,"depth":7,"frontier":32,"correspondence_budget":32},"mdl":null,"secondary_latent_path":"Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called","predictions":[null]}
```

Limits: depth=7, extraction frontier=32; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs.

Abstraction compression is measured over distinct exact-valid portfolio programs. Naming a single-use scan lambda does not by itself shorten the winning AST. `I<n>` names are assigned only after discovery; any Attach interpretation is a post hoc semantic description.

Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation.
