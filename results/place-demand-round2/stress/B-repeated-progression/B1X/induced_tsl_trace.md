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
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,75)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=88 children=[11,87]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=89 children=[11,88]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_place node=90 children=[7,89]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=91 children=[90]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=101 children=[91,100]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,15),(2,8)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=153 children=[152,106]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,45)]
Nonempty VS_add node=154 children=[106,152]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=205 children=[158,204]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,30)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=240 children=[208,239]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,2)]
Nonempty VS_add node=241 children=[239,208]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_add node=242 children=[204,158]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=244 children=[155,243]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,14),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,14),(1,30)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=276 children=[275,87]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=281 children=[280,276]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=286 children=[285,87]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=287 children=[285,286]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,11)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=288 children=[280,87]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=289 children=[275,288]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_place node=291 children=[102,290]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=292 children=[291]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Nonempty VS_scan node=318 children=[292,317,301]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,15),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=320 children=[3,6,319]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
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
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=329 children=[91,328]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=334 children=[333,152]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=335 children=[206,239]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=337 children=[336,204]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=339 children=[334,338]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,13),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,13),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,13),(1,17)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=341 children=[87,275]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=342 children=[340,341]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=344 children=[343,87]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=345 children=[343,344]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=346 children=[340,275]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=347 children=[87,346]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_place node=349 children=[102,348]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=350 children=[349]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=401 children=[239,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=418 children=[204,417]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_add node=419 children=[417,204]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,30)]
Nonempty VS_add node=420 children=[400,239]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,137),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=605 children=[604,467]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_multiply node=606 children=[467,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=653 children=[152,652]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=654 children=[467,467]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=655 children=[652,152]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=657 children=[656,421]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,17)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_coordAdd node=658 children=[369,657]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,5),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=401 children=[239,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=418 children=[204,417]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_add node=419 children=[417,204]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,30)]
Nonempty VS_add node=420 children=[400,239]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,137),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=605 children=[604,467]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_multiply node=606 children=[467,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=653 children=[152,652]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=654 children=[467,467]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=655 children=[652,152]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=659 children=[656,421]; component projection of output specification
MRV immediate domains=[(0,75),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,11),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,137),(1,30)]
Nonempty VS_multiply node=660 children=[604,239]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,137)]
Nonempty VS_multiply node=661 children=[239,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=708 children=[707,417]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,30)]
Nonempty VS_add node=709 children=[239,239]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_add node=710 children=[417,707]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=743 children=[707,742]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Nonempty VS_multiply node=744 children=[742,707]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,112),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=858 children=[857,652]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,112)]
Nonempty VS_add node=859 children=[652,857]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=867 children=[652,866]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=960 children=[913,959]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=961 children=[959,913]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,137),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1008 children=[604,1007]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_add node=1009 children=[1007,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1118 children=[1117,1055]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_add node=1119 children=[1055,1117]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1121 children=[1007,1120]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1123 children=[1055,1122]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1125 children=[1124,745]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,75)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1126 children=[87,1125]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,2),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1149 children=[1120,1148]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_multiply node=1150 children=[1148,1120]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1152 children=[1151,421]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,10)]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,12)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,17)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_coordAdd node=1153 children=[1132,1152]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,11),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,112),(1,45)]
Nonempty VS_add node=1185 children=[857,467]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,112)]
Nonempty VS_add node=1186 children=[467,857]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1187 children=[467,866]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,137),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1234 children=[604,1233]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_add node=1235 children=[1233,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1282 children=[1117,1281]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_add node=1283 children=[1281,1117]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1330 children=[1329,417]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_multiply node=1331 children=[417,1329]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_subtract node=1332 children=[1233,1120]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1333 children=[1281,1122]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,7),(1,15)]
Nonempty VS_add node=1335 children=[866,417]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,7)]
Nonempty VS_add node=1336 children=[417,866]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,112)]
Nonempty VS_subtract node=1337 children=[417,857]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,137)]
Nonempty VS_subtract node=1338 children=[400,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1385 children=[1384,1117]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1417 children=[1416,742]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,30)]
Nonempty VS_add node=1418 children=[1120,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,2)]
Nonempty VS_add node=1419 children=[400,1120]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1420 children=[1384,1122]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1422 children=[1416,1421]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1424 children=[1148,1423]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1426 children=[1148,1425]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1428 children=[1334,1427]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,13)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,12)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,31)]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,61)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,137)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,10)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,10)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,12)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,13)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,7)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,10)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,10)]
Nonempty VS_coordAdd node=1429 children=[1184,1428]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,15)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,15)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,15)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,15)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,112)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,19)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,12)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,11),(1,15)]
Nonempty VS_vec node=1430 children=[1334,417]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1477 children=[1476,1430]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,26),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,45),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_subtract node=1509 children=[204,1117]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Nonempty VS_subtract node=1510 children=[1117,1329]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,137)]
Nonempty VS_subtract node=1511 children=[239,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Nonempty VS_subtract node=1512 children=[742,913]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1559 children=[1558,742]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_subtract node=1560 children=[417,959]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1561 children=[204,1122]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,30)]
Nonempty VS_add node=1562 children=[1120,239]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,2)]
Nonempty VS_add node=1563 children=[239,1120]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1564 children=[1558,1421]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1581 children=[1580,1423]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=1582 children=[1580,1425]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,112),(1,45)]
Nonempty VS_add node=1584 children=[857,152]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,112)]
Nonempty VS_add node=1585 children=[152,857]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1586 children=[152,866]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,45),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,137),(1,45)]
Nonempty VS_add node=1587 children=[604,913]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_add node=1588 children=[913,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1589 children=[1007,913]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_add node=1590 children=[1329,1117]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Nonempty VS_add node=1591 children=[1117,1329]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,30)]
Nonempty VS_multiply node=1592 children=[1329,239]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_multiply node=1593 children=[239,1329]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1594 children=[1055,1329]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1595 children=[652,152]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_subtract node=1596 children=[913,1120]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1597 children=[1329,1122]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1599 children=[1598,1583]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1617 children=[1616,1600]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1619 children=[275,1618]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1621 children=[1508,1620]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1623 children=[1622,87]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1625 children=[87,1624]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1626 children=[1508,1625]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1628 children=[87,1627]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1629 children=[1616,1628]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1631 children=[87,1630]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1632 children=[275,1631]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,9)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,9)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,8)]
Nonempty VS_coordAdd node=1634 children=[1508,1633]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,26),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,7),(1,30)]
Nonempty VS_add node=1635 children=[866,239]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,7)]
Nonempty VS_add node=1636 children=[239,866]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,112)]
Nonempty VS_subtract node=1637 children=[239,857]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_subtract node=1638 children=[204,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_subtract node=1639 children=[1558,1117]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1686 children=[417,1685]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_subtract node=1687 children=[400,959]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Nonempty VS_subtract node=1688 children=[742,1329]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,31)]
Nonempty VS_subtract node=1689 children=[1580,742]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,45)]
Nonempty VS_add node=1690 children=[1120,204]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_add node=1691 children=[204,1120]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1692 children=[1558,1122]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=1693 children=[1580,1421]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1695 children=[1598,1694]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,4),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1697 children=[275,1696]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,15)]
Nonempty VS_coord node=1698 children=[1007,417]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1699 children=[1508,1600]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_coordAdd node=1700 children=[1616,1618]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1702 children=[1701,87]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,13)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,13)]
MRV immediate domains=[(0,30),(1,2)]
Nonempty VS_coordDelta node=1703 children=[1508,1628]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_coordDelta node=1704 children=[1616,1631]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1706 children=[87,1705]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_coord node=1707 children=[913,959]; component projection of output specification
Nonempty VS_coordDelta node=1709 children=[275,1708]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,12)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,10)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,9)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,7)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,10)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordAdd node=1711 children=[1616,1710]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,26),(1,30)]
Nonempty VS_vec node=1712 children=[1598,239]; component projection of output specification
MRV immediate domains=[(0,30),(1,75)]
Nonempty VS_coordDelta node=1713 children=[275,87]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1715 children=[275,1714]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,7),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,17)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_multiply node=1728 children=[1580,1122]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1729 children=[1728,421]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,17)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordAdd node=1730 children=[1727,1729]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,3)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_place node=1741 children=[366,1740]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=1750 children=[350,1741,1749]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=1752 children=[3,6,1751]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=1754 children=[1753]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","height","index","lambda","literal","map","mkScene","multiply","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","vec","width","x","y"]
Cost saturation C=1..20 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0)]
Abstraction round=0; exact frontier=1790; accepted=["I0","I1","I2","I3","I4","I5"]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","height","index","lambda","literal","map","mkScene","multiply","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","vec","width","x","y"]
Abstraction round=1; exact frontier=1790; accepted=[]
Cost saturation C=1..20 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(objects(v0)),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(objects(v0)),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(objects(v0)),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(objects(v0)),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,18,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,18,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,18,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,18,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,18,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),BR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(__cse0))),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: False; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),Center) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TL) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(snd(v1),TR) in place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(__cse0,Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),TL),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),TR),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TR))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),head(objects(v0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
```
