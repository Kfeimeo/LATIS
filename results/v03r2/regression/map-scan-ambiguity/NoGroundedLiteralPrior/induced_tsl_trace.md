# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,16)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
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
Nonempty VS_map node=16 children=[10,15]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=18 children=[17,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=19 children=[18]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=33 children=[32,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=39 children=[19,33,38]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=41 children=[3,6,40]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=43 children=[10,42]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
Nonempty VS_Translate node=18 children=[17,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=19 children=[18]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,3),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=48 children=[47,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=50 children=[19,48,49]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=52 children=[3,6,51]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=54 children=[10,53]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=18 children=[17,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=19 children=[18]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=56 children=[19,48,55]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
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
Nonempty VS_mkScene node=58 children=[3,6,57]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=63 children=[10,62]; map witness: corresponding f(x_i)=y_i; element instances=6
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
Nonempty VS_Translate node=18 children=[17,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=19 children=[18]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=68 children=[19,33,67]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
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
Nonempty VS_mkScene node=70 children=[3,6,69]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=72 children=[10,71]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=18 children=[17,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=19 children=[18]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=76 children=[75,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=78 children=[19,76,77]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
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
Nonempty VS_mkScene node=80 children=[3,6,79]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=85 children=[10,84]; map witness: corresponding f(x_i)=y_i; element instances=6
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
Nonempty VS_Translate node=18 children=[17,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=19 children=[18]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,12),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=99 children=[98,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=104 children=[19,99,103]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=106 children=[3,6,105]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=108 children=[10,107]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
Nonempty VS_Translate node=18 children=[17,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=19 children=[18]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=110 children=[109,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=112 children=[19,110,111]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=114 children=[3,6,113]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=116 children=[10,115]; map witness: corresponding f(x_i)=y_i; element instances=6
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=18 children=[17,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1),Vec 1 (-1),Vec 1 (-1)]
Nonempty VS_lambda node=19 children=[18]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,11),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=129 children=[128,8]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 (-1),Vec 1 (-1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=131 children=[19,129,130]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=133 children=[3,6,132]; mkScene residual: canonical correspondence + Render-validated paint order; branch=1
Nonempty VS_lambda node=135 children=[134]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","Translate","background","canvasSize","cardinality","head","index","lambda","literal","map","mkScene","objectOf","objects","scan","snd","sortBy","subtract","tail","x","y"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,1),(13,3),(14,4),(15,4),(16,4),(17,4),(18,11),(19,26),(20,42),(21,57),(22,64),(23,64),(24,64),(25,70),(26,92),(27,127),(28,162),(29,188),(30,201),(31,216),(32,249),(33,306),(34,379),(35,463),(36,550),(37,599),(38,614),(39,620),(40,620),(41,620),(42,620),(43,620),(44,620),(45,620),(46,620),(47,620),(48,620),(49,620),(50,620),(51,620),(52,620),(53,620),(54,620),(55,620),(56,620),(57,620),(58,620),(59,620),(60,620),(61,620),(62,620),(63,620),(64,620),(65,620),(66,620),(67,620),(68,620),(69,620),(70,620),(71,620),(72,620),(73,620),(74,620),(75,620),(76,620),(77,620),(78,620),(79,620),(80,620),(81,620),(82,620),(83,620),(84,620),(85,620),(86,620),(87,620),(88,620),(89,620),(90,620),(91,620),(92,620),(93,620),(94,620),(95,620),(96,620)]
Abstraction round=0; exact frontier=620; accepted=["I0","I1","I2","I3","I4"]
Task TSL supported Base=["Anchor","ObjectCells","Translate","background","canvasSize","cardinality","head","index","lambda","literal","map","mkScene","objectOf","objects","scan","snd","sortBy","subtract","tail","x","y"]
Abstraction round=1; exact frontier=620; accepted=[]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,1),(13,3),(14,4),(15,4),(16,4),(17,4),(18,11),(19,26),(20,42),(21,57),(22,64),(23,64),(24,64),(25,70),(26,92),(27,127),(28,162),(29,188),(30,201),(31,216),(32,249),(33,306),(34,379),(35,463),(36,550),(37,599),(38,614),(39,620),(40,620),(41,620),(42,620),(43,620),(44,620),(45,620),(46,620),(47,620),(48,620),(49,620),(50,620),(51,620),(52,620),(53,620),(54,620),(55,620),(56,620),(57,620),(58,620),(59,620),(60,620),(61,620),(62,620),(63,620),(64,620),(65,620),(66,620),(67,620),(68,620),(69,620),(70,620),(71,620),(72,620),(73,620),(74,620),(75,620),(76,620),(77,620),(78,620),(79,620),(80,620),(81,620),(82,620),(83,620),(84,620),(85,620),(86,620),(87,620),(88,620),(89,620),(90,620),(91,620),(92,620),(93,620),(94,620),(95,620),(96,620)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,6,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,7,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,7,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,8,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,9,2,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,10,2,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,10,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
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
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,13,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,15,3,4,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,13,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(objects(v0)),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(__cse0),VecV (Vec 1 (-1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,14,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,12,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
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
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
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
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,14,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
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
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
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
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),VecV (Vec 1 (-1)))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 1 (-1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 (-1)))),objects(v0))))
TaskInvented I0: (lambda __r1h0:ListT PlacedT. map((lambda __r1b0:PlacedT. Translate(__r1b0,VecV (Vec 1 (-1)))),__r1h0)); repeats=31; portfolio MDL saving=84
TaskInvented I1: (lambda __r1h0:ListT PlacedT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda __r1b0:PlacedT. Translate(__r1b0,VecV (Vec 1 (-1)))),__r1h0))); repeats=14; portfolio MDL saving=30
TaskInvented I2: (lambda __r1h0:ColorT. (lambda __r1h1:ListT PlacedT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),__r1h0,map((lambda __r1b0:PlacedT. Translate(__r1b0,VecV (Vec 1 (-1)))),__r1h1)))); repeats=22; portfolio MDL saving=3
TaskInvented I3: (lambda __r1h0:SizeT. (lambda __r1h1:ListT PlacedT. mkScene(__r1h0,ColorV 0,map((lambda __r1b0:PlacedT. Translate(__r1b0,VecV (Vec 1 (-1)))),__r1h1)))); repeats=22; portfolio MDL saving=3
TaskInvented I4: (lambda __r1h0:AnchorT. (lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 22, gridHeight = 22}),ColorV 0,map((lambda __r1b0:PlacedT. Translate(__r1b0,VecV (Vec 1 (-1)))),sortBy((lambda __r1b0:PlacedT. subtract(IntV 0,x(Anchor(__r1b0,__r1h0)))),objects(v0)))))); repeats=3; portfolio MDL saving=2
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","Translate","background","canvasSize","cardinality","head","index","lambda","let","literal","map","mkScene","objectOf","objects","scan","snd","sortBy","subtract","tail","x","y"]; TaskInvented=["I0","I1","I2","I3","I4"]; StructuralPriorCount=0
```
