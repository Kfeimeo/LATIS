# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=3; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=3; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(SceneT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(SizeT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=10; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=10; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=10; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=10; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=10; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=10; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=10; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=10; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,2)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=15 children=[11,14]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=22 children=[18,21]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=29 children=[25,28]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=36 children=[32,35]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=38 children=[37,15]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=41 children=[39,40]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_Translate node=43 children=[8,42]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec (-2) (-6),Vec (-4) (-5),Vec (-6) (-2),Vec (-2) (-5),Vec (-4) (-4),Vec (-2) (-4),Vec (-4) (-2)]
Nonempty VS_lambda node=44 children=[43]; function graph -> parameter binding and output points
Learn(PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,2)]
Learn(PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=54 children=[53,50]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_Translate node=55 children=[47,54]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-7),Vec 0 (-6),Vec 0 (-8)]
Learn(ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=59 children=[44,55,58]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 1, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 3, position = Coord {cx = 6, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 1, cy = 0},3),(Coord {cx = 1, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 3, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 1, cy = 0},3),(Coord {cx = 1, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 3, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 1, cy = 0},3),(Coord {cx = 1, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 9, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 0, cy = 3},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 0, cy = 2},8),(Coord {cx = 0, cy = 3},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8),(Coord {cx = 1, cy = 2},8),(Coord {cx = 1, cy = 3},8),(Coord {cx = 2, cy = 0},8),(Coord {cx = 2, cy = 1},8),(Coord {cx = 2, cy = 2},8),(Coord {cx = 2, cy = 3},8)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 3, cy = 0},4),(Coord {cx = 3, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 0, cy = 4},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 1, cy = 0},3),(Coord {cx = 1, cy = 1},3),(Coord {cx = 1, cy = 2},3),(Coord {cx = 2, cy = 0},3),(Coord {cx = 2, cy = 1},3),(Coord {cx = 2, cy = 2},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 1, cy = 0},3),(Coord {cx = 1, cy = 1},3),(Coord {cx = 1, cy = 2},3),(Coord {cx = 2, cy = 0},3),(Coord {cx = 2, cy = 1},3),(Coord {cx = 2, cy = 2},3)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=3; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=60 children=[3,6,59]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=61 children=[60]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","Translate","add","background","canvasSize","coord","coordDelta","fst","head","lambda","literal","mkScene","objects","scan","snd","sortBy","subtract","tail","vec","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=32; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=7; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","Translate","add","background","canvasSize","coord","coordDelta","fst","head","lambda","literal","mkScene","objects","scan","snd","sortBy","subtract","tail","vec","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=16; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 10, gridHeight = 10}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 10, gridHeight = 10}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 10, gridHeight = 10}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 10, gridHeight = 10}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 10, gridHeight = 10}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 10, gridHeight = 10}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 10, gridHeight = 10}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 10, gridHeight = 10}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BR),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))
TaskInvented I0: (lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL)))); repeats=32; portfolio MDL saving=337
TaskInvented I1: (lambda __r1h0:PlacedT. (lambda __r1h1:CoordT. Translate(__r1h0,coordDelta(__r1h1,Anchor(__r1h0,TL))))); repeats=48; portfolio MDL saving=165
TaskInvented I2: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,BL))),objects(v0))); repeats=32; portfolio MDL saving=69
TaskInvented I3: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TL))),objects(v0))); repeats=16; portfolio MDL saving=69
TaskInvented I4: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TR))),objects(v0))); repeats=16; portfolio MDL saving=69
TaskInvented I5: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,BR))),objects(v0))); repeats=32; portfolio MDL saving=69
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","Translate","add","background","canvasSize","coord","coordDelta","fst","head","lambda","literal","mkScene","objects","scan","snd","sortBy","subtract","tail","vec","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
