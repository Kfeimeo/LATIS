# LATIS v0.3R induced TSL trace

Only training IO enters Learn; test labels are evaluated after selection. StructuralPriorCount=0.

The root is a typed Scene -> Scene graph. Return-type filtering visits the entire Base registry. Effect checks restrict conditional witness input domains. Each witness produces child learning tasks; a rule is activated only after every child has a nonempty version space. No task classifier selects scan.

## Deduction and child specifications

```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,26)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=7 children=[5,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=8 children=[7]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=12 children=[8,11]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=19 children=[18,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=23 children=[15,19,22]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=25 children=[3,4,24]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=29 children=[8,28]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=33 children=[32,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=37 children=[15,33,36]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=39 children=[3,4,38]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=41 children=[8,40]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=46 children=[45,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_scan node=47 children=[15,46,42]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=49 children=[3,4,48]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=53 children=[8,52]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=57 children=[15,19,56]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=59 children=[3,4,58]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=63 children=[8,62]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=67 children=[66,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=71 children=[15,67,70]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=73 children=[3,4,72]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=75 children=[8,74]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=80 children=[79,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_scan node=81 children=[15,80,76]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=83 children=[3,4,82]; mkScene residual: canonical correspondence + Render-validated paint order; branch=1
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=87 children=[8,86]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=91 children=[90,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=95 children=[15,91,94]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=97 children=[3,4,96]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=99 children=[8,98]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=101 children=[15,91,100]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=103 children=[3,4,102]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,26)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_lambda node=105 children=[104]; function graph -> parameter binding and output points
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,7,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,6,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,10,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,10,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(index(objects(v0),IntV 0),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,9,2,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,9,2,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(index(objects(v0),IntV 0),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","Translate","canvasSize","cardinality","head","index","lambda","literal","map","mkScene","objectOf","objects","scan","snd","sortBy","subtract","tail","x","y"]; TaskInvented=[]; StructuralPriorCount=0

```

## Supported map / scan rules

```text
Nonempty VS_map node=12 children=[8,11]; map witness: corresponding f(x_i)=y_i; element instances=6
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=23 children=[15,19,22]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_map node=29 children=[8,28]; map witness: corresponding f(x_i)=y_i; element instances=6
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=37 children=[15,33,36]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_map node=41 children=[8,40]; map witness: corresponding f(x_i)=y_i; element instances=6
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=47 children=[15,46,42]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_map node=53 children=[8,52]; map witness: corresponding f(x_i)=y_i; element instances=6
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=57 children=[15,19,56]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_map node=63 children=[8,62]; map witness: corresponding f(x_i)=y_i; element instances=6
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=71 children=[15,67,70]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_map node=75 children=[8,74]; map witness: corresponding f(x_i)=y_i; element instances=6
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=81 children=[15,80,76]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_map node=87 children=[8,86]; map witness: corresponding f(x_i)=y_i; element instances=6
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=95 children=[15,91,94]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_map node=99 children=[8,98]; map witness: corresponding f(x_i)=y_i; element instances=6
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=101 children=[15,91,100]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]

```

## Final expression and free-variable dependencies

```text
(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))
FV=[]
```

## Version space, inventions, induced TSL, exact verification and MDL

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\results\\v03\\regression\\map-scan-ambiguity\\task.json","mode":"NoFVDependency","train_exact":true,"heldout_exact":true,"heldout_available":true,"failure":"None","failure_evidence":"training exact; heldout is assessed only after MDL selection","program":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))","typed_ast":{"type":"ArrowT SceneT SceneT","expression":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))","free_variables":[],"binding_accesses":["v0","v1"],"children":[{"type":"SceneT","expression":"mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0)))","free_variables":["v0"],"binding_accesses":["v0","v1"],"children":[{"type":"SizeT","expression":"canvasSize(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]},{"type":"ColorT","expression":"ColorV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"ListT PlacedT","expression":"map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))","free_variables":["v0"],"binding_accesses":["v0","v1"],"children":[{"type":"ArrowT PlacedT PlacedT","expression":"(lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1))))","free_variables":[],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"Translate(v1,VecV (Vec 1 (-1)))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]},{"type":"VecT","expression":"VecV (Vec 1 (-1))","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]}]}]},"portfolio_count":32,"version_space_derivations":78,"base_activated":[{"symbol":"Anchor","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"}]},{"symbol":"ObjectCells","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),IntV 1); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"Translate","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]"},{"specification":"PlacedT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]"},{"specification":"PlacedT; observations=6; Gamma=[(\"v0\",SceneT),(\"v1\",PlacedT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]"}]},{"symbol":"canvasSize","source":"BaseActivated","support":[{"specification":"SizeT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; canvasSize(v0); FV=[\"v0\"]"}]},{"symbol":"cardinality","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),IntV 1); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"head","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(tail(objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(objects(v0)); FV=[\"v0\"]"}]},{"symbol":"index","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),IntV 1); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(objects(v0)),IntV 1); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(objects(v0),IntV 1); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(objects(v0),IntV 0); FV=[\"v0\"]"}]},{"symbol":"lambda","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),IntV 1); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"literal","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),IntV 1); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"map","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"map witness: corresponding f(x_i)=y_i; element instances=6"}]},{"symbol":"mkScene","source":"BaseActivated","support":[{"specification":"SceneT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"mkScene residual: canonical correspondence + Render-validated paint order; branch=0"},{"specification":"SceneT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"mkScene residual: canonical correspondence + Render-validated paint order; branch=1"}]},{"symbol":"objectOf","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),IntV 1); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"objects","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),IntV 1); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"scan","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier"}]},{"symbol":"snd","source":"BaseActivated","support":[{"specification":"PlacedT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; snd(v1); FV=[\"v1\"]"}]},{"symbol":"sortBy","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),IntV 1); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"subtract","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)),IntV 0); FV=[\"v0\"]"}]},{"symbol":"tail","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),IntV 1); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(objects(v0)),IntV 1); FV=[\"v0\"]"}]},{"symbol":"x","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"y","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"}]}],"task_invented":[],"statistics":{"base_symbols_activated":20,"base_symbols_rejected":44,"bottom_up_terms":0,"branch_points":15,"depth_cutoffs":0,"distinct_symbol_count":7,"effect_pruned":447,"exact_verifier_calls":32,"expression_tests":13726,"failed_witness_decompositions":353,"first_solution_states":24691,"fv_bindings_eliminated":0,"induced_tsl_symbol_count":20,"invented_abstractions":0,"join_nodes":35,"lookahead_witness_calls":5745,"materialized_child_asts":209,"materialized_complete_asts":32,"memo_hits":109,"memo_queries":470,"memoized_learning_tasks":361,"observer_terms":46799,"program_ast_length":12,"propagation_steps":4750,"recursive_learning_tasks":470,"root_learning_tasks":1,"semantic_deduplications":0,"structural_deduplications":31,"structural_prior_count":0,"successful_witness_decompositions":49,"total_expanded_work":24691,"union_nodes":26,"version_space_nodes":105,"witness_calls":9362,"witness_unavailable":3424,"wall_clock_seconds":32.2367688},"bounded":false,"configuration":{"work_budget":250000,"depth":7,"frontier":32,"correspondence_budget":32},"mdl":{"score":23,"ast_length":12,"distinct_symbols":7,"portfolio_saving":0},"secondary_latent_path":"Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called","predictions":[[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,6,0,0,0,0],[0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,6,6,0,0,0,0],[0,0,0,8,0,0,0,0,0,2,2,2,0,0,0,0,6,6,0,0,0,0],[0,0,0,8,0,0,0,0,0,2,2,2,0,0,0,0,6,6,0,0,0,0],[0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]}
```

Limits: depth=7, extraction frontier=32; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs.

Abstraction compression is measured over distinct exact-valid portfolio programs. Naming a single-use scan lambda does not by itself shorten the winning AST. `I<n>` names are assigned only after discovery; any Attach interpretation is a post hoc semantic description.

Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation.
