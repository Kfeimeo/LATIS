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
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,8),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,8),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,8),(1,5)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,75)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=134 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=135 children=[11,134]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,2)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,75)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=136 children=[11,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=137 children=[57,136]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_place node=139 children=[7,138]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=140 children=[139]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=149 children=[140,148]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,1)]
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
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,8),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,8),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=152 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=157 children=[156,152]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,6),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=158 children=[156,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=159 children=[57,158]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_place node=161 children=[150,160]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=162 children=[161]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,3)]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=218 children=[217,186]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=220 children=[57,219]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=222 children=[221,184]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=228 children=[217,227]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=230 children=[57,229]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=232 children=[231,225]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,75),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=238 children=[217,237]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=239 children=[57,186]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=241 children=[240,235]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=246 children=[217,219]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=248 children=[57,247]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=250 children=[249,244]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,18)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,17)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=255 children=[217,254]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=257 children=[57,256]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=259 children=[258,253]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=264 children=[217,263]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=266 children=[57,265]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=268 children=[267,262]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=273 children=[217,272]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=275 children=[57,274]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=277 children=[276,271]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=282 children=[217,281]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=283 children=[57,263]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=285 children=[284,280]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=289 children=[217,265]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=291 children=[57,290]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=293 children=[292,288]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=298 children=[217,297]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=299 children=[57,272]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=301 children=[300,296]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=305 children=[217,274]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=307 children=[57,306]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=309 children=[308,304]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=356 children=[355,226]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=358 children=[355,357]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=406 children=[405,359]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=454 children=[453,407]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=456 children=[405,455]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=458 children=[453,457]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=460 children=[459,226]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=466 children=[463,465]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=472 children=[471,468]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=478 children=[477,474]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=484 children=[483,480]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=490 children=[489,486]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=496 children=[495,492]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=502 children=[501,498]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=508 children=[507,504]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=514 children=[513,510]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=520 children=[519,516]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=526 children=[525,522]; coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=528 children=[217,527]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=532 children=[463,531]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=535 children=[471,534]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=538 children=[477,537]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=541 children=[483,540]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=544 children=[489,543]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=545 children=[495,504]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=546 children=[501,492]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=549 children=[507,548]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=552 children=[513,551]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=555 children=[519,554]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=558 children=[525,557]; coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=560 children=[57,559]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=562 children=[181,561]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,6),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=655 children=[608,654]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=748 children=[701,747]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=749 children=[747,701]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=750 children=[654,608]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=798 children=[608,797]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=799 children=[797,608]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=877 children=[876,830]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_add node=878 children=[830,876]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=910 children=[747,909]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_add node=911 children=[909,747]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=913 children=[912,751]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,75)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,28),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,12),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=915 children=[133,914]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=948 children=[947,916]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=966 children=[965,949]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=999 children=[998,967]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1001 children=[217,1000]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,12),(1,19)]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1003 children=[133,1002]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1005 children=[947,1004]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_coordAdd node=1006 children=[965,916]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1007 children=[998,949]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1009 children=[57,1008]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1012 children=[217,1011]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1014 children=[57,1013]; coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1016 children=[1015,947]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1019 children=[217,1018]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1021 children=[57,1020]; coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1023 children=[1022,998]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1025 children=[217,1020]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1026 children=[57,1011]; coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1028 children=[1027,965]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,5),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,17),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,17),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1030 children=[133,1029]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1033 children=[217,1032]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1035 children=[57,1034]; coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1037 children=[1036,181]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,16)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1039 children=[217,1038]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1041 children=[57,1040]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1043 children=[1042,225]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1045 children=[217,1044]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1047 children=[57,1046]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1049 children=[1048,235]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1051 children=[217,1050]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1053 children=[57,1052]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1055 children=[1054,244]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1057 children=[217,1056]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1059 children=[57,1058]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1061 children=[1060,253]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1062 children=[231,262]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,17)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1063 children=[258,271]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1065 children=[217,1064]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1066 children=[57,227]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1068 children=[1067,280]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1069 children=[217,229]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1071 children=[57,1070]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1073 children=[1072,288]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1075 children=[217,1074]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1076 children=[57,254]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1078 children=[1077,296]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1079 children=[217,256]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1081 children=[57,1080]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1083 children=[1082,304]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1084 children=[459,1031]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1088 children=[501,1087]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1089 children=[495,468]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1090 children=[507,534]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=1093 children=[463,1092]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1096 children=[471,1095]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1097 children=[513,474]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1098 children=[519,480]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1099 children=[525,486]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1102 children=[477,1101]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1105 children=[483,1104]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1108 children=[489,1107]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1110 children=[217,1109]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1112 children=[495,534]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1113 children=[501,468]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1116 children=[507,1115]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=1119 children=[463,1118]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1122 children=[471,1121]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1123 children=[513,537]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1124 children=[519,540]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1125 children=[525,543]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1128 children=[477,1127]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1131 children=[483,1130]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1134 children=[489,1133]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1136 children=[57,1135]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=1138 children=[184,1137]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1140 children=[217,1139]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1142 children=[57,1141]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1144 children=[1143,181]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1146 children=[217,1145]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1148 children=[57,1147]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1150 children=[1149,184]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1152 children=[217,1151]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1153 children=[57,1145]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1155 children=[1154,235]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1156 children=[217,1147]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1158 children=[57,1157]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1160 children=[1159,244]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,18)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,17)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1162 children=[217,1161]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1164 children=[57,1163]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1166 children=[1165,253]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1167 children=[221,262]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,9),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1169 children=[217,1168]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1171 children=[57,1170]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1173 children=[1172,271]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1174 children=[240,280]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1175 children=[249,288]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,9),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1177 children=[217,1176]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1178 children=[57,1168]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1180 children=[1179,296]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,9),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1181 children=[217,1170]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1183 children=[57,1182]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1185 children=[1184,304]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1186 children=[355,1031]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1188 children=[355,1187]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1190 children=[405,1189]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1192 children=[453,1191]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1194 children=[405,1193]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1196 children=[453,1195]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1198 children=[1197,226]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1200 children=[477,468]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1203 children=[483,1202]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1206 children=[489,1205]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=1209 children=[1208,465]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1212 children=[471,1211]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1213 children=[513,492]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1216 children=[519,1215]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1219 children=[525,1218]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1222 children=[495,1221]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1225 children=[501,1224]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1228 children=[507,1227]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1230 children=[217,1229]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1232 children=[477,534]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1235 children=[483,1234]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1238 children=[489,1237]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=1239 children=[1208,531]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1242 children=[471,1241]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1243 children=[513,504]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1246 children=[519,1245]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1249 children=[525,1248]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1250 children=[495,1227]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1251 children=[501,1221]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1254 children=[507,1253]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1256 children=[57,1255]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=1258 children=[225,1257]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,8),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,97),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1402 children=[1401,1304]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,122),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1525 children=[1524,701]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1603 children=[1602,654]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1652 children=[1651,1619]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1670 children=[1669,909]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1672 children=[355,608]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1735 children=[1734,701]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1813 children=[1812,1304]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=1814 children=[876,1304]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=1815 children=[1304,876]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1816 children=[405,876]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1817 children=[453,747]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Nonempty VS_subtract node=1818 children=[1651,654]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1820 children=[1819,1671]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,122)]
Nonempty VS_coord node=1821 children=[355,1524]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1823 children=[217,1822]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1825 children=[57,1824]; coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1827 children=[1826,133]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1829 children=[133,1828]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1831 children=[965,1830]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1833 children=[998,1832]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1834 children=[947,914]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1836 children=[217,1835]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1838 children=[133,1837]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1839 children=[998,1830]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1840 children=[947,1002]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_coordAdd node=1841 children=[965,914]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1843 children=[57,1842]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,30)]
MRV immediate domains=[(0,3),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,16)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1845 children=[217,1844]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1846 children=[57,1044]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1848 children=[1847,998]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,15)]
Nonempty VS_coordDelta node=1849 children=[1048,965]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,6)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,17)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,17)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,17)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_coordAdd node=1851 children=[947,1850]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,5)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,8),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,76),(1,45)]
Nonempty VS_subtract node=1852 children=[1602,701]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,122),(1,45)]
Nonempty VS_subtract node=1853 children=[1524,1304]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Nonempty VS_subtract node=1854 children=[1812,654]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1855 children=[405,747]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,15)]
Nonempty VS_subtract node=1856 children=[1669,1619]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1858 children=[1819,1857]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,3),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1860 children=[57,1859]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,76)]
Nonempty VS_coord node=1861 children=[355,1602]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1862 children=[217,1824]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1864 children=[1863,133]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,5)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,5)]
Nonempty VS_coordDelta node=1865 children=[217,1842]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1867 children=[133,1866]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_coord node=1868 children=[608,654]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1870 children=[947,1869]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_coordAdd node=1871 children=[965,1002]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1872 children=[998,914]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1874 children=[57,1873]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,0)]
MRV immediate domains=[(0,3),(1,30)]
Nonempty VS_coordDelta node=1875 children=[1054,947]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,30)]
Nonempty VS_coordDelta node=1876 children=[1048,998]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,15)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,5)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_coordAdd node=1878 children=[965,1877]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,76),(1,45)]
Nonempty VS_subtract node=1879 children=[1812,701]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1880 children=[405,608]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1881 children=[355,747]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Nonempty VS_subtract node=1882 children=[1734,654]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Nonempty VS_subtract node=1883 children=[1602,1304]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1885 children=[1819,1884]; component projection of output specification
MRV immediate domains=[(0,45),(1,75)]
Nonempty VS_coordDelta node=1886 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1888 children=[998,1887]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1889 children=[217,1034]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1891 children=[57,1890]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1893 children=[1892,181]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1894 children=[1054,184]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,16)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1895 children=[217,1040]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1897 children=[57,1896]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1899 children=[1898,225]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1901 children=[217,1052]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1903 children=[57,1902]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1905 children=[1904,244]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1906 children=[217,1058]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1908 children=[57,1907]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1910 children=[1909,253]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1911 children=[1072,262]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,19),(1,16)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1912 children=[1082,271]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1913 children=[231,280]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1914 children=[217,1070]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1916 children=[57,1915]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1918 children=[1917,288]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1919 children=[258,296]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1920 children=[217,1080]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1922 children=[57,1921]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1924 children=[1923,304]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1925 children=[459,1189]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordDelta node=1926 children=[217,1135]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1928 children=[495,1115]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1929 children=[501,534]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1932 children=[507,1931]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=1935 children=[463,1934]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=1938 children=[471,1937]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1941 children=[513,1940]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1944 children=[519,1943]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1947 children=[525,1946]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1950 children=[477,1949]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1953 children=[483,1952]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1956 children=[489,1955]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1958 children=[57,1957]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=1960 children=[235,1959]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1962 children=[217,1961]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1963 children=[57,1032]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1965 children=[1964,181]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1966 children=[1048,184]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,16)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1968 children=[217,1967]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1969 children=[57,1038]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1971 children=[1970,225]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1972 children=[1847,235]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1974 children=[217,1973]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1975 children=[57,1056]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1977 children=[1976,253]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1978 children=[1067,262]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1979 children=[1077,271]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,16)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1981 children=[217,1980]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1982 children=[57,1064]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1984 children=[1983,280]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1985 children=[231,288]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,16)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1987 children=[217,1986]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1988 children=[57,1074]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1990 children=[1989,296]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=1991 children=[258,304]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1992 children=[459,1191]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1994 children=[495,1087]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1997 children=[501,1996]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=1998 children=[507,468]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2001 children=[513,2000]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=2004 children=[463,2003]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2007 children=[471,2006]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2010 children=[519,2009]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2013 children=[525,2012]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2016 children=[477,2015]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2019 children=[483,2018]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2022 children=[489,2021]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2024 children=[217,2023]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordDelta node=2025 children=[57,1109]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=2027 children=[244,2026]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2029 children=[217,2028]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2031 children=[57,2030]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2033 children=[2032,181]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2035 children=[217,2034]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2037 children=[57,2036]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2039 children=[2038,184]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2041 children=[217,2040]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2043 children=[57,2042]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2045 children=[2044,225]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2047 children=[217,2046]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=2048 children=[57,2034]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2050 children=[2049,235]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=2051 children=[217,2036]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2053 children=[57,2052]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2055 children=[2054,244]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,18)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,17)]
MRV immediate domains=[(0,3),(1,2)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2057 children=[217,2056]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2059 children=[57,2058]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2061 children=[2060,262]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2062 children=[221,271]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2064 children=[217,2063]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=2065 children=[57,2056]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2067 children=[2066,280]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=2068 children=[217,2058]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2070 children=[57,2069]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2072 children=[2071,288]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2073 children=[240,296]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2074 children=[249,304]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2075 children=[355,1189]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2076 children=[355,1193]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2078 children=[405,2077]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2079 children=[453,1031]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2081 children=[405,2080]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2082 children=[453,1187]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=2084 children=[2083,226]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2086 children=[477,1205]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2087 children=[483,468]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2090 children=[489,2089]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=2093 children=[2092,465]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2096 children=[471,2095]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2097 children=[513,1218]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2098 children=[519,492]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2101 children=[525,2100]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2104 children=[495,2103]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2107 children=[501,2106]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2110 children=[507,2109]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2112 children=[217,2111]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2114 children=[477,1237]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2115 children=[483,534]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2118 children=[489,2117]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=2119 children=[2092,531]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2122 children=[471,2121]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2123 children=[513,1248]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2124 children=[519,504]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2127 children=[525,2126]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2128 children=[495,2109]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2129 children=[501,2103]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2132 children=[507,2131]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2134 children=[57,2133]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=2136 children=[253,2135]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2141 children=[217,2140]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2143 children=[57,2142]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2145 children=[2144,181]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2147 children=[217,2146]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2149 children=[57,2148]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2151 children=[2150,184]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2152 children=[1165,225]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2154 children=[217,2153]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=2155 children=[57,2146]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2157 children=[2156,235]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=2158 children=[217,2148]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2160 children=[57,2159]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2162 children=[2161,244]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,18)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,17)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2164 children=[217,2163]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2166 children=[57,2165]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2168 children=[2167,253]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2169 children=[1172,262]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,18)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2171 children=[217,2170]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2173 children=[57,2172]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2175 children=[2174,271]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2176 children=[1179,280]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2177 children=[1184,288]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2179 children=[217,2178]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=2180 children=[57,2170]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2182 children=[2181,296]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,8),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=2183 children=[217,2172]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2185 children=[57,2184]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2187 children=[2186,304]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2188 children=[355,1191]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2189 children=[355,1195]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=2190 children=[405,1031]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=2192 children=[453,2191]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=2193 children=[405,1187]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=2195 children=[453,2194]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=2197 children=[2196,226]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2201 children=[483,2200]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2202 children=[477,1202]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2203 children=[489,468]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=2206 children=[2205,465]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2209 children=[471,2208]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2212 children=[519,2211]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2213 children=[513,1215]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2214 children=[525,492]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2217 children=[495,2216]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2220 children=[501,2219]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2223 children=[507,2222]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2225 children=[217,2224]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2229 children=[483,2228]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2230 children=[477,1234]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2231 children=[489,534]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_coord node=2232 children=[2205,531]; component projection of output specification
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_coordAdd node=2235 children=[471,2234]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2238 children=[519,2237]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2239 children=[513,1245]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2240 children=[525,504]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2241 children=[495,2222]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2242 children=[501,2216]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_coordAdd node=2245 children=[507,2244]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2247 children=[57,2246]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordAdd node=2249 children=[2139,2248]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; VecT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,3),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2251 children=[217,2250]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2253 children=[57,2252]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2255 children=[2254,181]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2256 children=[1143,184]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,16)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2257 children=[1036,225]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2259 children=[217,2258]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=2260 children=[57,1139]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2262 children=[2261,235]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=2263 children=[217,1141]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2265 children=[57,2264]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2267 children=[2266,244]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,9),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2269 children=[217,2268]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2271 children=[57,2270]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2273 children=[2272,253]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,16),(1,16)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2274 children=[1165,271]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2275 children=[1048,280]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_coordDelta node=2276 children=[1054,288]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,9),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2278 children=[217,2277]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=2279 children=[57,1161]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2281 children=[2280,296]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,9),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=2282 children=[217,1163]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=2284 children=[57,2283]; coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=2286 children=[2285,304]; coordinate/vector inverse: condition on right operand and deduce left component specification
```
