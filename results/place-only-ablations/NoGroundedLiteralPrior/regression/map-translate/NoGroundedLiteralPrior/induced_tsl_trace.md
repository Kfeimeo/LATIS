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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=10 children=[8,9]; component projection of output specification
Nonempty VS_place node=11 children=[7,10]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=12 children=[11]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=14 children=[12,13]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=18 children=[16,17]; component projection of output specification
Nonempty VS_place node=19 children=[15,18]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=20 children=[19]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=72 children=[42,71]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=81 children=[80,72]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=83 children=[20,81,82]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=85 children=[3,6,84]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=87 children=[12,86]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=92 children=[89,91]; component projection of output specification
Nonempty VS_place node=93 children=[15,92]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=94 children=[93]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,50)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=168 children=[116,167]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=177 children=[176,168]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=179 children=[94,177,178]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 1, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 1})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 1})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=181 children=[3,6,180]; mkScene residual: canonical correspondence + Render-validated paint order; branch=3
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=186 children=[12,185]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=18 children=[16,17]; component projection of output specification
Nonempty VS_place node=19 children=[15,18]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=20 children=[19]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=220 children=[196,219]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=229 children=[228,220]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=234 children=[20,229,233]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=236 children=[3,6,235]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Nonempty VS_map node=238 children=[12,237]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=18 children=[16,17]; component projection of output specification
Nonempty VS_place node=19 children=[15,18]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=20 children=[19]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=247 children=[246,242]; component projection of output specification
Nonempty VS_place node=248 children=[239,247]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=250 children=[20,248,249]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=252 children=[3,6,251]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=254 children=[12,253]; map witness: corresponding f(x_i)=y_i; element instances=6
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=18 children=[16,17]; component projection of output specification
Nonempty VS_place node=19 children=[15,18]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=20 children=[19]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=286 children=[269,285]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=295 children=[294,286]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=297 children=[20,295,296]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 1, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=299 children=[3,6,298]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=306 children=[12,305]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=310 children=[16,309]; component projection of output specification
Nonempty VS_place node=311 children=[15,310]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=312 children=[311]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=350 children=[327,349]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=359 children=[358,350]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=366 children=[312,359,365]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 1, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0}))]; includes-seed convention; no task classifier
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=368 children=[3,6,367]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Nonempty VS_map node=373 children=[12,372]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=18 children=[16,17]; component projection of output specification
Nonempty VS_place node=19 children=[15,18]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=20 children=[19]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=378 children=[20,295,377]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 1, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 13, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=380 children=[3,6,379]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_lambda node=382 children=[381]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","fst","head","index","lambda","literal","map","mkScene","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","x","y"]
Cost saturation C=1..37 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,1),(26,3),(27,4),(28,4),(29,4),(30,4),(31,11),(32,25),(33,39),(34,53),(35,60),(36,60),(37,60)]
Abstraction round=0; exact frontier=398; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","fst","head","index","lambda","literal","map","mkScene","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","x","y"]
Cost saturation C=1..37 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,1),(26,3),(27,4),(28,4),(29,4),(30,4),(31,11),(32,25),(33,39),(34,53),(35,60),(36,60),(37,60)]
Abstraction round=1; exact frontier=398; accepted=[]
Cost saturation C=1..37 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,1),(26,3),(27,4),(28,4),(29,4),(30,4),(31,11),(32,25),(33,39),(34,53),(35,60),(36,60),(37,60)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,TL)),IntV 1),add(y(Anchor(__r1b0,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,17,2,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,17,2,2,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,16,2,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,17,2,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV 1)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,3,3,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(__cse0),BR)),IntV 8)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,3,3,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),IntV 8)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,3,3,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),IntV 8)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,20,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(__cse0),BR)),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(tail(tail(__cse0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(tail(tail(__cse0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(tail(tail(__cse0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,18,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(tail(objects(v0))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,18,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(x(Anchor(head(__cse0),BR)),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV 1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV 1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,17,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center)),IntV 1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(objects(v0)),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(__cse0,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(snd(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(tail(__cse0)))))),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(__cse0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(__cse0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(__cse0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,3,2,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))) in let __cse1=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(x(Anchor(__cse1,BR)),y(Anchor(head(tail(__cse0)),TL)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),Center)),IntV 1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(tail(objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,18,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(x(Anchor(__cse1,BR)),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,18,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,18,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(tail(tail(objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(__cse0),Center)),y(Anchor(head(objects(v0)),Center)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,3,2,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))) in let __cse1=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse1),coord(x(Anchor(__cse1,Center)),y(Anchor(head(__cse0),TL)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center)),IntV 1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center)),IntV 1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center)),IntV 1))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(objects(v0)),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,18,3,2,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))) in let __cse1=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(x(Anchor(__cse1,BR)),add(y(Anchor(head(tail(__cse0)),Center)),IntV (-1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,3,2,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))) in let __cse1=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse1),coord(x(Anchor(__cse1,Center)),y(Anchor(head(tail(__cse0)),Center)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(objects(v0)),Center)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,18,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in let __cse1=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse1),coord(x(Anchor(__cse1,Center)),add(y(Anchor(head(__cse0),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in let __cse1=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse1),coord(x(Anchor(__cse1,Center)),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(__cse0),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,3,2,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))) in let __cse1=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse1),coord(x(Anchor(__cse1,Center)),add(y(Anchor(head(__cse0),Center)),IntV (-1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,19,3,2,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))) in let __cse1=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse1),coord(x(Anchor(__cse1,Center)),add(y(Anchor(head(tail(__cse0)),TL)),IntV 1))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,19,4,2,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,19,4,2,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,19,4,2,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,20,4,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,20,4,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,20,4,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,20,4,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),coord(x(Anchor(head(tail(objects(v0))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),coord(x(Anchor(head(tail(objects(v0))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),coord(x(Anchor(head(tail(objects(v0))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,20,4,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in let __cse1=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,20,4,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in let __cse1=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,20,4,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in let __cse1=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse1)),coord(add(x(Anchor(head(tail(__cse0)),TL)),IntV 1),y(Anchor(head(__cse0),TL)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse1)),coord(add(x(Anchor(head(tail(__cse0)),TL)),IntV 1),y(Anchor(head(__cse0),TL)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse1)),coord(add(x(Anchor(head(tail(__cse0)),TL)),IntV 1),y(Anchor(head(__cse0),TL)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BR)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BR)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),BR)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,19,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,17,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),coord(x(Anchor(head(tail(objects(v0))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),coord(x(Anchor(head(tail(objects(v0))),BR)),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(__cse1,TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(__cse1,TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(__cse1,TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(__cse1,TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(__cse1,TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(__cse1,TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0))) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(__cse0)))),IntV 1))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(__cse0)))),IntV 1))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,20,4,2,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))) in let __cse1=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(__cse0)))),IntV 1))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))),coord(x(Anchor(head(tail(tail(objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))),coord(x(Anchor(head(tail(tail(objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))),coord(x(Anchor(head(tail(tail(objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),BR)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),BR)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),BR)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,21,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(tail(__cse0)))))),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,20,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),Center)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),coord(x(Anchor(head(tail(tail(objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,19,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,19,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,18,4,2,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,19,5,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,19,5,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),coord(x(Anchor(head(tail(tail(objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(96,21,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,19,4,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),Center)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(98,20,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(98,20,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(98,20,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(98,20,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(98,20,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(99,20,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(99,20,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(99,20,5,2,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(99,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(99,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(99,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(102,23,5,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(99,20,5,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(99,20,5,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(99,20,5,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),Center)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),Center)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(100,20,5,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),Center)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
```
