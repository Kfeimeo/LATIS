# LATIS v0.1 synthesis trace

Task: `data/03560426.json`. Mode: `Full`.

Only training pairs were passed to search. Test outputs are read after selection.

## Correspondence, residual and dependency evidence

```text
Pair 1: 4 input / 4 visible output objects
Correspondence edges=6, legal branches=2
  0 -> 3; TL Coord {cx = 9, cy = 6} -> Coord {cx = 3, cy = 4}; full size=4; visible size=4; painted before=[]
  1 -> 0; TL Coord {cx = 0, cy = 7} -> Coord {cx = 0, cy = 0}; full size=6; visible size=5; painted before=[1]
  2 -> 1; TL Coord {cx = 3, cy = 8} -> Coord {cx = 1, cy = 2}; full size=4; visible size=3; painted before=[2]
  3 -> 2; TL Coord {cx = 6, cy = 8} -> Coord {cx = 2, cy = 3}; full size=4; visible size=3; painted before=[3]
  2 -> 2; TL Coord {cx = 3, cy = 8} -> Coord {cx = 2, cy = 3}; full size=4; visible size=3; painted before=[3]
  3 -> 1; TL Coord {cx = 6, cy = 8} -> Coord {cx = 1, cy = 2}; full size=4; visible size=3; painted before=[2]
Pair 2: 3 input / 3 visible output objects
Correspondence edges=3, legal branches=1
  2 -> 2; TL Coord {cx = 7, cy = 8} -> Coord {cx = 3, cy = 4}; full size=6; visible size=6; painted before=[]
  0 -> 0; TL Coord {cx = 0, cy = 6} -> Coord {cx = 0, cy = 0}; full size=12; visible size=11; painted before=[1]
  1 -> 1; TL Coord {cx = 4, cy = 8} -> Coord {cx = 2, cy = 3}; full size=4; visible size=3; painted before=[2]
Pair 3: 3 input / 3 visible output objects
Correspondence edges=4, legal branches=1
  1 -> 2; TL Coord {cx = 7, cy = 7} -> Coord {cx = 3, cy = 5}; full size=9; visible size=9; painted before=[]
  0 -> 1; TL Coord {cx = 5, cy = 5} -> Coord {cx = 3, cy = 0}; full size=5; visible size=4; painted before=[0]
  0 -> 1; TL Coord {cx = 5, cy = 5} -> Coord {cx = 3, cy = 1}; full size=5; visible size=4; painted before=[2]
  2 -> 0; TL Coord {cx = 0, cy = 8} -> Coord {cx = 0, cy = 0}; full size=8; visible size=7; painted before=[1]
Residual: [Position]
Residual: [Position]
Residual: [Position]
Residual: [Position,Appearance]
Residual: [Position]
Residual: [Position]
Dependency: Evidence {evidenceSkeleton = ScanSkeleton LeftToRight, reason = "first placement: [\"GridTL - TL(current)\"]; recurrent placement: [\"BR(prev) - TL(current)\"]"}
Dependency: Evidence {evidenceSkeleton = MapSkeleton LeftToRight, reason = "one-to-one intrinsic transformation; no preceding-output coordinate dependency observed"}
Dependency: Evidence {evidenceSkeleton = MapSkeleton TopToBottom, reason = "one-to-one intrinsic transformation; no preceding-output coordinate dependency observed"}
Dependency: Evidence {evidenceSkeleton = MapSkeleton ByColor, reason = "one-to-one intrinsic transformation; no preceding-output coordinate dependency observed"}
Dependency: Evidence {evidenceSkeleton = MapSkeleton BySize, reason = "one-to-one intrinsic transformation; no preceding-output coordinate dependency observed"}
Dependency: Evidence {evidenceSkeleton = MapSkeleton ExtractionOrder, reason = "one-to-one intrinsic transformation; no preceding-output coordinate dependency observed"}
Dependency: Evidence {evidenceSkeleton = MapSkeleton RightToLeft, reason = "one-to-one intrinsic transformation; no preceding-output coordinate dependency observed"}
```

## Selected exact-valid program

```text
objects = sortBy(LeftToRight, objects)
Start = lambda current: Translate(current, GridTL - TL(current))
Attach = lambda prev,current: Translate(current, BR(prev) - TL(current))
scan(Attach, Start(head(objects)), tail(objects))
```

## Typed translation constraints

```text
Pair 1 witness Start: object=1, target TL=Coord {cx = 0, cy = 0}, required Vec=Vec 0 (-7), expression=Translate(current, GridTL - TL(current))
Pair 1 witness Attach: object=2, target TL=Coord {cx = 1, cy = 2}, required Vec=Vec (-2) (-6), expression=Translate(current, BR(prev) - TL(current))
Pair 1 witness Attach: object=3, target TL=Coord {cx = 2, cy = 3}, required Vec=Vec (-4) (-5), expression=Translate(current, BR(prev) - TL(current))
Pair 1 witness Attach: object=0, target TL=Coord {cx = 3, cy = 4}, required Vec=Vec (-6) (-2), expression=Translate(current, BR(prev) - TL(current))
Pair 2 witness Start: object=0, target TL=Coord {cx = 0, cy = 0}, required Vec=Vec 0 (-6), expression=Translate(current, GridTL - TL(current))
Pair 2 witness Attach: object=1, target TL=Coord {cx = 2, cy = 3}, required Vec=Vec (-2) (-5), expression=Translate(current, BR(prev) - TL(current))
Pair 2 witness Attach: object=2, target TL=Coord {cx = 3, cy = 4}, required Vec=Vec (-4) (-4), expression=Translate(current, BR(prev) - TL(current))
Pair 3 witness Start: object=2, target TL=Coord {cx = 0, cy = 0}, required Vec=Vec 0 (-8), expression=Translate(current, GridTL - TL(current))
Pair 3 witness Attach: object=0, target TL=Coord {cx = 3, cy = 1}, required Vec=Vec (-2) (-4), expression=Translate(current, BR(prev) - TL(current))
Pair 3 witness Attach: object=1, target TL=Coord {cx = 3, cy = 5}, required Vec=Vec (-4) (-2), expression=Translate(current, BR(prev) - TL(current))
```

## Task-local abstractions and transitive closure

```text
Concept {conceptName = "Start", parameters = ["current"], conceptBody = "Translate(current, GridTL - TL(current))", dependencies = fromList ["GridTL","TL","Translate","subtractCoord"]}
Concept {conceptName = "Attach", parameters = ["prev","current"], conceptBody = "Translate(current, BR(prev) - TL(current))", dependencies = fromList ["BR","TL","Translate","subtractCoord"]}
["Attach","BR","GridTL","Objects","Start","TL","Translate","coordX","head","lambda","scan","sortBy","subtractCoord","tail"]
```

## Instrumentation

```json
{"task":"data/03560426.json","mode":"Full","config":{"state_budget":1000000,"constant_radius":2,"correspondence_budget":256,"solution_limit":128,"encoder":"EncoderConfig {connectivity = Four, encoderBackground = 0}"},"solved":true,"program":"objects = sortBy(LeftToRight, objects)\nStart = lambda current: Translate(current, GridTL - TL(current))\nAttach = lambda prev,current: Translate(current, BR(prev) - TL(current))\nscan(Attach, Start(head(objects)), tail(objects))","description_length":23,"distinct_symbol_kinds":14,"statistics":{"expanded_states":1305,"complete_programs":1,"partial_skeleton_states":7,"maximum_search_depth":7,"first_solution_expanded_states":1251,"first_solution_seconds":4.7867e-3,"wall_seconds":5.0086e-3,"witness_resolved_instance_holes":10,"enumerated_schema_holes":0,"dependency_relation_checks":1044,"valid_programs":1,"budget_exhausted":false,"type_pruning":{"opportunities":0,"rejected":0,"ratio":null},"effect_pruning":{"opportunities":64,"rejected":62,"ratio":0.96875},"dependency_pruning":{"opportunities":92,"rejected":85,"ratio":0.9239130434782609},"witness_pruning":{"opportunities":174,"rejected":172,"ratio":0.9885057471264368}},"limitations":[],"tests":[{"prediction":[[7,0,0,0,0,0,0,0,0,0],[7,0,0,0,0,0,0,0,0,0],[7,0,0,0,0,0,0,0,0,0],[8,8,0,0,0,0,0,0,0,0],[8,8,0,0,0,0,0,0,0,0],[8,6,0,0,0,0,0,0,0,0],[0,6,0,0,0,0,0,0,0,0],[0,3,3,0,0,0,0,0,0,0],[0,3,3,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]],"exact":true}]}
```
