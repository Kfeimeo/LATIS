# LATIS v0.3R.1 induced TSL trace

Only training IO enters Learn; test labels are evaluated after selection. StructuralPriorCount=0.

The root is a typed Scene -> Scene graph. Return-type filtering visits the entire Base registry. Effect checks restrict conditional witness input domains. Each witness produces child learning tasks; a rule is activated only after every child has a nonempty version space. No task classifier selects scan.

## Deduction and child specifications

```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,36)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=19 children=[15,18]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=21 children=[20,19]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coord node=25 children=[15,15]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=27 children=[25,26]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coord node=28 children=[24,15]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=30 children=[28,29]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Nonempty VS_Translate node=33 children=[6,32]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 3,Vec 0 5,Vec 0 3,Vec 0 5]
Nonempty VS_lambda node=34 children=[33]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=39 children=[38,35]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=43 children=[34,39,42]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 1})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 9, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 1}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=44 children=[3,4,43]; mkScene residual: canonical correspondence + Render-validated paint order; branch=3
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=48 children=[24,47]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=49 children=[20,48]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,5)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=53 children=[52,24]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=55 children=[53,54]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=59 children=[58,24]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=61 children=[59,60]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=63 children=[62,24]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=65 children=[63,64]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_Translate node=67 children=[6,66]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 3,Vec 0 (-4),Vec 0 3]
Nonempty VS_lambda node=68 children=[67]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=73 children=[72,69]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 5,Vec 0 5]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=77 children=[68,73,76]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=78 children=[3,4,77]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,18)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_lambda node=81 children=[80]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","Translate","canvasSize","coord","coordDelta","fst","head","index","lambda","literal","mkScene","objects","scan","snd","sortBy","subtract","tail","vec","x","y"]
Abstraction round=0; exact frontier=32; accepted=["I0","I1","I2","I3","I4","I5"]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TR)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TR)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),TR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),TR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),TR)),y(Anchor(snd(v1),TR)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),TR)),y(Anchor(snd(v1),TR)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(index(objects(v0),IntV 0),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(index(objects(v0),IntV 0),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TR)))))),Translate(index(objects(v0),IntV 0),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TR)))))),Translate(index(objects(v0),IntV 0),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),TR)),y(Anchor(snd(v1),TL)))))),Translate(index(objects(v0),IntV 0),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),TR)),y(Anchor(snd(v1),TL)))))),Translate(index(objects(v0),IntV 0),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),TR)),y(Anchor(snd(v1),TR)))))),Translate(index(objects(v0),IntV 0),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,17,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),TR)),y(Anchor(snd(v1),TR)))))),Translate(index(objects(v0),IntV 0),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),BL)),x(Anchor(fst(v1),BR))),Anchor(snd(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),BL)),x(Anchor(fst(v1),BR))),Anchor(snd(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),BL)),x(Anchor(fst(v1),TR))),Anchor(snd(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),BL)),x(Anchor(fst(v1),TR))),Anchor(snd(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),BR)),x(Anchor(fst(v1),BR))),Anchor(snd(v1),TR)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),BR)),x(Anchor(fst(v1),BR))),Anchor(snd(v1),TR)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),BR)),x(Anchor(fst(v1),TR))),Anchor(snd(v1),TR)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),BR)),x(Anchor(fst(v1),TR))),Anchor(snd(v1),TR)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),Center)),x(Anchor(fst(v1),BR))),Anchor(snd(v1),Center)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),Center)),x(Anchor(fst(v1),BR))),Anchor(snd(v1),Center)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),Center)),x(Anchor(fst(v1),TR))),Anchor(snd(v1),Center)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),Center)),x(Anchor(fst(v1),TR))),Anchor(snd(v1),Center)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),TL)),x(Anchor(fst(v1),BR))),Anchor(snd(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),TL)),x(Anchor(fst(v1),BR))),Anchor(snd(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),TL)),x(Anchor(fst(v1),TR))),Anchor(snd(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(x(Anchor(snd(v1),TL)),x(Anchor(fst(v1),TR))),Anchor(snd(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))
TaskInvented I0: (lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TL)))))); repeats=4; portfolio MDL saving=41
TaskInvented I1: (lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TR)))))); repeats=4; portfolio MDL saving=41
TaskInvented I2: (lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TL)))))); repeats=4; portfolio MDL saving=41
TaskInvented I3: (lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TR)))))); repeats=4; portfolio MDL saving=41
TaskInvented I4: (lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),TR))),Anchor(snd(__r1b0),TL)))); repeats=2; portfolio MDL saving=14
TaskInvented I5: (lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),BR))),Anchor(snd(__r1b0),TL)))); repeats=2; portfolio MDL saving=14
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","Translate","canvasSize","coord","coordDelta","fst","head","index","lambda","literal","mkScene","objects","scan","snd","sortBy","subtract","tail","vec","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0

```

## Supported map / scan rules

```text
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=43 children=[34,39,42]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 1})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 9, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 1}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=77 children=[68,73,76]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0}))]; includes-seed convention; no task classifier
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]

```

## Final expression and free-variable dependencies

```text
(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))
FV=[]
```

## Version space, inventions, induced TSL, exact verification and MDL

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\results\\v03\\stress\\F-global-better\\task.json","mode":"PostHocOnly","train_exact":true,"heldout_exact":false,"heldout_available":true,"failure":"AbstractionMissing","failure_evidence":"selected exact-training Base program does not generalize to heldout; training specification underdetermines the abstraction","program":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))","typed_ast":{"type":"ArrowT SceneT SceneT","expression":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))","free_variables":[],"binding_accesses":["key","v0","v1.0","v1.1"],"children":[{"type":"SceneT","expression":"mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))","free_variables":["v0"],"binding_accesses":["key","v0","v1.0","v1.1"],"children":[{"type":"SizeT","expression":"canvasSize(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]},{"type":"ColorT","expression":"ColorV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"ListT PlacedT","expression":"scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))),Translate(head(objects(v0)),VecV (Vec 0 5)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))","free_variables":["v0"],"binding_accesses":["key","v0","v1.0","v1.1"],"children":[{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL))))))","free_variables":[],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(v1),vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"VecT","expression":"vec(IntV 0,subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL))))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(x(Anchor(fst(v1),BR)),y(Anchor(snd(v1),TL)))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"IntT","expression":"x(Anchor(fst(v1),BR))","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),BR)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"BR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"y(Anchor(snd(v1),TL))","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(v1),TL)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]}]}]},{"type":"PlacedT","expression":"Translate(head(objects(v0)),VecV (Vec 0 5))","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"PlacedT","expression":"head(objects(v0))","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]},{"type":"VecT","expression":"VecV (Vec 0 5)","free_variables":[],"binding_accesses":[],"children":[]}]},{"type":"ListT PlacedT","expression":"tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"ListT PlacedT","expression":"sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"ArrowT PlacedT IntT","expression":"(lambda key:PlacedT. x(Anchor(key,TL)))","free_variables":[],"binding_accesses":["key"],"children":[{"type":"IntT","expression":"x(Anchor(key,TL))","free_variables":["key"],"binding_accesses":["key"],"children":[{"type":"CoordT","expression":"Anchor(key,TL)","free_variables":["key"],"binding_accesses":["key"],"children":[{"type":"PlacedT","expression":"key","free_variables":["key"],"binding_accesses":["key"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]}]}]}]}]},"portfolio_count":32,"version_space_derivations":208,"base_activated":[{"symbol":"Anchor","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(snd(v1),Center); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),Center)); FV=[\"v1\"]"},{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(snd(v1),TR); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),BR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),TR)); FV=[\"v1\"]"},{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(snd(v1),TL); FV=[\"v1\"]"}]},{"symbol":"Translate","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 5,Vec 0 5]"},{"specification":"PlacedT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 3,Vec 0 (-4),Vec 0 3]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 (-4),Vec 0 (-4)]"},{"specification":"PlacedT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 0 3,Vec 0 5,Vec 0 3,Vec 0 5]"}]},{"symbol":"canvasSize","source":"BaseActivated","support":[{"specification":"SizeT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; canvasSize(v0); FV=[\"v0\"]"}]},{"symbol":"coord","source":"BaseActivated","support":[{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"component projection of output specification"}]},{"symbol":"coordDelta","source":"BaseActivated","support":[{"specification":"VecT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"coordinate/vector inverse: condition on right operand and deduce left component specification"}]},{"symbol":"fst","source":"BaseActivated","support":[{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(fst(v1),BR); FV=[\"v1\"]"},{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(fst(v1),BL); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),BR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),TR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),BR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),BL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),BL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(fst(v1),TL)); FV=[\"v1\"]"}]},{"symbol":"head","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(objects(v0)); FV=[\"v0\"]"}]},{"symbol":"index","source":"BaseActivated","support":[{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(objects(v0),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(objects(v0)),IntV 1); FV=[\"v0\"]"}]},{"symbol":"lambda","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"function graph -> parameter binding and output points"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1); FV=[\"v0\"]"}]},{"symbol":"literal","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(objects(v0),IntV 0); FV=[\"v0\"]"},{"specification":"VecT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; VecV (Vec 0 5); FV=[]"},{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(snd(v1),Center); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),Center)); FV=[\"v1\"]"},{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(snd(v1),TR); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),BR)); FV=[\"v1\"]"}]},{"symbol":"mkScene","source":"BaseActivated","support":[{"specification":"SceneT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"mkScene residual: canonical correspondence + Render-validated paint order; branch=0"},{"specification":"SceneT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"mkScene residual: canonical correspondence + Render-validated paint order; branch=3"}]},{"symbol":"objects","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(objects(v0),IntV 0); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; head(objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(objects(v0)),IntV 1); FV=[\"v0\"]"}]},{"symbol":"scan","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0}))]; includes-seed convention; no task classifier"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 2, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 1})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 9, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 1})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 4, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 1}))]; includes-seed convention; no task classifier"}]},{"symbol":"snd","source":"BaseActivated","support":[{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(snd(v1),Center); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),Center)); FV=[\"v1\"]"},{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(snd(v1),TR); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),BR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),TR)); FV=[\"v1\"]"},{"specification":"CoordT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; Anchor(snd(v1),TL); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),BL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),TL)); FV=[\"v1\"]"}]},{"symbol":"sortBy","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1); FV=[\"v0\"]"}]},{"symbol":"subtract","source":"BaseActivated","support":[{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"conditional scalar inverse (observed operand; remaining values deduced)"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"}]},{"symbol":"tail","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(tail(objects(v0)),IntV 1); FV=[\"v0\"]"}]},{"symbol":"vec","source":"BaseActivated","support":[{"specification":"VecT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"component projection of output specification"}]},{"symbol":"x","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),Center)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),BR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),TR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),BL)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; x(Anchor(snd(v1),TL)); FV=[\"v1\"]"},{"specification":"PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1); FV=[\"v0\"]"}]},{"symbol":"y","source":"BaseActivated","support":[{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(snd(v1),TR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(snd(v1),TL)); FV=[\"v1\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),BR)); FV=[\"v1\"]"},{"specification":"IntT; observations=4; Gamma=[(\"v0\",SceneT),(\"v1\",PairT PlacedT PlacedT)]","witness":"exact forward-observation witness; y(Anchor(fst(v1),BL)); FV=[\"v1\"]"}]}],"task_invented":[{"name":"I0","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TL))))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TL)))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TL))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TL)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(fst(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"y(Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]}]}]},"repeated_occurrences":4,"mdl_saving":41,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TL))))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TL)))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TL))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TL)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(fst(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"y(Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I1","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TR))))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TR)))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TR))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TR)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(fst(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"y(Anchor(snd(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]}]}]},"repeated_occurrences":4,"mdl_saving":41,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TR))))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TR)))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"vec(IntV 0,subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TR))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(x(Anchor(fst(__r1b0),TR)),y(Anchor(snd(__r1b0),TR)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(fst(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"y(Anchor(snd(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I2","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TL))))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TL)))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TL))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TL)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(fst(__r1b0),BR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),BR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"BR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"y(Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]}]}]},"repeated_occurrences":4,"mdl_saving":41,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TL))))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TL)))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TL))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TL)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(fst(__r1b0),BR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),BR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"BR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"y(Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I3","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TR))))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TR)))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TR))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TR)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(fst(__r1b0),BR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),BR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"BR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"y(Anchor(snd(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]}]}]},"repeated_occurrences":4,"mdl_saving":41,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TR))))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TR)))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"vec(IntV 0,subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TR))))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"IntV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"subtract(x(Anchor(fst(__r1b0),BR)),y(Anchor(snd(__r1b0),TR)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(fst(__r1b0),BR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),BR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"BR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"y(Anchor(snd(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I4","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),TR))),Anchor(snd(__r1b0),TL))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),TR))),Anchor(snd(__r1b0),TL)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),TR))),Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"CoordT","expression":"coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),TR)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"x(Anchor(fst(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]},"repeated_occurrences":2,"mdl_saving":14,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),TR))),Anchor(snd(__r1b0),TL))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),TR))),Anchor(snd(__r1b0),TL)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),TR))),Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"CoordT","expression":"coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),TR)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"x(Anchor(fst(__r1b0),TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I5","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),BR))),Anchor(snd(__r1b0),TL))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),BR))),Anchor(snd(__r1b0),TL)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),BR))),Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"CoordT","expression":"coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),BR)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"x(Anchor(fst(__r1b0),BR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),BR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"BR","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]},"repeated_occurrences":2,"mdl_saving":14,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),BR))),Anchor(snd(__r1b0),TL))))","free_variables":[],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(__r1b0),coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),BR))),Anchor(snd(__r1b0),TL)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"VecT","expression":"coordDelta(coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),BR))),Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"CoordT","expression":"coord(x(Anchor(snd(__r1b0),TL)),x(Anchor(fst(__r1b0),BR)))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0","__r1b0.1"],"children":[{"type":"IntT","expression":"x(Anchor(snd(__r1b0),TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"x(Anchor(fst(__r1b0),BR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"CoordT","expression":"Anchor(fst(__r1b0),BR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PlacedT","expression":"fst(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"BR","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"CoordT","expression":"Anchor(snd(__r1b0),TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PlacedT","expression":"snd(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"}],"statistics":{"abstraction_discovery_work":32895,"abstraction_rounds":1,"base_symbols_activated":20,"base_symbols_rejected":44,"bottom_up_terms":0,"branch_points":19,"depth_cutoffs":0,"distinct_symbol_count":17,"effect_pruned":160,"exact_verifier_calls":32,"expression_tests":21662,"failed_witness_decompositions":312,"first_solution_states":64541,"fv_bindings_eliminated":328,"induced_tsl_symbol_count":26,"invented_abstractions":6,"invention_expansion_tests":0,"invention_hits":0,"join_nodes":25,"lookahead_witness_calls":5447,"materialized_child_asts":810,"materialized_complete_asts":32,"memo_hits":131,"memo_queries":399,"memoized_learning_tasks":268,"observer_terms":8902,"program_ast_length":37,"propagation_steps":4138,"recursive_learning_tasks":399,"root_learning_tasks":1,"semantic_deduplications":0,"structural_deduplications":25,"structural_prior_count":0,"successful_witness_decompositions":25,"synthesis_work_after_discovery":0,"synthesis_work_before_discovery":31646,"total_expanded_work":64541,"union_nodes":17,"version_space_nodes":81,"witness_calls":8065,"witness_unavailable":2450,"wall_clock_seconds":23.7177985},"bounded":false,"base_expressibility":"Expressible: exact Base program is constructive evidence","reachability":"Reachable within configured specification/witness/search bounds","configuration":{"work_budget":250000,"depth":7,"frontier":32,"correspondence_budget":32,"abstraction_limits":"Limits {maxRounds = 2, maxInventions = 6, maxAST = 96, maxParameters = 4}"},"mdl":{"score":59,"ast_length":37,"distinct_symbols":17,"portfolio_saving":192},"secondary_latent_path":"Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called","predictions":[[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]}
```

Limits: depth=7, extraction frontier=32; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs.

Abstraction is typed anti-unification plus explicit lambda lifting. MDL compares a nonoverlapping portfolio cover including definition and argument costs. Accepted definitions feed later Learn through checked Base expansion, with matching tests counted. Online rounds and all dictionary/AST/parameter bounds are finite. `I<n>` has no preassigned semantic label.

Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation.
