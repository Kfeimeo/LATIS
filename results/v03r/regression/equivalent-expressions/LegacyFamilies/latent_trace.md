# LATIS v0.3 latent trace

Training-only discovery. Test outputs checked after MDL selection.

```text
Z0 canonical scenes=[Scene {canvas = Dimensions {gridWidth = 18, gridHeight = 18}, background = 0, objects = [Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}]},Scene {canvas = Dimensions {gridWidth = 18, gridHeight = 18}, background = 0, objects = [Object {objectId = 0, position = Coord {cx = 7, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},4)], orientation = 0}]}]
Level-0 synthesis=map(lambda current: Translate(current, (1,0)), sortBy(ExtractionOrder, objects))
Level-0 legacy cost=Just (Objective {descriptionLength = 12, symbolKinds = 5, exceptionPenalty = 1, totalCost = 19.0})
Latent discovery trigger=none: cheap exact Z0 retained
Decoder/reconstruction: 0 exact canonical Scene reconstructions; encoder guard rejections=0 decoder failures=0 reconstruction failures=0
PropagateToFixpoint: fixed point; branching now permitted
DetectLatentDominance: only exact-valid candidates compete; secondary requires strict J1<J0, or absent Z0
Z0 expanded reference cost=Just 19.0; Z1 cost=Nothing; DeltaMDL=Nothing
Selected representation=Z0
Final program=map(lambda current: Translate(current, (1,0)), sortBy(ExtractionOrder, objects))
Training exact=True
Heldout outputs are inaccessible to synthesis; evaluation runs after selection
Cross-latent iterative propagation=FutureWork
Heldout exact=True
```

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\results\\v03\\regression\\equivalent-expressions\\task.json","mode":"V03Full","route":"Z0","program":"map(lambda current: Translate(current, (1,0)), sortBy(ExtractionOrder, objects))","train_exact":true,"heldout_exact":true,"heldout_available":true,"failure":"Solved","failure_evidence":"Selected program exact on every training and heldout grid","statistics":{"latent_proposals":0,"local_latent_proposals":0,"global_latent_proposals":0,"fusion_proposals":0,"accepted_latent_hypotheses":0,"rejected_latent_hypotheses":0,"latent_branch_points":0,"latent_propagation_steps":1,"latent_contradictions":0,"decoder_failures":0,"reconstruction_failures":0,"discovery_checks":0,"latent_expression_tests":0,"exact_verifier_calls":42,"total_expanded_states":473,"latent_symbols":0,"program_symbols_saved":0,"description_units_saved":0,"first_solution_states":270,"wall_clock_seconds":0.200977,"delta_mdl":null,"level0_program_cost":19.0,"level1_program_cost":null,"budget_exhausted":false},"legacy_statistics":{"expanded":473,"complete_programs":42,"partial_states":67,"verifier_calls":42,"propagation_iterations":93,"propagation_rule_calls":1980,"deterministic_steps":84,"branch_points":13,"branch_assignments":54,"branch_domain_total":54,"maximum_branch_domain":6,"context_expansions":12,"previous_expansions":0,"grid_expansions":12,"expression_tests":43,"effect_queries":144,"witness_queries":24,"dependency_branches":0,"skeleton_branches":6,"dependencies_derived":96,"expression_dependencies_derived":48,"dependency_edges_derived":24,"witness_holes":12,"enumerated_holes":0,"legacy_dependency_checks":0,"expression_memo_queries":24,"expression_memo_hits":22,"partial_memo_queries":67,"partial_memo_hits":12,"program_memo_queries":42,"program_memo_hits":0,"contradictions":0,"proven_dominance":0,"first_solution_expanded":270,"first_seconds":1.54789e-2,"seconds":0.1913482,"first_previous_expansions":0,"first_grid_expansions":0,"first_context_expansions":0,"first_expression_tests":21,"average_branch_domain":4.153846153846154,"exhaustive":true,"budget_exhausted":false,"solution_limit_reached":false},"objective":{"L":12,"K":5,"E":1,"J":19.0},"state_budget":250000,"correspondence_budget":32,"solution_limit":128,"candidates":[],"predictions":[[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]}
```
