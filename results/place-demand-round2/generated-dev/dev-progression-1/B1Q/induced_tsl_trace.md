# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,8)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
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
MRV immediate domains=[(0,1),(1,6)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 11 non-local residual branches of coordAdd; CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=25 children=[9,24]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=26 children=[9,25]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=28 children=[5,26]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=29 children=[28]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=37 children=[29,36]; map witness: corresponding f(x_i)=y_i; element instances=6
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
MRV immediate domains=[(0,1),(1,1),(2,6)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 6 non-local residual branches of coordAdd; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=44 children=[39,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=52 children=[45,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=55 children=[53,54]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,42)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=103 children=[59,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,42)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=150 children=[106,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,28)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=183 children=[153,182]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=185 children=[56,184]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,32),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,44)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,32),(1,44)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,13)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=204 children=[24,203]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=205 children=[189,204]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,44)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=211 children=[210,24]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=212 children=[210,211]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=215 children=[38,214]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=216 children=[215]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,13),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 16 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,36),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,42),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=260 children=[102,259]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=301 children=[300,300]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,42)]
Nonempty VS_add node=302 children=[259,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=320 children=[102,319]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,42)]
Nonempty VS_multiply node=321 children=[319,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=384 children=[383,300]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,62)]
Nonempty VS_multiply node=385 children=[300,383]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=415 children=[414,399]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=445 children=[444,429]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=513 children=[472,512]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,26)]
Nonempty VS_add node=514 children=[512,472]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=515 children=[429,444]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=516 children=[399,414]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=532 children=[414,531]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_multiply node=533 children=[531,414]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=563 children=[149,562]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,29),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=594 children=[593,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,29)]
Nonempty VS_add node=595 children=[182,593]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,42)]
Nonempty VS_add node=596 children=[562,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=616 children=[599,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_multiply node=617 children=[615,599]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=634 children=[618,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_multiply node=635 children=[633,618]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=656 children=[638,655]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,2)]
Nonempty VS_add node=657 children=[655,638]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=662 children=[599,661]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=663 children=[661,599]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=671 children=[666,670]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=672 children=[670,666]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,26),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=716 children=[715,688]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Nonempty VS_add node=717 children=[688,715]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=745 children=[744,531]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Nonempty VS_add node=746 children=[531,744]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=776 children=[760,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Nonempty VS_add node=777 children=[775,760]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=809 children=[808,792]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_add node=810 children=[792,808]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=840 children=[839,824]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=841 children=[824,839]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=856 children=[855,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,13)]
Nonempty VS_add node=857 children=[43,855]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=877 children=[860,876]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_add node=878 children=[876,860]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=900 children=[899,883]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,15)]
Nonempty VS_add node=901 children=[883,899]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=916 children=[915,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,13)]
Nonempty VS_add node=917 children=[51,915]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=937 children=[921,936]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=952 children=[951,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=971 children=[953,970]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=972 children=[970,953]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Nonempty VS_add node=973 children=[54,951]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,3)]
Nonempty VS_add node=974 children=[936,921]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=979 children=[978,975]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=987 children=[982,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=988 children=[986,982]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_add node=989 children=[975,978]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=991 children=[808,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=997 children=[996,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=999 children=[921,998]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1001 children=[996,1000]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1003 children=[953,1002]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1005 children=[824,1004]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1021 children=[1020,1006]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1023 children=[1020,1022]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1025 children=[1024,673]; component projection of output specification
Nonempty VS_place node=1026 children=[230,1025]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=1034 children=[216,1026,1033]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 17, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 2, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 2, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=1036 children=[1,4,1035]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
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
MRV immediate domains=[(0,1),(1,6)]
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
MRV immediate domains=[(0,1),(1,1),(2,6)]
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
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=1045 children=[29,1044]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,14),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 6 non-local residual branches of coordAdd; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,6),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1046 children=[39,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_add node=1047 children=[43,39]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1048 children=[53,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Nonempty VS_add node=1049 children=[51,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1050 children=[54,45]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=1051 children=[45,54]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,42),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1053 children=[102,59]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,42)]
Nonempty VS_add node=1054 children=[59,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1055 children=[149,153]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,28)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1056 children=[106,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,2)]
Nonempty VS_add node=1057 children=[182,106]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,42)]
Nonempty VS_add node=1058 children=[153,149]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1060 children=[1052,1059]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,42)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,13),(1,14)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1061 children=[203,24]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,3),(1,42)]
Nonempty VS_vec node=1062 children=[43,102]; component projection of output specification
Nonempty VS_coordAdd node=1064 children=[189,1063]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,42)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=211 children=[210,24]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=212 children=[210,211]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=1066 children=[38,1065]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1067 children=[1066]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Nonempty VS_scan node=1091 children=[1067,1090,1075]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 2, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 17, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,6)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,6)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=1093 children=[1,4,1092]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,7)]
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
MRV immediate domains=[(0,1),(1,6)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,6)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=1095 children=[29,1094]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,6)]
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
MRV immediate domains=[(0,1),(1,14),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 6 non-local residual branches of coordAdd; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=211 children=[210,24]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=212 children=[210,211]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=1096 children=[38,212]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1097 children=[1096]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=1099 children=[1097,1090,1098]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 2, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 17, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,14),(2,6)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=1101 children=[1,4,1100]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,6)]
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
MRV immediate domains=[(0,1),(1,14),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,6)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,6)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=1103 children=[29,1102]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,6)]
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
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 6 non-local residual branches of coordAdd; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=211 children=[210,24]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=212 children=[210,211]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=1096 children=[38,212]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1097 children=[1096]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 16 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,36),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1105 children=[414,414]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,62)]
Nonempty VS_multiply node=1106 children=[414,383]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,14)]
Nonempty VS_multiply node=1107 children=[383,414]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1122 children=[1121,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1138 children=[1137,472]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,14)]
Nonempty VS_add node=1139 children=[472,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,42)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1141 children=[1140,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,1)]
Nonempty VS_multiply node=1142 children=[102,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1164 children=[1147,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1171 children=[1165,1170]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_add node=1172 children=[1170,1165]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,52),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1242 children=[1241,1189]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,52)]
Nonempty VS_add node=1243 children=[1189,1241]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1251 children=[1189,1250]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,15)]
Nonempty VS_subtract node=1252 children=[715,876]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1269 children=[383,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,62)]
Nonempty VS_add node=1270 children=[1268,383]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1271 children=[1137,688]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,14)]
Nonempty VS_add node=1272 children=[149,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,42)]
Nonempty VS_add node=1273 children=[775,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1274 children=[688,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1291 children=[744,1290]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1307 children=[414,1306]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_multiply node=1308 children=[1306,414]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1326 children=[1325,319]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,16)]
Nonempty VS_add node=1327 children=[319,1325]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,15)]
Nonempty VS_subtract node=1328 children=[760,899]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_subtract node=1329 children=[792,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_subtract node=1330 children=[839,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Nonempty VS_subtract node=1331 children=[860,688]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,14)]
Nonempty VS_subtract node=1332 children=[883,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,14)]
Nonempty VS_subtract node=1333 children=[670,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,42)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1335 children=[1334,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,16)]
Nonempty VS_add node=1336 children=[1140,970]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1340 children=[1163,1339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Nonempty VS_add node=1341 children=[1339,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=1342 children=[970,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1346 children=[1345,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1348 children=[1268,1347]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_multiply node=1349 children=[1140,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_multiply node=1350 children=[54,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1352 children=[1325,1351]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_subtract node=1353 children=[986,1165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1354 children=[975,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1355 children=[1140,1002]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=1356 children=[1165,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1357 children=[1165,1000]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1359 children=[1358,1173]; component projection of output specification
Nonempty VS_place node=1360 children=[1104,1359]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=1362 children=[1097,1360,1361]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 2, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 17, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=1364 children=[1,4,1363]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,6)]
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
MRV immediate domains=[(0,1),(1,1),(2,6)]
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
Nonempty VS_lambda node=1366 children=[1365]; function graph -> parameter binding and output points
Deferred pass: released=7 stale memo=25 share=62500
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,8)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,6)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordAdd node=26 children=[9,25]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,13),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,13),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,26),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_place node=28 children=[5,26]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=29 children=[28]; function graph -> parameter binding and output points
Nonempty VS_map node=37 children=[29,36]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,6)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,3)]
Nonempty VS_coord node=185 children=[56,184]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordAdd node=205 children=[189,204]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordAdd node=212 children=[210,211]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1369 children=[189,203]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1370 children=[24,1369]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_place node=1372 children=[38,1371]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1373 children=[1372]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,13),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,36),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,42),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=260 children=[102,259]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=301 children=[300,300]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,42)]
Nonempty VS_add node=302 children=[259,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=320 children=[102,319]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,42)]
Nonempty VS_multiply node=321 children=[319,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=384 children=[383,300]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,62)]
Nonempty VS_multiply node=385 children=[300,383]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=415 children=[414,399]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=445 children=[444,429]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=513 children=[472,512]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,26)]
Nonempty VS_add node=514 children=[512,472]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=515 children=[429,444]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=516 children=[399,414]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=532 children=[414,531]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_multiply node=533 children=[531,414]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=563 children=[149,562]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,29),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=594 children=[593,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,29)]
Nonempty VS_add node=595 children=[182,593]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,42)]
Nonempty VS_add node=596 children=[562,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=616 children=[599,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_multiply node=617 children=[615,599]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=634 children=[618,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_multiply node=635 children=[633,618]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=656 children=[638,655]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,2)]
Nonempty VS_add node=657 children=[655,638]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=662 children=[599,661]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=663 children=[661,599]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=671 children=[666,670]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=672 children=[670,666]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,26),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=716 children=[715,688]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Nonempty VS_add node=717 children=[688,715]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=745 children=[744,531]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Nonempty VS_add node=746 children=[531,744]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=776 children=[760,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Nonempty VS_add node=777 children=[775,760]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=809 children=[808,792]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_add node=810 children=[792,808]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=840 children=[839,824]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=841 children=[824,839]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=856 children=[855,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,13)]
Nonempty VS_add node=857 children=[43,855]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=877 children=[860,876]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_add node=878 children=[876,860]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=900 children=[899,883]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,15)]
Nonempty VS_add node=901 children=[883,899]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=916 children=[915,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,13)]
Nonempty VS_add node=917 children=[51,915]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=937 children=[921,936]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=952 children=[951,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=971 children=[953,970]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=972 children=[970,953]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Nonempty VS_add node=973 children=[54,951]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,3)]
Nonempty VS_add node=974 children=[936,921]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=979 children=[978,975]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=987 children=[982,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=988 children=[986,982]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_add node=989 children=[975,978]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=991 children=[808,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=997 children=[996,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=999 children=[921,998]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1001 children=[996,1000]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1003 children=[953,1002]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1005 children=[824,1004]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1021 children=[1020,1006]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1023 children=[1020,1022]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1377 children=[1024,673]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Nonempty VS_coordAdd node=1378 children=[1376,1377]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,36),(1,29)]
Nonempty VS_coord node=1025 children=[1024,673]; component projection of output specification
MRV immediate domains=[(0,14),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 1 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,26),(1,13)]
Nonempty VS_coord node=1394 children=[715,429]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1395 children=[1394,1376]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,12)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,12)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,12)]
MRV immediate domains=[(0,26),(1,13)]
Nonempty VS_vec node=1396 children=[715,429]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,28)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,28)]
Nonempty VS_coordAdd node=1398 children=[1393,1397]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,14),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,13)]
Nonempty VS_coord node=1414 children=[860,429]; component projection of output specification
Nonempty VS_coordDelta node=1415 children=[1414,1376]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,14)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,8)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,14)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,12)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,12)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,12)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,28)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,28)]
MRV immediate domains=[(0,2),(1,13)]
Nonempty VS_vec node=1416 children=[860,429]; component projection of output specification
Nonempty VS_coordAdd node=1418 children=[1413,1417]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,14),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,47),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,47),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,47),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,47),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,47),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1474 children=[1268,1473]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,15)]
Nonempty VS_add node=1475 children=[1473,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,13)]
Nonempty VS_add node=1476 children=[102,824]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,42)]
Nonempty VS_add node=1477 children=[824,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1518 children=[1325,1517]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,16)]
Nonempty VS_add node=1519 children=[1517,1325]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1561 children=[1189,1560]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,40),(1,15)]
Nonempty VS_add node=1562 children=[1560,1189]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1563 children=[775,792]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1564 children=[688,936]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1565 children=[936,688]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1566 children=[792,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1567 children=[760,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,15)]
Nonempty VS_add node=1568 children=[149,808]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,42)]
Nonempty VS_add node=1569 children=[808,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1577 children=[615,1576]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,13)]
Nonempty VS_add node=1578 children=[182,1020]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,28)]
Nonempty VS_add node=1579 children=[1020,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,15)]
Nonempty VS_add node=1580 children=[1576,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1598 children=[1597,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1603 children=[1602,876]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,3)]
Nonempty VS_add node=1604 children=[876,1602]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,16)]
Nonempty VS_add node=1605 children=[51,1597]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,4)]
Nonempty VS_add node=1606 children=[1163,883]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,15)]
Nonempty VS_add node=1607 children=[883,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1608 children=[1137,921]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,14)]
Nonempty VS_add node=1609 children=[921,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1610 children=[986,1290]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,3)]
Nonempty VS_add node=1611 children=[1290,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1639 children=[1140,1638]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Nonempty VS_add node=1640 children=[1638,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1641 children=[1165,744]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Nonempty VS_add node=1642 children=[744,1165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1643 children=[1339,899]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_add node=1644 children=[899,1339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1646 children=[1645,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_add node=1647 children=[43,1645]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_multiply node=1648 children=[1140,921]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_multiply node=1649 children=[921,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1651 children=[54,1650]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=1652 children=[1650,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1654 children=[666,1653]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_multiply node=1655 children=[1653,666]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=1656 children=[688,998]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_add node=1657 children=[531,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=1658 children=[775,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=1659 children=[531,1000]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1661 children=[1660,259]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,18)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,18)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,25)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,25)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,11)]
Nonempty VS_coordAdd node=1662 children=[1433,1661]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,14),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,13),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1677 children=[1676,1376]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,26),(1,28)]
Nonempty VS_vec node=1678 children=[715,259]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1680 children=[24,1679]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,14),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,28)]
Nonempty VS_coord node=1696 children=[860,259]; component projection of output specification
Nonempty VS_coordDelta node=1697 children=[1696,1376]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,19)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,6)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,8)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,12)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,19)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,20)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,11)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,2),(1,28)]
Nonempty VS_vec node=1698 children=[860,259]; component projection of output specification
Nonempty VS_coordAdd node=1700 children=[1695,1699]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,36),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,2),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1701 children=[1347,1560]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,40),(1,2)]
Nonempty VS_multiply node=1702 children=[1560,1347]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1704 children=[618,1703]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1706 children=[259,1705]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1708 children=[618,1707]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1710 children=[259,1709]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,29),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1712 children=[593,1711]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1714 children=[562,1713]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,29),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1716 children=[593,1715]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1718 children=[562,1717]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1721 children=[1719,1720]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1723 children=[1719,1722]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1725 children=[1024,1724]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,6)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,9)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,12)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,10)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,13)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,10)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,13)]
Nonempty VS_coordAdd node=1726 children=[1367,1725]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,16)]
Nonempty VS_multiply node=1727 children=[1347,655]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,2)]
Nonempty VS_multiply node=1728 children=[655,1347]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1730 children=[1729,1705]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1731 children=[1729,1709]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=1732 children=[1653,1711]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1734 children=[1733,1713]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1735 children=[1653,1715]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1736 children=[1733,1717]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1738 children=[1737,673]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Nonempty VS_coordAdd node=1739 children=[1368,1738]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,13),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,37),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,14)]
Nonempty VS_add node=1754 children=[1268,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_add node=1755 children=[633,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,15)]
Nonempty VS_subtract node=1756 children=[715,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,16)]
Nonempty VS_multiply node=1757 children=[615,319]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,15)]
Nonempty VS_multiply node=1758 children=[319,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,14)]
Nonempty VS_add node=1759 children=[319,531]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,14)]
Nonempty VS_add node=1760 children=[970,688]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,16)]
Nonempty VS_add node=1761 children=[688,970]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,16)]
Nonempty VS_add node=1762 children=[531,319]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,15)]
Nonempty VS_subtract node=1763 children=[744,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,40)]
Nonempty VS_add node=1764 children=[1325,1560]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1765 children=[1189,1306]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_add node=1766 children=[1306,1189]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,40),(1,16)]
Nonempty VS_add node=1767 children=[1560,1325]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,16)]
Nonempty VS_subtract node=1768 children=[760,1597]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Nonempty VS_add node=1769 children=[1137,824]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,13)]
Nonempty VS_add node=1770 children=[149,1020]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,42)]
Nonempty VS_add node=1771 children=[1020,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=1772 children=[824,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,3)]
Nonempty VS_add node=1773 children=[615,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,15)]
Nonempty VS_add node=1774 children=[43,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,5)]
Nonempty VS_add node=1775 children=[1163,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,15)]
Nonempty VS_add node=1776 children=[51,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,39)]
Nonempty VS_add node=1777 children=[1140,1473]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,1)]
Nonempty VS_add node=1778 children=[1473,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=1779 children=[1597,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,16)]
Nonempty VS_add node=1780 children=[54,1597]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,39)]
Nonempty VS_add node=1781 children=[1165,1517]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,1)]
Nonempty VS_add node=1782 children=[1517,1165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Nonempty VS_add node=1783 children=[1339,1290]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_add node=1784 children=[1290,1339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_subtract node=1785 children=[860,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1786 children=[531,1351]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_subtract node=1787 children=[883,1165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=1788 children=[688,1002]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_add node=1789 children=[775,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=1790 children=[775,1000]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1792 children=[1791,472]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,26)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,22),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,22),(1,41)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,41)]
Nonempty VS_coordAdd node=1793 children=[1753,1792]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,13),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,6)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,8)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,21)]
MRV immediate domains=[(0,1),(1,13)]
MRV immediate domains=[(0,35),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,16),(1,14)]
Nonempty VS_add node=1808 children=[319,688]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,16)]
Nonempty VS_add node=1809 children=[688,319]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,15)]
Nonempty VS_subtract node=1810 children=[744,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,14)]
Nonempty VS_add node=1811 children=[1325,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,14)]
Nonempty VS_add node=1812 children=[1268,1306]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_add node=1813 children=[1306,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,16)]
Nonempty VS_add node=1814 children=[633,1325]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,14)]
Nonempty VS_add node=1815 children=[383,531]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,62)]
Nonempty VS_add node=1816 children=[531,383]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,16)]
Nonempty VS_subtract node=1817 children=[715,1597]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,15)]
Nonempty VS_subtract node=1818 children=[1638,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,15)]
Nonempty VS_multiply node=1819 children=[1163,1189]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,15)]
Nonempty VS_multiply node=1820 children=[1189,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,16)]
Nonempty VS_add node=1821 children=[775,970]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,14)]
Nonempty VS_add node=1822 children=[970,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,13)]
Nonempty VS_multiply node=1823 children=[149,1020]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,42)]
Nonempty VS_multiply node=1824 children=[1020,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Nonempty VS_add node=1825 children=[1137,1020]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=1826 children=[1020,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,3)]
Nonempty VS_add node=1827 children=[1163,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=1828 children=[615,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_add node=1829 children=[54,615]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,15)]
Nonempty VS_add node=1830 children=[43,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,40)]
Nonempty VS_add node=1831 children=[1140,1560]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,40),(1,1)]
Nonempty VS_add node=1832 children=[1560,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_subtract node=1833 children=[953,1306]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_subtract node=1834 children=[760,1645]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,39)]
Nonempty VS_add node=1835 children=[1165,1473]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,1)]
Nonempty VS_add node=1836 children=[1473,1165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,16)]
Nonempty VS_subtract node=1837 children=[860,1325]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=1838 children=[688,1351]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Nonempty VS_subtract node=1839 children=[1576,1165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_subtract node=1840 children=[883,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,2)]
Nonempty VS_subtract node=1841 children=[531,1347]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=1842 children=[775,1002]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1844 children=[1843,472]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,26)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,41)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,41)]
Nonempty VS_coordAdd node=1845 children=[1807,1844]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,26),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,39)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,37),(1,39)]
Nonempty VS_vec node=1873 children=[1791,300]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,22)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,20)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,22)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,21)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,22),(1,39)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,39)]
Nonempty VS_coordAdd node=1874 children=[1872,1873]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,13),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,39)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,35),(1,39)]
Nonempty VS_vec node=1889 children=[1843,300]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,10)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,22)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,22)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,20)]
MRV immediate domains=[(0,1),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,21)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,39)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,39)]
Nonempty VS_coordAdd node=1890 children=[1888,1889]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,13),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,14)]
Nonempty VS_coord node=1905 children=[43,414]; component projection of output specification
Nonempty VS_coordDelta node=1906 children=[1905,1376]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,36),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,13)]
MRV immediate domains=[(0,1),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,31),(1,24)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,32),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,32),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,38),(1,24)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,38),(1,31)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,22),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
```
