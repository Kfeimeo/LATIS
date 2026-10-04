# LATIS v0.2A constraint synthesis trace

Only training pairs enter search. All tests run after program selection.

```text
Initial correspondence bundles=[]; residuals=[]
Initial Sigma: 0 guarded order/correspondence frames; Gamma fresh; D empty; context={current}
Propagation round 0: added=[]; removed constraints=[] (proofs retained); domain changes=[]; fixed point
Exact verifier True memo=False program=fold(bboxUnion, bbox(head(objects)), tail(objects)) |> solidRectangle MDL=Objective {descriptionLength = 8, symbolKinds = 6, exceptionPenalty = 0, totalCost = 14.0}
Final exact-valid MDL: Objective {descriptionLength = 8, symbolKinds = 6, exceptionPenalty = 0, totalCost = 14.0}
```

```json
{"task":"fold-bbox","mode":"JointConstraint","statistics":{"expanded":2,"complete_programs":1,"partial_states":1,"verifier_calls":1,"propagation_iterations":1,"propagation_rule_calls":1,"deterministic_steps":0,"branch_points":0,"branch_assignments":0,"branch_domain_total":0,"maximum_branch_domain":0,"context_expansions":0,"previous_expansions":0,"grid_expansions":0,"expression_tests":0,"effect_queries":0,"witness_queries":0,"dependency_branches":0,"skeleton_branches":0,"dependencies_derived":0,"expression_dependencies_derived":0,"dependency_edges_derived":0,"witness_holes":0,"enumerated_holes":0,"legacy_dependency_checks":0,"expression_memo_queries":0,"expression_memo_hits":0,"partial_memo_queries":1,"partial_memo_hits":0,"program_memo_queries":1,"program_memo_hits":0,"contradictions":0,"proven_dominance":0,"first_solution_expanded":2,"first_seconds":2.4481e-3,"seconds":2.4521e-3,"first_previous_expansions":0,"first_grid_expansions":0,"first_context_expansions":0,"first_expression_tests":0,"average_branch_domain":0.0,"exhaustive":true,"budget_exhausted":false,"solution_limit_reached":false},"program":"fold(bboxUnion, bbox(head(objects)), tail(objects)) |> solidRectangle","solved":true,"heldout_exact":true,"L":8,"K":6,"E":0,"valid_programs":1,"limitations":["CurrentlyUnsupported: union/split, fully occluded objects, or transformations outside the finite geometry closure","CurrentlyUnsupported: union/split, fully occluded objects, or transformations outside the finite geometry closure"],"state_budget":1000000,"solution_limit":100000}
```
