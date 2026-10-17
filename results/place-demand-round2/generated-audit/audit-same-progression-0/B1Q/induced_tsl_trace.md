# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,5)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,1),(1,3),(2,10)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 11 non-local residual branches of coordAdd; CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=19 children=[9,18]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=20 children=[9,19]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=22 children=[5,20]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=23 children=[22]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=25 children=[23,24]; map witness: corresponding f(x_i)=y_i; element instances=7
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 6 non-local residual branches of coordAdd; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=36 children=[35,18]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=37 children=[35,36]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=39 children=[26,37]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=40 children=[39]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 16 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,51),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=54 children=[53,49]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=66 children=[58,65]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=78 children=[70,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=84 children=[83,79]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=90 children=[89,85]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=112 children=[111,94]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Nonempty VS_add node=113 children=[94,111]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=137 children=[136,85]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_add node=138 children=[85,136]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=149 children=[148,139]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=151 children=[148,150]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=162 children=[161,152]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=164 children=[161,163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=175 children=[174,165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=177 children=[49,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=179 children=[174,178]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=181 children=[49,180]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=183 children=[79,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=185 children=[79,184]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=187 children=[85,186]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=208 children=[197,207]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_multiply node=209 children=[207,197]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=244 children=[243,218]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=289 children=[253,288]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,8)]
Nonempty VS_add node=290 children=[288,253]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,24)]
Nonempty VS_add node=291 children=[218,243]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=328 children=[327,302]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,24)]
Nonempty VS_add node=329 children=[302,327]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,23)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=363 children=[338,362]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,23),(1,8)]
Nonempty VS_add node=364 children=[362,338]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=410 children=[409,367]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,41)]
Nonempty VS_multiply node=411 children=[367,409]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=437 children=[436,419]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=447 children=[136,446]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,22)]
Nonempty VS_add node=448 children=[446,136]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Nonempty VS_add node=449 children=[419,436]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=459 children=[458,367]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Nonempty VS_add node=460 children=[367,458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,6)]
Nonempty VS_add node=461 children=[207,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,9)]
Nonempty VS_add node=462 children=[77,207]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=505 children=[504,482]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=514 children=[111,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=543 children=[522,542]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_add node=544 children=[542,522]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Nonempty VS_add node=545 children=[513,111]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,21)]
Nonempty VS_add node=546 children=[482,504]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=572 children=[554,571]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Nonempty VS_add node=573 children=[571,554]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=587 children=[574,586]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_multiply node=588 children=[586,574]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=631 children=[630,602]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,27)]
Nonempty VS_add node=632 children=[602,630]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=674 children=[646,673]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,13)]
Nonempty VS_add node=675 children=[673,646]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=699 children=[685,698]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,9)]
Nonempty VS_multiply node=700 children=[698,685]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=731 children=[707,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=746 children=[698,745]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,12)]
Nonempty VS_add node=747 children=[745,698]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,6)]
Nonempty VS_add node=748 children=[730,707]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=750 children=[630,749]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=752 children=[504,751]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=762 children=[761,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=763 children=[761,180]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=765 children=[522,764]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=767 children=[673,766]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=777 children=[776,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=778 children=[776,184]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=779 children=[446,186]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=781 children=[698,780]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=783 children=[707,782]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=785 children=[784,188]; component projection of output specification
Nonempty VS_place node=786 children=[48,785]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=788 children=[40,786,787]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 3, position = Coord {cx = 12, cy = 19}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=790 children=[1,4,789]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,5)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=797 children=[23,796]; map witness: corresponding f(x_i)=y_i; element instances=7
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 6 non-local residual branches of coordAdd; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,6)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,34)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=799 children=[798,288]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,19)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=803 children=[802,482]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=807 children=[806,602]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=811 children=[810,646]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=812 children=[806,749]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=813 children=[802,751]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=814 children=[810,766]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=816 children=[799,815]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,40),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,16)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=834 children=[18,833]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,8),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=853 children=[843,852]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,21)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=907 children=[906,875]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,40),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coordAdd node=909 children=[30,908]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=36 children=[35,18]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=37 children=[35,36]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=911 children=[26,910]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=912 children=[911]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=919 children=[912,786,918]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 3, position = Coord {cx = 12, cy = 19}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=921 children=[1,4,920]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=923 children=[23,922]; map witness: corresponding f(x_i)=y_i; element instances=7
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 6 non-local residual branches of coordAdd; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=36 children=[35,18]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=37 children=[35,36]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=39 children=[26,37]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=40 children=[39]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,6),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 16 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=931 children=[542,49]; component projection of output specification
Nonempty VS_place node=932 children=[930,931]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=934 children=[40,932,933]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 3, position = Coord {cx = 6, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})),PlacedV (Object {objectId = 3, position = Coord {cx = 12, cy = 19}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})),(PairV (PlacedV (Object {objectId = 3, position = Coord {cx = 12, cy = 19}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=936 children=[1,4,935]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=945 children=[23,944]; map witness: corresponding f(x_i)=y_i; element instances=7
MRV immediate domains=[(0,1),(1,8),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 6 non-local residual branches of coordAdd; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,9)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,34)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=947 children=[946,288]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,1)]
Nonempty VS_add node=948 children=[288,946]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,19)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=950 children=[810,482]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,2)]
Nonempty VS_add node=951 children=[482,810]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=952 children=[802,646]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=953 children=[806,602]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,2)]
Nonempty VS_add node=954 children=[602,806]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,2)]
Nonempty VS_add node=955 children=[646,802]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=956 children=[806,749]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=957 children=[802,766]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=958 children=[810,751]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=960 children=[949,959]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,71),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,16),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=961 children=[833,18]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,8),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=962 children=[852,843]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,71),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,21),(1,30)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=963 children=[875,906]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=965 children=[30,964]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,13)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=36 children=[35,18]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=37 children=[35,36]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=967 children=[26,966]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=968 children=[967]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Nonempty VS_scan node=986 children=[968,985,976]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})) (PlacedV (Object {objectId = 3, position = Coord {cx = 6, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})),PlacedV (Object {objectId = 3, position = Coord {cx = 12, cy = 19}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,8),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,8),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,8),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,8),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=988 children=[1,4,987]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=990 children=[23,989]; map witness: corresponding f(x_i)=y_i; element instances=7
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,5)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 7 non-local residual branches of coordAdd; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=992 children=[991,18]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=993 children=[991,992]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=994 children=[26,993]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=995 children=[994]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 16 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,29),(1,23)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,24),(1,8)]
Nonempty VS_subtract node=999 children=[327,148]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1010 children=[776,1009]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1021 children=[761,1020]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_add node=1022 children=[1020,761]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_add node=1023 children=[1009,776]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Nonempty VS_subtract node=1024 children=[243,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1062 children=[1061,1036]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,24)]
Nonempty VS_add node=1063 children=[1036,1061]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1072 children=[1071,446]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_multiply node=1073 children=[446,1071]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1096 children=[1081,1095]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,7)]
Nonempty VS_add node=1097 children=[1095,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1107 children=[436,1106]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1123 children=[111,1122]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_subtract node=1124 children=[458,161]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1172 children=[1171,1129]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,41)]
Nonempty VS_add node=1173 children=[1129,1171]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1204 children=[1203,1178]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1208 children=[409,1207]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,41)]
Nonempty VS_add node=1209 children=[1207,409]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,24)]
Nonempty VS_add node=1210 children=[1178,1203]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1214 children=[504,1213]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1218 children=[522,1217]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,11)]
Nonempty VS_add node=1220 children=[776,1036]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,8)]
Nonempty VS_add node=1221 children=[1036,776]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1232 children=[1231,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_multiply node=1233 children=[446,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1259 children=[1258,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,7)]
Nonempty VS_multiply node=1260 children=[288,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1269 children=[243,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Nonempty VS_multiply node=1270 children=[436,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1280 children=[1279,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,7)]
Nonempty VS_multiply node=1281 children=[1231,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,14)]
Nonempty VS_subtract node=1282 children=[504,1122]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,7)]
Nonempty VS_multiply node=1283 children=[302,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,4)]
Nonempty VS_add node=1284 children=[1061,1129]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,4)]
Nonempty VS_add node=1285 children=[761,1178]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,2)]
Nonempty VS_add node=1286 children=[1203,1207]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,24)]
Nonempty VS_add node=1287 children=[1207,1203]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,8)]
Nonempty VS_add node=1288 children=[1178,761]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,24)]
Nonempty VS_add node=1289 children=[1129,1061]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,8)]
Nonempty VS_subtract node=1290 children=[630,1106]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_multiply node=1291 children=[482,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1315 children=[1314,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,7)]
Nonempty VS_multiply node=1316 children=[630,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1332 children=[522,1331]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1334 children=[327,1333]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,7)]
Nonempty VS_multiply node=1335 children=[513,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,7)]
Nonempty VS_multiply node=1336 children=[94,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_multiply node=1337 children=[85,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1339 children=[243,1338]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=1340 children=[458,574]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1342 children=[1341,1219]; component projection of output specification
Nonempty VS_place node=1343 children=[998,1342]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=1345 children=[995,1343,1344]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})) (PlacedV (Object {objectId = 3, position = Coord {cx = 6, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})),PlacedV (Object {objectId = 3, position = Coord {cx = 12, cy = 19}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})),(PairV (PlacedV (Object {objectId = 3, position = Coord {cx = 12, cy = 19}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=1347 children=[1,4,1346]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=1349 children=[1348]; function graph -> parameter binding and output points
Deferred pass: released=9 stale memo=31 share=62500
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,5)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,1),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordAdd node=20 children=[9,19]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,7),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_place node=22 children=[5,20]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=23 children=[22]; function graph -> parameter binding and output points
Nonempty VS_map node=25 children=[23,24]; map witness: corresponding f(x_i)=y_i; element instances=7
MRV immediate domains=[(0,1),(1,5)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordAdd node=37 children=[35,36]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,8),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_place node=39 children=[26,37]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=40 children=[39]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,51),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=54 children=[53,49]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=66 children=[58,65]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=78 children=[70,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=84 children=[83,79]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=90 children=[89,85]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=112 children=[111,94]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Nonempty VS_add node=113 children=[94,111]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=137 children=[136,85]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_add node=138 children=[85,136]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=149 children=[148,139]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=151 children=[148,150]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=162 children=[161,152]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=164 children=[161,163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=175 children=[174,165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=177 children=[49,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=179 children=[174,178]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=181 children=[49,180]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=183 children=[79,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=185 children=[79,184]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=187 children=[85,186]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=208 children=[197,207]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_multiply node=209 children=[207,197]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=244 children=[243,218]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=289 children=[253,288]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,8)]
Nonempty VS_add node=290 children=[288,253]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,24)]
Nonempty VS_add node=291 children=[218,243]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=328 children=[327,302]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,24)]
Nonempty VS_add node=329 children=[302,327]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,23)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=363 children=[338,362]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,23),(1,8)]
Nonempty VS_add node=364 children=[362,338]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=410 children=[409,367]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,41)]
Nonempty VS_multiply node=411 children=[367,409]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=437 children=[436,419]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=447 children=[136,446]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,22)]
Nonempty VS_add node=448 children=[446,136]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Nonempty VS_add node=449 children=[419,436]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=459 children=[458,367]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Nonempty VS_add node=460 children=[367,458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,6)]
Nonempty VS_add node=461 children=[207,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,9)]
Nonempty VS_add node=462 children=[77,207]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=505 children=[504,482]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=514 children=[111,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=543 children=[522,542]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_add node=544 children=[542,522]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Nonempty VS_add node=545 children=[513,111]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,21)]
Nonempty VS_add node=546 children=[482,504]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=572 children=[554,571]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Nonempty VS_add node=573 children=[571,554]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=587 children=[574,586]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_multiply node=588 children=[586,574]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=631 children=[630,602]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,27)]
Nonempty VS_add node=632 children=[602,630]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=674 children=[646,673]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,13)]
Nonempty VS_add node=675 children=[673,646]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=699 children=[685,698]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,9)]
Nonempty VS_multiply node=700 children=[698,685]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=731 children=[707,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=746 children=[698,745]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,12)]
Nonempty VS_add node=747 children=[745,698]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,6)]
Nonempty VS_add node=748 children=[730,707]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=750 children=[630,749]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=752 children=[504,751]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=762 children=[761,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=763 children=[761,180]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=765 children=[522,764]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=767 children=[673,766]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=777 children=[776,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=778 children=[776,184]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=779 children=[446,186]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=781 children=[698,780]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=783 children=[707,782]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1355 children=[784,188]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,51),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,51),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,51),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,16)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,22)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,22)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coordAdd node=1358 children=[1354,1355]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,51),(1,20)]
Nonempty VS_coord node=785 children=[784,188]; component projection of output specification
MRV immediate domains=[(0,8),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,15)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,16)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,19)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,2)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,17)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,17)]
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,6)]
Nonempty VS_subtract node=1359 children=[83,65]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,6)]
Nonempty VS_subtract node=1360 children=[53,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1361 children=[1314,1217]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,22)]
Nonempty VS_add node=1362 children=[1217,1314]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_add node=1363 children=[85,338]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_add node=1364 children=[338,85]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1365 children=[1213,136]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,2)]
Nonempty VS_add node=1366 children=[136,1213]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1370 children=[1369,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,2)]
Nonempty VS_add node=1371 children=[730,1369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,7)]
Nonempty VS_add node=1372 children=[94,554]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,3)]
Nonempty VS_add node=1373 children=[554,94]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1375 children=[1217,1374]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_subtract node=1376 children=[1213,186]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_subtract node=1377 children=[1369,782]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1379 children=[176,1378]; component projection of output specification
Nonempty VS_coordAdd node=1380 children=[843,1379]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,8),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,72),(1,15)]
MRV immediate domains=[(0,72),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,71),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1461 children=[1460,253]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,71)]
Nonempty VS_add node=1462 children=[253,1460]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1470 children=[253,1469]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,66)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1537 children=[1279,1536]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,66),(1,8)]
Nonempty VS_add node=1538 children=[1536,1279]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,41)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1550 children=[1549,409]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,10)]
Nonempty VS_multiply node=1551 children=[409,1549]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_add node=1552 children=[446,338]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_add node=1553 children=[338,446]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,8)]
Nonempty VS_add node=1554 children=[630,197]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,27)]
Nonempty VS_add node=1555 children=[197,630]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1556 children=[1314,1081]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,22)]
Nonempty VS_add node=1557 children=[1081,1314]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1558 children=[1171,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,41)]
Nonempty VS_add node=1559 children=[730,1171]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1569 children=[1568,504]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,8)]
Nonempty VS_add node=1570 children=[504,1568]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1571 children=[1203,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,13)]
Nonempty VS_add node=1572 children=[409,745]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1573 children=[1258,65]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,13)]
Nonempty VS_add node=1574 children=[288,646]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,34)]
Nonempty VS_add node=1575 children=[646,288]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,24)]
Nonempty VS_add node=1576 children=[65,1258]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,41)]
Nonempty VS_add node=1577 children=[745,409]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,24)]
Nonempty VS_add node=1578 children=[77,1203]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,66),(1,7)]
Nonempty VS_multiply node=1579 children=[1536,419]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1584 children=[1171,1583]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,41)]
Nonempty VS_multiply node=1585 children=[1583,1171]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,66)]
Nonempty VS_multiply node=1586 children=[419,1536]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,9)]
Nonempty VS_add node=1587 children=[436,685]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,16)]
Nonempty VS_add node=1588 children=[685,436]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1625 children=[1624,1597]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1635 children=[1634,571]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,8)]
Nonempty VS_add node=1636 children=[571,1634]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,26)]
Nonempty VS_add node=1637 children=[1597,1624]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1638 children=[1231,1217]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,9)]
Nonempty VS_add node=1639 children=[1217,1231]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,26)]
Nonempty VS_add node=1640 children=[1549,673]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1653 children=[1369,1652]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1691 children=[1662,1690]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,9)]
Nonempty VS_add node=1692 children=[49,207]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1693 children=[85,1009]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_add node=1694 children=[1009,85]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_add node=1695 children=[207,49]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,8)]
Nonempty VS_add node=1696 children=[1690,1662]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,2)]
Nonempty VS_add node=1697 children=[1652,1369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,10)]
Nonempty VS_add node=1698 children=[673,1549]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1700 children=[1699,111]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1701 children=[1333,327]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Nonempty VS_add node=1702 children=[327,1333]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=1703 children=[111,1699]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1739 children=[1738,1710]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,27)]
Nonempty VS_add node=1740 children=[1710,1738]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1749 children=[1748,1662]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_multiply node=1750 children=[1662,1748]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Nonempty VS_add node=1751 children=[243,574]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,24)]
Nonempty VS_add node=1752 children=[574,243]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,6)]
Nonempty VS_add node=1753 children=[302,707]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,10)]
Nonempty VS_add node=1754 children=[707,302]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1755 children=[1338,458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_add node=1756 children=[458,1338]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,7)]
Nonempty VS_add node=1757 children=[419,419]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,12)]
Nonempty VS_add node=1758 children=[367,698]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,2)]
Nonempty VS_add node=1759 children=[698,367]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1761 children=[1279,1760]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,7)]
Nonempty VS_add node=1762 children=[513,554]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,7)]
Nonempty VS_add node=1763 children=[554,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1765 children=[1597,1764]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,1)]
Nonempty VS_subtract node=1766 children=[288,766]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,1)]
Nonempty VS_subtract node=1767 children=[409,780]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,1)]
Nonempty VS_subtract node=1768 children=[1171,782]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=1769 children=[1081,1374]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1771 children=[1770,1378]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,72),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,15)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,72),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,72),(1,2)]
MRV immediate domains=[(0,1),(1,16)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,19)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,19)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,15)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,2)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,17)]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,17)]
Nonempty VS_coordAdd node=1772 children=[1389,1771]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,8),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,68),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,68),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,8)]
Nonempty VS_subtract node=1782 children=[58,253]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,13)]
Nonempty VS_subtract node=1783 children=[83,646]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,13)]
Nonempty VS_subtract node=1784 children=[53,745]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,22)]
Nonempty VS_subtract node=1785 children=[89,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_multiply node=1786 children=[1568,458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_multiply node=1787 children=[458,1568]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1788 children=[1122,136]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1789 children=[1314,1331]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,14)]
Nonempty VS_add node=1790 children=[136,1122]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,22)]
Nonempty VS_add node=1791 children=[1331,1314]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,41)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1802 children=[1801,409]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,9)]
Nonempty VS_multiply node=1803 children=[409,1801]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,27)]
Nonempty VS_multiply node=1804 children=[574,1738]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,1)]
Nonempty VS_multiply node=1805 children=[1738,574]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,2)]
Nonempty VS_multiply node=1806 children=[1624,367]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,26)]
Nonempty VS_multiply node=1807 children=[367,1624]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,22)]
Nonempty VS_add node=1808 children=[1801,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,13)]
Nonempty VS_add node=1809 children=[1583,745]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,13)]
Nonempty VS_add node=1810 children=[94,646]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,3)]
Nonempty VS_add node=1811 children=[646,94]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,3)]
Nonempty VS_add node=1812 children=[745,1583]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,9)]
Nonempty VS_add node=1813 children=[730,1801]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,13)]
Nonempty VS_multiply node=1814 children=[685,602]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,9)]
Nonempty VS_multiply node=1815 children=[602,685]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_add node=1816 children=[83,766]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_add node=1817 children=[53,780]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_add node=1818 children=[89,782]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=1819 children=[1122,186]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1820 children=[1106,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=1821 children=[1106,180]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=1822 children=[1331,1374]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_subtract node=1823 children=[94,766]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_subtract node=1824 children=[1583,780]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_subtract node=1825 children=[1801,782]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,16),(1,8)]
Nonempty VS_add node=1827 children=[436,197]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,16)]
Nonempty VS_add node=1828 children=[197,436]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,21)]
Nonempty VS_add node=1829 children=[148,504]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,14)]
Nonempty VS_add node=1830 children=[1231,1331]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,8)]
Nonempty VS_add node=1831 children=[504,148]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,9)]
Nonempty VS_add node=1832 children=[1331,1231]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1861 children=[302,1860]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,8)]
Nonempty VS_add node=1862 children=[1738,218]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,27)]
Nonempty VS_add node=1863 children=[218,1738]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,10)]
Nonempty VS_add node=1864 children=[1860,302]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,16)]
Nonempty VS_add node=1865 children=[1568,111]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,8)]
Nonempty VS_add node=1866 children=[111,1568]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,16)]
Nonempty VS_add node=1867 children=[1549,571]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Nonempty VS_add node=1868 children=[1258,338]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,24)]
Nonempty VS_add node=1869 children=[338,1258]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,10)]
Nonempty VS_add node=1870 children=[571,1549]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,8)]
Nonempty VS_add node=1871 children=[630,161]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,27)]
Nonempty VS_add node=1872 children=[161,630]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1873 children=[1314,1071]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,22)]
Nonempty VS_add node=1874 children=[1071,1314]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_add node=1875 children=[174,522]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,8)]
Nonempty VS_add node=1876 children=[522,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,6)]
Nonempty VS_add node=1877 children=[409,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,6)]
Nonempty VS_add node=1878 children=[288,65]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,34)]
Nonempty VS_add node=1879 children=[65,288]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,41)]
Nonempty VS_add node=1880 children=[77,409]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,2)]
Nonempty VS_add node=1881 children=[243,1217]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,9)]
Nonempty VS_add node=1882 children=[1279,685]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_add node=1883 children=[685,1279]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,24)]
Nonempty VS_add node=1884 children=[1217,243]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_add node=1885 children=[1634,1597]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_add node=1886 children=[1597,1634]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,11)]
Nonempty VS_add node=1887 children=[1801,1652]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1888 children=[1583,1095]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,27)]
Nonempty VS_add node=1889 children=[367,1690]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,3)]
Nonempty VS_add node=1890 children=[1095,1583]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,2)]
Nonempty VS_add node=1891 children=[1690,367]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,9)]
Nonempty VS_add node=1892 children=[1652,1801]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1893 children=[1268,136]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_add node=1894 children=[1699,253]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,24)]
Nonempty VS_add node=1895 children=[1213,327]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,7)]
Nonempty VS_add node=1896 children=[136,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,2)]
Nonempty VS_add node=1897 children=[327,1213]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_add node=1898 children=[253,1699]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,22)]
Nonempty VS_add node=1899 children=[1748,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,7)]
Nonempty VS_add node=1900 children=[730,1748]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,23)]
Nonempty VS_add node=1901 children=[1369,362]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,23),(1,2)]
Nonempty VS_add node=1902 children=[362,1369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,12)]
Nonempty VS_add node=1903 children=[49,698]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_add node=1904 children=[482,554]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,19)]
Nonempty VS_add node=1905 children=[554,482]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_add node=1906 children=[698,49]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1907 children=[94,1129]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,13)]
Nonempty VS_add node=1908 children=[513,646]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,13)]
Nonempty VS_add node=1909 children=[419,602]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,7)]
Nonempty VS_add node=1910 children=[602,419]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,3)]
Nonempty VS_add node=1911 children=[1129,94]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,7)]
Nonempty VS_add node=1912 children=[646,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,26)]
Nonempty VS_add node=1913 children=[79,673]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Nonempty VS_add node=1914 children=[673,79]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,6)]
Nonempty VS_add node=1915 children=[85,707]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Nonempty VS_add node=1916 children=[707,85]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=1917 children=[419,749]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=1918 children=[1071,1374]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=1919 children=[513,766]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=1920 children=[554,751]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=1921 children=[1268,186]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=1922 children=[1748,782]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1924 children=[1923,1826]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,68),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,68),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,68),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,16)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,18)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,4)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coordAdd node=1925 children=[1781,1924]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,8),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 2 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,34)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,16)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,18)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,34)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,4)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,34)]
Nonempty VS_vec node=1926 children=[176,1826]; component projection of output specification
Nonempty VS_coordAdd node=1927 children=[18,1926]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,8),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,72),(1,34)]
MRV immediate domains=[(0,72),(1,34)]
Nonempty VS_vec node=1937 children=[1770,1826]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,72),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,72),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,72),(1,4)]
MRV immediate domains=[(0,1),(1,16)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,18)]
MRV immediate domains=[(0,1),(1,8)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,18)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,4)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,25)]
Nonempty VS_coordAdd node=1938 children=[1936,1937]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Deferred 1 non-local residual branches of coordAdd; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,51),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,51),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,64),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2003 children=[2002,49]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2004 children=[1020,1279]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_subtract node=2005 children=[1009,253]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_multiply node=2006 children=[1469,49]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_multiply node=2007 children=[49,1469]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=2008 children=[1469,79]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,71),(1,1)]
Nonempty VS_subtract node=2009 children=[1460,85]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,8)]
Nonempty VS_subtract node=2010 children=[1071,218]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2011 children=[1036,111]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,6)]
Nonempty VS_subtract node=2012 children=[1171,65]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,22)]
Nonempty VS_subtract node=2013 children=[1738,1314]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,22)]
Nonempty VS_subtract node=2014 children=[1860,136]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,10)]
Nonempty VS_subtract node=2015 children=[1268,302]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2016 children=[1061,646]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,8)]
Nonempty VS_subtract node=2017 children=[1748,338]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,13)]
Nonempty VS_subtract node=2018 children=[1203,745]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,6)]
Nonempty VS_subtract node=2019 children=[409,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,22)]
Nonempty VS_subtract node=2020 children=[1258,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,3)]
Nonempty VS_subtract node=2021 children=[174,1583]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,3)]
Nonempty VS_subtract node=2022 children=[148,94]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2023 children=[1178,436]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,7)]
Nonempty VS_subtract node=2024 children=[1095,522]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_subtract node=2025 children=[776,554]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,6)]
Nonempty VS_subtract node=2026 children=[1081,1710]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,21)]
Nonempty VS_subtract node=2027 children=[1129,504]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2028 children=[1207,630]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Nonempty VS_subtract node=2029 children=[1760,161]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Nonempty VS_add node=2030 children=[1061,766]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Nonempty VS_add node=2031 children=[1203,780]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,1)]
Nonempty VS_add node=2032 children=[1860,186]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=2033 children=[436,163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Nonempty VS_add node=2034 children=[1258,782]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_subtract node=2035 children=[436,152]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,1)]
Nonempty VS_add node=2036 children=[1738,1374]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,1)]
Nonempty VS_add node=2037 children=[1690,180]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,1)]
Nonempty VS_subtract node=2038 children=[1690,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=2039 children=[111,150]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=2040 children=[571,184]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_subtract node=2041 children=[111,139]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_subtract node=2042 children=[571,182]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=2044 children=[784,2043]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,40)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,51),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,51),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,16)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,4)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,9)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,4)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,9)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,40)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,27)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,27)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,18)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,27)]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,27)]
Nonempty VS_coordAdd node=2045 children=[1350,2044]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Deferred 16 non-local residual branches of coordDelta; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,9),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,7),(2,7)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,8),(1,3)]
Nonempty VS_subtract node=2046 children=[253,83]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_multiply node=2047 children=[197,764]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_multiply node=2048 children=[1699,780]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=2050 children=[2049,188]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,0)]
MRV immediate domains=[(0,1),(1,16)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,22)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,22)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,54),(1,20)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,54),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,54),(1,2)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,54),(1,0)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coordAdd node=2051 children=[1351,2050]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
```
