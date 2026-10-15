# LATIS v0.3R induced TSL trace

Only training IO enters Learn; test labels are evaluated after selection. StructuralPriorCount=0.

The root is a typed Scene -> Scene graph. Return-type filtering visits the entire Base registry. Effect checks restrict conditional witness input domains. Each witness produces child learning tasks; a rule is activated only after every child has a nonempty version space. No task classifier selects scan.

## Deduction and child specifications

```text
Root specification Q0: ArrowT SceneT SceneT; observations=3; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=3; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,40)]
Learn(SceneT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,20)]
Learn(SizeT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=12 children=[8,11]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=14 children=[13,12]; component projection of output specification
Nonempty VS_Translate node=15 children=[5,14]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-4),Vec 0 (-2),Vec 0 (-6),Vec 0 (-5),Vec 0 (-2),Vec 0 (-4),Vec 0 (-3),Vec 0 (-1)]
Nonempty VS_lambda node=16 children=[15]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=20 children=[16,19]; map witness: corresponding f(x_i)=y_i; element instances=9
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=25 children=[24,11]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=26 children=[13,25]; component projection of output specification
Nonempty VS_Translate node=27 children=[21,26]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-2),Vec 0 (-5),Vec 0 (-2),Vec 0 (-3),Vec 0 (-1)]
Nonempty VS_lambda node=28 children=[27]; function graph -> parameter binding and output points
Learn(PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=32 children=[31,11]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=33 children=[13,32]; component projection of output specification
Learn(PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=37 children=[36,33]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-6),Vec 0 (-4)]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=41 children=[28,37,40]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1),(Coord {cx = 1, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 0, cy = 4},4),(Coord {cx = 0, cy = 5},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 1, cy = 4},4),(Coord {cx = 1, cy = 5},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 2, cy = 4},4),(Coord {cx = 2, cy = 5},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4),(Coord {cx = 3, cy = 4},4),(Coord {cx = 3, cy = 5},4)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 14}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 3, cy = 0},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 3, cy = 0},2)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=43 children=[3,4,42]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,20)]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,20)]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
Learn(PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,20)]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
Learn(PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,20)]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=47 children=[16,46]; map witness: corresponding f(x_i)=y_i; element instances=9
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=25 children=[24,11]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=26 children=[13,25]; component projection of output specification
Nonempty VS_Translate node=27 children=[21,26]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-2),Vec 0 (-4),Vec 0 (-2),Vec 0 (-5),Vec 0 (-4),Vec 0 (-3)]
Nonempty VS_lambda node=28 children=[27]; function graph -> parameter binding and output points
Learn(PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=52 children=[51,50]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=56 children=[55,11]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=58 children=[13,57]; component projection of output specification
Learn(PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=62 children=[61,58]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-6),Vec 0 (-1)]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=66 children=[28,62,65]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1),(Coord {cx = 1, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 0, cy = 4},4),(Coord {cx = 0, cy = 5},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 1, cy = 4},4),(Coord {cx = 1, cy = 5},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 2, cy = 4},4),(Coord {cx = 2, cy = 5},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4),(Coord {cx = 3, cy = 4},4),(Coord {cx = 3, cy = 5},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 3, cy = 0},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=68 children=[3,4,67]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,20)]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=9; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=9; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
Nonempty VS_lambda node=70 children=[69]; function graph -> parameter binding and output points
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,11,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,11,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,10,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,10,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),width(canvasSize(v0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),width(canvasSize(v0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),width(canvasSize(v0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),width(canvasSize(v0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,13,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,13,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 15, gridHeight = 15}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),width(canvasSize(v0)))))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),objects(v0))))
TaskInvented I0: (lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))); repeats=8; portfolio MDL saving=59
TaskInvented I1: (lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))); repeats=8; portfolio MDL saving=59
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","Translate","canvasSize","head","index","lambda","literal","map","mkScene","objects","scan","snd","sortBy","subtract","tail","vec","width","x","y"]; TaskInvented=["I0","I1"]; StructuralPriorCount=0

```

## Supported map / scan rules

```text
Nonempty VS_map node=20 children=[16,19]; map witness: corresponding f(x_i)=y_i; element instances=9
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=41 children=[28,37,40]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1),(Coord {cx = 1, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 0, cy = 4},4),(Coord {cx = 0, cy = 5},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 1, cy = 4},4),(Coord {cx = 1, cy = 5},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 2, cy = 4},4),(Coord {cx = 2, cy = 5},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4),(Coord {cx = 3, cy = 4},4),(Coord {cx = 3, cy = 5},4)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 14}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 3, cy = 0},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 3, cy = 0},2)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
Nonempty VS_map node=47 children=[16,46]; map witness: corresponding f(x_i)=y_i; element instances=9
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=66 children=[28,62,65]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1),(Coord {cx = 1, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 0, cy = 4},4),(Coord {cx = 0, cy = 5},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 1, cy = 4},4),(Coord {cx = 1, cy = 5},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 2, cy = 4},4),(Coord {cx = 2, cy = 5},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4),(Coord {cx = 3, cy = 4},4),(Coord {cx = 3, cy = 5},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 3, cy = 0},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]

```

## Final expression and free-variable dependencies

```text
(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),objects(v0))))
FV=[]
```

## Version space, inventions, induced TSL, exact verification and MDL

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\data\\arc1-frozen\\5521c0d9.json","mode":"InducedTSLFull","train_exact":true,"heldout_exact":true,"heldout_available":true,"failure":"None","failure_evidence":"finite expanded-work budget reached; no impossibility claim","program":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),objects(v0))))","typed_ast":{"type":"ArrowT SceneT SceneT","expression":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),objects(v0))))","free_variables":[],"binding_accesses":["v0","v1"],"children":[{"type":"SceneT","expression":"mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),objects(v0)))","free_variables":["v0"],"binding_accesses":["v0","v1"],"children":[{"type":"SizeT","expression":"canvasSize(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]},{"type":"ColorT","expression":"ColorV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"ListT PlacedT","expression":"map((lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))),objects(v0))","free_variables":["v0"],"binding_accesses":["v0","v1"],"children":[{"type":"ArrowT PlacedT PlacedT","expression":"(lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15))))","free_variables":[],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]},{"type":"VecT","expression":"vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(y(Anchor(v1,TL)),IntV 15)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"IntT","expression":"y(Anchor(v1,TL))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"CoordT","expression":"Anchor(v1,TL)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 15","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]},{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]}]}]},"portfolio_count":32,"version_space_derivations":352,"base_activated":[{"symbol":"Anchor","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),IntV 1),Center)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(objects(v0)),IntV 1),Center)); FV=[\"v0\"]"}]},{"symbol":"Translate","source":"BaseActivated","support":[{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-6),Vec 0 (-1)]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-6),Vec 0 (-4)]"},{"specification":"PlacedT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-2),Vec 0 (-4),Vec 0 (-2),Vec 0 (-5),Vec 0 (-4),Vec 0 (-3)]"},{"specification":"PlacedT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-2),Vec 0 (-5),Vec 0 (-2),Vec 0 (-3),Vec 0 (-1)]"},{"specification":"PlacedT; observations=9; Gamma=[(\"v0\",SceneT),(\"v1\",PlacedT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-4),Vec 0 (-2),Vec 0 (-6),Vec 0 (-5),Vec 0 (-2),Vec 0 (-4),Vec 0 (-3),Vec 0 (-1)]"}]},{"symbol":"canvasSize","source":"BaseActivated","support":[{"specification":"IntT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; width(canvasSize(v0)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; width(canvasSize(v0)); FV=[\"v0\"]"},{"specification":"IntT; observations=9; Gamma=[(\"v0\",SceneT),(\"v1\",PlacedT)]","witness":"exact forward-observation witness; width(canvasSize(v0)); FV=[\"v0\"]"},{"specification":"SizeT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; canvasSize(v0); FV=[\"v0\"]"}]},{"symbol":"head","source":"BaseActivated","support":[{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(objects(v0)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(objects(v0)),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(objects(v0)),TL)); FV=[\"v0\"]"}]},{"symbol":"index","source":"BaseActivated","support":[{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),IntV 1),Center)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(objects(v0)),IntV 1),Center)); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(objects(v0),IntV 0); FV=[\"v0\"]"}]},{"symbol":"lambda","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=3; Gamma=[]","witness":"function graph -> parameter binding and output points"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),IntV 1),Center)); FV=[\"v0\"]"}]},{"symbol":"literal","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; IntV 1; FV=[]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),IntV 1),Center)); FV=[\"v0\"]"}]},{"symbol":"map","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"map witness: corresponding f(x_i)=y_i; element instances=9"}]},{"symbol":"mkScene","source":"BaseActivated","support":[{"specification":"SceneT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"mkScene residual: canonical correspondence + Render-validated paint order; branch=0"}]},{"symbol":"objects","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),IntV 1),Center)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(objects(v0)),IntV 1),Center)); FV=[\"v0\"]"}]},{"symbol":"scan","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1),(Coord {cx = 1, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 0, cy = 4},4),(Coord {cx = 0, cy = 5},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 1, cy = 4},4),(Coord {cx = 1, cy = 5},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 2, cy = 4},4),(Coord {cx = 2, cy = 5},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4),(Coord {cx = 3, cy = 4},4),(Coord {cx = 3, cy = 5},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 3, cy = 0},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1),(Coord {cx = 1, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 3, cy = 0},2),(Coord {cx = 3, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4),(Coord {cx = 0, cy = 4},4),(Coord {cx = 0, cy = 5},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 1, cy = 3},4),(Coord {cx = 1, cy = 4},4),(Coord {cx = 1, cy = 5},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4),(Coord {cx = 2, cy = 3},4),(Coord {cx = 2, cy = 4},4),(Coord {cx = 2, cy = 5},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4),(Coord {cx = 3, cy = 2},4),(Coord {cx = 3, cy = 3},4),(Coord {cx = 3, cy = 4},4),(Coord {cx = 3, cy = 5},4)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 1, cy = 4},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 0, cy = 3},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 14}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 3, cy = 0},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 3, cy = 0},2)], orientation = 0}))]; includes-seed convention; no task classifier"}]},{"symbol":"snd","source":"BaseActivated","support":[{"specification":"IntT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(snd(v1),TR)); FV=[\"v1\"]"},{"specification":"IntT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(snd(v1),TL)); FV=[\"v1\"]"},{"specification":"PlacedT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; snd(v1); FV=[\"v1\"]"}]},{"symbol":"sortBy","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),IntV 1),Center)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"subtract","source":"BaseActivated","support":[{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"conditional scalar inverse (observed operand; remaining values deduced)"},{"specification":"IntT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"conditional scalar inverse (observed operand; remaining values deduced)"},{"specification":"IntT; observations=9; Gamma=[(\"v0\",SceneT),(\"v1\",PlacedT)]","witness":"conditional scalar inverse (observed operand; remaining values deduced)"}]},{"symbol":"tail","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),IntV 1),Center)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(objects(v0)),IntV 1),Center)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(objects(v0)); FV=[\"v0\"]"}]},{"symbol":"vec","source":"BaseActivated","support":[{"specification":"VecT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"component projection of output specification"},{"specification":"VecT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"component projection of output specification"},{"specification":"VecT; observations=9; Gamma=[(\"v0\",SceneT),(\"v1\",PlacedT)]","witness":"component projection of output specification"}]},{"symbol":"width","source":"BaseActivated","support":[{"specification":"IntT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; width(canvasSize(v0)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; width(canvasSize(v0)); FV=[\"v0\"]"},{"specification":"IntT; observations=9; Gamma=[(\"v0\",SceneT),(\"v1\",PlacedT)]","witness":"exact forward-observation witness; width(canvasSize(v0)); FV=[\"v0\"]"}]},{"symbol":"x","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),IntV 1),Center)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(objects(v0)),IntV 1),Center)); FV=[\"v0\"]"}]},{"symbol":"y","source":"BaseActivated","support":[{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; x(Anchor(index(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),IntV 1),Center)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(objects(v0)),TR)); FV=[\"v0\"]"},{"specification":"IntT; observations=3; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; y(Anchor(head(objects(v0)),TL)); FV=[\"v0\"]"},{"specification":"IntT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(snd(v1),TR)); FV=[\"v1\"]"},{"specification":"IntT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(snd(v1),TL)); FV=[\"v1\"]"}]}],"task_invented":[{"name":"I0","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT PlacedT","expression":"(lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15))))","free_variables":[],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15)))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]},{"type":"VecT","expression":"vec(IntV 0,subtract(y(Anchor(v1,TL)),IntV 15))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(y(Anchor(v1,TL)),IntV 15)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"IntT","expression":"y(Anchor(v1,TL))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"CoordT","expression":"Anchor(v1,TL)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 15","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]},"repeated_occurrences":8,"mdl_saving":59,"saving_scope":"exact-valid program portfolio","evidence":"exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"},{"name":"I1","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT PlacedT","expression":"(lambda v1:PlacedT. Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15))))","free_variables":[],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"Translate(v1,vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15)))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]},{"type":"VecT","expression":"vec(IntV 0,subtract(y(Anchor(v1,TR)),IntV 15))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(y(Anchor(v1,TR)),IntV 15)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"IntT","expression":"y(Anchor(v1,TR))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"CoordT","expression":"Anchor(v1,TR)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 15","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]},"repeated_occurrences":8,"mdl_saving":59,"saving_scope":"exact-valid program portfolio","evidence":"exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"}],"statistics":{"base_symbols_activated":19,"base_symbols_rejected":45,"bottom_up_terms":0,"branch_points":8,"depth_cutoffs":0,"distinct_symbol_count":11,"effect_pruned":178,"exact_verifier_calls":32,"expression_tests":20328,"failed_witness_decompositions":126,"first_solution_states":25008,"fv_bindings_eliminated":1980,"induced_tsl_symbol_count":21,"invented_abstractions":2,"join_nodes":22,"lookahead_witness_calls":2173,"materialized_child_asts":439,"materialized_complete_asts":32,"memo_hits":24,"memo_queries":187,"memoized_learning_tasks":162,"observer_terms":13541,"program_ast_length":19,"propagation_steps":2320,"recursive_learning_tasks":187,"root_learning_tasks":1,"semantic_deduplications":0,"structural_deduplications":26,"structural_prior_count":0,"successful_witness_decompositions":26,"total_expanded_work":25008,"union_nodes":17,"version_space_nodes":70,"witness_calls":3800,"witness_unavailable":1541,"wall_clock_seconds":15.1763919},"bounded":true,"configuration":{"work_budget":25000,"depth":7,"frontier":32,"correspondence_budget":32},"mdl":{"score":34,"ast_length":19,"distinct_symbols":11,"portfolio_saving":118},"secondary_latent_path":"Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called","predictions":[[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[2,2,2,2,0,0,0,0,0,0,0,0,0,0,0],[2,2,2,2,0,0,0,0,0,0,0,0,0,0,0],[2,2,2,2,0,4,4,4,0,0,0,0,0,0,0],[2,2,2,2,0,4,4,4,0,0,0,0,0,0,0],[2,2,2,2,0,4,4,4,0,0,0,0,0,0,0],[2,2,2,2,0,4,4,4,0,0,0,0,0,0,0],[2,2,2,2,0,4,4,4,0,0,0,0,0,0,0],[0,0,0,0,0,4,4,4,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,1,1,1,1,1],[0,0,0,0,0,0,0,0,0,0,1,1,1,1,1],[0,0,0,0,0,0,0,0,0,0,1,1,1,1,1],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]}
```

Limits: depth=7, extraction frontier=32; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs.

Abstraction compression is measured over distinct exact-valid portfolio programs. Naming a single-use scan lambda does not by itself shorten the winning AST. `I<n>` names are assigned only after discovery; any Attach interpretation is a post hoc semantic description.

Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation.
