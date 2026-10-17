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
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=10 children=[8,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=13 children=[11,12]; component projection of output specification
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=18 children=[17,14]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=20 children=[8,19]; coordinate/vector inverse: condition on left operand and deduce right component specification
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
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,2)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,3)]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=38 children=[8,37]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=52 children=[51,38]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,6)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=57 children=[8,56]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=58 children=[55,57]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=63 children=[8,62]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=64 children=[61,63]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=66 children=[11,12]; component projection of output specification
Nonempty VS_place node=68 children=[7,67]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=69 children=[68]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=75 children=[69,74]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=78 children=[77,9]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=84 children=[79,83]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=86 children=[17,85]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=87 children=[77,19]; coordinate/vector inverse: condition on left operand and deduce right component specification
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
Nonempty VS_coordDelta node=93 children=[77,90]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=94 children=[92,93]; coordinate/vector inverse: condition on left operand and deduce right component specification
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
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,4)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,4)]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=99 children=[77,37]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=100 children=[51,99]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=101 children=[79,83]; component projection of output specification
Nonempty VS_place node=103 children=[76,102]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=104 children=[103]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,12),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=132 children=[131,9]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=134 children=[51,133]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,17)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=149 children=[148,135]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=164 children=[163,150]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=166 children=[37,165]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=168 children=[131,167]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=170 children=[51,169]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=185 children=[184,171]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=200 children=[199,186]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=202 children=[201,55]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,36)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,70)]
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=223 children=[148,222]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=225 children=[163,224]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=227 children=[37,226]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=228 children=[131,165]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=230 children=[51,229]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=232 children=[184,231]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=234 children=[199,233]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=236 children=[235,221]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=240 children=[148,226]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=242 children=[163,241]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=243 children=[37,167]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=245 children=[131,244]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=247 children=[51,246]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=248 children=[184,233]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=250 children=[199,249]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=252 children=[251,239]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,11)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=255 children=[148,254]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=257 children=[163,256]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=259 children=[37,258]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=261 children=[131,260]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=263 children=[51,262]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=265 children=[184,264]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=267 children=[199,266]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=282 children=[268,281]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,43)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,43)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=311 children=[285,310]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=324 children=[323,311]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,37),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=376 children=[375,337]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,33)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,31)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,33)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,70)]
Nonempty VS_coord node=455 children=[384,454]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=461 children=[460,457]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=467 children=[466,463]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=473 children=[472,469]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=489 children=[488,475]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=505 children=[504,491]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=507 children=[37,506]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_coord node=511 children=[384,510]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=514 children=[460,513]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=517 children=[466,516]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=520 children=[472,519]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=523 children=[488,522]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=526 children=[504,525]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=528 children=[148,527]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,52),(1,1)]
Nonempty VS_coord node=582 children=[581,510]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=585 children=[460,584]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=588 children=[466,587]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=591 children=[472,590]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=594 children=[488,593]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=597 children=[504,596]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=599 children=[163,598]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,70)]
Nonempty VS_coord node=603 children=[602,454]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=606 children=[460,605]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=609 children=[472,608]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=612 children=[466,611]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=615 children=[488,614]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=618 children=[504,617]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=620 children=[199,619]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=622 children=[602,510]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=625 children=[460,624]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=628 children=[466,627]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=631 children=[472,630]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=634 children=[488,633]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=637 children=[504,636]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=639 children=[184,638]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=641 children=[17,640]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=642 children=[131,19]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=644 children=[51,643]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,37),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=653 children=[337,652]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=699 children=[698,661]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=701 children=[698,700]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=766 children=[765,702]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,56),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=825 children=[824,767]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=827 children=[765,826]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,56),(1,1)]
Nonempty VS_subtract node=828 children=[824,253]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,80),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=911 children=[910,829]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,80),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=913 children=[910,912]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=915 children=[337,914]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=948 children=[947,916]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=950 children=[947,949]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=952 children=[375,951]; component projection of output specification
MRV immediate domains=[(0,12),(1,2)]
Nonempty VS_coordDelta node=953 children=[51,239]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=955 children=[55,954]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,12)]
Nonempty VS_coord node=956 children=[284,337]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=958 children=[131,957]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=960 children=[51,959]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=962 children=[199,961]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=964 children=[37,963]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=966 children=[184,965]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=968 children=[148,967]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=970 children=[163,969]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=972 children=[971,17]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=974 children=[184,973]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=976 children=[199,975]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=978 children=[148,977]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=980 children=[163,979]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=982 children=[37,981]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=984 children=[131,983]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=986 children=[51,985]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=988 children=[987,55]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,46),(1,34)]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,46),(1,36)]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,46),(1,33)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,40)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,70)]
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1016 children=[184,1015]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1018 children=[199,1017]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1020 children=[148,1019]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1022 children=[163,1021]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1024 children=[37,1023]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1025 children=[131,981]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1027 children=[51,1026]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1029 children=[1028,221]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1030 children=[184,1017]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1032 children=[199,1031]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1033 children=[148,1023]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1035 children=[163,1034]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1036 children=[37,983]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1038 children=[131,1037]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1040 children=[51,1039]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1042 children=[1041,239]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,11)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,31)]
MRV immediate domains=[(0,8),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,31)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1044 children=[184,1043]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1046 children=[199,1045]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1048 children=[148,1047]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1050 children=[163,1049]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1052 children=[37,1051]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1054 children=[131,1053]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1056 children=[51,1055]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1058 children=[1057,281]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,40),(1,43)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,43)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,52),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=1153 children=[1152,310]; component projection of output specification
Nonempty VS_coordDelta node=1154 children=[323,1153]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,39),(1,11)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,39),(1,33)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,51),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,51),(1,33)]
MRV immediate domains=[(0,1),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1165 children=[284,337]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,75)]
Nonempty VS_coord node=1249 children=[1173,1248]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1252 children=[472,1251]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1255 children=[460,1254]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1258 children=[488,1257]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1261 children=[504,1260]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1264 children=[466,1263]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1266 children=[131,1265]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,75)]
Nonempty VS_coord node=1276 children=[1275,1248]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1279 children=[472,1278]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1282 children=[460,1281]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1285 children=[488,1284]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1288 children=[504,1287]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1291 children=[466,1290]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1293 children=[51,1292]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,70)]
Nonempty VS_coord node=1331 children=[1330,454]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1334 children=[488,1333]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1337 children=[460,1336]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1338 children=[472,605]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1341 children=[504,1340]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1344 children=[466,1343]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1346 children=[199,1345]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,70)]
Nonempty VS_coord node=1348 children=[1173,454]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1349 children=[472,457]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1352 children=[460,1351]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1355 children=[488,1354]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1358 children=[504,1357]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1361 children=[466,1360]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1363 children=[37,1362]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,1)]
Nonempty VS_coord node=1365 children=[1330,510]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1368 children=[488,1367]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1371 children=[504,1370]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1374 children=[460,1373]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1375 children=[472,624]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1378 children=[466,1377]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1380 children=[184,1379]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_coord node=1382 children=[1173,510]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1383 children=[472,513]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1386 children=[460,1385]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1389 children=[488,1388]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1392 children=[504,1391]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1395 children=[466,1394]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1397 children=[148,1396]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_coord node=1399 children=[1275,510]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1400 children=[472,584]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1403 children=[460,1402]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1406 children=[488,1405]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1409 children=[504,1408]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1412 children=[466,1411]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1414 children=[163,1413]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=1416 children=[61,1415]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=1445 children=[1444,1430]; component projection of output specification
Nonempty VS_coordDelta node=1446 children=[1445,17]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=1448 children=[1444,1447]; component projection of output specification
Nonempty VS_coordDelta node=1449 children=[1448,55]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,34)]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,12)]
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1477 children=[1429,1476]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1492 children=[1491,1478]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1507 children=[1506,1493]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1509 children=[148,1508]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,39)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1511 children=[1429,1510]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1513 children=[1491,1512]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1515 children=[1506,1514]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1517 children=[163,1516]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,49)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1519 children=[1429,1518]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1521 children=[1491,1520]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1522 children=[1506,1476]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1524 children=[37,1523]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1526 children=[1429,1525]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,25),(1,30)]
Nonempty VS_coord node=1527 children=[1475,947]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1529 children=[1491,1528]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1531 children=[1506,1530]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1533 children=[131,1532]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1535 children=[1429,1534]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,24),(1,30)]
Nonempty VS_coord node=1536 children=[310,947]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1538 children=[1491,1537]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1539 children=[1506,1520]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1541 children=[51,1540]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1543 children=[1429,1542]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1545 children=[1491,1544]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1547 children=[1506,1546]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1549 children=[184,1548]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,39)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,43)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,49)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1551 children=[1429,1550]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1553 children=[1491,1552]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1554 children=[1506,1542]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1556 children=[199,1555]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,49)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=1571 children=[1444,1570]; component projection of output specification
Nonempty VS_coordDelta node=1572 children=[1571,221]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=1574 children=[1444,1573]; component projection of output specification
Nonempty VS_coordDelta node=1575 children=[1574,239]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,11)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,26)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,41),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,12)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,36)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,35)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,26)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,12)]
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1576 children=[1444,1430]; component projection of output specification
Nonempty VS_coordAdd node=1578 children=[1429,1577]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=1593 children=[1592,1579]; component projection of output specification
Nonempty VS_coordDelta node=1594 children=[1593,17]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coord node=1595 children=[1592,1573]; component projection of output specification
Nonempty VS_coordDelta node=1596 children=[1595,55]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,34)]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,36)]
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,43)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1611 children=[1491,1476]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1613 children=[1429,1612]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1615 children=[1506,1614]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1617 children=[148,1616]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,43)]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1618 children=[1429,1530]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1619 children=[1491,1510]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1621 children=[1506,1620]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1623 children=[163,1622]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,30)]
Nonempty VS_coord node=1624 children=[1610,947]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1626 children=[1429,1625]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1627 children=[1491,1518]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1628 children=[1506,1612]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1630 children=[37,1629]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1631 children=[1491,1525]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,13),(1,56)]
Nonempty VS_coord node=1632 children=[1610,824]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1634 children=[1429,1633]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1636 children=[1506,1635]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1638 children=[131,1637]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1640 children=[1429,1639]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1641 children=[1491,1534]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,25),(1,56)]
Nonempty VS_coord node=1642 children=[1475,824]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1643 children=[1506,1518]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1645 children=[51,1644]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,43)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1647 children=[1429,1646]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1648 children=[1491,1542]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1650 children=[1506,1649]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1652 children=[184,1651]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,29),(1,49)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,30)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1654 children=[1429,1653]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1655 children=[1491,1550]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=1656 children=[1506,1646]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1658 children=[199,1657]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,30)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coord node=1659 children=[1592,1447]; component projection of output specification
Nonempty VS_coordDelta node=1660 children=[1659,221]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=1662 children=[1592,1661]; component projection of output specification
Nonempty VS_coordDelta node=1663 children=[1662,239]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,11)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,18)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,13)]
MRV immediate domains=[(0,11),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,39)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,36)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,35)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,46)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,18)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,37)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,36)]
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1664 children=[1592,1579]; component projection of output specification
Nonempty VS_coordAdd node=1666 children=[1491,1665]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,12),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1667 children=[131,1491]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,13),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1669 children=[1444,1668]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1671 children=[1506,1670]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1686 children=[131,1685]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1688 children=[148,1687]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1690 children=[37,1689]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1692 children=[51,1691]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1694 children=[184,1693]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1696 children=[199,1695]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1698 children=[163,1697]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1700 children=[1699,17]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1738 children=[148,1737]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1740 children=[37,1739]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1742 children=[131,1741]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1744 children=[184,1743]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1746 children=[199,1745]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1748 children=[163,1747]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1750 children=[51,1749]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1752 children=[1751,55]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=1757 children=[661,1756]; component projection of output specification
Nonempty VS_coordDelta node=1758 children=[1757,131]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,37)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,35),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,36),(1,52)]
Nonempty VS_subtract node=1759 children=[698,1152]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,37)]
Nonempty VS_subtract node=1760 children=[765,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1777 children=[1475,1776]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,75),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1857 children=[1856,1781]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,80),(1,13)]
Nonempty VS_subtract node=1858 children=[910,1570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,40)]
Nonempty VS_subtract node=1859 children=[337,1099]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1876 children=[310,1875]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1888 children=[1887,1880]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1905 children=[1610,1904]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,70),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1980 children=[1979,1909]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1985 children=[1014,1984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1990 children=[1989,337]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,36)]
Nonempty VS_subtract node=1991 children=[1756,698]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2006 children=[1992,2005]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2008 children=[1164,2007]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2023 children=[2009,2022]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2038 children=[2024,2037]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2043 children=[1781,2042]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2052 children=[2051,2044]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2061 children=[2060,2053]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2066 children=[2065,2062]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=2067 children=[1668,1475]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,2)]
Nonempty VS_multiply node=2068 children=[1475,1668]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2073 children=[1880,2072]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2075 children=[2072,2074]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2080 children=[1668,2079]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2082 children=[698,2081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2084 children=[337,2083]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,1)]
Nonempty VS_add node=2085 children=[765,118]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,56),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2087 children=[824,2086]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,56),(1,1)]
Nonempty VS_subtract node=2088 children=[824,1447]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,80),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2090 children=[910,2089]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2092 children=[947,2091]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_subtract node=2093 children=[947,1573]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=2095 children=[1736,2094]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,37)]
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,43)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2097 children=[148,2096]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2099 children=[184,2098]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2101 children=[163,2100]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2103 children=[37,2102]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2104 children=[131,1739]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2106 children=[199,2105]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2108 children=[51,2107]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2110 children=[2109,221]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2111 children=[148,2102]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2112 children=[37,1741]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2113 children=[184,2105]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2115 children=[199,2114]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2117 children=[163,2116]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2119 children=[131,2118]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2121 children=[51,2120]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2123 children=[2122,239]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,11)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2125 children=[131,2124]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2127 children=[51,2126]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2129 children=[37,2128]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,12)]
Nonempty VS_coord node=2130 children=[1447,337]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2132 children=[148,2131]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2134 children=[163,2133]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2136 children=[199,2135]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2138 children=[184,2137]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2140 children=[2139,281]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,52),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,70),(1,38)]
MRV immediate domains=[(0,11),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,75),(1,43)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,42),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,42),(1,37)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,29)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,33),(1,34)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,46),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,46),(1,37)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2142 children=[488,1251]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,36),(1,52)]
Nonempty VS_coord node=2233 children=[2179,2232]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2236 children=[504,2235]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2239 children=[466,2238]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2242 children=[460,2241]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2245 children=[472,2244]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2247 children=[131,2246]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2249 children=[488,513]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,36),(1,1)]
Nonempty VS_coord node=2252 children=[2179,2251]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2255 children=[504,2254]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2258 children=[466,2257]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2261 children=[460,2260]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2264 children=[472,2263]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2266 children=[148,2265]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,37)]
Nonempty VS_coord node=2306 children=[2179,2305]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2307 children=[488,457]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2310 children=[504,2309]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2313 children=[466,2312]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2316 children=[460,2315]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2319 children=[472,2318]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2321 children=[37,2320]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2323 children=[488,1278]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,35),(1,52)]
Nonempty VS_coord node=2324 children=[1330,2232]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2327 children=[504,2326]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2330 children=[466,2329]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2333 children=[460,2332]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2336 children=[472,2335]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2338 children=[51,2337]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2342 children=[466,2341]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2343 children=[488,624]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=2346 children=[2345,2251]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2349 children=[460,2348]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2352 children=[504,2351]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2355 children=[472,2354]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2357 children=[184,2356]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,37)]
Nonempty VS_coord node=2359 children=[2345,2305]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2362 children=[466,2361]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2363 children=[488,605]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2366 children=[504,2365]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2369 children=[460,2368]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2372 children=[472,2371]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2374 children=[199,2373]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2376 children=[488,584]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,35),(1,1)]
Nonempty VS_coord node=2377 children=[1330,2251]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2380 children=[504,2379]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2383 children=[466,2382]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2386 children=[460,2385]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2389 children=[472,2388]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2391 children=[163,2390]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=2393 children=[1684,2392]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,34)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2395 children=[131,2394]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2397 children=[51,2396]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2399 children=[184,2398]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2401 children=[199,2400]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2403 children=[148,2402]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2405 children=[163,2404]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2407 children=[37,2406]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2409 children=[2408,17]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,39)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2411 children=[184,2410]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2413 children=[199,2412]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2415 children=[148,2414]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2417 children=[163,2416]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2419 children=[37,2418]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2421 children=[131,2420]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2423 children=[51,2422]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2425 children=[2424,55]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=2434 children=[2433,1756]; component projection of output specification
Nonempty VS_coordDelta node=2435 children=[2434,131]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,34)]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,37)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,41),(1,37)]
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,43)]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2437 children=[184,2436]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2439 children=[148,2438]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2441 children=[163,2440]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2443 children=[199,2442]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2445 children=[37,2444]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2446 children=[131,2418]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2448 children=[51,2447]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2450 children=[2449,221]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,8),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,33)]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2451 children=[184,2442]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2453 children=[199,2452]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2454 children=[148,2444]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2456 children=[163,2455]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2457 children=[37,2420]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2459 children=[131,2458]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2461 children=[51,2460]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2463 children=[2462,239]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,11)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,33)]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,38)]
MRV immediate domains=[(0,11),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,43)]
MRV immediate domains=[(0,13),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=2464 children=[217,2094]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,37)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,34),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,12)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,43),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,43),(1,37)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2475 children=[488,2474]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2476 children=[504,1251]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,46),(1,52)]
Nonempty VS_coord node=2524 children=[2523,2232]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2527 children=[466,2526]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2530 children=[460,2529]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2533 children=[472,2532]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2535 children=[131,2534]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2537 children=[504,1278]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,26),(1,52)]
Nonempty VS_coord node=2565 children=[2564,2232]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2568 children=[488,2567]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2571 children=[466,2570]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2574 children=[460,2573]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2577 children=[472,2576]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2579 children=[51,2578]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2583 children=[466,2582]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2586 children=[488,2585]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2587 children=[504,624]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=2590 children=[2589,2251]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2593 children=[460,2592]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2596 children=[472,2595]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2598 children=[184,2597]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,37)]
Nonempty VS_coord node=2600 children=[2589,2305]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2603 children=[466,2602]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2606 children=[488,2605]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2607 children=[504,605]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2610 children=[460,2609]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2613 children=[472,2612]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2615 children=[199,2614]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2619 children=[488,2618]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2620 children=[504,513]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,46),(1,1)]
Nonempty VS_coord node=2621 children=[2523,2251]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2624 children=[466,2623]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2627 children=[460,2626]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2630 children=[472,2629]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2632 children=[148,2631]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2634 children=[504,584]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,26),(1,1)]
Nonempty VS_coord node=2635 children=[2564,2251]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2638 children=[488,2637]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2641 children=[466,2640]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2644 children=[460,2643]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2647 children=[472,2646]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2649 children=[163,2648]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,46),(1,37)]
Nonempty VS_coord node=2651 children=[2523,2305]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2654 children=[488,2653]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2655 children=[504,457]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2658 children=[466,2657]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2661 children=[460,2660]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2664 children=[472,2663]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2666 children=[37,2665]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=2668 children=[281,2667]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,11),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=2670 children=[323,2669]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2671 children=[2670,17]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordDelta node=2672 children=[17,311]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,35)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2674 children=[323,2673]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2675 children=[2674,55]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=2679 children=[652,2678]; component projection of output specification
Nonempty VS_coordDelta node=2680 children=[2679,148]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,12),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_coordAdd node=2681 children=[323,1476]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2682 children=[148,2681]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,46),(1,39)]
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_coordAdd node=2683 children=[323,1510]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2684 children=[163,2683]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_coordAdd node=2685 children=[323,1518]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2686 children=[37,2685]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_coordAdd node=2687 children=[323,1525]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,35),(1,12)]
Nonempty VS_coord node=2688 children=[1736,1592]; component projection of output specification
Nonempty VS_coordDelta node=2690 children=[131,2689]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_coordAdd node=2691 children=[323,1534]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,46),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=2739 children=[2738,1592]; component projection of output specification
Nonempty VS_coordDelta node=2741 children=[51,2740]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=2742 children=[61,1153]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_coordAdd node=2744 children=[323,1542]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2745 children=[184,2744]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,12),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,40)]
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_coordAdd node=2746 children=[323,1550]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2747 children=[199,2746]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,40)]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,35)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_coordAdd node=2748 children=[323,1614]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2749 children=[2748,221]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2751 children=[323,2750]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2752 children=[2751,239]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,11)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=2754 children=[1570,2753]; component projection of output specification
MRV immediate domains=[(0,11),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2756 children=[323,2755]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2758 children=[2757,281]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,36),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,7),(1,25)]
Nonempty VS_subtract node=2759 children=[1887,1475]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2812 children=[2811,310]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,24)]
Nonempty VS_multiply node=2813 children=[1887,310]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,7)]
Nonempty VS_multiply node=2814 children=[310,1887]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,75),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2828 children=[1856,2827]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,37)]
Nonempty VS_subtract node=2829 children=[1444,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,13)]
Nonempty VS_subtract node=2830 children=[337,1444]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,12)]
Nonempty VS_subtract node=2831 children=[698,1592]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,52)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2846 children=[2845,1152]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,13)]
Nonempty VS_subtract node=2847 children=[1592,1570]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,3)]
Nonempty VS_subtract node=2848 children=[310,1909]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,56)]
Nonempty VS_subtract node=2849 children=[2678,824]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2859 children=[2858,947]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,3)]
Nonempty VS_subtract node=2860 children=[1475,1781]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,12),(1,3)]
Nonempty VS_subtract node=2861 children=[2827,1984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2866 children=[1904,2865]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,3)]
Nonempty VS_subtract node=2867 children=[1776,2042]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,40)]
Nonempty VS_subtract node=2868 children=[2753,1099]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,15)]
Nonempty VS_subtract node=2869 children=[2079,1904]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,15)]
Nonempty VS_subtract node=2870 children=[1880,1776]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2874 children=[2873,2022]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2876 children=[2022,2875]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2878 children=[2005,2877]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2892 children=[2891,2024]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2894 children=[2065,2893]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2896 children=[2895,2062]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2905 children=[2900,2904]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Nonempty VS_subtract node=2906 children=[1668,1610]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2908 children=[2907,1880]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_add node=2909 children=[2845,2081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2910 children=[2753,2083]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_add node=2911 children=[1444,118]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_add node=2912 children=[1592,2089]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=2951 children=[2950,2913]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,37)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coord node=2952 children=[2904,2678]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=2957 children=[2952,2956]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,40),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,40),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,11),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,70),(1,37)]
Nonempty VS_coord node=2959 children=[454,2305]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2962 children=[466,2961]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2965 children=[488,2964]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordAdd node=2968 children=[504,2967]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2971 children=[460,2970]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2974 children=[472,2973]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2976 children=[323,2975]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=2978 children=[323,2977]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,37),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=2979 children=[375,337]; component projection of output specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=2987 children=[2983,2986]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=2994 children=[2990,2993]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,75),(1,2)]
Nonempty VS_vec node=2997 children=[1248,2996]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3002 children=[2999,3001]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3003 children=[3001,2999]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=3005 children=[37,3004]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,8),(1,11)]
MRV immediate domains=[(0,11),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,75),(1,1)]
Nonempty VS_vec node=3007 children=[1248,2589]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_coordDelta node=3010 children=[3009,460]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordDelta node=3013 children=[460,3012]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3016 children=[2999,3015]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3017 children=[3015,2999]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3020 children=[3019,466]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordDelta node=3023 children=[466,3022]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3029 children=[3025,3028]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3035 children=[3031,3034]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordDelta node=3038 children=[472,3037]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,12)]
Nonempty VS_coordDelta node=3041 children=[3040,504]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordDelta node=3044 children=[488,3043]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordDelta node=3047 children=[504,3046]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=3049 children=[148,3048]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,8),(1,11)]
MRV immediate domains=[(0,11),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,52),(1,1)]
Nonempty VS_vec node=3051 children=[581,2589]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_coordDelta node=3054 children=[3053,460]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordDelta node=3057 children=[460,3056]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3060 children=[2999,3059]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3061 children=[3059,2999]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3064 children=[3063,466]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordDelta node=3067 children=[466,3066]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3070 children=[3069,3028]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3073 children=[3072,3034]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordDelta node=3076 children=[472,3075]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,12)]
Nonempty VS_coordDelta node=3079 children=[3078,504]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordDelta node=3082 children=[488,3081]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordDelta node=3085 children=[504,3084]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=3087 children=[163,3086]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,10)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,8),(1,11)]
MRV immediate domains=[(0,11),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,40),(1,2)]
Nonempty VS_vec node=3130 children=[3129,2996]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_coordDelta node=3133 children=[3132,460]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordDelta node=3136 children=[460,3135]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3139 children=[2999,3138]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3140 children=[3138,2999]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordDelta node=3143 children=[472,3142]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordDelta node=3146 children=[488,3145]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordDelta node=3149 children=[504,3148]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3152 children=[3151,466]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordDelta node=3155 children=[466,3154]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3158 children=[3157,3028]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3161 children=[3160,3034]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Nonempty VS_coordDelta node=3164 children=[3163,504]; coordinate/vector inverse: condition on right operand and deduce left component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=3166 children=[199,3165]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,8),(1,11)]
MRV immediate domains=[(0,11),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,40),(1,1)]
Nonempty VS_vec node=3168 children=[3129,2589]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_coordDelta node=3171 children=[3170,460]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordDelta node=3174 children=[460,3173]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3177 children=[2999,3176]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=3178 children=[3176,2999]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordDelta node=3181 children=[472,3180]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordDelta node=3184 children=[488,3183]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_coordDelta node=3187 children=[504,3186]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3190 children=[3189,466]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordDelta node=3193 children=[466,3192]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3196 children=[3195,3028]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=3197 children=[3157,3034]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,12)]
Nonempty VS_coordDelta node=3200 children=[3199,504]; coordinate/vector inverse: condition on right operand and deduce left component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=3202 children=[184,3201]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_place node=3204 children=[117,3203]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=3210 children=[104,3204,3209]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 16, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 0, cy = 3},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6),(Coord {cx = 1, cy = 3},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 3, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 0, cy = 2},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 1, cy = 2},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4),(Coord {cx = 2, cy = 2},4)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2),(Coord {cx = 2, cy = 2},2),(Coord {cx = 2, cy = 3},2)], orientation = 0}))]; includes-seed convention; no task classifier
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
```
