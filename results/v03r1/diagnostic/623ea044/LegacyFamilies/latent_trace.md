# LATIS v0.3 latent trace

Training-only discovery. Test outputs checked after MDL selection.

```text
Z0 canonical scenes=[Scene {canvas = Dimensions {gridWidth = 15, gridHeight = 15}, background = 0, objects = [Object {objectId = 0, position = Coord {cx = 3, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},2)], orientation = 0}]},Scene {canvas = Dimensions {gridWidth = 15, gridHeight = 15}, background = 0, objects = [Object {objectId = 0, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},7)], orientation = 0}]},Scene {canvas = Dimensions {gridWidth = 7, gridHeight = 7}, background = 0, objects = [Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},8)], orientation = 0}]}]
Level-0 synthesis=none
Level-0 legacy cost=Nothing
Latent discovery trigger=Z0 absent or cost >25; inspect repeated relational / structural constraints
Decoder/reconstruction: 0 exact canonical Scene reconstructions; encoder guard rejections=0 decoder failures=0 reconstruction failures=0
PropagateToFixpoint: fixed point; branching now permitted
DetectLatentDominance: only exact-valid candidates compete; secondary requires strict J1<J0, or absent Z0
Z0 expanded reference cost=Nothing; Z1 cost=Nothing; DeltaMDL=Nothing
Selected representation=none
Final program=none
Training exact=False
Heldout outputs are inaccessible to synthesis; evaluation runs after selection
Cross-latent iterative propagation=FutureWork
Heldout exact=False
```

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\data\\arc1-frozen\\623ea044.json","mode":"V03Full","route":null,"program":null,"train_exact":false,"heldout_exact":false,"heldout_available":true,"failure":"LanguageFailure","failure_evidence":"No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds","statistics":{"latent_proposals":0,"local_latent_proposals":0,"global_latent_proposals":0,"fusion_proposals":0,"accepted_latent_hypotheses":0,"rejected_latent_hypotheses":0,"latent_branch_points":0,"latent_propagation_steps":1,"latent_contradictions":0,"decoder_failures":0,"reconstruction_failures":0,"discovery_checks":159,"latent_expression_tests":0,"exact_verifier_calls":0,"total_expanded_states":213,"latent_symbols":0,"program_symbols_saved":0,"description_units_saved":0,"first_solution_states":null,"wall_clock_seconds":3.563e-4,"delta_mdl":null,"level0_program_cost":null,"level1_program_cost":null,"budget_exhausted":false},"legacy_statistics":{"expanded":54,"complete_programs":0,"partial_states":1,"verifier_calls":0,"propagation_iterations":1,"propagation_rule_calls":0,"deterministic_steps":0,"branch_points":0,"branch_assignments":0,"branch_domain_total":0,"maximum_branch_domain":0,"context_expansions":0,"previous_expansions":0,"grid_expansions":0,"expression_tests":0,"effect_queries":0,"witness_queries":0,"dependency_branches":0,"skeleton_branches":0,"dependencies_derived":0,"expression_dependencies_derived":0,"dependency_edges_derived":0,"witness_holes":0,"enumerated_holes":0,"legacy_dependency_checks":0,"expression_memo_queries":0,"expression_memo_hits":0,"partial_memo_queries":1,"partial_memo_hits":0,"program_memo_queries":0,"program_memo_hits":0,"contradictions":0,"proven_dominance":0,"first_solution_expanded":null,"first_seconds":null,"seconds":3.271e-4,"first_previous_expansions":null,"first_grid_expansions":null,"first_context_expansions":null,"first_expression_tests":null,"average_branch_domain":0.0,"exhaustive":true,"budget_exhausted":false,"solution_limit_reached":false},"objective":null,"state_budget":25000,"correspondence_budget":32,"solution_limit":128,"candidates":[],"predictions":[null]}
```
