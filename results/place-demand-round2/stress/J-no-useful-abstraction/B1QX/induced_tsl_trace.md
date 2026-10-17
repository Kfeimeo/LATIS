# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,2)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,8)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 13 non-local residual branches of coordAdd; CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=12 children=[11,8]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,98),(1,7)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,98),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=19 children=[18,14]; component projection of output specification
Nonempty VS_place node=21 children=[7,20]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=22 children=[21]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=31 children=[22,30]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 11 non-local residual branches of coordAdd; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=37 children=[36,8]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,99),(1,31)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=46 children=[45,41]; component projection of output specification
Nonempty VS_place node=48 children=[32,47]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=49 children=[48]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 16 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=143 children=[142,96]; component projection of output specification
Nonempty VS_place node=144 children=[65,143]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=153 children=[49,144,152]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 14, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=155 children=[3,6,154]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=165 children=[22,164]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,8)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 11 non-local residual branches of coordAdd; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=167 children=[166,8]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,99),(1,25)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,99),(1,31)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=168 children=[45,39]; component projection of output specification
Nonempty VS_place node=170 children=[32,169]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=171 children=[170]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 16 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=280 children=[233,279]; component projection of output specification
Nonempty VS_place node=281 children=[187,280]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=291 children=[171,281,290]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 14, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=293 children=[3,6,292]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=295 children=[294]; function graph -> parameter binding and output points
Deferred pass: released=5 stale memo=17 share=62500
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,2)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,8)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=297 children=[11,296]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=298 children=[18,14]; component projection of output specification
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=303 children=[302,299]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=12 children=[11,8]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=308 children=[11,307]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=309 children=[306,308]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=316 children=[11,315]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=317 children=[312,316]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,6)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,6)]
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coord node=19 children=[18,14]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=322 children=[11,321]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=323 children=[320,322]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=328 children=[11,327]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=329 children=[326,328]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=331 children=[11,330]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=332 children=[315,331]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=336 children=[11,312]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=337 children=[335,336]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_place node=339 children=[7,338]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=340 children=[339]; function graph -> parameter binding and output points
Nonempty VS_map node=341 children=[340,30]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=342 children=[36,296]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=343 children=[45,41]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=345 children=[302,344]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=37 children=[36,8]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,4),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=346 children=[36,307]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=347 children=[306,346]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=348 children=[36,315]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=349 children=[312,348]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,4),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,4),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,4),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=350 children=[36,321]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=351 children=[320,350]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=352 children=[36,327]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=353 children=[326,352]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coord node=46 children=[45,41]; component projection of output specification
Nonempty VS_place node=355 children=[32,354]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=356 children=[355]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,8)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,7)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,19)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,19)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,19)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,19)]
MRV immediate domains=[(0,45),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=375 children=[142,96]; component projection of output specification
Nonempty VS_coordAdd node=376 children=[302,375]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=393 children=[142,392]; component projection of output specification
Nonempty VS_coordDelta node=394 children=[393,320]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=441 children=[142,440]; component projection of output specification
Nonempty VS_coordDelta node=442 children=[441,326]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,20)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,15)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,45)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=451 children=[96,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=460 children=[440,459]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=469 children=[392,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=471 children=[279,470]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=473 children=[279,472]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=521 children=[520,474]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=569 children=[568,522]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=571 children=[96,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=573 children=[440,572]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=575 children=[520,574]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=577 children=[568,576]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=579 children=[392,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=612 children=[611,580]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=614 children=[611,613]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=632 children=[631,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=634 children=[631,633]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=636 children=[142,635]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,15)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_coordAdd node=638 children=[306,637]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,16),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,82),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,45),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=685 children=[684,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=686 children=[142,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,2),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=688 children=[687,440]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_multiply node=689 children=[440,687]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=737 children=[736,690]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=739 children=[736,738]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=787 children=[786,740]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=788 children=[684,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=790 children=[233,789]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=792 children=[786,791]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=794 children=[233,793]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=842 children=[841,795]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=843 children=[142,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=845 children=[841,844]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=847 children=[846,96]; component projection of output specification
MRV immediate domains=[(0,30),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=879 children=[878,315]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=881 children=[312,880]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=899 children=[898,882]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=900 children=[878,8]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_coord node=932 children=[96,279]; component projection of output specification
Nonempty VS_coordDelta node=933 children=[932,302]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,45)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,45)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,19)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,19)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,18)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,18)]
MRV immediate domains=[(0,30),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=934 children=[96,279]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,18)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,18)]
Nonempty VS_coordAdd node=936 children=[931,935]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_coord node=937 children=[96,568]; component projection of output specification
Nonempty VS_coordDelta node=938 children=[937,302]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,45)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,17)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,45)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,17)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,17)]
MRV immediate domains=[(0,30),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=939 children=[96,568]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=987 children=[986,940]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordDelta node=988 children=[441,306]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,30)]
Nonempty VS_coord node=989 children=[142,611]; component projection of output specification
Nonempty VS_coordDelta node=990 children=[989,326]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,35)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,30)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=991 children=[440,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,7)]
Nonempty VS_subtract node=992 children=[611,459]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,7)]
Nonempty VS_subtract node=993 children=[96,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=994 children=[279,474]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=995 children=[279,574]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=996 children=[611,572]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=998 children=[520,997]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=999 children=[568,470]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=1000 children=[96,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1001 children=[440,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1003 children=[520,1002]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1004 children=[568,472]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=1005 children=[392,795]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=1006 children=[392,844]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=1007 children=[631,580]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=1008 children=[631,613]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1010 children=[142,1009]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,30)]
Nonempty VS_coordAdd node=1012 children=[320,1011]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordDelta node=1013 children=[393,306]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,25)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,7)]
Nonempty VS_subtract node=1014 children=[392,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,7)]
Nonempty VS_subtract node=1015 children=[96,459]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1016 children=[279,522]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1017 children=[279,576]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1018 children=[520,470]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1020 children=[568,1019]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=1021 children=[96,572]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1022 children=[520,472]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1024 children=[568,1023]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=1025 children=[392,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=1026 children=[611,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1027 children=[440,580]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_subtract node=1028 children=[611,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1029 children=[440,613]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1031 children=[631,1030]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1033 children=[631,1032]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1035 children=[142,1034]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,25)]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordAdd node=1037 children=[326,1036]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,19)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,21),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,19)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,8)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,7)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,21),(1,19)]
MRV immediate domains=[(0,15),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,7),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1),(1,97),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1038 children=[142,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1039 children=[736,740]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1040 children=[736,791]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1042 children=[786,1041]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1043 children=[684,795]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1044 children=[233,690]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1046 children=[786,1045]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1047 children=[684,844]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1048 children=[233,738]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1049 children=[841,1019]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1050 children=[142,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1051 children=[841,1023]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1053 children=[1052,96]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,21),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,21),(1,19)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordAdd node=1054 children=[315,1053]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,13),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,7),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1055 children=[684,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1056 children=[841,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1057 children=[142,459]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1058 children=[736,789]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1059 children=[736,793]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1060 children=[786,690]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1061 children=[684,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1063 children=[233,1062]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1064 children=[786,738]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1066 children=[233,1065]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1067 children=[841,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1068 children=[142,572]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1070 children=[1069,96]; component projection of output specification
MRV immediate domains=[(0,30),(1,2)]
Nonempty VS_coordDelta node=1071 children=[878,312]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=1073 children=[335,1072]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,16),(1,16)]
Nonempty VS_vec node=1074 children=[846,635]; component projection of output specification
MRV immediate domains=[(0,30),(1,2)]
Nonempty VS_coordDelta node=1075 children=[878,362]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1076 children=[898,374]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=1078 children=[359,1077]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,16)]
MRV immediate domains=[(0,15),(1,16)]
Nonempty VS_vec node=1079 children=[1052,635]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,21),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,15)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,45)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,20)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,21),(1,15)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,21),(1,45)]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordDelta node=1080 children=[393,371]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordDelta node=1081 children=[441,374]; coordinate/vector inverse: condition on right operand and deduce left component specification
Nonempty VS_coordAdd node=1083 children=[362,1082]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,13),(1,16)]
Nonempty VS_vec node=1087 children=[1069,635]; component projection of output specification
MRV immediate domains=[(0,30),(1,2)]
Nonempty VS_coordDelta node=1088 children=[878,359]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_coordDelta node=1089 children=[898,368]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=1091 children=[1086,1090]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,30)]
Nonempty VS_coord node=143 children=[142,96]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 1 non-local residual branches of vecAdd; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=1099 children=[1095,1098]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=1106 children=[1102,1105]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,97),(1,2)]
Nonempty VS_vec node=1206 children=[1205,1108]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=1211 children=[1208,1210]; coordinate/vector inverse: condition on right operand and deduce left component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1244 children=[1243,1212]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
Deferred 1 non-local residual branches of vecAdd; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,75)]
MRV immediate domains=[(0,5),(1,30)]
MRV immediate domains=[(0,5),(1,30)]
MRV immediate domains=[(0,5),(1,15)]
MRV immediate domains=[(0,1),(1,61)]
Nonempty VS_vec node=1310 children=[1247,1309]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_coordDelta node=1316 children=[1312,1315]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=1319 children=[1208,1318]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1325 children=[1321,1324]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1331 children=[1327,1330]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1337 children=[1333,1336]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1343 children=[1339,1342]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1349 children=[1345,1348]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1355 children=[1351,1354]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1361 children=[1357,1360]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1364 children=[1363,1095]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1367 children=[1366,1105]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1373 children=[1369,1372]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=1376 children=[1375,1098]; coordinate/vector inverse: condition on right operand and deduce left component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1454 children=[1453,1377]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_place node=1456 children=[65,1455]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_scan node=1457 children=[356,1456,152]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 14, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=1459 children=[3,6,1458]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_map node=1460 children=[340,164]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,8)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1461 children=[166,296]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1462 children=[45,39]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1464 children=[302,1463]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=167 children=[166,8]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1465 children=[166,307]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=1466 children=[306,1465]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1467 children=[166,315]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=1468 children=[312,1467]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,8)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1469 children=[166,321]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=1470 children=[320,1469]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1471 children=[166,327]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=1472 children=[326,1471]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coord node=168 children=[45,39]; component projection of output specification
Nonempty VS_place node=1474 children=[32,1473]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1475 children=[1474]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,19)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,18)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,7)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,6)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,19)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,19)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,18)]
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1476 children=[233,279]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,18)]
Nonempty VS_coordAdd node=1477 children=[302,1476]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,1)]
Nonempty VS_coordAdd node=1478 children=[1453,8]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_coord node=1479 children=[233,520]; component projection of output specification
Nonempty VS_coordDelta node=1480 children=[1479,320]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_coord node=1481 children=[233,568]; component projection of output specification
Nonempty VS_coordDelta node=1482 children=[1481,326]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1483 children=[279,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1484 children=[520,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1485 children=[568,459]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1486 children=[279,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1487 children=[520,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1488 children=[568,572]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1490 children=[611,1489]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1492 children=[96,1491]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1494 children=[440,1493]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1496 children=[611,1495]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1498 children=[96,1497]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1500 children=[440,1499]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1502 children=[631,1501]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=1503 children=[392,1030]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1505 children=[631,1504]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=1506 children=[392,1032]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1508 children=[233,1507]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,45)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,45)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,45)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_coordAdd node=1510 children=[306,1509]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,12),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1511 children=[736,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1512 children=[233,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1513 children=[736,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1514 children=[786,795]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1515 children=[233,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1516 children=[786,844]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1517 children=[684,1501]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1518 children=[684,1504]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1519 children=[841,1489]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1521 children=[142,1520]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1522 children=[841,1495]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1524 children=[142,1523]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1526 children=[1525,279]; component projection of output specification
MRV immediate domains=[(0,75),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1527 children=[1453,315]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=1529 children=[312,1528]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,18),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,76)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1607 children=[279,1606]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1654 children=[736,1653]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1701 children=[233,1700]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1764 children=[568,1763]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,76)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1842 children=[520,1841]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1844 children=[520,1843]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1846 children=[279,1845]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1848 children=[568,1847]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1850 children=[611,1849]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1852 children=[96,1851]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1854 children=[440,1853]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1856 children=[611,1855]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1858 children=[96,1857]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1860 children=[440,1859]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1862 children=[631,1861]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1864 children=[392,1863]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1866 children=[631,1865]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1868 children=[392,1867]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1870 children=[736,1700]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_subtract node=1871 children=[279,1763]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,76)]
Nonempty VS_subtract node=1872 children=[520,1606]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1873 children=[786,1653]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1920 children=[233,1919]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1953 children=[568,1952]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1954 children=[279,1847]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1955 children=[520,1845]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1957 children=[568,1956]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=1958 children=[611,1861]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=1959 children=[96,1853]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1960 children=[440,1849]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_subtract node=1961 children=[611,1865]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_subtract node=1962 children=[96,1859]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1963 children=[440,1855]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1965 children=[631,1964]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=1966 children=[392,1851]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1968 children=[631,1967]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=1969 children=[392,1857]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1971 children=[1869,1970]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,16)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,19)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,16)]
Nonempty VS_coordAdd node=1972 children=[931,1971]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,18)]
MRV immediate domains=[(0,18),(1,18)]
Nonempty VS_vec node=1973 children=[1869,1869]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,16)]
Nonempty VS_coordAdd node=1974 children=[986,1973]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordDelta node=1975 children=[1481,306]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1976 children=[279,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1977 children=[568,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1978 children=[279,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1979 children=[520,795]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1980 children=[568,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1981 children=[520,844]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=1982 children=[611,1493]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=1983 children=[96,1030]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1984 children=[440,1491]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_subtract node=1985 children=[611,1499]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_subtract node=1986 children=[96,1032]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1987 children=[440,1497]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=1988 children=[631,1489]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=1989 children=[392,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=1990 children=[631,1495]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=1991 children=[392,633]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1993 children=[233,1992]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,21)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,21)]
Nonempty VS_coordAdd node=1995 children=[320,1994]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordDelta node=1996 children=[1479,306]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1997 children=[520,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1998 children=[279,459]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1999 children=[279,572]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2000 children=[520,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=2001 children=[611,1501]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2002 children=[568,580]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_add node=2003 children=[96,1493]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2004 children=[440,1489]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_subtract node=2005 children=[611,1504]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2006 children=[568,613]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_subtract node=2007 children=[96,1499]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2008 children=[440,1495]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=2009 children=[631,1520]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=2010 children=[392,1491]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=2011 children=[631,1523]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=2012 children=[392,1497]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=2014 children=[233,2013]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordAdd node=2016 children=[326,2015]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,12),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,12),(1,19)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,27),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=2017 children=[233,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2018 children=[736,795]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2019 children=[736,844]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2020 children=[786,1019]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2021 children=[233,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2022 children=[786,1023]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2023 children=[684,1489]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2024 children=[684,1495]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2025 children=[841,1493]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2026 children=[142,1501]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2027 children=[841,1499]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2028 children=[142,1504]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=2030 children=[2029,279]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,12),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,12),(1,18)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,7)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,6)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,27),(1,19)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,27),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,27),(1,18)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordAdd node=2031 children=[315,2030]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,12),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=2032 children=[736,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=2033 children=[786,468]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=2034 children=[233,459]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2035 children=[736,570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2036 children=[786,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2037 children=[233,572]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2038 children=[684,1520]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2039 children=[684,1523]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2040 children=[841,1501]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2042 children=[142,2041]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2043 children=[841,1504]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2045 children=[142,2044]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=2047 children=[2046,279]; component projection of output specification
MRV immediate domains=[(0,75),(1,2)]
Nonempty VS_coordDelta node=2048 children=[1453,312]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=2050 children=[335,2049]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,12),(1,16)]
Nonempty VS_vec node=2051 children=[1525,1507]; component projection of output specification
MRV immediate domains=[(0,75),(1,2)]
Nonempty VS_coordDelta node=2052 children=[1453,362]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=2054 children=[359,2053]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,12),(1,16)]
MRV immediate domains=[(0,12),(1,16)]
Nonempty VS_vec node=2055 children=[2029,1507]; component projection of output specification
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,27),(1,16)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,12),(1,45)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,12),(1,45)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,27),(1,45)]
MRV immediate domains=[(0,5),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 4 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,27),(1,45)]
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordDelta node=2056 children=[1479,371]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_coordDelta node=2057 children=[1481,374]; coordinate/vector inverse: condition on right operand and deduce left component specification
Nonempty VS_coordAdd node=2059 children=[362,2058]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,12),(1,16)]
Nonempty VS_vec node=2060 children=[2046,1507]; component projection of output specification
MRV immediate domains=[(0,75),(1,2)]
Nonempty VS_coordDelta node=2061 children=[1453,359]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=2063 children=[1086,2062]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_coord node=280 children=[233,279]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
Deferred 1 non-local residual branches of vecAdd; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,75)]
MRV immediate domains=[(0,5),(1,30)]
MRV immediate domains=[(0,5),(1,30)]
MRV immediate domains=[(0,5),(1,15)]
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vec node=2069 children=[2066,2068]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_coordDelta node=2072 children=[2071,1315]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=2075 children=[1208,2074]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2078 children=[2077,1324]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2081 children=[2080,1330]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2084 children=[2083,1336]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2087 children=[2086,1342]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2090 children=[2089,1348]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2093 children=[2092,1354]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2096 children=[2095,1360]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2099 children=[2098,1095]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2102 children=[2101,1105]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2105 children=[2104,1372]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2108 children=[2107,1098]; coordinate/vector inverse: condition on right operand and deduce left component specification
Nonempty VS_coordAdd node=2110 children=[1243,2109]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
Deferred 1 non-local residual branches of vecAdd; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,75)]
MRV immediate domains=[(0,5),(1,30)]
MRV immediate domains=[(0,5),(1,30)]
MRV immediate domains=[(0,5),(1,15)]
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vec node=2114 children=[2066,2113]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_coordDelta node=2117 children=[2116,1315]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=2120 children=[1208,2119]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2123 children=[2122,1324]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2126 children=[2125,1330]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2127 children=[2089,1336]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2128 children=[2083,1342]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2131 children=[2130,1348]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2132 children=[2101,1354]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2133 children=[2107,1360]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2134 children=[2092,1095]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2137 children=[2136,1105]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2138 children=[2095,1372]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2141 children=[2140,1098]; coordinate/vector inverse: condition on right operand and deduce left component specification
Nonempty VS_coordAdd node=2143 children=[898,2142]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
Deferred 1 non-local residual branches of vecAdd; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,75)]
MRV immediate domains=[(0,5),(1,30)]
MRV immediate domains=[(0,5),(1,30)]
MRV immediate domains=[(0,5),(1,15)]
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vec node=2147 children=[2066,2146]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_coordDelta node=2150 children=[2149,1315]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=2153 children=[1208,2152]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2156 children=[2155,1324]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2159 children=[2158,1330]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2160 children=[2130,1336]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2161 children=[2089,1342]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2164 children=[2163,1348]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2165 children=[2136,1354]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2166 children=[2140,1360]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2167 children=[2101,1095]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2170 children=[2169,1105]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2171 children=[2107,1372]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=2174 children=[2173,1098]; coordinate/vector inverse: condition on right operand and deduce left component specification
Nonempty VS_coordAdd node=2176 children=[878,2175]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_place node=2178 children=[187,2177]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_scan node=2179 children=[1475,2178,290]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 14, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=2181 children=[3,6,2180]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=2183 children=[2182]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","head","height","index","lambda","literal","map","mkScene","multiply","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","vec","vecAdd","width","x","y"]
Cost saturation C=1..21 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,2),(19,4),(20,6),(21,6)]
Abstraction round=0; exact frontier=3146; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I1 by typed definition expansion; ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I4 by typed definition expansion; ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I4 by typed definition expansion; ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","head","height","index","lambda","literal","map","mkScene","multiply","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","vec","vecAdd","width","x","y"]
Cost saturation C=1..21 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,2),(19,4),(20,6),(21,6)]
Abstraction round=1; exact frontier=3142; accepted=[]
Cost saturation C=1..21 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,2),(19,4),(20,6),(21,6)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,10,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,10,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TR),VecV (Vec 1 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TR),VecV (Vec 1 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(CoordV (Coord {cx = 0, cy = 0}),coordDelta(Anchor(v1,TL),CoordV (Coord {cx = -1, cy = 0}))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(CoordV (Coord {cx = 0, cy = 0}),coordDelta(Anchor(v1,TR),CoordV (Coord {cx = -1, cy = 0}))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),y(Anchor(__r1b0,TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TR),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coordAdd(Anchor(__r1b0,TL),VecV (Vec 1 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),y(Anchor(__r1b0,TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,13,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,15,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,2,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,2,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,2,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,2,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,2,2,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,TL),VecV (Vec 1 0))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,Center),VecV (Vec 1 (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,3,2,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(__cse0),coordAdd(Anchor(__cse0,TL),VecV (Vec 1 0))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,16,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,16,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,16,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,16,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,16,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,16,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),coordAdd(Anchor(head(objects(v0)),BL),VecV (Vec 1 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),Center),VecV (Vec 1 0)))),place(objectOf(head(__cse0)),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),VecV (Vec 1 (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BL)),IntV 1),y(Anchor(__cse0,BL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BR)),IntV 1),y(Anchor(__cse0,BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),y(Anchor(__cse0,Center)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(__cse0,TL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,21,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TR)),IntV 1),y(Anchor(__cse0,TR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BL)),IntV 1),y(Anchor(__cse0,BL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BR)),IntV 1),y(Anchor(__cse0,BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),y(Anchor(__cse0,Center)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(__cse0,TL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TR)),IntV 1),y(Anchor(__cse0,TR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BL)),IntV 1),y(Anchor(__cse0,BL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BR)),IntV 1),y(Anchor(__cse0,BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),y(Anchor(__cse0,Center)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(__cse0,TL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TR)),IntV 1),y(Anchor(__cse0,TR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BL)),IntV 1),y(Anchor(__cse0,BL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BR)),IntV 1),y(Anchor(__cse0,BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),y(Anchor(__cse0,Center)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(__cse0,TL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TR)),IntV 1),y(Anchor(__cse0,TR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BL)),IntV 1),y(Anchor(__cse0,BL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BR)),IntV 1),y(Anchor(__cse0,BR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),y(Anchor(__cse0,Center)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(__cse0,TL)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TR)),IntV 1),y(Anchor(__cse0,TR)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(coord(add(width(canvasSize(v0)),IntV 1),IntV 0),coordDelta(Anchor(head(objects(v0)),BL),coord(width(canvasSize(v0)),IntV 0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(coord(width(canvasSize(v0)),IntV 0),coordDelta(Anchor(head(objects(v0)),BL),coord(add(width(canvasSize(v0)),IntV (-1)),IntV 0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=Anchor(head(__cse0),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=Anchor(head(__cse0),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=Anchor(head(__cse0),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)) in let __cse1=Anchor(head(__cse0),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in let __cse1=Anchor(head(__cse0),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in let __cse1=Anchor(head(__cse0),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)) in let __cse1=Anchor(head(__cse0),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse1),IntV 1),y(__cse1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,2,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(CoordV (Coord {cx = 0, cy = 0}),vec(add(x(__cse0),IntV 1),y(__cse0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,21,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(coord(IntV 0,height(canvasSize(v0))),vec(add(x(__cse0),IntV 1),subtract(y(__cse0),height(canvasSize(v0)))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,21,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(coord(IntV 0,height(canvasSize(v0))),vec(add(x(__cse0),IntV 1),subtract(y(__cse0),height(canvasSize(v0)))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,21,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(coord(IntV 0,height(canvasSize(v0))),vec(add(x(__cse0),IntV 1),subtract(y(__cse0),height(canvasSize(v0)))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,21,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(coord(IntV 0,height(canvasSize(v0))),vec(add(x(__cse0),IntV 1),subtract(y(__cse0),height(canvasSize(v0)))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,21,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coordAdd(coord(IntV 0,height(canvasSize(v0))),vec(add(x(__cse0),IntV 1),subtract(y(__cse0),height(canvasSize(v0)))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,23,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,23,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,23,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,23,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,23,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0))),IntV 1),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0))),IntV 1),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0))),IntV 1),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0))),IntV 1),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0))),IntV 1),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),IntV 1),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),IntV 1),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),IntV 1),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),IntV 1),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),IntV 1),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),IntV 1),BL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),IntV 1),BR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),IntV 1),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,21,3,1,"(lambda v0:SceneT. let __cse0=Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),IntV 1),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. place(objectOf(snd(__r1b0)),coordAdd(Anchor(snd(__r1b0),TL),VecV (Vec 1 0)))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),y(__cse0))),tail(objects(v0)))))")
```
