# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_place node=10 children=[8,9]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=11 children=[10]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,3)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_place node=18 children=[14,17]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=22 children=[11,18,21]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 1, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 1, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=23 children=[3,6,22]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=24 children=[23]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","background","canvasSize","cardinality","coord","fst","head","index","lambda","literal","mkScene","objectOf","objects","place","scan","snd","sortBy","subtract","tail","x"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=16; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I2 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectCells","background","canvasSize","cardinality","coord","fst","head","index","lambda","literal","mkScene","objectOf","objects","place","scan","snd","sortBy","subtract","tail","x"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=10; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,19,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,19,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))
TaskInvented I0: (lambda __r1b0:PlacedT. subtract(IntV 0,x(Anchor(__r1b0,TL)))); repeats=8; portfolio MDL saving=31
TaskInvented I1: (lambda __r1b0:PlacedT. subtract(IntV 0,x(Anchor(__r1b0,TR)))); repeats=8; portfolio MDL saving=31
TaskInvented I2: (lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))); repeats=16; portfolio MDL saving=101
TaskInvented I3: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. cardinality(ObjectCells(objectOf(__r1b0)))),objects(v0))); repeats=16; portfolio MDL saving=69
TaskInvented I4: (lambda v0:SceneT. head(sortBy((lambda __r1b0:PlacedT. cardinality(ObjectCells(objectOf(__r1b0)))),objects(v0)))); repeats=16; portfolio MDL saving=4
TaskInvented I5: (lambda v0:SceneT. objectOf(head(sortBy((lambda __r1b0:PlacedT. cardinality(ObjectCells(objectOf(__r1b0)))),objects(v0))))); repeats=16; portfolio MDL saving=3
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","background","canvasSize","cardinality","coord","fst","head","index","lambda","literal","mkScene","objectOf","objects","place","scan","snd","sortBy","subtract","tail","x"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
