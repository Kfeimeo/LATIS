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
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
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
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,2)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,3)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_place node=21 children=[20,17]; place inverse: output local geometry and absolute origin; no translation template
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=18; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,3)]
Learn(PlacedT; observations=18; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT),("v2",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
Nonempty VS_lambda node=22 children=[21]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_fold node=29 children=[22,25,28]; fold conditional transition trace; all intermediate states grounded; final state exact
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=34 children=[11,30,33]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=35 children=[3,6,34]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=36 children=[35]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","background","canvasSize","coord","fold","fst","head","lambda","literal","mkScene","objectOf","objects","place","scan","snd","sortBy","tail","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=32; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","background","canvasSize","coord","fold","fst","head","lambda","literal","mkScene","objectOf","objects","place","scan","snd","sortBy","tail","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=16; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,14,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,16,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),Anchor(fst(v1),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(IntV 0,IntV 0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),CoordV (Coord {cx = 0, cy = 0})),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))
TaskInvented I0: (lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),Anchor(fst(__r1b0),BR))); repeats=32; portfolio MDL saving=213
TaskInvented I1: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,BL))),objects(v0))); repeats=16; portfolio MDL saving=69
TaskInvented I2: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TL))),objects(v0))); repeats=16; portfolio MDL saving=69
TaskInvented I3: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TR))),objects(v0))); repeats=16; portfolio MDL saving=69
TaskInvented I4: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,BR))),objects(v0))); repeats=16; portfolio MDL saving=69
TaskInvented I5: (lambda v0:SceneT. head(sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,BL))),objects(v0)))); repeats=16; portfolio MDL saving=4
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","background","canvasSize","coord","fold","fst","head","lambda","literal","mkScene","objectOf","objects","place","scan","snd","sortBy","tail","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
