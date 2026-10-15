# LATIS v0.3R induced TSL trace

Only training IO enters Learn; test labels are evaluated after selection. StructuralPriorCount=0.

The root is a typed Scene -> Scene graph. Return-type filtering visits the entire Base registry. Effect checks restrict conditional witness input domains. Each witness produces child learning tasks; a rule is activated only after every child has a nonempty version space. No task classifier selects scan.

## Deduction and child specifications

```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
NoWitness: finite bottom-up typed Base enumeration; beam=8/type, products=64/operator-instance, iterations=depth bound; targets used only for final acceptance
Exact original Render(P(Encode(x)))=y: True; MDL rank=(9,3,1,0,"(lambda v0:SceneT. if(BoolV False,v0,v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(9,3,1,0,"(lambda v0:SceneT. if(BoolV True,v0,v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(12,3,1,0,"(lambda v0:SceneT. if(BoolV False,if(BoolV False,v0,v0),v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(12,3,1,0,"(lambda v0:SceneT. if(BoolV False,v0,if(BoolV False,v0,v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(13,5,1,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,objects(v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(15,3,1,0,"(lambda v0:SceneT. if(BoolV False,if(BoolV False,if(BoolV False,v0,v0),v0),v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(15,3,1,0,"(lambda v0:SceneT. if(BoolV False,if(BoolV False,v0,v0),if(BoolV False,v0,v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(15,3,1,0,"(lambda v0:SceneT. if(BoolV False,v0,if(BoolV False,if(BoolV False,v0,v0),v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(17,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 1,objects(v0)),v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(17,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 2,objects(v0)),v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(17,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 3,objects(v0)),v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(17,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 4,objects(v0)),v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(17,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 5,objects(v0)),v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(17,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 6,objects(v0)),v0))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(17,6,1,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,concat(objects(v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(17,6,1,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,objects(if(BoolV False,v0,v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(18,3,1,0,"(lambda v0:SceneT. if(BoolV False,if(BoolV False,if(BoolV False,v0,v0),v0),if(BoolV False,v0,v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(18,3,1,0,"(lambda v0:SceneT. if(BoolV False,if(BoolV False,v0,v0),if(BoolV False,if(BoolV False,v0,v0),v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(19,7,1,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,concat(objects(v0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(19,7,1,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,concat(tail(objects(v0)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(20,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 1,objects(v0)),if(BoolV False,v0,v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(20,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 2,objects(v0)),if(BoolV False,v0,v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(20,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 3,objects(v0)),if(BoolV False,v0,v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(20,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 4,objects(v0)),if(BoolV False,v0,v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(20,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 5,objects(v0)),if(BoolV False,v0,v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(20,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 6,objects(v0)),if(BoolV False,v0,v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(21,3,1,0,"(lambda v0:SceneT. if(BoolV False,if(BoolV False,if(BoolV False,v0,v0),v0),if(BoolV False,if(BoolV False,v0,v0),v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 1,objects(v0)),if(BoolV False,if(BoolV False,v0,v0),v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 2,objects(v0)),if(BoolV False,if(BoolV False,v0,v0),v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 3,objects(v0)),if(BoolV False,if(BoolV False,v0,v0),v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 4,objects(v0)),if(BoolV False,if(BoolV False,v0,v0),v0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,6,1,0,"(lambda v0:SceneT. if(BoolV False,mkScene(canvasSize(v0),ColorV 5,objects(v0)),if(BoolV False,if(BoolV False,v0,v0),v0)))")
Selected AST; FV=[]; (lambda v0:SceneT. if(BoolV False,v0,v0))
Induced TSL=Signature(root VS) union inventions. BaseActivated=["canvasSize","concat","if","lambda","literal","mkScene","objects","tail"]; TaskInvented=[]; StructuralPriorCount=0

```

## Supported map / scan rules

```text

```

## Final expression and free-variable dependencies

```text
(lambda v0:SceneT. if(BoolV False,v0,v0))
FV=[]
```

## Version space, inventions, induced TSL, exact verification and MDL

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\results\\v03\\stress\\D-object-sufficient\\task.json","mode":"NoWitness","train_exact":true,"heldout_exact":true,"heldout_available":true,"failure":"None","failure_evidence":"training exact; heldout is assessed only after MDL selection","program":"(lambda v0:SceneT. if(BoolV False,v0,v0))","typed_ast":{"type":"ArrowT SceneT SceneT","expression":"(lambda v0:SceneT. if(BoolV False,v0,v0))","free_variables":[],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"if(BoolV False,v0,v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"BoolT","expression":"BoolV False","free_variables":[],"binding_accesses":[],"children":[]},{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]},{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]},"portfolio_count":32,"version_space_derivations":32,"base_activated":[{"symbol":"canvasSize","source":"BaseActivated","support":[{"specification":"root IO specification","witness":"finite typed forward enumeration; no witness backpropagation"}]},{"symbol":"concat","source":"BaseActivated","support":[{"specification":"root IO specification","witness":"finite typed forward enumeration; no witness backpropagation"}]},{"symbol":"if","source":"BaseActivated","support":[{"specification":"root IO specification","witness":"finite typed forward enumeration; no witness backpropagation"}]},{"symbol":"lambda","source":"BaseActivated","support":[{"specification":"root IO specification","witness":"finite typed forward enumeration; no witness backpropagation"}]},{"symbol":"literal","source":"BaseActivated","support":[{"specification":"root IO specification","witness":"finite typed forward enumeration; no witness backpropagation"}]},{"symbol":"mkScene","source":"BaseActivated","support":[{"specification":"root IO specification","witness":"finite typed forward enumeration; no witness backpropagation"}]},{"symbol":"objects","source":"BaseActivated","support":[{"specification":"root IO specification","witness":"finite typed forward enumeration; no witness backpropagation"}]},{"symbol":"tail","source":"BaseActivated","support":[{"specification":"root IO specification","witness":"finite typed forward enumeration; no witness backpropagation"}]}],"task_invented":[],"statistics":{"base_symbols_activated":8,"base_symbols_rejected":56,"bottom_up_terms":18077,"branch_points":0,"depth_cutoffs":0,"distinct_symbol_count":3,"effect_pruned":0,"exact_verifier_calls":32,"expression_tests":104839,"failed_witness_decompositions":0,"first_solution_states":18077,"fv_bindings_eliminated":0,"induced_tsl_symbol_count":8,"invented_abstractions":0,"join_nodes":0,"lookahead_witness_calls":0,"materialized_child_asts":32,"materialized_complete_asts":32,"memo_hits":0,"memo_queries":0,"memoized_learning_tasks":0,"observer_terms":0,"program_ast_length":5,"propagation_steps":0,"recursive_learning_tasks":0,"root_learning_tasks":1,"semantic_deduplications":4604,"structural_deduplications":0,"structural_prior_count":0,"successful_witness_decompositions":0,"total_expanded_work":18077,"union_nodes":1,"version_space_nodes":33,"witness_calls":0,"witness_unavailable":0,"wall_clock_seconds":1.3259977},"bounded":false,"configuration":{"work_budget":250000,"depth":7,"frontier":32,"correspondence_budget":32},"mdl":{"score":9,"ast_length":5,"distinct_symbols":3,"portfolio_saving":0},"secondary_latent_path":"Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called","predictions":[[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]}
```

Limits: depth=7, extraction frontier=32; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs.

Abstraction compression is measured over distinct exact-valid portfolio programs. Naming a single-use scan lambda does not by itself shorten the winning AST. `I<n>` names are assigned only after discovery; any Attach interpretation is a post hoc semantic description.

Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation.
