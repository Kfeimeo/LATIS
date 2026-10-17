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
MRV immediate domains=[(0,1),(1,6)]
Learn(ObjectT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=39 children=[26,37]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=40 children=[39]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,51),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=46 children=[45,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=58 children=[50,57]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=70 children=[62,69]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=76 children=[75,71]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=82 children=[81,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=104 children=[103,86]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Nonempty VS_add node=105 children=[86,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=129 children=[128,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_add node=130 children=[77,128]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=141 children=[140,131]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=143 children=[140,142]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=154 children=[153,144]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=156 children=[153,155]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=167 children=[166,157]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=169 children=[41,168]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=171 children=[166,170]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=173 children=[41,172]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=175 children=[71,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=177 children=[71,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=179 children=[77,178]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=200 children=[189,199]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_multiply node=201 children=[199,189]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=236 children=[235,210]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=281 children=[245,280]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,8)]
Nonempty VS_add node=282 children=[280,245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,24)]
Nonempty VS_add node=283 children=[210,235]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=320 children=[319,294]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,24)]
Nonempty VS_add node=321 children=[294,319]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,23)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=355 children=[330,354]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,23),(1,8)]
Nonempty VS_add node=356 children=[354,330]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=402 children=[401,359]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,41)]
Nonempty VS_multiply node=403 children=[359,401]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=429 children=[428,411]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=439 children=[128,438]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,22)]
Nonempty VS_add node=440 children=[438,128]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Nonempty VS_add node=441 children=[411,428]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=451 children=[450,359]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Nonempty VS_add node=452 children=[359,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,6)]
Nonempty VS_add node=453 children=[199,69]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,9)]
Nonempty VS_add node=454 children=[69,199]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=497 children=[496,474]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=506 children=[103,505]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=535 children=[514,534]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_add node=536 children=[534,514]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Nonempty VS_add node=537 children=[505,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,21)]
Nonempty VS_add node=538 children=[474,496]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=564 children=[546,563]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Nonempty VS_add node=565 children=[563,546]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=579 children=[566,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_multiply node=580 children=[578,566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=623 children=[622,594]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,27)]
Nonempty VS_add node=624 children=[594,622]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=666 children=[638,665]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,13)]
Nonempty VS_add node=667 children=[665,638]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=691 children=[677,690]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,9)]
Nonempty VS_multiply node=692 children=[690,677]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=723 children=[699,722]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=738 children=[690,737]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,12)]
Nonempty VS_add node=739 children=[737,690]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,6)]
Nonempty VS_add node=740 children=[722,699]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=742 children=[622,741]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=744 children=[496,743]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=754 children=[753,168]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=755 children=[753,172]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=757 children=[514,756]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=759 children=[665,758]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=769 children=[768,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=770 children=[768,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=771 children=[438,178]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=773 children=[690,772]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=775 children=[699,774]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=777 children=[776,180]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=786 children=[785,777]; place inverse: output local geometry and absolute origin; no translation template
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,6)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,34)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=799 children=[798,280]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,19)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=803 children=[802,474]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=807 children=[806,594]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=811 children=[810,638]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=812 children=[806,741]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=813 children=[802,743]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=814 children=[810,758]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=816 children=[799,815]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,40),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=36 children=[35,18]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=37 children=[35,36]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=39 children=[26,37]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=40 children=[39]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,6),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=924 children=[534,41]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=932 children=[931,924]; place inverse: output local geometry and absolute origin; no translation template
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
MRV immediate domains=[(0,1),(1,11)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,9)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,34)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=947 children=[946,280]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,1)]
Nonempty VS_add node=948 children=[280,946]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,19)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=950 children=[810,474]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,2)]
Nonempty VS_add node=951 children=[474,810]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=952 children=[802,638]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=953 children=[806,594]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,2)]
Nonempty VS_add node=954 children=[594,806]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,2)]
Nonempty VS_add node=955 children=[638,802]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=956 children=[806,741]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=957 children=[802,758]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=958 children=[810,743]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=960 children=[949,959]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,71),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,13)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,13)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=36 children=[35,18]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=37 children=[35,36]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
MRV immediate domains=[(0,1),(1,10)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,3)]
Nonempty VS_place node=994 children=[26,993]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=995 children=[994]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,29),(1,23)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,24),(1,8)]
Nonempty VS_subtract node=996 children=[319,140]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1007 children=[768,1006]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1018 children=[753,1017]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_add node=1019 children=[1017,753]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_add node=1020 children=[1006,768]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Nonempty VS_subtract node=1021 children=[235,166]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1059 children=[1058,1033]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,24)]
Nonempty VS_add node=1060 children=[1033,1058]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1069 children=[1068,438]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_multiply node=1070 children=[438,1068]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1093 children=[1078,1092]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,7)]
Nonempty VS_add node=1094 children=[1092,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1104 children=[428,1103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1120 children=[103,1119]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_subtract node=1121 children=[450,153]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1169 children=[1168,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,41)]
Nonempty VS_add node=1170 children=[1126,1168]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1201 children=[1200,1175]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,41),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1205 children=[401,1204]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,41)]
Nonempty VS_add node=1206 children=[1204,401]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,24)]
Nonempty VS_add node=1207 children=[1175,1200]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1211 children=[496,1210]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1215 children=[514,1214]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,11)]
Nonempty VS_add node=1217 children=[768,1033]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,8)]
Nonempty VS_add node=1218 children=[1033,768]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1229 children=[1228,166]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_multiply node=1230 children=[438,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1256 children=[1255,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,34),(1,7)]
Nonempty VS_multiply node=1257 children=[280,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1266 children=[235,1265]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Nonempty VS_multiply node=1267 children=[428,1265]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1277 children=[1276,1265]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,7)]
Nonempty VS_multiply node=1278 children=[1228,1265]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,14)]
Nonempty VS_subtract node=1279 children=[496,1119]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,7)]
Nonempty VS_multiply node=1280 children=[294,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,4)]
Nonempty VS_add node=1281 children=[1058,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,4)]
Nonempty VS_add node=1282 children=[753,1175]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,2)]
Nonempty VS_add node=1283 children=[1200,1204]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,24)]
Nonempty VS_add node=1284 children=[1204,1200]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,8)]
Nonempty VS_add node=1285 children=[1175,753]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,24)]
Nonempty VS_add node=1286 children=[1126,1058]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,8)]
Nonempty VS_subtract node=1287 children=[622,1103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_multiply node=1288 children=[474,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1312 children=[1311,1265]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,7)]
Nonempty VS_multiply node=1313 children=[622,1265]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1329 children=[514,1328]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1331 children=[319,1330]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,7)]
Nonempty VS_multiply node=1332 children=[505,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,7)]
Nonempty VS_multiply node=1333 children=[86,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_multiply node=1334 children=[77,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1336 children=[235,1335]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=1337 children=[450,566]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1339 children=[1338,1216]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=1343 children=[1342,1339]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=1345 children=[995,1343,1344]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},8),(Coord {cx = 0, cy = 1},8),(Coord {cx = 1, cy = 0},8),(Coord {cx = 1, cy = 1},8)], orientation = 0})) (PlacedV (Object {objectId = 3, position = Coord {cx = 6, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})),PlacedV (Object {objectId = 3, position = Coord {cx = 12, cy = 19}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})),(PairV (PlacedV (Object {objectId = 3, position = Coord {cx = 12, cy = 19}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 1, cy = 0},5)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=1347 children=[1,4,1346]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=1349 children=[1348]; function graph -> parameter binding and output points
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=1
Demand resolved: type IntT generated=1850 new observations=1670 (VecT=0, CoordT=0, IntT=1670); epoch=2
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=3
Demand resolved: type IntT generated=1846 new observations=1666 (VecT=0, CoordT=0, IntT=1666); epoch=4
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=5
Demand resolved: type IntT generated=1858 new observations=1682 (VecT=0, CoordT=0, IntT=1682); epoch=6
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=7
Demand resolved: type IntT generated=1846 new observations=1666 (VecT=0, CoordT=0, IntT=1666); epoch=8
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=9
Demand round 1: pools grown=9; stale memo entries=65
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
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1351 children=[1350,753]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,4),(1,24)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1357 children=[1356,1200]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1358 children=[1351,1357]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1360 children=[9,1359]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_place node=1362 children=[5,1361]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1363 children=[1362]; function graph -> parameter binding and output points
Nonempty VS_map node=1364 children=[1363,24]; map witness: corresponding f(x_i)=y_i; element instances=7
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
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1366 children=[35,1365]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_place node=1367 children=[26,1366]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=1368 children=[1367]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,7),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,17),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,26)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,77)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,61)]
MRV immediate domains=[(0,47),(1,77)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,27),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1372 children=[622,1371]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1375 children=[496,1374]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,21)]
Nonempty VS_add node=1376 children=[1374,496]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,27)]
Nonempty VS_add node=1377 children=[1371,622]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,23)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1382 children=[1379,1381]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,23),(1,13)]
Nonempty VS_add node=1383 children=[1381,1379]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1388 children=[514,1387]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,7)]
Nonempty VS_add node=1389 children=[1387,514]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1392 children=[1391,665]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,14)]
Nonempty VS_add node=1393 children=[665,1391]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1394 children=[319,210]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,24)]
Nonempty VS_add node=1395 children=[210,319]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1396 children=[235,330]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,24)]
Nonempty VS_add node=1397 children=[330,235]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1399 children=[245,1398]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_add node=1400 children=[1398,245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1402 children=[245,1401]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1403 children=[450,294]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,8)]
Nonempty VS_add node=1404 children=[294,450]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1405 children=[428,546]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1406 children=[103,411]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Nonempty VS_add node=1407 children=[411,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,16)]
Nonempty VS_add node=1408 children=[546,428]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1409 children=[1311,699]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,22)]
Nonempty VS_add node=1410 children=[699,1311]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1411 children=[622,758]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1412 children=[496,741]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1436 children=[1435,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1437 children=[1435,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1438 children=[514,743]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1451 children=[1450,144]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1465 children=[1464,168]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1466 children=[1450,155]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1467 children=[1464,172]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1468 children=[1379,774]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1469 children=[665,772]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1471 children=[699,1470]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1492 children=[1491,1472]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1517 children=[1516,1493]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,17),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1537 children=[1536,1518]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1539 children=[1491,1538]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1541 children=[1516,1540]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,17),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1543 children=[1536,1542]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1551 children=[1550,1544]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1558 children=[1557,1552]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1560 children=[1550,1559]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1562 children=[1557,1561]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,115)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1680 children=[1564,1679]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1684 children=[1683,1371]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,118),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1803 children=[1802,1369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1840 children=[1839,1564]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,36)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1880 children=[1845,1879]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,118)]
Nonempty VS_add node=1881 children=[1369,1802]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,36)]
Nonempty VS_add node=1882 children=[1564,1839]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,4)]
Nonempty VS_add node=1883 children=[1879,1845]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,118),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1885 children=[1802,1884]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1887 children=[1839,1886]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1908 children=[1845,1907]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,215)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2124 children=[1369,2123]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,35)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2166 children=[2137,2165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2180 children=[1879,2179]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2210 children=[2181,2209]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2214 children=[2213,1374]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2218 children=[2217,1391]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2233 children=[2232,2137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,13)]
Nonempty VS_add node=2234 children=[2137,2232]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2241 children=[2232,2240]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,53),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2293 children=[2292,57]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2302 children=[2301,2294]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,6)]
Nonempty VS_add node=2303 children=[2294,2301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2305 children=[2301,2304]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,48)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2321 children=[2294,2320]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2338 children=[2337,2324]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2343 children=[2342,428]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2347 children=[2346,1276]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2352 children=[2351,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2356 children=[2355,245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2358 children=[1401,2357]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2359 children=[2357,1401]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2361 children=[1401,2360]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2412 children=[2411,71]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,37),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2448 children=[2447,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=2449 children=[2357,1398]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2454 children=[2450,2453]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2461 children=[2457,2460]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2468 children=[2464,2467]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2477 children=[2476,2471]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2479 children=[2478,1103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,37),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2522 children=[2521,2486]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2562 children=[2561,69]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2567 children=[2563,2566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2582 children=[2581,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2585 children=[2583,2584]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2586 children=[2584,2583]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2591 children=[2453,2590]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2595 children=[2594,411]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2599 children=[2598,546]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2601 children=[2600,1214]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2606 children=[2602,2605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2620 children=[2609,2619]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2621 children=[2460,86]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2623 children=[2622,566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2625 children=[2181,2624]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2626 children=[1683,758]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2627 children=[2213,741]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2628 children=[2179,131]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2629 children=[2179,142]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2630 children=[2217,772]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2631 children=[2165,157]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2632 children=[2165,170]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2640 children=[2639,2633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2656 children=[2655,2641]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2663 children=[2662,2657]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2677 children=[2676,2664]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2678 children=[41,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2680 children=[2639,2679]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2682 children=[2655,2681]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2684 children=[2662,2683]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2686 children=[2676,2685]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=2687 children=[41,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2688 children=[71,144]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2689 children=[77,168]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=2690 children=[71,155]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=2691 children=[77,172]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=2693 children=[1563,2692]; component projection of output specification
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,95)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,64)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,74)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,81)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,44)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,1)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,77)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,135)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,37)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,64)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,65)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2712 children=[2693,2711]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,26)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,26)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,57)]
MRV immediate domains=[(0,47),(1,61)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,27)]
Nonempty VS_subtract node=2713 children=[1564,2209]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Nonempty VS_subtract node=2714 children=[1683,1391]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,115)]
Nonempty VS_subtract node=2715 children=[1369,1679]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2720 children=[2181,2719]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Nonempty VS_subtract node=2721 children=[2213,1371]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,23)]
Nonempty VS_subtract node=2722 children=[2217,1381]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Nonempty VS_add node=2723 children=[1839,1369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,12)]
Nonempty VS_add node=2724 children=[1845,2137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,36)]
Nonempty VS_add node=2725 children=[1369,1839]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,4)]
Nonempty VS_add node=2726 children=[2137,1845]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Nonempty VS_subtract node=2727 children=[1839,1884]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,5)]
Nonempty VS_subtract node=2728 children=[1845,2240]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,20)]
Nonempty VS_subtract node=2729 children=[2137,2179]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,1)]
Nonempty VS_subtract node=2730 children=[2411,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2732 children=[2731,1103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2733 children=[2478,1119]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,37),(1,6)]
Nonempty VS_subtract node=2734 children=[2521,57]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,53),(1,6)]
Nonempty VS_subtract node=2735 children=[2292,69]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Nonempty VS_subtract node=2736 children=[2342,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Nonempty VS_subtract node=2737 children=[2346,245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2738 children=[1401,2294]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2739 children=[2294,1401]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=2740 children=[1401,2304]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Nonempty VS_subtract node=2741 children=[1879,71]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2743 children=[2742,2566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,37),(1,1)]
Nonempty VS_subtract node=2744 children=[2447,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=2745 children=[2294,1398]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_subtract node=2746 children=[2450,2460]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_subtract node=2747 children=[2464,2471]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,6)]
Nonempty VS_subtract node=2748 children=[2337,2486]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,3)]
Nonempty VS_add node=104 children=[103,86]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Nonempty VS_add node=105 children=[86,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_subtract node=2749 children=[2609,2590]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_subtract node=2750 children=[2453,86]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,7)]
Nonempty VS_subtract node=2751 children=[2594,546]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2753 children=[2752,1210]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_subtract node=2754 children=[2600,2605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=129 children=[128,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_add node=130 children=[77,128]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2755 children=[1564,2624]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2756 children=[2181,756]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2757 children=[2213,758]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,1)]
Nonempty VS_add node=2758 children=[2165,131]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,1)]
Nonempty VS_subtract node=2759 children=[2165,142]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Nonempty VS_add node=2760 children=[2179,144]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Nonempty VS_subtract node=2761 children=[2179,155]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2762 children=[1683,772]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2763 children=[2217,774]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2765 children=[2639,2764]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_add node=2766 children=[2655,2633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_add node=2767 children=[2662,2641]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Nonempty VS_add node=2768 children=[2676,157]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=169 children=[41,168]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2770 children=[2639,2769]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_subtract node=2771 children=[2655,2679]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_subtract node=2772 children=[2662,2681]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Nonempty VS_subtract node=2773 children=[2676,170]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=173 children=[41,172]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=175 children=[71,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=177 children=[71,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=179 children=[77,178]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=2775 children=[1563,2774]; component projection of output specification
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,58)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,1)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,61)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,114)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,61)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,68)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2803 children=[2775,2802]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,26)]
MRV immediate domains=[(0,1),(1,21)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,56)]
MRV immediate domains=[(0,47),(1,57)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_subtract node=2804 children=[1564,2719]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,23)]
Nonempty VS_subtract node=2805 children=[1683,1381]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,27)]
Nonempty VS_subtract node=2806 children=[1369,2209]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_subtract node=2807 children=[2181,1387]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Nonempty VS_subtract node=2808 children=[2213,1391]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,2)]
Nonempty VS_multiply node=2809 children=[2209,2324]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,27)]
Nonempty VS_multiply node=2810 children=[2324,2209]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_subtract node=2811 children=[2731,1119]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Nonempty VS_subtract node=2812 children=[1879,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,1)]
Nonempty VS_subtract node=2813 children=[2411,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2815 children=[2814,1103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2818 children=[2478,2817]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,6)]
Nonempty VS_subtract node=2819 children=[2337,57]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,37),(1,6)]
Nonempty VS_subtract node=2820 children=[2521,69]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2831 children=[2821,2830]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_subtract node=2832 children=[2137,71]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_subtract node=2833 children=[2622,2566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,22)]
Nonempty VS_subtract node=2834 children=[2217,1311]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,3)]
Nonempty VS_add node=2835 children=[428,86]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,3)]
Nonempty VS_add node=2836 children=[103,2590]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Nonempty VS_add node=2837 children=[2590,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Nonempty VS_add node=2838 children=[86,428]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,48)]
Nonempty VS_multiply node=2839 children=[71,2320]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,36)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=2853 children=[2619,2852]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,9)]
Nonempty VS_multiply node=2854 children=[2852,2619]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,48),(1,1)]
Nonempty VS_multiply node=2855 children=[2320,71]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2857 children=[2856,1210]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_subtract node=2858 children=[2752,1214]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,6)]
Nonempty VS_add node=2859 children=[330,69]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,8)]
Nonempty VS_add node=2860 children=[69,330]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_subtract node=2861 children=[2609,86]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,1)]
Nonempty VS_add node=2862 children=[1311,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,1)]
Nonempty VS_add node=2863 children=[128,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_add node=2864 children=[41,128]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_add node=2865 children=[77,1311]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2866 children=[1369,2624]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2867 children=[1564,756]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2868 children=[2181,743]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,1)]
Nonempty VS_add node=2869 children=[2165,144]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,1)]
Nonempty VS_subtract node=2870 children=[2165,155]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Nonempty VS_add node=2871 children=[2676,131]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Nonempty VS_add node=2872 children=[2179,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Nonempty VS_subtract node=2873 children=[2676,142]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Nonempty VS_subtract node=2874 children=[2179,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2875 children=[1683,774]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2876 children=[2213,772]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2877 children=[2217,1470]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2879 children=[2639,2878]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_add node=2880 children=[2655,2764]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_add node=2881 children=[2662,2633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2883 children=[2639,2882]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_subtract node=2884 children=[2655,2769]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_subtract node=2885 children=[2662,2679]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=2886 children=[41,178]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2887 children=[71,168]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=2888 children=[71,172]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=2889 children=[77,1470]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=2891 children=[1563,2890]; component projection of output specification
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,47)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,1)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,57)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,56),(1,96)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,53)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,64)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2914 children=[2891,2913]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,70),(1,61)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2713 children=[1564,2209]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2915 children=[1683,737]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,115)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2715 children=[1369,1679]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2916 children=[2181,534]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2917 children=[2213,638]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,23)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2918 children=[2217,722]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2723 children=[1839,1369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2724 children=[1845,2137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,36)]
Nonempty VS_add node=2725 children=[1369,1839]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,4)]
Nonempty VS_add node=2726 children=[2137,1845]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2727 children=[1839,1884]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2728 children=[1845,2240]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,20)]
Nonempty VS_subtract node=2919 children=[2137,153]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,1)]
Nonempty VS_subtract node=46 children=[45,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2732 children=[2731,1103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2733 children=[2478,1119]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,37),(1,6)]
Nonempty VS_subtract node=58 children=[50,57]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,53),(1,6)]
Nonempty VS_subtract node=70 children=[62,69]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2736 children=[2342,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2737 children=[2346,245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2738 children=[1401,2294]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2739 children=[2294,1401]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2740 children=[1401,2304]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,1)]
Nonempty VS_subtract node=76 children=[75,71]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2743 children=[2742,2566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,37),(1,1)]
Nonempty VS_subtract node=82 children=[81,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2745 children=[2294,1398]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2746 children=[2450,2460]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2747 children=[2464,2471]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2748 children=[2337,2486]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,3)]
Nonempty VS_add node=104 children=[103,86]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,16)]
Nonempty VS_add node=105 children=[86,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2749 children=[2609,2590]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2750 children=[2453,86]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2751 children=[2594,546]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2753 children=[2752,1210]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2754 children=[2600,2605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,1)]
Nonempty VS_add node=129 children=[128,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_add node=130 children=[77,128]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2755 children=[1564,2624]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=2756 children=[2181,756]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2757 children=[2213,758]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,1)]
Nonempty VS_add node=141 children=[140,131]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,1)]
Nonempty VS_subtract node=143 children=[140,142]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Nonempty VS_add node=154 children=[153,144]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,1)]
Nonempty VS_subtract node=156 children=[153,155]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2762 children=[1683,772]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2763 children=[2217,774]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2765 children=[2639,2764]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2766 children=[2655,2633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2767 children=[2662,2641]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Nonempty VS_add node=167 children=[166,157]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=169 children=[41,168]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2770 children=[2639,2769]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2771 children=[2655,2679]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2772 children=[2662,2681]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Nonempty VS_subtract node=171 children=[166,170]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=173 children=[41,172]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_add node=175 children=[71,174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=177 children=[71,176]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=179 children=[77,178]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=2921 children=[776,2920]; component projection of output specification
MRV immediate domains=[(0,17),(1,5)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,26)]
MRV immediate domains=[(0,1),(1,21)]
MRV immediate domains=[(0,47),(1,74)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,44),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2949 children=[2948,1391]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,27)]
Nonempty VS_subtract node=2950 children=[2232,2209]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,115)]
Nonempty VS_subtract node=2951 children=[1845,1679]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2958 children=[2957,2719]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,35),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2971 children=[2970,1371]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,23)]
Nonempty VS_subtract node=2972 children=[2852,1381]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,4)]
Nonempty VS_add node=2973 children=[1839,1845]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,36)]
Nonempty VS_add node=2974 children=[1845,1839]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,36),(1,20)]
Nonempty VS_subtract node=2975 children=[1839,2179]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,14)]
Nonempty VS_subtract node=2976 children=[2639,1119]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_multiply node=2977 children=[2655,1119]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,13)]
Nonempty VS_multiply node=2978 children=[1119,2655]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,415),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3394 children=[3393,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3395 children=[1017,1276]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3396 children=[1006,245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,118),(1,1)]
Nonempty VS_multiply node=3397 children=[1802,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,118)]
Nonempty VS_multiply node=3398 children=[41,1802]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,8)]
Nonempty VS_subtract node=3399 children=[2655,1103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=3405 children=[3404,1369]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_add node=3406 children=[1557,2294]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Nonempty VS_add node=3407 children=[1369,3404]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,4)]
Nonempty VS_add node=3408 children=[2294,1557]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,118),(1,1)]
Nonempty VS_subtract node=3409 children=[1802,71]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_subtract node=3410 children=[3404,1884]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_subtract node=3411 children=[1557,2304]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,215),(1,1)]
Nonempty VS_subtract node=3412 children=[2123,77]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Nonempty VS_subtract node=3413 children=[1369,2581]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,2)]
Nonempty VS_subtract node=3414 children=[2137,2460]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3415 children=[1068,210]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3430 children=[2294,3429]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,2)]
Nonempty VS_subtract node=3431 children=[2337,2471]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3432 children=[1033,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,27)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3462 children=[3433,3461]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3484 children=[3483,57]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3513 children=[3512,1311]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,27),(1,22)]
Nonempty VS_subtract node=3514 children=[3461,128]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=3515 children=[1265,294]; conditional scalar inverse (observed operand; remaining values deduced)
```
