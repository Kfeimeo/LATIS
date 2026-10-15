# LATIS v0.3R induced TSL trace

Only training IO enters Learn; test labels are evaluated after selection. StructuralPriorCount=0.

The root is a typed Scene -> Scene graph. Return-type filtering visits the entire Base registry. Effect checks restrict conditional witness input domains. Each witness produces child learning tasks; a rule is activated only after every child has a nonempty version space. No task classifier selects scan.

## Deduction and child specifications

```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,36)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,18)]
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
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
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
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=13 children=[9,12]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=15 children=[13,14]; component projection of output specification
Nonempty VS_Translate node=16 children=[6,15]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec (-10) 0,Vec 2 0,Vec (-10) 0,Vec 2 0]
Nonempty VS_lambda node=17 children=[16]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=22 children=[21,18]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 11 0,Vec 11 0]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=26 children=[17,22,25]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 13, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0}))]; includes-seed convention; no task classifier
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
Nonempty VS_mkScene node=27 children=[3,4,26]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,18)]
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
MRV immediate domains=[(0,1),(1,0),(2,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,0),(2,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
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
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
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
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_lambda node=28 children=[27]; function graph -> parameter binding and output points
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(index(objects(v0),IntV 0),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))
TaskInvented I0: (lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))); repeats=8; portfolio MDL saving=101
TaskInvented I1: (lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))); repeats=8; portfolio MDL saving=101
TaskInvented I2: (lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))); repeats=8; portfolio MDL saving=101
TaskInvented I3: (lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))); repeats=8; portfolio MDL saving=101
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","Translate","canvasSize","fst","head","index","lambda","literal","mkScene","objects","scan","snd","sortBy","subtract","tail","vec","x","y"]; TaskInvented=["I0","I1","I2","I3"]; StructuralPriorCount=0

```

## Supported map / scan rules

```text
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=26 children=[17,22,25]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 13, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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

```

## Final expression and free-variable dependencies

```text
(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))
FV=[]
```

## Version space, inventions, induced TSL, exact verification and MDL

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\results\\v03\\stress\\C-scene-axis\\task.json","mode":"NoFVDependency","train_exact":true,"heldout_exact":false,"heldout_available":true,"failure":"AbstractionMissing","failure_evidence":"selected exact-training Base program does not generalize to heldout; training specification underdetermines the abstraction","program":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))","typed_ast":{"type":"ArrowT SceneT SceneT","expression":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))","free_variables":[],"binding_accesses":["v0","v1.0","v1.1"],"children":[{"type":"SceneT","expression":"mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0))))","free_variables":["v0"],"binding_accesses":["v0","v1.0","v1.1"],"children":[{"type":"SizeT","expression":"canvasSize(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]},{"type":"ColorT","expression":"ColorV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"ListT PlacedT","expression":"scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))","free_variables":["v0"],"binding_accesses":["v0","v1.0","v1.1"],"children":[{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0)))","free_variables":[],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"VecT","expression":"vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL)))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"y(Anchor(fst(v1),TL))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),TL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"x(Anchor(fst(v1),BL))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),BL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"BL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"PlacedT","expression":"Translate(head(objects(v0)),VecV (Vec 11 0))","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"PlacedT","expression":"head(objects(v0))","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]},{"type":"VecT","expression":"VecV (Vec 11 0)","free_variables":[],"binding_accesses":[],"children":[]}]},{"type":"ListT PlacedT","expression":"tail(objects(v0))","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]}]}]}]},"portfolio_count":32,"version_space_derivations":32,"base_activated":[{"symbol":"Anchor","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),BL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),TL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),TR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),TL)); FV=[\"v1\"]"}]},{"symbol":"Translate","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 11 0,Vec 11 0]"},{"specification":"PlacedT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec (-10) 0,Vec 2 0,Vec (-10) 0,Vec 2 0]"}]},{"symbol":"canvasSize","source":"BaseActivated","support":[{"specification":"SizeT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; canvasSize(v0); FV=[\"v0\"]"}]},{"symbol":"fst","source":"BaseActivated","support":[{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),BL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),TL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),TR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),TL)); FV=[\"v1\"]"}]},{"symbol":"head","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(objects(v0)); FV=[\"v0\"]"}]},{"symbol":"index","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(objects(v0),IntV 0); FV=[\"v0\"]"}]},{"symbol":"lambda","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"literal","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(objects(v0),IntV 0); FV=[\"v0\"]"},{"specification":"VecT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; VecV (Vec 11 0); FV=[]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; IntV 0; FV=[]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),BL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),TL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),TR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),TL)); FV=[\"v1\"]"}]},{"symbol":"mkScene","source":"BaseActivated","support":[{"specification":"SceneT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"mkScene residual: canonical correspondence + Render-validated paint order; branch=0"}]},{"symbol":"objects","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(objects(v0)); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(objects(v0),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(objects(v0)); FV=[\"v0\"]"}]},{"symbol":"scan","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 13, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0}))]; includes-seed convention; no task classifier"}]},{"symbol":"snd","source":"BaseActivated","support":[{"specification":"PlacedT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; snd(v1); FV=[\"v1\"]"}]},{"symbol":"sortBy","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"}]},{"symbol":"subtract","source":"BaseActivated","support":[{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"conditional scalar inverse (observed operand; remaining values deduced)"}]},{"symbol":"tail","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(objects(v0)); FV=[\"v0\"]"}]},{"symbol":"vec","source":"BaseActivated","support":[{"specification":"VecT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"component projection of output specification"}]},{"symbol":"x","source":"BaseActivated","support":[{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),BL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),TL)); FV=[\"v1\"]"}]},{"symbol":"y","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),TR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),TL)); FV=[\"v1\"]"}]}],"task_invented":[{"name":"I0","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0)))","free_variables":[],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"VecT","expression":"vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL))),IntV 0)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),TL)))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"y(Anchor(fst(v1),TL))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),TL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"x(Anchor(fst(v1),TL))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),TL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},"repeated_occurrences":8,"mdl_saving":101,"saving_scope":"exact-valid program portfolio","evidence":"exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"},{"name":"I1","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0)))","free_variables":[],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"VecT","expression":"vec(subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL))),IntV 0)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"subtract(y(Anchor(fst(v1),TL)),x(Anchor(fst(v1),BL)))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"y(Anchor(fst(v1),TL))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),TL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"x(Anchor(fst(v1),BL))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),BL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"BL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},"repeated_occurrences":8,"mdl_saving":101,"saving_scope":"exact-valid program portfolio","evidence":"exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"},{"name":"I2","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0)))","free_variables":[],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"VecT","expression":"vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL))),IntV 0)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),TL)))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"y(Anchor(fst(v1),TR))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),TR)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"x(Anchor(fst(v1),TL))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),TL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},"repeated_occurrences":8,"mdl_saving":101,"saving_scope":"exact-valid program portfolio","evidence":"exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"},{"name":"I3","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0)))","free_variables":[],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"VecT","expression":"vec(subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL))),IntV 0)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"subtract(y(Anchor(fst(v1),TR)),x(Anchor(fst(v1),BL)))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"IntT","expression":"y(Anchor(fst(v1),TR))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),TR)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"x(Anchor(fst(v1),BL))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),BL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"BL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},"repeated_occurrences":8,"mdl_saving":101,"saving_scope":"exact-valid program portfolio","evidence":"exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"}],"statistics":{"base_symbols_activated":18,"base_symbols_rejected":46,"bottom_up_terms":0,"branch_points":13,"depth_cutoffs":0,"distinct_symbol_count":16,"effect_pruned":158,"exact_verifier_calls":32,"expression_tests":4360,"failed_witness_decompositions":191,"first_solution_states":9682,"fv_bindings_eliminated":0,"induced_tsl_symbol_count":22,"invented_abstractions":4,"join_nodes":8,"lookahead_witness_calls":3046,"materialized_child_asts":112,"materialized_complete_asts":32,"memo_hits":88,"memo_queries":235,"memoized_learning_tasks":147,"observer_terms":8558,"program_ast_length":31,"propagation_steps":2041,"recursive_learning_tasks":235,"root_learning_tasks":1,"semantic_deduplications":0,"structural_deduplications":6,"structural_prior_count":0,"successful_witness_decompositions":8,"total_expanded_work":9682,"union_nodes":5,"version_space_nodes":28,"witness_calls":4699,"witness_unavailable":1561,"wall_clock_seconds":8.1544888},"bounded":false,"configuration":{"work_budget":250000,"depth":7,"frontier":32,"correspondence_budget":32},"mdl":{"score":51,"ast_length":31,"distinct_symbols":16,"portfolio_saving":404},"secondary_latent_path":"Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called","predictions":[[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]}
```

Limits: depth=7, extraction frontier=32; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs.

Abstraction compression is measured over distinct exact-valid portfolio programs. Naming a single-use scan lambda does not by itself shorten the winning AST. `I<n>` names are assigned only after discovery; any Attach interpretation is a post hoc semantic description.

Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation.
