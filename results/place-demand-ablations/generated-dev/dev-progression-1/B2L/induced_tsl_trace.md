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
MRV immediate domains=[(0,1),(1,6)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,32),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,44)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,44)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=211 children=[210,24]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=212 children=[210,211]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=215 children=[38,214]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=216 children=[215]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,13),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,36),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,42),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=246 children=[102,245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=287 children=[286,286]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,42)]
Nonempty VS_add node=288 children=[245,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=306 children=[102,305]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,42)]
Nonempty VS_multiply node=307 children=[305,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=370 children=[369,286]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,62)]
Nonempty VS_multiply node=371 children=[286,369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=401 children=[400,385]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=431 children=[430,415]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=499 children=[458,498]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,26)]
Nonempty VS_add node=500 children=[498,458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=501 children=[415,430]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=502 children=[385,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=518 children=[400,517]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_multiply node=519 children=[517,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=549 children=[149,548]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,29),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=580 children=[579,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,29)]
Nonempty VS_add node=581 children=[182,579]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,42)]
Nonempty VS_add node=582 children=[548,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=602 children=[585,601]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_multiply node=603 children=[601,585]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=620 children=[604,619]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_multiply node=621 children=[619,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=642 children=[624,641]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,2)]
Nonempty VS_add node=643 children=[641,624]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=648 children=[585,647]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=649 children=[647,585]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=657 children=[652,656]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=658 children=[656,652]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,26),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=702 children=[701,674]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Nonempty VS_add node=703 children=[674,701]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=731 children=[730,517]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Nonempty VS_add node=732 children=[517,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=762 children=[746,761]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Nonempty VS_add node=763 children=[761,746]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=795 children=[794,778]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_add node=796 children=[778,794]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=826 children=[825,810]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=827 children=[810,825]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=842 children=[841,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,13)]
Nonempty VS_add node=843 children=[43,841]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=863 children=[846,862]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Nonempty VS_add node=864 children=[862,846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=886 children=[885,869]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,15)]
Nonempty VS_add node=887 children=[869,885]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=902 children=[901,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,13)]
Nonempty VS_add node=903 children=[51,901]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=923 children=[907,922]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=938 children=[937,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=957 children=[939,956]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=958 children=[956,939]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Nonempty VS_add node=959 children=[54,937]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,3)]
Nonempty VS_add node=960 children=[922,907]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=965 children=[964,961]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=973 children=[968,972]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=974 children=[972,968]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_add node=975 children=[961,964]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=977 children=[794,976]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=983 children=[982,978]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=985 children=[907,984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=987 children=[982,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=989 children=[939,988]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=991 children=[810,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1007 children=[1006,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1009 children=[1006,1008]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1011 children=[1010,659]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=1026 children=[1025,1011]; place inverse: output local geometry and absolute origin; no translation template
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,6),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,42)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,42)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,14)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=211 children=[210,24]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=212 children=[210,211]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=1096 children=[38,212]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1097 children=[1096]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,36),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1105 children=[400,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,62)]
Nonempty VS_multiply node=1106 children=[400,369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,14)]
Nonempty VS_multiply node=1107 children=[369,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1122 children=[1121,761]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1138 children=[1137,458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,14)]
Nonempty VS_add node=1139 children=[458,1137]; conditional scalar inverse (observed operand; remaining values deduced)
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
Nonempty VS_subtract node=1252 children=[701,862]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,62),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1269 children=[369,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,62)]
Nonempty VS_add node=1270 children=[1268,369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1271 children=[1137,674]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,14)]
Nonempty VS_add node=1272 children=[149,761]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,42)]
Nonempty VS_add node=1273 children=[761,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1274 children=[674,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1291 children=[730,1290]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1307 children=[400,1306]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_multiply node=1308 children=[1306,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1326 children=[1325,305]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,16)]
Nonempty VS_add node=1327 children=[305,1325]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,15)]
Nonempty VS_subtract node=1328 children=[746,885]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_subtract node=1329 children=[778,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,15)]
Nonempty VS_subtract node=1330 children=[825,601]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Nonempty VS_subtract node=1331 children=[846,674]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,14)]
Nonempty VS_subtract node=1332 children=[869,761]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,14)]
Nonempty VS_subtract node=1333 children=[656,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,42)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1335 children=[1334,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,16)]
Nonempty VS_add node=1336 children=[1140,956]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1340 children=[1163,1339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Nonempty VS_add node=1341 children=[1339,1163]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Nonempty VS_add node=1342 children=[956,1140]; conditional scalar inverse (observed operand; remaining values deduced)
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
Nonempty VS_subtract node=1353 children=[972,1165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1354 children=[961,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1355 children=[1140,988]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=1356 children=[1165,978]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1357 children=[1165,986]; conditional scalar inverse (observed operand; remaining values deduced)
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
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=1
Demand resolved: type IntT generated=1850 new observations=1670 (VecT=0, CoordT=0, IntT=1670); epoch=2
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=3
Demand resolved: type IntT generated=1846 new observations=1666 (VecT=0, CoordT=0, IntT=1666); epoch=4
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=5
Demand resolved: type IntT generated=1858 new observations=1682 (VecT=0, CoordT=0, IntT=1682); epoch=6
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=7
Demand resolved: type IntT generated=1846 new observations=1666 (VecT=0, CoordT=0, IntT=1666); epoch=8
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=9
Demand round 1: pools grown=9; stale memo entries=64
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
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1368 children=[1367,674]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,4),(1,42)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1374 children=[1373,102]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1375 children=[1368,1374]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1377 children=[9,1376]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_place node=1379 children=[5,1378]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1380 children=[1379]; function graph -> parameter binding and output points
Nonempty VS_map node=1381 children=[1380,36]; map witness: corresponding f(x_i)=y_i; element instances=6
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
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,42)]
Nonempty VS_subtract node=103 children=[59,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,42)]
Nonempty VS_subtract node=150 children=[106,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,28)]
Nonempty VS_subtract node=183 children=[153,182]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1383 children=[1382,674]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,3)]
Nonempty VS_subtract node=44 children=[39,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,5)]
Nonempty VS_subtract node=52 children=[45,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=55 children=[53,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1392 children=[1386,1391]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1396 children=[1395,1345]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1400 children=[1399,939]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1402 children=[1401,184]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1404 children=[210,1403]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_place node=1406 children=[38,1405]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1407 children=[1406]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,13),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,61),(1,53)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,42),(1,40)]
Nonempty VS_multiply node=306 children=[102,305]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,40),(1,42)]
Nonempty VS_multiply node=307 children=[305,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,113),(1,39)]
Nonempty VS_multiply node=370 children=[369,286]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,113)]
Nonempty VS_multiply node=371 children=[286,369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,28)]
Nonempty VS_add node=246 children=[102,245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,39)]
Nonempty VS_add node=287 children=[286,286]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,42)]
Nonempty VS_add node=288 children=[245,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Nonempty VS_add node=401 children=[400,385]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Nonempty VS_add node=431 children=[430,415]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,39)]
Nonempty VS_add node=499 children=[458,498]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,26)]
Nonempty VS_add node=500 children=[498,458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=501 children=[415,430]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_add node=502 children=[385,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Nonempty VS_multiply node=518 children=[400,517]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,14)]
Nonempty VS_multiply node=519 children=[517,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,41)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1451 children=[1408,1450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,28)]
Nonempty VS_add node=549 children=[149,548]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,29),(1,28)]
Nonempty VS_add node=580 children=[579,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,29)]
Nonempty VS_add node=581 children=[182,579]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,42)]
Nonempty VS_add node=582 children=[548,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1453 children=[1452,841]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1497 children=[1456,1496]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1526 children=[1498,1525]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1533 children=[1532,1527]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1540 children=[1539,1534]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1547 children=[1546,1541]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Nonempty VS_add node=1548 children=[1527,1532]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Nonempty VS_add node=1549 children=[1534,1539]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Nonempty VS_add node=1550 children=[1541,1546]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1552 children=[1532,1551]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1554 children=[1539,1553]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1556 children=[1546,1555]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,26)]
Nonempty VS_subtract node=1557 children=[1527,517]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,52)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1611 children=[1534,1610]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,27)]
Nonempty VS_subtract node=1612 children=[1541,885]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1614 children=[1613,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1632 children=[1631,1618]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,46)]
Nonempty VS_multiply node=602 children=[585,601]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,46),(1,2)]
Nonempty VS_multiply node=603 children=[601,585]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1636 children=[1635,901]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1638 children=[1637,937]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,34)]
Nonempty VS_multiply node=620 children=[604,619]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,1)]
Nonempty VS_multiply node=621 children=[619,604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1644 children=[1639,1643]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1646 children=[1645,794]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1648 children=[1647,907]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,16)]
Nonempty VS_add node=642 children=[624,641]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,2)]
Nonempty VS_add node=643 children=[641,624]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1650 children=[1649,982]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_add node=648 children=[585,647]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=649 children=[647,585]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_add node=657 children=[652,656]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=658 children=[656,652]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,15),(1,13)]
Nonempty VS_add node=826 children=[825,810]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,15)]
Nonempty VS_add node=827 children=[810,825]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,15)]
Nonempty VS_add node=795 children=[794,778]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,15)]
Nonempty VS_add node=796 children=[778,794]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,2)]
Nonempty VS_add node=1007 children=[1006,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Nonempty VS_add node=1652 children=[992,1006]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,34)]
Nonempty VS_add node=702 children=[701,674]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,26)]
Nonempty VS_add node=703 children=[674,701]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,15)]
Nonempty VS_add node=923 children=[907,922]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,5)]
Nonempty VS_add node=960 children=[922,907]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,26)]
Nonempty VS_add node=731 children=[730,517]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=983 children=[982,978]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_add node=1653 children=[978,982]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,26)]
Nonempty VS_add node=732 children=[517,730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,4)]
Nonempty VS_subtract node=1654 children=[730,1532]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1669 children=[701,1668]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,17)]
Nonempty VS_add node=957 children=[939,956]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,25)]
Nonempty VS_add node=762 children=[746,761]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,13)]
Nonempty VS_add node=763 children=[761,746]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,17),(1,1)]
Nonempty VS_add node=958 children=[956,939]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1676 children=[746,1675]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,42)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1680 children=[1679,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,2)]
Nonempty VS_add node=1681 children=[102,1679]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,4)]
Nonempty VS_add node=842 children=[841,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,13)]
Nonempty VS_add node=843 children=[43,841]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,35)]
Nonempty VS_add node=863 children=[846,862]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,2)]
Nonempty VS_add node=864 children=[862,846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,4)]
Nonempty VS_add node=886 children=[885,869]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,27)]
Nonempty VS_add node=887 children=[869,885]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,4)]
Nonempty VS_subtract node=1682 children=[869,1546]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,5)]
Nonempty VS_add node=902 children=[901,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,13)]
Nonempty VS_add node=903 children=[51,901]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1697 children=[846,1696]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_add node=938 children=[937,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Nonempty VS_add node=959 children=[54,937]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1705 children=[1704,1643]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,6)]
Nonempty VS_add node=1706 children=[1643,1704]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1714 children=[1713,1709]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_add node=1715 children=[1709,1713]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1723 children=[1718,1722]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=1724 children=[1722,1718]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=965 children=[964,961]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_add node=973 children=[968,972]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_add node=974 children=[972,968]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_add node=975 children=[961,964]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_subtract node=977 children=[794,976]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Nonempty VS_subtract node=985 children=[907,984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_subtract node=987 children=[982,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=989 children=[939,988]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_subtract node=991 children=[810,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_subtract node=1009 children=[1006,1008]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1726 children=[1555,1725]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1728 children=[1555,1727]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1731 children=[1729,1730]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1734 children=[1732,1733]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1736 children=[1729,1735]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1738 children=[1732,1737]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1743 children=[1742,1739]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1746 children=[1744,1745]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1748 children=[1742,1747]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1750 children=[1744,1749]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1752 children=[1751,1651]; component projection of output specification
MRV immediate domains=[(0,14),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1756 children=[24,1755]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,13),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1774 children=[1773,1759]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,13),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1776 children=[203,1775]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_place node=1778 children=[1025,1777]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_scan node=1779 children=[1407,1778,1033]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 17, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 2, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 2, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=1781 children=[1,4,1780]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,8)]
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_map node=1782 children=[1380,1044]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,14),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,42),(1,2)]
Nonempty VS_add node=1053 children=[102,59]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,42)]
Nonempty VS_add node=1054 children=[59,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,2)]
Nonempty VS_add node=1055 children=[149,153]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,28)]
Nonempty VS_add node=1056 children=[106,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,2)]
Nonempty VS_add node=1057 children=[182,106]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,42)]
Nonempty VS_add node=1058 children=[153,149]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1383 children=[1382,674]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,3)]
Nonempty VS_add node=1046 children=[39,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Nonempty VS_add node=1047 children=[43,39]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,5)]
Nonempty VS_add node=1048 children=[53,51]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,7)]
Nonempty VS_add node=1049 children=[51,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1792 children=[43,1791]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1798 children=[51,1797]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,9)]
Nonempty VS_add node=1050 children=[54,45]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_add node=1051 children=[45,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1802 children=[54,1801]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1804 children=[1803,1059]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1404 children=[210,1403]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,13),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1806 children=[203,1805]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_place node=1808 children=[38,1807]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1809 children=[1808]; function graph -> parameter binding and output points
Nonempty VS_scan node=1810 children=[1809,1090,1075]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 2, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 17, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,6)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,6)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=1812 children=[1,4,1811]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,8)]
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_map node=1813 children=[1380,1094]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,6)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1404 children=[210,1403]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_place node=1814 children=[38,1404]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1815 children=[1814]; function graph -> parameter binding and output points
Nonempty VS_scan node=1816 children=[1815,1090,1098]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 2, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 17, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 0, cy = 1},7),(Coord {cx = 1, cy = 1},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,14),(2,6)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,14),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=1818 children=[1,4,1817]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,8)]
MRV immediate domains=[(0,1),(1,3),(2,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,6)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_map node=1819 children=[1380,1102]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,6)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,19)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,83),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,14),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1820 children=[400,430]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1821 children=[430,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,39)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1822 children=[1137,286]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1823 children=[149,458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,42)]
Nonempty VS_add node=1824 children=[458,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,14)]
Nonempty VS_add node=1825 children=[286,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1829 children=[1828,548]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1831 children=[1830,1121]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,2)]
Nonempty VS_add node=1832 children=[548,1828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_add node=1833 children=[1121,1830]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1837 children=[548,1836]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1839 children=[1121,1838]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1840 children=[1527,1391]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1842 children=[1841,1345]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1847 children=[1846,1147]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,3)]
Nonempty VS_add node=1848 children=[1147,1846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1853 children=[1147,1852]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1854 children=[1534,846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1860 children=[1165,1859]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1861 children=[1140,1170]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_add node=1862 children=[1170,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_add node=1863 children=[1859,1165]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,46)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1899 children=[1866,1898]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1917 children=[1916,1866]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,40),(1,23)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1952 children=[1951,1926]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,23),(1,40)]
Nonempty VS_add node=1953 children=[1926,1951]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,16)]
Nonempty VS_add node=1954 children=[1866,1916]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1965 children=[1962,1964]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,7)]
Nonempty VS_add node=1966 children=[1964,1962]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1981 children=[1964,1980]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,113),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2034 children=[2033,1189]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,17)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2037 children=[1325,2036]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,17),(1,16)]
Nonempty VS_add node=2038 children=[2036,1325]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,113)]
Nonempty VS_add node=2039 children=[1189,2033]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,36)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2075 children=[1189,2074]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2078 children=[1846,2077]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,3)]
Nonempty VS_add node=2079 children=[2077,1846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,3)]
Nonempty VS_subtract node=2080 children=[2077,1852]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2102 children=[149,2101]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2115 children=[102,2114]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,42)]
Nonempty VS_add node=2116 children=[2114,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,42)]
Nonempty VS_add node=2117 children=[2101,149]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2118 children=[102,1675]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2125 children=[2124,701]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2138 children=[400,2137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,5)]
Nonempty VS_add node=2139 children=[701,2124]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,14)]
Nonempty VS_add node=2140 children=[2137,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2141 children=[149,1668]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2148 children=[400,2147]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2161 children=[701,2160]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,35)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2183 children=[746,2182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=2184 children=[1980,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,28)]
Nonempty VS_multiply node=2185 children=[182,1980]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2186 children=[1696,746]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2200 children=[1137,2199]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2203 children=[1140,2202]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,13)]
Nonempty VS_add node=2204 children=[746,1696]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2205 children=[2202,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,14)]
Nonempty VS_add node=2206 children=[2199,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2207 children=[1137,1532]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2209 children=[430,2208]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_add node=2210 children=[2208,430]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2212 children=[430,2211]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2215 children=[1165,2214]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_add node=2216 children=[2214,1165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,28)]
Nonempty VS_add node=2217 children=[1838,182]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,1)]
Nonempty VS_add node=2218 children=[182,1838]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,1)]
Nonempty VS_subtract node=2219 children=[182,1830]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2220 children=[1980,1722]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,46),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2221 children=[1898,1339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,46)]
Nonempty VS_add node=2222 children=[1339,1898]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,28)]
Nonempty VS_add node=2223 children=[1722,1980]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,7)]
Nonempty VS_subtract node=2224 children=[1722,1962]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_add node=2225 children=[1675,846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,5)]
Nonempty VS_add node=2226 children=[846,1675]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,25)]
Nonempty VS_subtract node=2227 children=[846,2114]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,16)]
Nonempty VS_subtract node=2228 children=[1339,1916]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2234 children=[1828,2233]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,2)]
Nonempty VS_add node=2235 children=[2233,1828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2236 children=[1334,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,2)]
Nonempty VS_subtract node=2237 children=[2233,1836]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2238 children=[1852,972]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,3)]
Nonempty VS_add node=2239 children=[972,1852]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,3)]
Nonempty VS_subtract node=2240 children=[972,1846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2241 children=[1830,869]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_add node=2242 children=[869,1830]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_subtract node=2243 children=[869,1838]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,23),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2244 children=[1926,1351]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2245 children=[961,1165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2246 children=[1325,988]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2247 children=[1846,976]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2248 children=[1916,1008]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2257 children=[2256,2249]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2258 children=[1962,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2260 children=[2256,2259]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2261 children=[1140,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2262 children=[1165,984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2265 children=[2263,2264]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2267 children=[2263,2266]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2272 children=[2271,2268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2274 children=[2271,2273]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2279 children=[2278,2275]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2284 children=[2283,2280]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2286 children=[2278,2285]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2288 children=[2283,2287]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=2290 children=[2289,1864]; component projection of output specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=2295 children=[2294,2291]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2317 children=[2296,2316]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,27)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,19)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=2321 children=[2320,2291]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2322 children=[2321,2316]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,27)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,22)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,83),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,14),(1,113)]
Nonempty VS_multiply node=2323 children=[400,2033]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,113),(1,14)]
Nonempty VS_multiply node=2324 children=[2033,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,14)]
Nonempty VS_add node=1105 children=[400,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,13)]
Nonempty VS_add node=2325 children=[1675,1121]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,5)]
Nonempty VS_add node=2326 children=[1121,1675]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,25)]
Nonempty VS_subtract node=2327 children=[1121,2114]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Nonempty VS_add node=1138 children=[1137,458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,14)]
Nonempty VS_add node=1139 children=[458,1137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2328 children=[1828,245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2329 children=[1830,385]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,2)]
Nonempty VS_add node=2330 children=[245,1828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_add node=2331 children=[385,1830]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,28),(1,2)]
Nonempty VS_subtract node=2332 children=[245,1836]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_subtract node=2333 children=[385,1838]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,42)]
Nonempty VS_multiply node=1141 children=[1140,102]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,42),(1,1)]
Nonempty VS_multiply node=1142 children=[102,1140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,4)]
Nonempty VS_add node=2334 children=[1962,1147]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,7)]
Nonempty VS_add node=2335 children=[1147,1962]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,28)]
Nonempty VS_subtract node=2336 children=[1147,1980]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,4)]
Nonempty VS_add node=2337 children=[1846,1859]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,3)]
Nonempty VS_add node=2338 children=[1859,1846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,3)]
Nonempty VS_subtract node=2339 children=[1859,1852]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_subtract node=2340 children=[1527,1345]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Nonempty VS_add node=1171 children=[1165,1170]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_add node=1172 children=[1170,1165]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=2342 children=[2289,2341]; component projection of output specification
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,25)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,4)]
Nonempty VS_coord node=2343 children=[2077,1170]; component projection of output specification
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2345 children=[2343,2344]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2350 children=[2320,2349]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=2351 children=[2350,2346]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,25)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2381 children=[2352,2380]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,22)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,19)]
MRV immediate domains=[(0,1),(1,27)]
MRV immediate domains=[(0,1),(1,22)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,83),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,13)]
Nonempty VS_add node=2382 children=[1675,385]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,5)]
Nonempty VS_add node=2383 children=[385,1675]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,25)]
Nonempty VS_subtract node=2384 children=[385,2114]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,34)]
Nonempty VS_subtract node=2385 children=[1121,2101]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,13)]
Nonempty VS_add node=2386 children=[1668,1121]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,13)]
Nonempty VS_add node=2387 children=[1121,1668]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,4)]
Nonempty VS_add node=2388 children=[1962,1859]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,7)]
Nonempty VS_add node=2389 children=[1859,1962]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,28)]
Nonempty VS_subtract node=2390 children=[1859,1980]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,46)]
Nonempty VS_subtract node=2391 children=[1147,1898]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,4)]
Nonempty VS_add node=2392 children=[1916,1147]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2407 children=[2211,2406]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,16)]
Nonempty VS_add node=2408 children=[1147,1916]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_add node=2409 children=[2406,2211]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_subtract node=2410 children=[2406,2208]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2411 children=[1828,579]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2412 children=[1830,415]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,29),(1,2)]
Nonempty VS_add node=2413 children=[579,1828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_add node=2414 children=[415,1830]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,29),(1,2)]
Nonempty VS_subtract node=2415 children=[579,1836]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_subtract node=2416 children=[415,1838]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,4)]
Nonempty VS_add node=2417 children=[1846,1170]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,3)]
Nonempty VS_add node=2418 children=[1170,1846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,3)]
Nonempty VS_subtract node=2419 children=[1170,1852]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=2421 children=[2289,2420]; component projection of output specification
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,20)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,24)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,48)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,4)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,4)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,37)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,24)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2445 children=[2421,2444]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,93),(1,25)]
Nonempty VS_coord node=1359 children=[1358,1173]; component projection of output specification
MRV immediate domains=[(0,17),(1,4)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,19)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,27)]
MRV immediate domains=[(0,1),(1,22)]
MRV immediate domains=[(0,83),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2451 children=[2263,937]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2452 children=[1546,1391]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2459 children=[2458,1147]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,5)]
Nonempty VS_add node=2460 children=[1147,2458]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2474 children=[1147,2473]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,2)]
Nonempty VS_subtract node=2475 children=[1696,1345]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2476 children=[1539,846]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,1)]
Nonempty VS_add node=2477 children=[286,2280]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2479 children=[498,2478]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,1)]
Nonempty VS_subtract node=2480 children=[286,2287]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2482 children=[498,2481]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Nonempty VS_add node=2483 children=[458,2268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2485 children=[2406,2484]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Nonempty VS_subtract node=2486 children=[458,2273]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2488 children=[2406,2487]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2494 children=[2493,2489]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2496 children=[2493,2495]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2501 children=[2500,2497]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2503 children=[2500,2502]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2505 children=[2504,1749]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2506 children=[2504,1745]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2509 children=[2507,2508]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2511 children=[2507,2510]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2513 children=[2512,1737]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2516 children=[2514,2515]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2517 children=[2512,1733]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2519 children=[2514,2518]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2524 children=[2523,2520]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2526 children=[2523,2525]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2529 children=[2527,2528]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2531 children=[2527,2530]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=2533 children=[2289,2532]; component projection of output specification
MRV immediate domains=[(0,1),(1,4)]
```
