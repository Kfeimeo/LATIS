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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,6)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=10 children=[8,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,76),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,7)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=17 children=[15,16]; component projection of output specification
Nonempty VS_place node=19 children=[7,18]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=20 children=[19]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=26 children=[20,25]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=29 children=[28,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,54)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,77)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,77)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=35 children=[28,32]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=36 children=[34,35]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,77),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,7)]
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=46 children=[41,45]; component projection of output specification
Nonempty VS_place node=48 children=[27,47]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=49 children=[48]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=101 children=[100,62]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=115 children=[114,101]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=121 children=[49,115,120]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=123 children=[3,6,122]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=125 children=[20,124]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=29 children=[28,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,5)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=35 children=[28,32]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=36 children=[34,35]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,77),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,5),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=126 children=[41,42]; component projection of output specification
Nonempty VS_place node=128 children=[27,127]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=129 children=[128]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=161 children=[133,160]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=166 children=[165,161]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=168 children=[129,166,167]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=170 children=[3,6,169]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=172 children=[20,171]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=29 children=[28,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,49)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,43)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,43)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=35 children=[28,32]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=36 children=[34,35]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,77),(1,10)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,10)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=126 children=[41,42]; component projection of output specification
Nonempty VS_place node=128 children=[27,127]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=129 children=[128]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=181 children=[129,166,180]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
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
Nonempty VS_mkScene node=183 children=[3,6,182]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Nonempty VS_map node=188 children=[20,187]; map witness: corresponding f(x_i)=y_i; element instances=6
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=29 children=[28,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,77),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,5),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=126 children=[41,42]; component projection of output specification
Nonempty VS_place node=192 children=[27,191]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=193 children=[192]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=198 children=[193,115,197]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0}))]; includes-seed convention; no task classifier
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
Nonempty VS_mkScene node=200 children=[3,6,199]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=202 children=[20,201]; map witness: corresponding f(x_i)=y_i; element instances=6
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=29 children=[28,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,77),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,4),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=126 children=[41,42]; component projection of output specification
Nonempty VS_place node=192 children=[27,191]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=193 children=[192]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=213 children=[212,205]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=217 children=[216,213]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=219 children=[193,217,218]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
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
Nonempty VS_mkScene node=221 children=[3,6,220]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=226 children=[20,225]; map witness: corresponding f(x_i)=y_i; element instances=6
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=29 children=[28,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,77),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=126 children=[41,42]; component projection of output specification
Nonempty VS_place node=192 children=[27,191]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=193 children=[192]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,36)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=289 children=[251,288]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=303 children=[302,289]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=308 children=[193,303,307]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=310 children=[3,6,309]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Nonempty VS_map node=312 children=[20,311]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=29 children=[28,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,77),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,5),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=126 children=[41,42]; component projection of output specification
Nonempty VS_place node=192 children=[27,191]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=193 children=[192]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=316 children=[314,315]; component projection of output specification
Nonempty VS_place node=317 children=[313,316]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=319 children=[193,317,318]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=321 children=[3,6,320]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,16)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
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
Nonempty VS_map node=323 children=[20,322]; map witness: corresponding f(x_i)=y_i; element instances=6
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=29 children=[28,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,7)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,77),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=325 children=[28,39]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=326 children=[40,325]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=329 children=[41,328]; component projection of output specification
Nonempty VS_place node=331 children=[27,330]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=332 children=[331]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,11),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,46),(1,62)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=443 children=[379,442]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=456 children=[455,443]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=458 children=[332,456,457]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 1})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=460 children=[3,6,459]; mkScene residual: canonical correspondence + Render-validated paint order; branch=1
Nonempty VS_lambda node=462 children=[461]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","index","lambda","literal","map","mkScene","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","x","y"]
Cost saturation C=1..33 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,1),(19,2),(20,2),(21,2),(22,2),(23,2),(24,9),(25,16),(26,24),(27,32),(28,32),(29,32),(30,32),(31,32),(32,39),(33,39)]
Abstraction round=0; exact frontier=462; accepted=["I0","I1","I2","I3","I4","I5"]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","index","lambda","literal","map","mkScene","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","x","y"]
Abstraction round=1; exact frontier=462; accepted=[]
Cost saturation C=1..33 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,1),(19,2),(20,2),(21,2),(22,2),(23,2),(24,9),(25,16),(26,24),(27,32),(28,32),(29,32),(30,32),(31,32),(32,39),(33,39)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,10,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(x(Anchor(v1,TL)),IntV 1),add(y(Anchor(v1,TL)),IntV (-1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,2,1,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,2,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,2,1,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,1,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,2,0,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),y(Anchor(fst(v1),Center))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(__cse0),BR)),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,17,2,0,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,20,2,0,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),TR),coordDelta(Anchor(snd(v1),TL),Anchor(fst(v1),Center))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,20,3,1,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,20,3,1,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,20,3,1,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,2,0,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV 1)))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,19,3,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,19,3,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,19,3,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,19,3,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=Anchor(head(objects(v0)),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,Center)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,3,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(objects(v0)),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(__cse0),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(__cse0),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(__cse0),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(__cse0),Center)),y(Anchor(head(objects(v0)),Center)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,TL)),IntV 1),y(Anchor(head(tail(__cse0)),TL)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,TL)),IntV 1),y(Anchor(head(tail(__cse0)),TL)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,TL)),IntV 1),y(Anchor(head(tail(__cse0)),TL)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,20,3,1,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,20,3,1,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(tail(objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,22,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,22,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,22,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,20,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(__cse0),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(__cse0),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,21,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(__cse0),TL)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,TL)),IntV 1),add(y(Anchor(head(tail(__cse0)),Center)),IntV (-1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,TL)),IntV 1),add(y(Anchor(head(tail(__cse0)),Center)),IntV (-1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse1),coord(add(x(Anchor(__cse1,TL)),IntV 1),add(y(Anchor(head(tail(__cse0)),Center)),IntV (-1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(objects(v0))))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,21,3,1,"(lambda v0:SceneT. let __cse0=head(tail(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(tail(objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,21,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(__cse0)),Center)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,21,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(tail(__cse0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,3,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV (-1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,19,3,0,"(lambda v0:SceneT. let __cse0=head(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(x(Anchor(__cse0,BR)),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,3,1,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(__cse0)),TL)),IntV 1))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,18,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(__cse0),BR)),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,4,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,24,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),TR),coordDelta(Anchor(snd(v1),TL),Anchor(fst(v1),Center))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(__cse0)),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,4,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL) in let __cse1=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL)),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in let __cse1=Anchor(head(__cse0),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))),coord(add(x(__cse1),IntV 1),add(y(__cse1),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),coord(add(x(Anchor(head(tail(objects(v0))),TL)),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(tail(objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),TL)),IntV (-1)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,21,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))))),IntV 1),y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),coord(x(Anchor(head(objects(v0)),BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,21,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TR),coordDelta(Anchor(snd(v1),TL),Anchor(snd(v1),Center))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,22,4,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV (-1)))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TL)),IntV 1),x(Anchor(head(tail(tail(objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,21,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),TL)),IntV 1),x(Anchor(head(tail(tail(objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,22,4,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),x(Anchor(head(tail(tail(objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(83,21,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coord(add(x(Anchor(snd(v1),TL)),IntV 1),add(y(Anchor(fst(v1),TL)),IntV (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),BR)),IntV (-1)),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL)),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(tail(objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))))),IntV 1),y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,21,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,20,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(objects(v0)))),coord(IntV 3,y(Anchor(head(objects(v0)),TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,22,5,1,"(lambda v0:SceneT. let __cse0=Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,21,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coord(add(x(__cse0),IntV 1),add(y(__cse0),IntV (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,24,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),TR),coordDelta(Anchor(snd(v1),TL),Anchor(fst(v1),Center))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(__cse0,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(93,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(95,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,21,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),coord(add(x(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),TL)),IntV 1),x(Anchor(head(tail(tail(objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(96,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(96,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(96,22,5,1,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,16,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(IntV 16,add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,21,3,2,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(__cse0)),coord(add(x(Anchor(head(__cse0),TL)),IntV 1),IntV 10)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,17,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(tail(tail(objects(v0))))),coord(IntV 9,y(Anchor(head(objects(v0)),Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,3,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(head(objects(v0))),coord(IntV 16,add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(81,22,4,2,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(snd(v1),TL),VecV (Vec 1 (-1))))),place(objectOf(__cse0),coord(add(x(Anchor(__cse0,TL)),IntV 1),IntV 10)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),VecV (Vec 1 (-1))))),objects(v0))))
TaskInvented I0: (lambda __r1b0:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(__r1b0))))); repeats=2; portfolio MDL saving=1
TaskInvented I1: (lambda __r1b0:PlacedT. subtract(IntV 0,x(Anchor(__r1b0,TL)))); repeats=2; portfolio MDL saving=1
TaskInvented I2: (lambda __r1b0:PlacedT. subtract(IntV 0,x(Anchor(__r1b0,BR)))); repeats=2; portfolio MDL saving=1
TaskInvented I3: (lambda __r1b0:PlacedT. subtract(IntV 0,x(Anchor(__r1b0,Center)))); repeats=2; portfolio MDL saving=1
TaskInvented I4: (lambda __r1b0:PlacedT. subtract(IntV 0,y(Anchor(__r1b0,TL)))); repeats=2; portfolio MDL saving=1
TaskInvented I5: (lambda __r1b0:PlacedT. subtract(IntV 0,y(Anchor(__r1b0,BR)))); repeats=2; portfolio MDL saving=1
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","index","lambda","let","literal","map","mkScene","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
