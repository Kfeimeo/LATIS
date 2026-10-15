# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,28)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=9 children=[7,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=10 children=[9]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=12 children=[10,11]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=24 children=[23,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=26 children=[15,24,25]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
Nonempty VS_mkScene node=28 children=[3,6,27]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=30 children=[10,29]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=39 children=[38,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=41 children=[15,39,40]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 1, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 1})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 1})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=43 children=[3,6,42]; mkScene residual: canonical correspondence + Render-validated paint order; branch=3
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=48 children=[10,47]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=57 children=[56,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=62 children=[15,57,61]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
Nonempty VS_mkScene node=64 children=[3,6,63]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=66 children=[10,65]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=68 children=[67,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=70 children=[15,68,69]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
Nonempty VS_mkScene node=72 children=[3,6,71]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=74 children=[10,73]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=83 children=[82,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=85 children=[15,83,84]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 1, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
Nonempty VS_mkScene node=87 children=[3,6,86]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=94 children=[10,93]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=103 children=[102,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=110 children=[15,103,109]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 1, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
Nonempty VS_mkScene node=112 children=[3,6,111]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=117 children=[10,116]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=14 children=[13,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=122 children=[15,83,121]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 1, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=124 children=[3,6,123]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
Nonempty VS_lambda node=126 children=[125]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","Translate","background","canvasSize","cardinality","head","index","lambda","literal","map","mkScene","objectOf","objects","scan","snd","sortBy","subtract","tail","x","y"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,1),(13,3),(14,4),(15,4),(16,4),(17,4),(18,11),(19,26),(20,42),(21,57),(22,64),(23,64),(24,64),(25,70),(26,89),(27,111),(28,130),(29,151),(30,165),(31,180),(32,207),(33,240),(34,276),(35,330),(36,402),(37,444),(38,453),(39,456),(40,456),(41,456),(42,456),(43,456),(44,456),(45,456),(46,456),(47,456),(48,456),(49,456),(50,456),(51,456),(52,456),(53,456),(54,456),(55,456),(56,456),(57,456),(58,456),(59,456),(60,456),(61,456),(62,456),(63,456),(64,456),(65,456),(66,456),(67,456),(68,456),(69,456),(70,456),(71,456),(72,456),(73,456),(74,456),(75,456),(76,456),(77,456),(78,456),(79,456),(80,456),(81,456),(82,456),(83,456),(84,456),(85,456),(86,456),(87,456),(88,456),(89,456),(90,456),(91,456),(92,456),(93,456),(94,456),(95,456),(96,456)]
Abstraction round=0; exact frontier=456; accepted=["I0","I1","I2","I3","I4"]
Task TSL supported Base=["Anchor","ObjectCells","Translate","background","canvasSize","cardinality","head","index","lambda","literal","map","mkScene","objectOf","objects","scan","snd","sortBy","subtract","tail","x","y"]
Abstraction round=1; exact frontier=456; accepted=[]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,1),(13,3),(14,4),(15,4),(16,4),(17,4),(18,11),(19,26),(20,42),(21,57),(22,64),(23,64),(24,64),(25,70),(26,89),(27,111),(28,130),(29,151),(30,165),(31,180),(32,207),(33,240),(34,276),(35,330),(36,402),(37,444),(38,453),(39,456),(40,456),(41,456),(42,456),(43,456),(44,456),(45,456),(46,456),(47,456),(48,456),(49,456),(50,456),(51,456),(52,456),(53,456),(54,456),(55,456),(56,456),(57,456),(58,456),(59,456),(60,456),(61,456),(62,456),(63,456),(64,456),(65,456),(66,456),(67,456),(68,456),(69,456),(70,456),(71,456),(72,456),(73,456),(74,456),(75,456),(76,456),(77,456),(78,456),(79,456),(80,456),(81,456),(82,456),(83,456),(84,456),(85,456),(86,456),(87,456),(88,456),(89,456),(90,456),(91,456),(92,456),(93,456),(94,456),(95,456),(96,456)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,6,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,7,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,7,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,8,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,9,2,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,10,2,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,10,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
```
