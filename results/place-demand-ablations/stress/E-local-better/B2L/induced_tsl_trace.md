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
MRV immediate domains=[(0,1),(1,4)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
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
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,6)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,8)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,6)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
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
MRV immediate domains=[(0,3),(1,1)]
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
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: vecAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: scale lacks a conditioning operand of type VecT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=1
Demand resolved: type IntT generated=1850 new observations=1670 (VecT=0, CoordT=0, IntT=1670); epoch=2
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=3
Demand resolved: type IntT generated=1846 new observations=1666 (VecT=0, CoordT=0, IntT=1666); epoch=4
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=5
Demand resolved: type IntT generated=1846 new observations=1666 (VecT=0, CoordT=0, IntT=1666); epoch=6
Demand round 1: pools grown=6; stale memo entries=29
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
MRV immediate domains=[(0,1),(1,20)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,9)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,10)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=26 children=[14,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,10)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=69 children=[68,37]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=81 children=[70,80]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,7)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,15)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=98 children=[14,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,10)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=145 children=[144,37]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=155 children=[146,154]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PlacedT)][[("v0",SceneV (Sc...; IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,7),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,7),(1,0)]
MRV immediate domains=[(0,2),(1,5)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,7),(1,9)]
MRV immediate domains=[(0,10),(1,9)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_vecAdd node=156 children=[25,80]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,7)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_vecAdd node=157 children=[97,154]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,7),(1,15)]
Nonempty VS_vecAdd node=158 children=[154,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,9),(1,10)]
Nonempty VS_vecAdd node=159 children=[80,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=161 children=[14,160]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,9)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,20)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,22)]
Nonempty VS_place node=163 children=[7,162]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=164 children=[163]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=173 children=[164,172]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,22)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,9)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,15)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=190 children=[68,189]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,3),(1,10)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=194 children=[193,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=196 children=[195,80]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,9)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,45),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=197 children=[144,189]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,3),(1,15)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=198 children=[193,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=205 children=[199,204]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,7),(1,0)]
MRV immediate domains=[(0,3),(1,5)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,7),(1,9)]
MRV immediate domains=[(0,10),(1,9)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_vecAdd node=206 children=[25,80]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,9)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_vecAdd node=207 children=[97,204]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,9),(1,15)]
Nonempty VS_vecAdd node=208 children=[204,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,9),(1,10)]
Nonempty VS_vecAdd node=209 children=[80,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=211 children=[193,210]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_place node=213 children=[9,212]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=214 children=[213]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=308 children=[261,307]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=309 children=[307,261]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=373 children=[372,326]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,45)]
Nonempty VS_add node=374 children=[326,372]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=376 children=[372,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=424 children=[423,377]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=426 children=[423,425]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=474 children=[473,427]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=476 children=[473,475]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=478 children=[477,215]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=495 children=[494,478]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=504 children=[214,495,503]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 15, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 6, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=506 children=[3,6,505]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=516 children=[164,515]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,8)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,22)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,9)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,10)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=518 children=[68,517]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,10)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=520 children=[519,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=522 children=[521,80]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,9)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,15)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=523 children=[519,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,10)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=524 children=[144,517]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=526 children=[525,204]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT),("v1",PairT PlacedT PlacedT)][[("...; IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,7),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,7),(1,0)]
MRV immediate domains=[(0,2),(1,5)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,7),(1,9)]
MRV immediate domains=[(0,10),(1,9)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_vecAdd node=206 children=[25,80]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,9)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_vecAdd node=207 children=[97,204]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,9),(1,15)]
Nonempty VS_vecAdd node=208 children=[204,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,9),(1,10)]
Nonempty VS_vecAdd node=209 children=[80,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=527 children=[519,210]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,9)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_place node=529 children=[9,528]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=530 children=[529]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Demand registered: coordAdd lacks a conditioning operand of type VecT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; CoordT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,61)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=593 children=[473,592]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=610 children=[609,593]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=620 children=[530,610,619]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 6, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 15, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=622 children=[3,6,621]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=624 children=[623]; function graph -> parameter binding and output points
Demand resolved: type VecT generated=1152 new observations=1152 (VecT=1152, CoordT=0, IntT=0); epoch=7
Demand round 2: pools grown=1; stale memo entries=8
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
Nonempty VS_map node=173 children=[164,172]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,15)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=656 children=[655,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,10)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=673 children=[672,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,6)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=681 children=[68,680]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,11)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=694 children=[144,693]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=696 children=[423,427]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=697 children=[423,475]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=698 children=[473,215]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=699 children=[372,377]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=701 children=[473,700]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=702 children=[372,425]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=704 children=[703,695]; component projection of output specification
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=724 children=[705,723]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,5),(1,23)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,15)]
Nonempty VS_coordAdd node=725 children=[672,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=757 children=[756,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,11)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=770 children=[68,769]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,6)]
Nonempty VS_coordAdd node=771 children=[144,680]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=772 children=[703,215]; component projection of output specification
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=789 children=[773,788]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,15)]
Nonempty VS_coordAdd node=790 children=[756,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,11)]
Nonempty VS_coordAdd node=791 children=[144,769]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,6),(1,1)]
Nonempty VS_coord node=792 children=[703,427]; component projection of output specification
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=815 children=[793,814]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,10)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,23)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,9)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,9)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=833 children=[703,828]; component projection of output specification
Nonempty VS_coordAdd node=834 children=[833,826]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,9)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=847 children=[703,827]; component projection of output specification
Nonempty VS_coordAdd node=848 children=[847,844]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,9)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=861 children=[703,829]; component projection of output specification
Nonempty VS_coordAdd node=862 children=[861,858]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,12)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,23)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,6),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,122),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=998 children=[997,307]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,122)]
Nonempty VS_multiply node=999 children=[307,997]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=1000 children=[307,307]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1002 children=[703,1001]; component projection of output specification
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_coordAdd node=1003 children=[1002,875]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,4)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,23)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,0),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,10)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,18)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,15)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,10)]
MRV immediate domains=[(0,17),(1,4)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,17)]
MRV immediate domains=[(0,1),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,18)]
MRV immediate domains=[(0,0),(1,17)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,5)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,4)]
MRV immediate domains=[(0,17),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,17),(1,3)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,17),(1,5)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,17),(1,3)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,17),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,23)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=1038 children=[703,1035]; component projection of output specification
Nonempty VS_coordAdd node=1039 children=[1038,1033]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,17),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,0),(1,16)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_coord node=478 children=[477,215]; component projection of output specification
Nonempty VS_place node=1047 children=[494,1046]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_scan node=1048 children=[214,1047,503]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 15, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 6, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=1050 children=[3,6,1049]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_map node=516 children=[164,515]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,8)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,23)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1051 children=[68,788]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1052 children=[144,814]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_coord node=593 children=[473,592]; component projection of output specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1059 children=[1055,1058]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1066 children=[1062,1065]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1073 children=[1069,1072]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1081 children=[1076,1080]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_place node=1083 children=[609,1082]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_scan node=1084 children=[530,1083,619]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 6, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 15, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=1086 children=[3,6,1085]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=1088 children=[1087]; function graph -> parameter binding and output points
Demand resolved: type IntT generated=1858 new observations=1682 (VecT=0, CoordT=0, IntT=1682); epoch=8
Demand round 3: pools grown=1; stale memo entries=24
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
Nonempty VS_map node=173 children=[164,172]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,17)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,15)]
Nonempty VS_coordAdd node=656 children=[655,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,10)]
Nonempty VS_coordAdd node=673 children=[672,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,6)]
Nonempty VS_coordAdd node=681 children=[68,680]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,11)]
Nonempty VS_coordAdd node=694 children=[144,693]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,10),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_add node=696 children=[423,427]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,45)]
Nonempty VS_add node=1090 children=[427,423]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_add node=699 children=[372,377]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,45)]
Nonempty VS_add node=1091 children=[377,372]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1148 children=[1101,1147]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,9)]
Nonempty VS_add node=1149 children=[1147,1101]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=697 children=[423,475]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=698 children=[473,215]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=701 children=[473,700]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=702 children=[372,425]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1151 children=[1150,695]; component projection of output specification
Nonempty VS_coordAdd node=1153 children=[1152,723]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,5),(1,23)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,15)]
Nonempty VS_coordAdd node=725 children=[672,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,10)]
Nonempty VS_coordAdd node=757 children=[756,25]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,11)]
Nonempty VS_coordAdd node=770 children=[68,769]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,6)]
Nonempty VS_coordAdd node=771 children=[144,680]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_coord node=1154 children=[1150,215]; component projection of output specification
Nonempty VS_coordAdd node=1156 children=[1155,788]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,25)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,2)]
Nonempty VS_coord node=1157 children=[1150,427]; component projection of output specification
MRV immediate domains=[(0,30),(1,15)]
Nonempty VS_coordAdd node=790 children=[756,97]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,11)]
Nonempty VS_coordAdd node=791 children=[144,769]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=1159 children=[1158,814]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_coord node=1160 children=[1150,828]; component projection of output specification
Nonempty VS_coordAdd node=1161 children=[1160,826]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,9)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_coord node=1162 children=[1150,827]; component projection of output specification
Nonempty VS_coordAdd node=1163 children=[1162,844]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,9)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_coord node=1164 children=[1150,829]; component projection of output specification
Nonempty VS_coordAdd node=1165 children=[1164,858]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,12)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,10),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,18),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1185 children=[1184,427]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,18)]
Nonempty VS_add node=1186 children=[427,1184]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,81)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1269 children=[427,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,196),(1,45)]
Nonempty VS_multiply node=998 children=[997,307]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,196)]
Nonempty VS_multiply node=999 children=[307,997]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,18),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=1000 children=[307,307]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1316 children=[1315,1101]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1357 children=[1356,215]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1371 children=[1370,695]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,1)]
Nonempty VS_subtract node=1372 children=[1184,475]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,39),(1,1)]
Nonempty VS_subtract node=1373 children=[1356,700]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1375 children=[1370,1374]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1383 children=[1382,828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1385 children=[1382,1384]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1393 children=[1392,827]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1401 children=[1400,829]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1403 children=[1392,1402]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1405 children=[1400,1404]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=1407 children=[1150,1406]; component projection of output specification
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordAdd node=1408 children=[1407,875]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Demand registered: add lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: subtract lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
Demand registered: multiply lacks a conditioning operand of type IntT in pool [("v0",SceneT)][[("v0",SceneV (Scene {canvas = D...; IntT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,17),(1,4)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,22)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,17),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,21)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,17),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,19)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,17),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,19)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,17),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,19)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,17),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_coord node=1409 children=[1150,1035]; component projection of output specification
Nonempty VS_coordAdd node=1410 children=[1409,1033]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,17),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,20)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,17),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,17)]
MRV immediate domains=[(0,1),(1,23)]
MRV immediate domains=[(0,1),(1,25)]
MRV immediate domains=[(0,0),(1,18)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,9)]
MRV immediate domains=[(0,1),(1,12)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,4)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,13),(1,1)]
Nonempty VS_coord node=478 children=[477,215]; component projection of output specification
Nonempty VS_place node=1412 children=[494,1411]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_scan node=1413 children=[214,1412,503]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 15, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 6, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=1415 children=[3,6,1414]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,4)]
Nonempty VS_mkScene node=1086 children=[3,6,1085]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=1417 children=[1416]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","height","index","lambda","literal","map","mkScene","multiply","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","vec","vecAdd","width","x","y"]
Cost saturation C=1..23 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0)]
Abstraction round=0; exact frontier=452; accepted=["I0","I1","I2","I3","I4","I5"]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","height","index","lambda","literal","map","mkScene","multiply","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","vec","vecAdd","width","x","y"]
Abstraction round=1; exact frontier=452; accepted=[]
Cost saturation C=1..23 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TR)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TR),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TR),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TR),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,15,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(IntV (-1),IntV 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(IntV (-1),IntV 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),IntV 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),IntV 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),IntV 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),IntV 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(IntV (-1),colorToInt(background(v0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),colorToInt(background(v0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),colorToInt(background(v0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(IntV (-1),x(coord(IntV 0,IntV 0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(IntV (-1),y(coord(IntV 0,IntV 0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(IntV (-1),cardinality(ObjectColors(objectOf(v1)))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),cardinality(ObjectColors(objectOf(v1)))),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),x(coord(IntV 0,IntV 0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),y(coord(IntV 0,IntV 0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),x(coord(IntV 0,IntV 0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),y(coord(IntV 0,IntV 0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),cardinality(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),IntV 0))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(IntV (-1),add(colorToInt(background(v0)),IntV 1)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),IntV 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),add(colorToInt(background(v0)),IntV 1)),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),IntV 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),IntV 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),IntV 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),add(colorToInt(background(v0)),IntV 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),IntV 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,15,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),Center)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),Center)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),Center)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),Center)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),Center)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 1),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TR)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),colorToInt(background(v0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BL)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BR)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),Center)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TL)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TR)),VecV (Vec (-1) 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),colorToInt(background(v0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TR),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),colorToInt(background(v0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TR),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),BR),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),Center))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),TR))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TR),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(v1,TR),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,18,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,5,1,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,20,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),x(coord(IntV 0,IntV 0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,20,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),y(coord(IntV 0,IntV 0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,20,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),cardinality(ObjectColors(objectOf(v1)))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,20,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),cardinality(ObjectColors(objectOf(v1)))),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,20,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),x(coord(IntV 0,IntV 0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,20,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),y(coord(IntV 0,IntV 0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,19,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),x(coord(IntV 0,IntV 0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,19,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),y(coord(IntV 0,IntV 0)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,19,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),cardinality(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,19,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(IntV (-1),IntV 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(IntV (-1),IntV 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),add(colorToInt(background(v0)),IntV 1)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),IntV 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),IntV 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,18,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),add(colorToInt(background(v0)),IntV 1)),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),IntV 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),IntV 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),add(colorToInt(background(v0)),IntV 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(IntV (-1),colorToInt(background(v0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),colorToInt(background(v0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),colorToInt(background(v0)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(IntV (-1),x(coord(IntV 0,IntV 0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(IntV (-1),y(coord(IntV 0,IntV 0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(IntV (-1),cardinality(ObjectColors(objectOf(v1)))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),cardinality(ObjectColors(objectOf(v1)))),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),x(coord(IntV 0,IntV 0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),y(coord(IntV 0,IntV 0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),x(coord(IntV 0,IntV 0)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),y(coord(IntV 0,IntV 0)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),cardinality(ObjectColors(objectOf(v1))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,22,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),IntV 0))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,22,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(IntV (-1),add(colorToInt(background(v0)),IntV 1)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,22,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),IntV 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,22,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(IntV (-1),add(colorToInt(background(v0)),IntV 1)),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,22,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),IntV 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,22,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),IntV 1),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),IntV 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(IntV (-1),add(colorToInt(background(v0)),IntV 1))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),IntV 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,17,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,17,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,17,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,17,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,17,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)),vec(add(colorToInt(background(v0)),IntV (-1)),colorToInt(background(v0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(vec(add(colorToInt(background(v0)),IntV (-1)),colorToInt(background(v0))),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,21,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(objects(v0))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),vec(add(colorToInt(background(v0)),IntV (-1)),colorToInt(background(v0)))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 0)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))),VecV (Vec (-1) 1)))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),vecAdd(VecV (Vec (-1) 0),coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),BL)))))),objects(v0))))
TaskInvented I0: (lambda v0:SceneT. Anchor(head(tail(objects(v0))),BL)); repeats=10; portfolio MDL saving=21
TaskInvented I1: (lambda v0:SceneT. Anchor(head(tail(objects(v0))),BR)); repeats=7; portfolio MDL saving=12
TaskInvented I2: (lambda v0:SceneT. Anchor(head(tail(objects(v0))),TL)); repeats=5; portfolio MDL saving=6
TaskInvented I3: (lambda v0:SceneT. Anchor(head(tail(objects(v0))),TR)); repeats=5; portfolio MDL saving=6
TaskInvented I4: (lambda v0:SceneT. Anchor(head(tail(objects(v0))),Center)); repeats=5; portfolio MDL saving=6
TaskInvented I5: (lambda __r1h0:AnchorT. (lambda v0:SceneT. coordDelta(Anchor(head(tail(objects(v0))),BL),Anchor(head(objects(v0)),__r1h0)))); repeats=10; portfolio MDL saving=34
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","height","index","lambda","let","literal","map","mkScene","multiply","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","vec","vecAdd","width","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
